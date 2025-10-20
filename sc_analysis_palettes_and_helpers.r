# Functions and useful resources for scRNA-seq analysis 

# Color palettes

tol21rainbow= c("#771155", "#AA4488", "#CC99BB", "#114477", "#4477AA", "#77AADD", "#117777", "#44AAAA", "#77CCCC", "#117744", "#44AA77", "#88CCAA", "#777711", "#AAAA44", "#DDDD77", "#774411", "#AA7744", "#DDAA77", "#771122", "#AA4455", "#DD7788", "#525252", "#969696", "#252525", "#C6DBEF", "#FC9272", "#C7E9C0", "#DBDBDB", "#FDEE02", "#FFAB00", "#4D4DBF", "#BF4DBF", "#999999")


pinks_8 <- c('#ffcfe2',
             '#ff9dc8',
             '#ff5aaf',
             '#ef0096',
             '#c7007c',
             '#9f0162',
             '#790149',
             '#560133'
            )

yellowtobrown <- c('#f7f5bc',
                    '#f1ee8e',
                    '#ece75f',
                    '#e8e337',
                    '#e5de00',
                    '#e6cc00',
                    '#e6b400',
                    '#e69b00',
                    '#ec9006',
                    '#e47200',
                    '#d24e01',
                    '#a34100',
                    '#853500'
                    )

blues_24 = c(
            '#f2fcff',
            '#e2f9fe',
            '#d2f6fe',
            '#c1f2fe',
            '#b1effe',
            '#a1ecff',
            '#80e5ff',
            '#57ddff',
            '#3fd8ff',
            '#26d3ff',
            '#06cdff',
            '#00bdec',
            '#00a9d4',
            '#009cc3',
            '#008fb3',
            '#0082a3',
            '#007592',
            '#006882',
            '#005b72',
            '#004e61',
            '#004151',
            '#003441',
            '#002730',
            '#001318'
            )

colorblindfriend24 = c(
                        '#003D30',
                        '#005745',
                        '#00735C',
                        '#009175',
                        '#00AF8E',
                        '#00CBA7',
                        '#00EBC1',
                        '#86FFDE',
                        '#00306F',
                        '#00489E',
                        '#005FCC',
                        '#0079FA',
                        '#009FFA',
                        '#00C2F9',
                        '#00E5F8',
                        '#7CFFFA',
                        '#5F0914',
                        '#86081C',
                        '#B20725',
                        '#DE0D2E',
                        '#FF4235',
                        '#FF8735',
                        '#FFB935',
                        '#FFE239'
                        )

colorblindfriend24_var = c(
                        '#003D30',
                        '#005745',
                        '#00735C',
                        '#009175',
                        '#00AF8E',
                        '#00CBA7',
                        '#FF9DC8',
                        '#86FFDE',
                        '#00306F',
                        '#00489E',
                        '#005FCC',
                        '#0079FA',
                        '#009FFA',
                        '#00C2F9',
                        '#00E5F8',
                        '#7CFFFA',
                        '#000000',
                        '#5F0914',
                        '#86081C',
                        '#B20725',
                        '#DE0D2E',
                        '#FF4235',
                        '#D24E01',
                        '#FF8735',
                        '#FFB935',
                        '#FFE239',
                        '#FEFF4F',
                        '#FFFBC8'
                        )

