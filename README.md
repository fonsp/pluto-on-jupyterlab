# pluto-on-jupyterlab: An extension to add JupyterLab with Pluto

For instructions on how to install a Pluto.jl server based on JupyterLab,
see @koehlerson detailed guide: https://www.maximiliankoehler.de/posts/pluto-server/

That will help you install JupyterLab, JupyterHub and Pluto on one of your servers,
as well as add users that will have access to JupyterHub.

# How to add this extension in an existing installation of JupyterLab
To install the contents of this repository, you don't need to clone it.

```bash
jupyter labextension install @jupyterlab/server-proxy
pip3 install git+https://github.com/fonsp/pluto-on-jupyterlab.git
```

# !!!Danger!!! This extension does *NOT* include Pluto!
It just teaches jupyter lab how to **start** Pluto and exposes the `/pluto` endpoint.

## Julia Installation 
To install julia, see the official documentation.

The command below will install julia 1.5.3, which may be what you want (run as root)

```bash
wget https://julialang-s3.julialang.org/bin/linux/x64/1.5/julia-1.5.3-linux-x86_64.tar.gz && \
    tar -xvzf julia-1.5.3-linux-x86_64.tar.gz && \
    mv julia-1.5.3 /opt/ && \
    ln -s /opt/julia-1.5.3/bin/julia /usr/local/bin/julia && \
    rm julia-1.5.3-linux-x86_64.tar.gz
```

## Pluto Installation

After installing julia, you can install pluto using `Pkg`.

## Pluto Update

You can update Pluto from Julia as you do with any Julia package.

```bash
julia -e "import Pkg; Pkg.rm(\"Pluto\"); Pkg.add(\"Pluto\");"
```

# Dockerfile

This repository also contains a Dockerfile. You can use this to create a Docker image containing
- the Jupyter application
- **this extension**
- Julia
- Pluto

Use-cases for that are:

- Run Pluto on Binder
- Start a personal Jupyter Notebook server **with Pluto** in a local Docker container
- Run JupyterLab servers **with Pluto** for a team using JupyterHub
- Write your own project Dockerfile **with Pluto** 

When re-build, it installs Julia 1.5.3 and the latest Pluto, on top of [jupyter/scipy-notebook](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-scipy-notebook).

As it happens with Docker Containers, it makes no sense to update Pluto within an existing
(please rebuilt the image instead).

For more information on this, read the docks of [Jupyter Docker Stacks](https://jupyter-docker-stacks.readthedocs.io/en/latest/)