# Calculating WGS demands

# Requirements ####
## Packages ####
require(data.table)
require(ggplot2)

# Differentially-expressed clone sizes ####
## File descriptions and loading ####
symad_de_clones <- 
  fread("./Data/number_of_modsPerClone_withSigExprDiffToRestOfTumour_topFourSympModsOnly_withCloneNames.csv",
        header = T, nrows = 28,
        col.names = c("Sample", paste0("X", 1:10)))
# Here, the number of modules that are differentially expressed when comparing 
# to the rest of the cells in the tumour are shown for each clone. All modules 
# were taken into account. Samples, in which no inter-clone expression 
# differences were found are not shown in the table. 

clone_sizes <- fread("./Data/clone_cell_numbers_inNBcompartment_withTotalCellNumbs_highres_withCloneNames.csv",
                     nrows = 38)
names(clone_sizes)[1] <- "Sample"

## Table of differentially-expressed clones ####
symad_de_clones_melt <-
  melt(symad_de_clones, id = "Sample", variable.name = "Clone", 
       value.name = "de_count")
# NB de_count is the number of differentially expressed sympathoadrenal modules.
symad_de_clones_melt <- symad_de_clones_melt[complete.cases(symad_de_clones_melt)]
clone_sizes_melt <-
  melt(clone_sizes, id = c("Sample", "non_nb_cells", "all_cells", "total_NBcells",
                         "NBcells_without_clone"),
     variable.name = "Clone", value.name = "Size")
clone_sizes_melt <- clone_sizes_melt[complete.cases(clone_sizes_melt)]
de_clone_sizes <- merge(symad_de_clones_melt, clone_sizes_melt)
de_clone_sizes$Rel_clone_size <- de_clone_sizes$Size/de_clone_sizes$all_cells

## Initial summary ####
paste("Across", nrow(clone_sizes), "models, we see", sum(de_clone_sizes$de_count > 0),
      "clones with differentially expressed sympathoadrenergic modules, with relative sizes varying between", 
      signif(min(de_clone_sizes$Rel_clone_size[de_clone_sizes$de_count > 0]), 2),
      "and",
      signif(max(de_clone_sizes$Rel_clone_size[de_clone_sizes$de_count > 0]), 2))

## Only in MYCN ####
MYCN_lat_clone_size_dist <- data.table(Min_freq = 0.1*1:10, 
                                       Clones = NA,
                                       Pos_models = NA)
for(i in 1:nrow(MYCN_lat_clone_size_dist)){
  min_freq <- MYCN_lat_clone_size_dist$Min_freq[i]
  these_de_clone_sizes <- 
    de_clone_sizes[grepl("MYCN_lat", Sample) &
                     de_count > 0 & Rel_clone_size >= min_freq, ]
  MYCN_lat_clone_size_dist$Clones[i] <- 
    nrow(these_de_clone_sizes)
  MYCN_lat_clone_size_dist$Pos_models[i] <- length(unique(these_de_clone_sizes$Sample))
}
non_LMO1_models <- 
  length(
    unique(clone_sizes$Sample[grepl("MYCN_lat", clone_sizes$Sample)])
  )

dt <- de_clone_sizes[grepl("MYCN_lat", Sample), ]
length(unique(dt$Sample))
detection_threshold <- 0.25
nrow(dt[ de_count > 0 & 
                      Rel_clone_size > detection_threshold, ])
length(unique(dt[de_count > 0 & 
                      Rel_clone_size > detection_threshold, ]$Sample))
# With threshold of 0.26 relative size, we find 9 differentially-expressing
# clones across 8 out of 12 tumors.

# Range of thresholds to sweep
thresholds <- seq(0, max(dt$Rel_clone_size), by = 0.005)

# For each threshold, count samples with at least one de_count>0 clone above it
sweep_dt <- rbindlist(lapply(thresholds, function(thresh) {
  n_samples <- dt[de_count > 0 & Rel_clone_size >= thresh, 
                  uniqueN(Sample)]
  data.table(threshold = thresh, n_samples = n_samples)
}))

# png("./Images/Clone_sizes.png",
#     width = 450, height = 300)
ggplot(sweep_dt, aes(x = threshold, y = n_samples)) +
  geom_step() +
  geom_vline(xintercept = 0.25, linetype = "dashed", color = "red") +
  scale_y_continuous(breaks = 0:12) +
  labs(
    title = "MYCN lateral tumors",
    x = "Relative clone size threshold",
    y = expression(paste("Tumors with at least one\n DE clone over threshold")),
    caption = "Red = 0.25 threshold"
  ) +
  theme_bw() +
  theme(plot.margin = margin(1, 1, 1, 1, "cm"),
        plot.title = element_text(hjust = 0.5))
# dev.off()

