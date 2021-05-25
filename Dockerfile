FROM python:3.8

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y  --no-install-recommends \
    build-essential \
    git \
    wget \
    dumb-init

#RUN apt update && \
#    apt install -y  --no-install-recommends \
#    python3.8
#
#RUN apt update && \
#    apt install -y  --no-install-recommends \
#    python3-dev
#
#RUN apt update && \
#    apt install -y  --no-install-recommends \
#    python3-pip \
#    python3-setuptools \
#    python3-wheel

RUN apt update && \
    apt install -y  --no-install-recommends \
    xvfb \
    x11-utils \
    libx11-dev \
    qt5-default

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash

RUN apt update && \
    apt install -y  --no-install-recommends \
    nodejs

RUN npm install

RUN apt clean

RUN pip install numpy

RUN pip install jupyterlab

RUN pip install mayavi

RUN pip install ipyevents

RUN pip install Pillow

RUN pip install xvfbwrapper

RUN pip install pymeshlab

RUN jupyter nbextension install mayavi --py --sys-prefix
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager ipyevents

ENV DISPLAY :99

RUN mkdir -p /data/notebooks
RUN mkdir -p /data/tools
RUN mkdir -p /data/examples/images

COPY Equation_To_Object_Instructions.ipynb /data/examples/
COPY images/ruffle_equation.png /data/examples/images/
COPY images/wrapped_ruffle.png /data/examples/images/
COPY images/printed.png /data/examples/images/
COPY images/saddle_grapher.png /data/examples/images/

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--no-browser", "--notebook-dir=/data"]
