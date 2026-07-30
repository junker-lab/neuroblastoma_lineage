library(data.table)
library(ggplot2)

# Parameters
OUT_LOC  <- "./Data"   
PAIRS    <- c("1", "2", "3", "4", "5")

# ── Helper: cumulative chromosome offsets from CNVkit .cnr file ───────────────
get_chrom_offsets <- function(cnr) {
  # Use the max position per chromosome to get chromosome lengths
  chrom_lengths <- cnr[, .(length = max(end)), by = chromosome]
  
  # Sort chromosomes naturally (1,2,...,25,MT)
  chrom_order <- c(as.character(1:25), "MT")
  chrom_lengths <- chrom_lengths[chromosome %in% chrom_order]
  chrom_lengths[, chromosome := factor(chromosome, levels = chrom_order)]
  setorder(chrom_lengths, chromosome)
  
  chrom_lengths[, offset := cumsum(shift(length, fill = 0))]
  chrom_lengths[]
}

# ── Helper: add genome-wide position column ───────────────────────────────────
add_genome_pos <- function(dt, offsets, chrom_col = "chromosome", start_col = "start") {
  dt <- merge(dt, offsets[, .(chromosome, offset)],
              by.x = chrom_col, by.y = "chromosome", all.x = TRUE)
  dt[, genome_pos := get(start_col) + offset]
  dt[]
}

# ── Helper: chromosome boundary positions for x-axis breaks ──────────────────
chrom_breaks <- function(offsets) {
  offsets[, mid := offset + length / 2]
  list(
    breaks     = offsets$mid,
    labels     = as.character(offsets$chromosome),
    boundaries = c(offsets$offset, offsets[.N, offset + length])
  )
}

# ── Per-pair plotting function ────────────────────────────────────────────────
plot_pair <- function(pair_id, reload = TRUE) {
  
  message("Processing pair ", pair_id)
  
  # -- Load CNVkit files -------------------------------------------------------
  cnr_file <- file.path(OUT_LOC, paste0(pair_id, ".cnr"))
  cns_file <- file.path(OUT_LOC, paste0(pair_id, ".call.cns"))

  if (reload || !exists("cnr") || !exists("cns") || !exists("baf")) {
    if (!file.exists(cnr_file)) { warning("Missing .cnr for pair ", pair_id); return(NULL) }
    if (!file.exists(cns_file)) { warning("Missing .cns for pair ", pair_id); return(NULL) }

    cnr <- fread(cnr_file)
    cns <- fread(cns_file)
  } else {
    message("Using already-loaded cnr/cns — set reload=TRUE to re-read from disk")
  }
  
  # CNVkit column names: chromosome, start, end, gene, depth, log2, weight

  # Ensure numeric columns are numeric
  cnr[, start := as.integer(start)][, end := as.integer(end)][, log2 := as.numeric(log2)]
  cns[, start := as.integer(start)][, end := as.integer(end)][, log2 := as.numeric(log2)]

  # Filter to chromosomes 1-25
  chroms_keep <- as.character(1:25)
  cnr <- cnr[chromosome %in% chroms_keep]
  cns <- cns[chromosome %in% chroms_keep]
  offsets <- get_chrom_offsets(cnr)
  cb      <- chrom_breaks(offsets)
  cns$Segment_length <- cns$end - cns$start
  
  # -- Add genome-wide positions -----------------------------------------------
  cnr <- add_genome_pos(cnr, offsets)
  cns <- add_genome_pos(cns, offsets)

  # Segment end position
  cns[, genome_end := end + offset]
  
  # -- Alternating chromosome background ---------------------------------------
  chrom_bg <- data.table(
    xmin  = cb$boundaries[-length(cb$boundaries)],
    xmax  = cb$boundaries[-1],
    fill  = rep(c("white", "grey92"), length.out = length(cb$boundaries) - 1)
  )
  
  bg_layer <- function() {
    list(
      geom_rect(data = chrom_bg,
                aes(xmin = xmin, xmax = xmax, ymin = -Inf, ymax = Inf, fill = fill),
                inherit.aes = FALSE, alpha = 0.5),
      scale_fill_identity(),
      geom_vline(xintercept = cb$boundaries, color = "grey70", linewidth = 0.2)
    )
  }
  
  x_scale <- scale_x_continuous(
    breaks = cb$breaks,
    labels = cb$labels,
    expand = c(0, 0)
  )
  
  # Plot segments -----------------------------------
  p_cnv <- ggplot() +
    bg_layer() +
    geom_segment(data = cns,
                 aes(x = genome_pos, xend = genome_end, y = log2, yend = log2,
                     color = abs(log2) > 0.2),
                 linewidth = 1.2) +
    scale_color_manual(values = c("TRUE" = "#d73027", "FALSE" = "grey50"),
                       guide = "none") +
    geom_hline(yintercept = 0, linetype = "dashed", color = "black", linewidth = 0.4) +
    x_scale +
    labs(
      title = paste0("Pair ", pair_id, " — Copy number"),
      x     = NULL,
      y     = "log2 ratio"
    ) +
    coord_cartesian(ylim = c(-1.2, 1.2)) +
    theme_bw() +
    theme(
      axis.text.x  = element_text(size = 7, angle = 45, hjust = 1),
      legend.position = "top",
      panel.grid.major.x = element_blank(),
      panel.grid.minor   = element_blank()
    )
  
  print(p_cnv)
  
  invisible(list(cnr = cnr, cns = cns))#, baf = baf_filt))
}

# ── Run for all pairs ─────────────────────────────────────────────────────────
results <- lapply(PAIRS, plot_pair, reload = F)
names(results) <- PAIRS

# Plot individual pair
i <- 4

offsets <- get_chrom_offsets(results[[i]]$cns)
cb      <- chrom_breaks(offsets)
chrom_bg <- data.table(
  xmin  = cb$boundaries[-length(cb$boundaries)],
  xmax  = cb$boundaries[-1],
  fill  = rep(c("white", "grey92"), length.out = length(cb$boundaries) - 1)
)

ggplot() +
  geom_rect(data = chrom_bg,
            aes(xmin = xmin, xmax = xmax, ymin = -Inf, ymax = Inf, fill = fill),
            inherit.aes = FALSE, alpha = 0.5) +
  scale_fill_identity() +
  geom_vline(xintercept = cb$boundaries, color = "grey70", linewidth = 0.2) +
  geom_segment(data = results[[i]]$cns,
               aes(x = genome_pos, xend = genome_end, y = log2, yend = log2),
               linewidth = 1.2) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "black", linewidth = 0.4) +
  scale_x_continuous(
    breaks = cb$breaks,
    labels = cb$labels,
    expand = c(0, 0)) +
  labs(
    title = paste0("Pair ", i),
    x     = NULL,
    y     = "log2 ratio"
  ) +
  coord_cartesian(ylim = c(-0.5, 0.5)) +
  theme_bw() +
  theme(
    text = element_text(size = 14),
    axis.text = element_text(size = 12),
    axis.text.x  = element_text(angle = 45, hjust = 1),
    plot.title = element_text(hjust = 0.5, size = 16),
    panel.grid.major.x = element_blank(),
    panel.grid.minor   = element_blank()
  )
# ggsave(paste0("./Images/WGS_pair_", i, ".png"))

# Statistical test of the assumption that differentially-expressing clones have
# copy number variations: probability of finding 8/12 tumors with at least one
# differentially-expressing clone when we find 0/5 tumors without any
# copy number variations.
fisher.test(matrix(c(8, 4, 0, 5), nrow = 2, byrow = T),
            alternative = "greater")
