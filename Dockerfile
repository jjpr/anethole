FROM tutum/ubuntu:trusty

RUN apt-get update && apt-get install -y python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose

RUN apt-get install -y mayavi2

Expose 8888

CMD ipython notebook --no-browser --port 8888

