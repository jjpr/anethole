FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y  --no-install-recommends \
    build-essential \
    git \
    wget \
    dumb-init
    
RUN apt update && \
    apt install -y  --no-install-recommends \
    python3.8
    
RUN apt update && \
    apt install -y  --no-install-recommends \
    python3-dev

RUN apt update && \
    apt install -y  --no-install-recommends \
    python3-pip \
    python3-setuptools \
    python3-wheel

RUN apt update && \
    apt install -y  --no-install-recommends \
    xvfb \
    x11-utils \
    libx11-dev \
    qt5-default

RUN apt clean

RUN pip3 install numpy

RUN pip3 install jupyterlab

RUN pip3 install mayavi

RUN pip3 install ipyevents

RUN pip3 install Pillow

RUN pip3 install xvfbwrapper

RUN pip3 install pymeshlab

RUN jupyter nbextension install mayavi --py --sys-prefix

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
