# Detection, expression scoring and differential expression analysis of gene modules

## Gene module detection
The initial detection of gene modules is done using [cNMF](https://github.com/dylkot/cNMF) ([https://doi.org/10.7554/eLife.43803](https://elifesciences.org/articles/43803)). The data used as input is a count matrix for all cells of interest written out from Seurat or Scanpy. In this analysis, I also determined highly variable genes passed to cNMF with Seurat. Results from cNMF are then further analyzed in R, e.g. to identify consensus modules from the cNMF-gene modules dreived from many samples.
### Steps:
-
-

## Gene module expression scoring
### AUCell scoring

### Binary expression test scoring



## Differential module expression analysis




