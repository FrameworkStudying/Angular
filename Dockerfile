# The Dockerfile just add the AngularCLI on CentOS7 image

# There must set a basis image in first row of Dockerfile
FROM centos:centos7

# Setting the maintainer information
MAINTAINER Core <hfreedomx@gmail.com>

# Update Yum and Add [vim] in development environment
RUN yum -y update && yum -y install vim

# Fix error when install nodejs and npm
# [Error: Nothing to do]
# Error: [The command '/bin/sh -c yum -y install npm' returned a non-zero code: 1]
RUN yum -y install epel-release

# in order to support Angular
RUN yum -y install nodejs npm

# in order to add CLI of Angular
RUN npm install -g @angular/cli

ENV PROJECT_ROOT /StudyAngular
RUN mkdir $PROJECT_ROOT
WORKDIR $PROJECT_ROOT

# set EXPOSE will infroms Docker that the container listens on the specified network ports at runtime
EXPOSE 4200
