FROM jupyter/scipy-notebook:python-3.10

RUN pip install sympy

RUN pip install mayavi

RUN pip install Pillow

RUN pip install xvfbwrapper

RUN pip install pymeshlab

RUN jupyter nbextension install mayavi --py --sys-prefix
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager ipyevents

RUN mkdir -p /data/notebooks
RUN mkdir -p /data/tools
RUN mkdir -p /data/examples/images

COPY Equation_To_Object_Instructions.ipynb /data/examples/
COPY images/ruffle_equation.png /data/examples/images/
COPY images/wrapped_ruffle.png /data/examples/images/
COPY images/printed.png /data/examples/images/
COPY images/saddle_grapher.png /data/examples/images/