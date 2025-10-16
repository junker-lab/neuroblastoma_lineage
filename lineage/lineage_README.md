# Single cell lineage tracing
# ... based on CRISPR/Cas9-induced barcodes in endogenous genes and a transgenic recording cassette
  
## Contents of this directory
- [dir linBC_extraction](./linBC_extraction/):
    - Scripts for extracting lineage barcode sequences from fastqs obtained from 10x-cDNA-derived targeted endogenous gene libraries and a targeted transgenic gene library (set to dsRedRecCas target).
    - Config-files to pass file names and parameters to the lineage barcode extraction scripts.
    - Wildtype sequence reference fastas.
    - Commands for running the scripts.
    - Tiny example key input and output files.
    - A [README](./linBC_extraction/README_linBC_extraction.md) with more detailed information on contents.
- [dir linBC_processing_and_clone_calling](./linBC_processing_and_clone_calling/):
    - R-scripts with filtering functions for endogenous target and transgenic target sequences.
    - R-script with functions for grouping endogenous target gene lineage barcodes and cells on a per-gene basis.
    - R-script with clone calling function.
    - Lineage barcode creation probabilities for selected genes.
    - An jupyter notebook demonstrating a full workflow from filtering to clone calling
    - Small example output files.
    - A [README](./linBC_processing_and_clone_calling/README_processing_cloneCalling.md) with more detailed information on contents.
- [dir LINNAEUS_resources](./LINNAEUS_resources/):
    - Reproduced from [LINNAUES](https://github.com/Bastiaanspanjaard/LINNAEUS).
    - Contains key resources and background functions for lineage barcode sequence extraction and filtering for transgenic target.

## Overview of workflow
The following gives an introduction to the workflow of extracting lineage barcodes, filtering them and finally calling clones. For further information on production and sequencing of lineage barcode libraries, please refer to the methods section of the publication.   

### 1. Lineage barcode extraction
This step takes as input sequencing read fastq-files derived from targeted libraries produced for a specific lineage tracing target gene. These libraries are derived from 10x-cDNA and are expected to be sequenced with 28 cycles on R1 and at least 90, but preferably more cycles (e.g. 150 for transgene cassette) on R2.   
The extraction workflow is performed separately for the transgenic target gene and the endogenous target genes.  
**Endogenous target lineage barcode extraction**
- Fastqs for all endogenous target genes need to be merged into one fastq-file. A small example R2 can be found [here](./linBC_extraction/data/bAllos4_tums_S1_endoTargets_R2.fastq).
- The pipeline further needs a list of names of the genes to be considered, a list of valid cell barcodes written out from Seurat or Scanpy object, a reference fasta for all genes to be considered. Furthermore, a bam-file produced during mapping of the corresponding whole transcriptome library with cellranger count (possorted_genome_bam.bam) is needed.
- Location and name of input file names need to be configured in the config_endo.sh file.
- Lineage barcode extraction can then be run via the command in [commands_lineage_barcode_extraction.sh](./linBC_extraction/commands_lineage_barcode_extraction.sh) and entails the following steps:
    - Indexing of reference fasta with bwa.
    - Extraction of valid cell barcodes and UMIs for each gene of interest from the whole transcriptome mapping bam-file. This is cross-referenced with the provided list of valid cell barcodes after filtering the whole transcriptome data (e.g. in Seurat).
    - Sequencing reads from targeted libraries are mapped to the reference-fasta with bwa.
    - Mapping results are cross-referenced with the allowed cell barcode and UMI list.
    - Reads are counted for each UMI and lineage barcode.
    - Final output used downstream is in file XX_scars_UMIw_read_counts.txt ([small example](./linBC_extraction/output/bAllos4_tums_S1_endoTargets_scars_UMIw_read_counts.txt)) with one entry per combination of cell barcode, UMI and lineage target sequence. For each entry, the number of reads, the gene the sequence was derived from and the sequence-CIGAR derived from bwa-mapping are provided.  

**Transgenic target lineage barcode extraction (here for dsRedRecCas)**
- A small example R2 fastq derived from the transgenic target site can be found [here](./linBC_extraction/data/bAllos4_tums_S1_dsRedRecCas_R2.fastq).
- The pipeline further needs as input a reference fasta file, further scripts provided [here](./LINNAEUS_resources/scar_extraction) and a config file.
- Location and name of input file names need to be configured in the config_transgene.sh. Further input required here:
    - a barcode read threshold (dependent on sequencing depth; for a library derived from 10k cells and sequenced with 15 Mio reads, a typical threshold is 500 reads)
    - the sequence of the target-specific primer used for library generation to extract reads with a valid primer sequence
    - the desired length of the output lineage barcode sequence; depends on the length of R2, but should ideally cover the entire recording cassette and is therefore set to 140
- Lineage barcode extraction can then be run via the command in [commands_lineage_barcode_extraction.sh](./linBC_extraction/commands_lineage_barcode_extraction.sh) and entails the following steps:
    - Indexing of reference fasta with bwa.
    - Count reads per cell barcode and only keep cell barcodes above the threshold.
    - Map lineage sequencing reads to reference fasta with bwa, taking into account desired read clipping length and primer sequence.
    - Reads are counted for each UMI and lineage barcode and those with only one read are removed.
    - Lineage barcodes are filtered for sequencing errors using the scar_filter.py from LINNAEUS.
    - Returns two output files used downstream with small examples provided:
        - file XX_reads_over1.txt ([small example](./linBC_extraction/output/bAllos4_tums_S1_dsRedRecCas_reads_over1.txt)) with one entry per combination of cell barcode, UMI and lineage target sequence. For each entry, the number of reads and the sequence-CIGAR derived from bwa-mapping are provided.
        - file XX_filtered_scars.csv ([small example](./linBC_extraction/output/bAllos4_tums_S1_dsRedRecCas_filtered_scars.csv)) contains the sequencing-error-filtered output with one entry per combination of cell barcode, UMI and lineage target sequence. For each entry, the number of reads and the sequence-CIGAR derived from bwa-mapping are provided.

### 1. Lineage barcode filtering and processing

