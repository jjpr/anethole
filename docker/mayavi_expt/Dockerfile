FROM ubuntu

RUN apt update && \
    apt install -y  --no-install-recommends \
    build-essential \
    git \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN apt update && \
    apt install -y  --no-install-recommends \
    python3 \
    && rm -rf /var/lib/apt/lists/*

RUN apt update && \
    apt install -y  --no-install-recommends \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

RUN apt update && \
    apt install -y  --no-install-recommends \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install numpy

