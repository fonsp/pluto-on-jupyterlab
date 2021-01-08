FROM jupyter/datascience-notebook:lab-2.2.9

COPY ./plutoserver ./plutoserver
COPY ./environment.yml ./environment.yml
COPY ./setup.py ./setup.py

RUN pip install --no-cache-dir .

RUN julia -e "import Pkg; Pkg.add([\"PlutoUI\", \"Pluto\", \"DataFrames\", \"CSV\", \"Plots\"]); Pkg.precompile()"