# Case study for Review Paper: "Evaluation of multi-omics methodologies and tools for identification of putative biomarkers and causal molecular networks in translational cancer research"

Reproducible workflow on how to perform Multi-omics cancer data integration with an unsupervised approach-MOFA+

## Usage

### Locally
You have two options for preparing the environment for the script:

1. Use the prepared Docker container in *.devcontainer*.
2. Create the environment manually with something like the following (expect neither pitty nor help). You may install additional dependencies, too: 
```
BiocManager::install(c(
    "MultiAssayExperiment", "curatedTCGAData", "TCGAutils",
    "DESeq2", "M3C", "TxDb.Hsapiens.UCSC.hg19.knownGene", "org.Hs.eg.db"
))

install.packages(c("devtools", "data.table", "tidyverse", "UpSetR"))

devtools::install_github("bioFAM/MOFA2", build_opts = c("--no-resave-data --no-build-vignettes"))
```

### On Jupyter Hub
Just build using the *Dockerfile* and stick to the information [online](https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html).