allmerged_final_ct_cols <-
c(
    'NB' = colorblindfriend24_var[7],
    'HSPCs' = colorblindfriend24_var[1],
    'Lymphoid_progenitors' = colorblindfriend24_var[2],
    'B_cells' = colorblindfriend24_var[3],
    'T_cells' = colorblindfriend24_var[4],
    'Th2_cells_ILC2s' = colorblindfriend24_var[5],
    'T_and_NK_cells' = colorblindfriend24_var[6],
    'NK_cells' = colorblindfriend24_var[8],
    'NKL_cells' = colorblindfriend24_var[9],
    'Macrophages_myeloid' = colorblindfriend24_var[10],
    'Macrophages' = colorblindfriend24_var[11],
    'Neutrophils' = colorblindfriend24_var[12],
    'Blood_progenitors' = colorblindfriend24_var[13],
    'Erythrocytes' = colorblindfriend24_var[14],
    'Fibroblasts' = colorblindfriend24_var[17],
    'Endothelial_cells' = colorblindfriend24_var[18],
    'Glial_sox10' = colorblindfriend24_var[19],
    'Keratinocytes' = colorblindfriend24_var[20],
    'Epithelial_cells' = colorblindfriend24_var[21],
    'Kidney_tubule' = colorblindfriend24_var[22],
    'Mucin_cells' = colorblindfriend24_var[23],
    'Multiciliated_cells' = colorblindfriend24_var[24],
    'Interrenal_cells' = colorblindfriend24_var[25],
    'Hepato_enterocytes' = colorblindfriend24_var[26],
    'Muscle_cells' = colorblindfriend24_var[27],
    'Smooth_muscle' = colorblindfriend24_var[28],
    'Doublets' = 'light grey'
) 


alltimepointsmerged_final_ct_cols <-
c(
    'NB' = colorblindfriend24_var[7],
    'HSPCs' = colorblindfriend24_var[1],
    'Lymphoid_progenitors' = colorblindfriend24_var[2],
    'B_cells' = colorblindfriend24_var[3],
    'T_cells' = colorblindfriend24_var[4],
    'Th2_cells_ILC2s' = colorblindfriend24_var[5],
    'T_and_NK_cells' = colorblindfriend24_var[6],
    'NK_cells' = colorblindfriend24_var[8],
    'NKL_cells' = colorblindfriend24_var[9],
    'Macrophages_myeloid' = colorblindfriend24_var[10],
    'Macrophages' = colorblindfriend24_var[11],
    'Neutrophils' = colorblindfriend24_var[12],
    'Blood_progenitors' = colorblindfriend24_var[13],
    'Erythrocytes' = colorblindfriend24_var[14],
    'Fibroblasts' = colorblindfriend24_var[17],
    'Endothelial_cells' = colorblindfriend24_var[18],
    'Glial_sox10' = colorblindfriend24_var[19],
    'Keratinocytes' = colorblindfriend24_var[20],
    'Epithelial_cells' = colorblindfriend24_var[21],
    'Kidney_tubule' = colorblindfriend24_var[22],
    'Mucin_cells' = colorblindfriend24_var[23],
    'Multiciliated_cells' = colorblindfriend24_var[24],
    'Interrenal_cells' = colorblindfriend24_var[25],
    'Hepato_enterocytes' = colorblindfriend24_var[26],
    'Muscle_cells' = colorblindfriend24_var[27],
    'Smooth_muscle' = colorblindfriend24_var[28],
    'Macrophages_myeloid_NKL_cells' = colorblindfriend24_var[15],
    'Mesenchymal_cells' = '#C19770',
    'Pigment_cells' = '#D5B895',
    'Radial_glia' = '#E8DCB5',
    'Neuronal' = '#F2E5D9',
    'Doublets' = 'light grey'
) 




mytheme_basic <-  theme(panel.background = element_rect(fill = 'white', colour = "#555555", linetype = 'solid'),
                          axis.text.x = element_text(colour = "#555555", size = 12),
                          axis.title.x = element_text(colour = "#555555", size = 14),
                          axis.text.y = element_text(colour = "#555555", size = 12),
                          axis.title.y = element_text(colour = "#555555", size = 14),
                          legend.text=element_text(colour = "#555555", size=12),
                          legend.title=element_text(colour = "#555555", size=14),
                          legend.key = element_blank(),
                          panel.grid.major.x = element_blank(),
                          panel.grid.major.y = element_blank()
                          )

