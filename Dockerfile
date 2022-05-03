FROM jupyter/r-notebook
ARG JUPYTERHUB_VERSION=2.0.1

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
    'r-ggally' \
    'r-psych' \
    'r-survminer' && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

# Install from BiocManager
RUN R --vanilla -s -e 'BiocManager::install(c("MOFA2", "MultiAssayExperiment", "curatedTCGAData", "TCGAutils", "DESeq2", "M3C", "TxDb.Hsapiens.UCSC.hg19.knownGene", "org.Hs.eg.db", "ComplexHeatmap"))'

# Skript to clone the repository with the files
USER root
COPY .devcontainer/docker-entrypoint.sh /srv/docker-entrypoint.sh
RUN chmod 700 /srv/docker-entrypoint.sh
ENTRYPOINT ["tini", "--", "/srv/docker-entrypoint.sh"]
CMD ["start-singleuser.sh"]