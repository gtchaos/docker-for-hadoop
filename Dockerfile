FROM registry.cn-hangzhou.aliyuncs.com/gtchaos/hadoop:latest

MAINTAINER gtchaos <gsls1817@gmail.com>

WORKDIR /home/hadoop

ENV JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
ENV HADOOP_HOME=/usr/local/hadoop
ENV PATH=$PATH:/usr/local/hadoop/bin:/usr/local/hadoop/sbin

COPY config/* /tmp/

RUN cp /tmp/ssh_config ~/.ssh/config && \
    cp /tmp/hadoop-env.sh $HADOOP_HOME/etc/hadoop/hadoop-env.sh && \
    cp /tmp/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml && \ 
    cp /tmp/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml && \
    cp /tmp/mapred-site.xml $HADOOP_HOME/etc/hadoop/mapred-site.xml && \
    cp /tmp/yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml && \
    cp /tmp/slaves $HADOOP_HOME/etc/hadoop/slaves && \
    chmod +x $HADOOP_HOME/sbin/start-dfs.sh && \
    chmod +x $HADOOP_HOME/sbin/start-yarn.sh 

EXPOSE 22
