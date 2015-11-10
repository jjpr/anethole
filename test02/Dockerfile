FROM python:2

RUN pip install numpy
RUN apt-get update && apt-get install -y python-vtk
RUN pip install mayavi


RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
EXPOSE 22

RUN echo 'jovyan:password' | chpasswd

# Start sshd
CMD /usr/sbin/sshd -D &

