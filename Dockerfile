# build image
FROM ubuntu:latest
ENV user root
USER $user
RUN apt-get update
RUN apt-get upgrade -y
# RUN apt-get install apt-utils -y
RUN apt-get install -y openjdk-8-jre-headless
RUN apt-get install python3 -y
RUN apt-get install python3-pip -y
RUN pip3 install matplotlib
RUN pip3 install numpy
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get install texlive-xetex -y