mytheme_angledX <-  theme(panel.background = element_rect(fill = 'white', colour = "#555555", linetype = 'solid'),
                          axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1, colour = "#555555", size = 12),
                          axis.title.x = element_text(colour = "#555555", size = 14),
                          axis.text.y = element_text(colour = "#555555", size = 12),
                          axis.title.y = element_text(colour = "#555555", size = 14),
                          legend.text=element_text(colour = "#555555", size=12),
                          legend.title=element_text(colour = "#555555", size=14),
                          legend.key = element_blank(),
                          panel.grid.major.x = element_blank(),
                          panel.grid.major.y = element_blank()
                          )

mytheme_angledYtitle <-  theme(panel.background = element_rect(fill = 'white', colour = "#555555", linetype = 'solid'),
                              axis.text.x = element_text(colour = "#555555", size = 12),
                              axis.title.x = element_text(colour = "#555555", size = 14),
                              axis.text.y = element_text(colour = "#555555", size = 12),
                              axis.title.y = element_text(angle = 90, vjust = 1, hjust=0.5, colour = "#555555", size = 14),
                              legend.text=element_text(colour = "#555555", size=12),
                              legend.title=element_text(colour = "#555555", size=14),
                              legend.key = element_blank(),
                              panel.grid.major.x = element_blank(),
                              panel.grid.major.y = element_blank()
                              )



# Function to write pheatmap-generated heatmaps to PDF
save_pheatmap_pdf <- function(x, filename, width=7, height=7) {
   stopifnot(!missing(x))
   stopifnot(!missing(filename))
   pdf(filename, width=width, height=height)
   grid::grid.newpage()
   grid::grid.draw(x$gtable)
   dev.off()
}


# Miscellaneous functions

# jaccard similarity function
jaccard <- function(a, b) {
    intersection = length(intersect(a, b))
    union = length(a) + length(b) - intersection
    return (intersection/union)
}



# Functions for pairwise correlation of positive values in two dataframe columns.
# Create a function to calculate correlation and p-value for a pair of columns.
# Takes a dataframe called all_scores and returns a list of results.

calculate_correlation <- function(i, all_scores = all_scores
                                 ){

    corr_result <- lapply(colnames(all_scores), function(x) {
          corr_test <- cor.test(as.data.frame(all_scores[all_scores[,i] > 0 | all_scores[,x] > 0 ,])[, i],
                                as.data.frame(all_scores[all_scores[,i] > 0 | all_scores[,x] > 0 ,])[, x],
                                method = "pearson", use = "pairwise.complete.obs", verbose = F)
          return(corr_test)
        })

    res_vec <- unlist(corr_result)

    loop_pval <- as.data.frame(res_vec[names(res_vec) == 'p.value' ])
    rownames(loop_pval) <- colnames(all_scores)
    loop_corr <- as.data.frame(res_vec[names(res_vec) == 'estimate.cor' ]) # estimate.rho for spearman
    rownames(loop_corr) <- colnames(all_scores)
    
    res_list <- list('loop_corr' = loop_corr, 'loop_pval' = loop_pval)
    
    return(res_list)
}




# Functions for scoring modules with different approaches.

# 1. For scRNA-seq: Taken from Barkley et al. Nat Gen 2022 as presented here https://github.com/yanailab/PanCancer with minimal alterations

# 1. Making random gene sets for score comparison to gene set of interest:

