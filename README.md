# docker-for-hadoop

You can build your hadoop cluster directly by one shell script. The script could produce a docker image contains a fully compiled hadoop environment and create one bridge network named hadoop in local host. 

The docker image has added a user named hadoop(passwd: hadoop), so you can su the user to execute some jobs and tasks.

When you first use it, make sure you have installed a docker engine in your computer.

By default, the hadoop cluster contains 3 nodes: one master node and two slave nodes. You can specify the node number of hadoop cluster in `-n` option. 

### install docker engine

If you are using Mac OS, i recommend to download and install [docker-for-mac](https://docs.docker.com/docker-for-mac/install/#download-docker-for-mac). 
If you are using Linux System, please reference the link [docker-for-linux](https://docs.docker.com/engine/installation/linux/ubuntu/) to install an appropriate docker environment.

### docker-image introduction

* the docker-image based on Ubuntu 14.04
* installed hadoop(version 2.7.2) in path `/usr/local/hadoop`
* installed git, ssh-agent, oh-my-zsh and so on.


### usage

1. clone repository 
   
   ```
   $ git clone https://github.com/gtchaos/docker-for-hadoop.git
   ```

2. build hadoop cluster

   You can specify the node number of hadoop cluster, example: -n 3.
   
   ```
   $ sh build.sh -n 3
   ```

3. switch to hadoop user 

   When you attached master node, please run `su hadoop` in bash.
   
   ```
   root@hadoop-master:~# su hadoop
   ```

4. start hadoop
   
   ```
   hadoop@hadoop-master:~# ./start-hadoop.sh
   ```

5. run wordcount

   ```
   hadoop@hadoop-master:~# ./run-wordcount.sh 
   ```


