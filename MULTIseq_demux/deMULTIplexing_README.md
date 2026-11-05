# MULTI-seq sample demultiplexing
Single cell transcriptomes from sequencing runs using MULTI-seq for sample multiplexing were demultiplexed using the workflow shown for one dataset in [MULTI_seq_demultiplexing.ipynb](MULTI_seq_demultiplexing.ipynb).  
This workflow was carried out using R version 3 with package versions as indicated for [this environment](r3.yml).

Cell barcodes used as input for classification were obtained by loading the raw feature output matrix from cellranger count and performing lenient filtering on these cells. This is done, because the demultiplexing workflow is expected to remove empty droplets and doublets later on and benefits from having some true 'negative cells' in the input data. Preparation of the cell barcode list is done using Seurat in notebook [MULTI_seq_demux_prep.ipynb](MULTI_seq_demux_prep.ipynb) in R version 4 (Environment as [r4.yml](../transcriptome_analysis/r4.yml)).

## Brief workflow overview
- MULTI-seq barcode library sequencing reads were processed using the [deMULTIplex](https://github.com/chris-mcginnis-ucsf/MULTI-seq) pipeline, yielding a count matrix showing number of molecules detected for each barcode per cell.
- Three independent cell-sample classification approaches were used, assigning cells to a sample or classifyng them as 'negative' or 'doublet':
	1. Approach from the [deMULTIplex R package](https://github.com/chris-mcginnis-ucsf/MULTI-seq)
	2. A manual thresholding approach based on visual assessment of barcode count distribution across cells.
	3. Cells were classified according to the dominant barcode identified in them, assigning a cell to a single sample, if the associated dominant barcode contributed over 40 % of barcode molecules found in that cells and had at least 2.3 times as many molecules as the second-most highly detected barcode.
- Only cells assigned to the same sample by at least two of these approaches were given that final sample classification. Cells with ambiguous classification were assigned as 'doublet'. 
