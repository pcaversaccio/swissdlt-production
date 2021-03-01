#!/bin/bash
#this sets up a node running in the background with screen
screen -S node1 geth --datadir node1/ --syncmode 'full' --port 30312 --rpc --rpcaddr 'localhost' --rpcport 8550 --rpcapi 'personal,eth,net,web3,txpool,miner' --networkid 999 --gasprice '1'