MakeRand = function(
      srt, # this is the seurat object,
      db, # this is a modules list,
      assay = NULL,
      nrand = 3,
      nbin = 25
    ){
      if (is.null(assay)){
        assay = DefaultAssay(srt)
      }
      data = GetAssayData(srt, slot = 'data')
      db = lapply(db, intersect, rownames(data))
      data.avg = sort(rowMeans(x = data))
      data.cut = cut_number(x = data.avg + rnorm(n = length(data.avg))/1e+30, 
                            n = nbin, labels = FALSE, right = FALSE)
      names(x = data.cut) = names(x = data.avg)
      binned = split(names(data.cut), data.cut)
      db_rand = lapply(names(db), function(m){
        lapply(1:10^nrand, function(i){
          used = vector()
          unused = binned
          for (g in db[[m]]){
            pool = data.cut[g]
            new = sample(unused[[pool]], 1)
            used = c(used, new)
            unused[[pool]] = setdiff(unused[[pool]], new)
          }
          return(used)
        })
      })
      names(db_rand) = names(db)
      return(db_rand)
}


# 2. Scoring function
# Modules to cells
GeneToEnrichment = function(
      srt, # seurat object,
      type = 'GO',
      db = NULL,
      method = 'rand',
      genes = NULL,
      assay = NULL,
      do.rescale = FALSE,
      min.cells = 0,
      min.genes = 0,
      min.var = 0,
      min.var.rescaled = 0,
      auc_percentile = 0.05,
      db_rand = NULL,
      nrand = 4,
      nbin = 25,
      ...
    ){
      if (is.null(assay)){
        assay = DefaultAssay(srt)
      }
      if (is.null(db)){
        db = FindMSigDB(type)
      }

      counts = as.matrix(GetAssayData(srt, assay = assay, slot = 'counts'))
      genes = rownames(counts)
      genes.expr = rownames(counts)[rowSums(counts) > min.cells]

      if (method == 'metagene'){

        data = as.matrix(GetAssayData(srt, assay = assay, slot = 'scale.data'))

        db = lapply(db, intersect, genes.expr)


        enrichment.profile = t(sapply(names(db), function(m){

            if(length(db[[m]]) >= 5){
              colMeans(data[db[[m]], ], na.rm = TRUE)
            }else{

              rep(0, ncol(data))

            }

        }))

        enrichment.profile = enrichment.profile[sapply(names(db), function(x){
          v = var(enrichment.profile[x, ])
          l = length(db[[x]])
          return(l > min.genes
                 && v > min.var
                 && v*l^2 > min.var.rescaled)
        }), ]

        if (do.rescale){
          mn = apply(enrichment.profile, 1, mean)
          v = apply(enrichment.profile, 1, var)
          enrichment.profile = (enrichment.profile - mn) / sqrt(v)
        }

        #srt = AddMetaData(srt,  t(enrichment.profile), col.name = rownames(enrichment.profile))
         srt = enrichment.profile

      }

      if (method == 'auc'){

        data = as.matrix(GetAssayData(srt, assay = assay, slot = 'data'))

        cells_rankings = AUCell_buildRankings(data)
        cells_AUC = AUCell_calcAUC(db, cells_rankings, aucMaxRank=nrow(cells_rankings)*auc_percentile)
        enrichment.profile = getAUC(cells_AUC)

        if (do.rescale){
          mn = apply(enrichment.profile, 1, mean)
          v = apply(enrichment.profile, 1, var)
          enrichment.profile = (enrichment.profile - mn) / sqrt(v)
        }

         srt = t(enrichment.profile)
      }

      if (method == 'score'){

        temp = AddModuleScore(srt, features = db, assay = assay, name = names(db), nbin = nbin, ...)


        enrichment.profile = t(temp@meta.data[, paste0(names(db), 1:length(db))])

        if (do.rescale){
          mn = apply(enrichment.profile, 1, mean)
          v = apply(enrichment.profile, 1, var)
          enrichment.profile = (enrichment.profile - mn) / sqrt(v)
        }

        #srt = AddMetaData(srt,  t(enrichment.profile), col.name = rownames(enrichment.profile))
        srt = enrichment.profile

      }

      if (method == 'rand'){

        data = as.matrix(GetAssayData(srt, assay = assay, slot = 'scale.data'))

        db = lapply(db, intersect, genes)

        if (is.null(db_rand)){
          db_rand = MakeRand(srt, db, nrand = nrand, nbin = nbin)
        } else {
          nrand = log10(length(db_rand[[1]]))
        }

        enrichment.profile = t(sapply(names(db), function(m){
          ra = sapply(db_rand[[m]], function(i){
            colMeans(data[i, ], na.rm = TRUE)
          })
          re = colMeans(data[db[[m]], ], na.rm = TRUE)
          p = rowMeans(ra >= re)
          p = -log10(p)
          return(p)
        }))
        enrichment.profile[is.infinite(enrichment.profile)] = nrand
        enrichment.profile = enrichment.profile/nrand

        #srt = AddMetaData(srt,  t(enrichment.profile), col.name = rownames(enrichment.profile))
         srt = enrichment.profile
      }



      if (method == 'countsum'){

        data = as.matrix(GetAssayData(srt, assay = assay, slot = 'counts'))


        for(i in 1:length(modules_pan)){
            if(i == 1){
                enrichment.profile <- as.data.frame(colSums(data[rownames(data) %in% modules_pan[[i]],]))
                colnames(enrichment.profile)[i] <- names(modules_pan)[i]
            }else{
                enrichment.profile <- cbind(enrichment.profile, as.data.frame(colSums(data[rownames(data) %in% modules_pan[[i]],])))
                colnames(enrichment.profile)[i] <- names(modules_pan)[i]
            }
        }

        srt = enrichment.profile

      }


      return(srt)
}



