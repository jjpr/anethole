FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    git \
    wget \
    && apt-get clean

RUN apt-get install -y libglu1-mesa
RUN apt-get install -y python-dev
RUN apt-get install -y python-numpy python-scipy python-matplotlib python-pandas python-sympy python-nose
RUN apt-get install -y python-pip
RUN pip install jupyter
EXPOSE 8888
RUN apt-get install -y libvtk5-dev
RUN apt-get install -y mayavi2
ENV ETS_TOOLKIT qt4

# Add ssh
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:password' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# examples of environment variables, use the second form to put into the user's session
# ENV NOTVISIBLE "in users profile"
# RUN echo "export VISIBLE=now" >> /etc/profile

RUN echo "export ETS_TOOLKIT=qt4" >> /etc/profile

EXPOSE 22

RUN mkdir /notebooks
COPY Equation_To_Object_Instructions.ipynb /notebooks/
# Start sshd
CMD /usr/sbin/sshd -D

# log in:
# ssh -Y -p 2222 root@192.168.99.100
# and issue:
# jupyter notebook --no-browser --ip=* --notebook-dir=/notebooks
