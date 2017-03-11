# docker-for-hadoop

You can build your hadoop clustor directly by the docker image that contains a fully compiled hadoop environment.

When you first use docker, make sure you have installed a docker tool in your computer.

### install docker toool

If you are using Mac OS, i recommend to download and install [docker-for-mac](https://docs.docker.com/docker-for-mac/install/#download-docker-for-mac). 
If you are using Linux System, please reference the link [docker-for-linux](https://docs.docker.com/engine/installation/linux/ubuntu/) to install an appropriate docker environment.

### docker-image introduction

* the docker-image based on Ubuntu 14.04
* installed hadoop(version 2.7.3) in path `/usr/local/hadoop`
* installed git, ssh-agent, oh-my-zsh and so on.
