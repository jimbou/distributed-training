#!/bin/bash
fuser -k 2222/tcp
#Configuration file for slave2
TF_CONFIG='{"cluster": {"worker": ["83.212.80.22:2222", "192.168.1.1:2222", "192.168.1.3:2222"]}, "task": {"index": 2, "type": "worker"}}' /home/user/miniconda3/envs/distributed_training/bin/python3 /home/user/distributed-training/scripts/worker.py $1 $2