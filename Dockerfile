# build image
FROM ubuntu:24.04
ENV user=root
ENV LANG=C.UTF-8
USER $user
RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
RUN sed -i 's@http://[a-z]*.archive.ubuntu.com/ubuntu/@http://mirrors.tuna.tsinghua.edu.cn/ubuntu/@g' /etc/apt/sources.list \
    && sed -i 's@http://[a-z]*.ubuntu.com/ubuntu/@http://mirrors.tuna.tsinghua.edu.cn/ubuntu/@g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y systemd
RUN apt install -y openssh-server
RUN apt-get install -y openjdk-21-jdk-headless
RUN apt-get install python3 -y
RUN apt-get install python3-pip -y
RUN apt-get install vim -y
RUN apt-get install -y python3-matplotlib
RUN apt-get install -y python3-numpy
RUN apt-get install -y python3-prettytable
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get install texlive-xetex -y
RUN sed -i 's/^#\?\s*PermitRootLogin .*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN echo "root:jiyun1026" | chpasswd

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]