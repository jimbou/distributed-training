#!/bin/bash

#Configuration file for slave1
fuser -k 2222/tcp
#if there are 2 workers wake up the second one as well
if [ $1 == "2" ];
then
  TF_CONFIG='{"cluster": {"worker": ["83.212.80.22:2222", "192.168.1.1:2222"]}, "task": {"index": 1, "type": "worker"}}' /home/user/miniconda3/envs/distributed_training/bin/python3 /home/user/distributed-training/scripts/worker.py $1 $2
elif [ $1 == "3" ];
#if there are three workers wake up the other two workers as well
then
  TF_CONFIG='{"cluster": {"worker": ["83.212.80.22:2222", "192.168.1.1:2222", "192.168.1.3:2222"]}, "task": {"index": 1, "type": "worker"}}' /home/user/miniconda3/envs/distributed_training/bin/python3 /home/user/distributed-training/scripts/worker.py $1 $2
fi
