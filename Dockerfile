FROM jupyter/r-notebook
ARG JUPYTERHUB_VERSION=2.0.1

# Add the required files
ADD ["data/Census_allMon Dec 14 12_02_03 2020.tsv", "data/Census_allMon Dec 14 12_02_03 2020.tsv"]
ADD ["Analysis.ipynb", "Analysis.ipynb"]

# Install MOFA2 and JupyterHub
RUN pip install --quiet --no-cache-dir mofapy2 jupyterhub==$JUPYTERHUB_VERSION && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

# Install the required 
RUN mamba install --quiet --yes \
    'r-biocmanager' \
    'r-upsetr' \
    'r-msigdbr' \
    'r-circlize' \
    'r-dplyr' \
    'r-rcolorbrewer' \
    'r-survival' \
    'r-survminer' && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

# Install from BiocManager
RUN R --vanilla -s -e 'BiocManager::install(c("MOFA2", "MultiAssayExperiment", "curatedTCGAData", "TCGAutils", "DESeq2", "M3C", "TxDb.Hsapiens.UCSC.hg19.knownGene", "org.Hs.eg.db", "ComplexHeatmap"))'