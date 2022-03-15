# Case study for Review Paper: "Evaluation of multi-omics methodologies and tools for identification of putative biomarkers and causal molecular networks in translational cancer research"

Reproducible workflow on how to perform Multi-omics cancer data integration with an unsupervised approach-MOFA+

## Usage
You have two options for preparing the environment for the script:

1. Use the prepared Docker container in *.devcontainer*.
2. Create the environment manually: ```
BiocManager::install(c(
    "MultiAssayExperiment", "curatedTCGAData", "TCGAutils",
    "DESeq2", "M3C", "TxDb.Hsapiens.UCSC.hg19.knownGene", "org.Hs.eg.db"
))

install.packages(c("devtools", "data.table", "tidyverse", "UpSetR"))

devtools::install_github("bioFAM/MOFA2", build_opts = c("--no-resave-data --no-build-vignettes"))
```