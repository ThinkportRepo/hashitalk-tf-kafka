#!/bin/bash

echo "
initLimit=5
syncLimit=2
server.1=zookeeper-nodes-0.hashitalks:2888:3888
server.2=zookeeper-nodes-1.hashitalks:2888:3888
server.3=zookeeper-nodes-2.hashitalks:2888:3888
autopurge.snapRetainCount=3
autopurge.purgeInterval=24
" | sudo tee -a /etc/kafka/zookeeper.properties
