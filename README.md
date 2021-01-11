# pluto-on-jupyterlab: an extension to use Pluto from within JupyterLab

This small package informs JupyterLab on how to **start** Pluto and exposes the `/pluto` endpoint.

That is useful because you can use your existing JupyterLab infrastructure and use pluto with
existing authentication/deployment settings!!

# If you already have an existing installation of Jupyter/JupyterLab

To install the contents of this repository, you don't need to clone it.

```bash
jupyter labextension install @jupyterlab/server-proxy
pip3 install git+https://github.com/fonsp/pluto-on-jupyterlab.git
```

# Install JupyterHub, JupyterLab & Pluto.jl for your team (Advanced)

Installing JupyterHub is hard.

For instructions on how to install a Pluto.jl server based on JupyterHub,
see @koehlerson detailed guide: https://www.maximiliankoehler.de/posts/pluto-server/

That will help you install JupyterLab, JupyterHub and Pluto on one of your servers,
as well as add users that will have access to JupyterHub.

A use case for this is to create a server for your students/class/team.

## Kubernetes setup (Very Advanced)
For more a advanced setup you may want to follow the [Zero-To-JupyterHub](https://zero-to-jupyterhub.readthedocs.io/en/latest/) guide.

To run JupyterHub with Jupyter that include this extension, you can install this extension in a Docker image that JupyterHub will use to spawn notebook servers for your users.

Check the Dockerfile included below for creating Docker image that includes this extension and that can be used for your JupterHub installation.

[How to configure JupyterHub to use your image](https://zero-to-jupyterhub.readthedocs.io/en/latest/administrator/optimization.html#the-images-that-will-be-pulled)


# !!!Important!!! This extension does *NOT* include Pluto!

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
julia -e "import Pkg; Pkg.update(\"Pluto\");"
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
