FROM jupyter/scipy-notebook:latest

RUN conda install -n python2 --yes mayavi

RUN apt-get install -y libglu1-mesa

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
EXPOSE 22

RUN echo 'jovyan:password' | chpasswd

CMD ["start-sshd-and-notebook.sh"]

COPY start-sshd-and-notebook.sh /usr/local/bin/
