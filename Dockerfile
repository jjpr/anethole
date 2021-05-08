FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y  --no-install-recommends \
    build-essential \
    git \
    wget
    
RUN apt update && \
    apt install -y  --no-install-recommends \
    python3
    
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

RUN pip3 install jupyter

RUN pip3 install mayavi

RUN pip3 install ipyevents

RUN pip3 install xvfbwrapper

RUN pip3 install Pillow

RUN jupyter nbextension install mayavi --py --sys-prefix

RUN jupyter nbextension enable mayavi --py --sys-prefix

ENV DISPLAY :99

RUN mkdir -p /data/notebooks

RUN apt update && \
    apt install -y  --no-install-recommends \
    meshlab

RUN mkdir -p /data/tools

COPY Uniform_Mesh_Resampling.mlx /data/tools/
COPY Uniform_Mesh_Resampling_Color.mlx /data/tools/

CMD jupyter notebook --ip=0.0.0.0 --allow-root --no-browser --notebook-dir=/data
