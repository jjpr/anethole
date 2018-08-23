FROM debian:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    git \
    wget

RUN apt-get update && \
    apt-get install -y \
    python-dev

RUN apt-get update && \
    apt-get install -y \
    python-pip

RUN apt-get update && \
    apt-get install -y \
    python-numpy

RUN apt-get update && \
    apt-get install -y \
    python-scipy

RUN apt-get update && \
    apt-get install -y \
    python-matplotlib

RUN pip install pandas
RUN pip install sympy
RUN pip install nose
RUN pip install jupyter

EXPOSE 8888

# Add Tini
ENV TINI_VERSION v0.8.4
COPY tini/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

RUN mkdir /data
RUN mkdir /data/examples
RUN mkdir /data/notebooks

VOLUME ["/data/notebooks/"]

# CMD jupyter notebook --no-browser --ip=* --notebook-dir=/data

# USER root

RUN apt-get update && \
    apt-get install -y \
    libglu1-mesa

RUN apt-get update && \
    apt-get install -y \
    libvtk6-dev
# 
# RUN apt-get update && \
#     apt-get install -y \
#     mayavi2

RUN pip install mayavi

# RUN pip install PyQt5

RUN jupyter nbextension install --py mayavi --user

# USER jovyan
