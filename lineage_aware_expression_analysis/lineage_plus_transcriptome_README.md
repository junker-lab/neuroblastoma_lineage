# Analysis of transcriptional profiles across clones and transplantation time points
Processed single cell transcriptomes are brought together with gene module scores and cell clonal assignments. This is done [here](./merge_transcriptome_modScores_clones.ipynb) and used to:  
**[on primary tumor data](./clone_transcriptome_analysis.ipynb):**
- Assess overall inter-clonal expression differences
- Perform differential module expression analysis between clones
- Calculate intra-clone module expression variance

**on data from primary tumors and allograft samples:**
- Perform differential module expression analysis between cells from different sample types (e.g. primary tumor vs. late allograft tumor)