# 2. FOR BULK RNA-seq
# Adapted https://github.com/HerpelinckT/geneset-modulescoring

AddGeneSetScore <- function(
  dds,
  features,
  pool = NULL,
  nbin = 24,
  ctrl = 100,
  name = 'Set',
  seed = 123
) {
  if (!is.null(x = seed)) {
    set.seed(seed = seed)
  }
  
  `%||%` <- function(a, b) if (!is.null(a)) a else b
  
  object <- assay(dds) # used to be counts(dds) to use non-normalized counts. This seems wrong though!
  object.old <- object
  object <- object %||% object.old
  
  features <- list(features)
  features.old <- features
  
  if (is.null(x = features)) {
    stop("Missing input feature list")
  }
  features <- lapply(
    X = features,
    FUN = function(x) {
      missing.features <- setdiff(x = x, y = rownames(x = object))
      if (length(x = missing.features) > 0) {
        warning(
          "The following features are not present in the object: ",
          paste(missing.features, collapse = ", ")
        ) 
        warning(
          paste0("\n ",
                 paste(missing.features, collapse = ", "),
                 " dropped for calculating the geneset score."
          )
        )
      }
      return(intersect(x = x, y = rownames(x = object)))
    }
  )
  
  geneset.length <- length(x = features)
  
  pool <- pool %||% rownames(x = object)
  data.avg <- Matrix::rowMeans(x = object[pool, ])
  data.avg <- data.avg[order(data.avg)]
  data.cut <- cut_number(x = data.avg + rnorm(n = length(data.avg))/1e30, n = nbin, labels = FALSE, right = FALSE)
  names(x = data.cut) <- names(x = data.avg)
  ctrl.use <- vector(mode = "list", length = geneset.length)
  for (i in 1:geneset.length) {
    features.use <- features[[i]]
    for (j in 1:length(x = features.use)) {
      ctrl.use[[i]] <- c(
        ctrl.use[[i]],
        names(x = sample(
          x = data.cut[which(x = data.cut == data.cut[features.use[j]])],
          size = ctrl,
          replace = FALSE
        ))
      )
    }
  }
  ctrl.use <- lapply(X = ctrl.use, FUN = unique)
  ctrl.scores <- matrix(
    data = numeric(length = 1L),
    nrow = length(x = ctrl.use),
    ncol = ncol(x = object)
  )
  for (i in 1:length(ctrl.use)) {
    features.use <- ctrl.use[[i]]
    ctrl.scores[i, ] <- Matrix::colMeans(x = object[features.use, ])
  }
  features.scores <- matrix(
    data = numeric(length = 1L),
    nrow = geneset.length,
    ncol = ncol(x = object)
  )
  for (i in 1:geneset.length) {
    features.use <- features[[i]]
    data.use <- object[features.use, , drop = FALSE]
    features.scores[i, ] <- Matrix::colMeans(x = data.use)
  }
  features.scores.use <- features.scores - ctrl.scores
  rownames(x = features.scores.use) <- paste0(name, 1:geneset.length)
  features.scores.use <- as.data.frame(x = t(x = features.scores.use))
  
  range01 <- lapply(
    X = features.scores.use,
    FUN = function(x) {
      range01 <- (x-min(x))/(max(x)-min(x))
    }
  )
  
  range01 <- as.data.frame(x = range01)
  rownames(x = range01) <- colnames(object)
  
  colData(dds) <- cbind(colData(dds), range01)
  
  return(dds)
}

































