#!/bin/bash

# NUMBER is the node number of hadoop cluster
NUMBER=3

usage() {
    echo "Usage:"
    echo "    build.sh [-n number] [-h] " 
    echo "Description:"
    echo "    number - specify the node number of hadoop cluster, default: 3"
    echo "    -h - show this help"
    exit -1
}

while getopts "n:h" arg
do
    case $arg in
        n) NUMBER=$OPTARG;;
        h) usage;;
        ?) usage;;
    esac
done

if [ $NUMBER -lt 1 ]
then
	echo "\033[31mPlease specify the node number of hadoop cluster more than 1 \033[0m"
	exit 1
fi

# change slaves file
i=1
rm config/slaves
while [ $i -lt $NUMBER ]
do
	echo "hadoop-slave$i" >> config/slaves
	((i++))
done 


echo "\033[32mStart to build IMAGE for hadoop ...\033[0m"

# build hadoop image
docker build -t gtchaos/hadoop .

# run hadoop master container
docker rm -f hadoop-master &> /dev/null
echo "\033[33mRun hadoop-master container ...\033[0m"
docker run -itd \
    --net=hadoop \
    -p 50070:50070 \
    -p 8088:8088 \
    --name hadoop-master \
    --hostname hadoop-master \
    gtchaos/hadoop &> /dev/null


# run hadoop slave container
i=1
while [ $i -lt $NUMBER ]
do
    docker rm -f hadoop-slave$i &> /dev/null
    echo "\033[33mRun hadoop-slave$i container ...\033[0m"
    docker run -itd \
        --net=hadoop \
        --name hadoop-slave$i \
        --hostname hadoop-slave$i \
        gtchaos/hadoop &> /dev/null
    i=$(( $i + 1 ))
done

# attach hadoop master container
echo "\033[35mAttached hadoop-master container, please ENTER go on.\033[0m"
docker attach hadoop-master
