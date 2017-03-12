# docker-for-hadoop

You can build your hadoop clustor directly by one shell script that contains a fully compiled hadoop environment.

When you first use it, make sure you have installed a docker engine in your computer.

### install docker engine

If you are using Mac OS, i recommend to download and install [docker-for-mac](https://docs.docker.com/docker-for-mac/install/#download-docker-for-mac). 
If you are using Linux System, please reference the link [docker-for-linux](https://docs.docker.com/engine/installation/linux/ubuntu/) to install an appropriate docker environment.

### docker-image introduction

* the docker-image based on Ubuntu 14.04
* installed hadoop(version 2.7.3) in path `/usr/local/hadoop`
* installed git, ssh-agent, oh-my-zsh and so on.


### usage

1. git clone https://github.com/gtchaos/docker-for-hadoop.git

2. sh build-hadoop-clustor.sh