# Differential module score calculation (with permutation test for significance)
# dat is a seurat object
# location_clones is the metadata column name containing information on the groups used for comparison (e.g. clone)

modScorDiff_Permutation <- function(clone1,
                               clone2,
                               dat,
                               type, # tirosh, barkley, auc or metafeatures
                               nperm,
                               module_names,
                               module_metnames
                              ) {
    
    results_df_perm <- data.frame()
    results_df <- data.frame()
    results_df_p <- data.frame()

    # Add ID to module number depending on assay used
   
    if(type == 'tirosh'){
        module_names <- paste0('tiro_',module_names)
        
    }else if(type == 'barkley'){
        module_names <- paste0('bark_',module_names)
        
    }else if(type == 'auc'){
        module_names <- paste0('auc_',module_names)
        
    }else if(type == 'metafeatures'){
        module_names <- paste0('meta_',module_names)
        
    }else if(type == 'count'){
        module_names <- paste0('count_',module_names)
        
    }
    
    # Filter cells for each clone pair
    clone1_cells <- which(dat$location_clones == clone1)
    clone2_cells <- which(dat$location_clones == clone2)
    
    if (length(clone1_cells) <= 10 || length(clone2_cells) <= 10 || length(c(clone1_cells, clone2_cells)) <= 25) {
        return(NULL)  # Skip this combination
    }
    
    # Extract cells that belong to the two clones from the dataset
    clone_cells <- c(names(which(dat$location_clones == clone1)), names(which(dat$location_clones == clone2)))
    sub <- subset(dat, cells = clone_cells)
    

    
    # Calculate differential expression between clone1 and clone2
    
    if(type == 'tirosh'){
        de_result <- FindMarkers(sub, group.by = "location_clones", ident.1 = clone1, ident.2 = clone2, test.use = "wilcox", reduction = 'scores_tiro', min.pct=0.05, min.diff.pct=0.05)
        
    }else if(type == 'barkley'){
        de_result <- FindMarkers(sub, group.by = "location_clones", ident.1 = clone1, ident.2 = clone2, test.use = "wilcox", reduction = 'scores_bark', min.pct=0.05, min.diff.pct=0.05)
        
    }else if(type == 'auc'){
        de_result <- FindMarkers(sub, group.by = "location_clones", ident.1 = clone1, ident.2 = clone2, test.use = "wilcox", reduction = 'scores_auc', min.pct=0.05, min.diff.pct=0.05)
        
    }else if(type == 'metafeatures'){
        de_result <- FindMarkers(sub, group.by = "location_clones", ident.1 = clone1, ident.2 = clone2, test.use = "wilcox", reduction = 'scores_meta', min.pct=0.05, min.diff.pct=0.05)
        
    }else if(type == 'count'){
        de_result <- FindMarkers(sub, group.by = "location_clones", ident.1 = clone1, ident.2 = clone2, test.use = "wilcox", reduction = 'scores_count', min.pct=0.05, min.diff.pct=0.05)
        
    }
        
    # Store the results in the data frame
    results_df <- data.frame(Clone1 = clone1,
                             Clone2 = clone2,
                             DE_pval = de_result$p_val,
                             DE_pvaladj = de_result$p_val_adj,
                             DE_avgdiff = de_result$avg_diff,
                             Module = rownames(de_result))
    
    
    for (t in 1:nperm) {
        # Randomly shuffle clonal assignments
        set.seed(t)
        sub@meta.data$location_clones <- sample(sub@meta.data$location_clones)
        sub@meta.data$location_clones <- as.factor(as.character(sub@meta.data$location_clones))
        Idents(sub) <- 'location_clones'
        
        # Calculate differential expression between clone1 and clone2
                
            if(type == 'tirosh'){
                de_result_perm <- FindMarkers(sub, group.by = "location_clones", ident.1 = clone1, ident.2 = clone2, test.use = "wilcox", reduction = 'scores_tiro', min.pct=0.05, min.diff.pct=0.05)

            }else if(type == 'barkley'){
                de_result_perm <- FindMarkers(sub, group.by = "location_clones", ident.1 = clone1, ident.2 = clone2, test.use = "wilcox", reduction = 'scores_bark', min.pct=0.05, min.diff.pct=0.05)

            }else if(type == 'auc'){
                de_result_perm <- FindMarkers(sub, group.by = "location_clones", ident.1 = clone1, ident.2 = clone2, test.use = "wilcox", reduction = 'scores_auc', min.pct=0.05, min.diff.pct=0.05)

            }else if(type == 'metafeatures'){
                de_result_perm <- FindMarkers(sub, group.by = "location_clones", ident.1 = clone1, ident.2 = clone2, test.use = "wilcox", reduction = 'scores_meta', min.pct=0.05, min.diff.pct=0.05)

            }else if(type == 'count'){
                de_result_perm <- FindMarkers(sub, group.by = "location_clones", ident.1 = clone1, ident.2 = clone2, test.use = "wilcox", reduction = 'scores_count', min.pct=0.05, min.diff.pct=0.05)

            }
        
        # Store the results in a list
        results_df_perm <- rbind(results_df_perm, data.frame(Clone1 = clone1,
                                                             Clone2 = clone2,
                                                             DE_pval = de_result_perm$p_val,
                                                             DE_pvaladj = de_result_perm$p_val_adj,
                                                             DE_avgdiff = de_result_perm$avg_diff,
                                                             Module = rownames(de_result_perm)))
    }
    rm(sub)
    
    
    for (z in 1:length(module_names)) {
        mod <- module_names[z]
        
        results_df_perm_z <- results_df_perm[results_df_perm$Module == mod,]
        
        avg_diff_perm <- abs(results_df_perm_z$DE_avgdiff)
        avg_diff_actual <- abs(de_result$avg_diff[rownames(de_result) == mod])
        avg_diff_perm_mean <- mean(avg_diff_perm)
        
        p_val_p <- sum(avg_diff_perm >= avg_diff_actual) / nperm
        
        results_df_p <- rbind(results_df_p, data.frame(Clone1 = clone1, Clone2 = clone2, Module = mod, p_val_perm = p_val_p, avg_diff_perm_mean = avg_diff_perm_mean, avg_diff_actual = avg_diff_actual))
    }
    
    res_list <- list('corrected_sum_values' = results_df_p, 'results_perm' = results_df_perm)
    
    return(tryCatch(return(res_list), error=function(e) NULL))
}


FaultTolerant_modScorDiff <- function(clone1, clone2, dat, type, nperm, module_names, module_metnames) {
    
    tryCatch(modScorDiff_Permutation(clone1, clone2, dat, type, nperm, module_names, module_metnames), error = function(e) NULL)
             
 }


