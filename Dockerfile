FROM jupyter/datascience-notebook:lab-2.2.9

USER ${NB_USER}

COPY --chown=${NB_USER}:users ./plutoserver ./plutoserver
COPY --chown=${NB_USER}:users ./environment.yml ./environment.yml
COPY --chown=${NB_USER}:users ./setup.py ./setup.py
COPY --chown=${NB_USER}:users ./runpluto.sh ./runpluto.sh

RUN julia -e "import Pkg; Pkg.add([\"PlutoUI\", \"Pluto\", \"DataFrames\", \"CSV\", \"Plots\"])"
# ; Pkg.precompile()

RUN pip install --no-cache-dir .
