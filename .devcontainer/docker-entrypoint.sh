#!/bin/bash
# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

set -e

# If the run command is the default, do some initialization first
if [ "$(which "$1")" = "/usr/local/bin/start-singleuser.sh" ]; then
  # Clone sample notebooks to user's notebook directory.  Assume $NB_USER's work
  # directory if notebook directory not explicitly set.  `git clone` will fail
  # if target directory already exists and is not empty, which likely means
  # that we've already done it, so just ignore.
  : ${NOTEBOOK_DIR:=/home/$NB_USER/work}
  git clone https://github.com/UKEIAM/CaseStudy_MAE_TCGA_LUAD_Review.git \
    --depth 1 \
    "$NOTEBOOK_DIR/casestudy" || true
fi

# Run the command provided
exec "$@"
