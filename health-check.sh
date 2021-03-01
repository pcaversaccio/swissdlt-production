 #!/bin/bash
NOW=$(date +"%b-%d %H:%M")
if (ps -ef | grep -i node-prod | grep -v grep) ; then
#    echo 'node-prod is running '$NOW''
#    uncomment the next line for testing purposes
#    echo 'node-prod is running '$NOW'' >> ~/swissdlt/servercheck.txt
sleep 1
else
#please choose if you want to mine or not uncomment one of the following lines
cd ~/swissdlt/
#put your mining node command here
#eg screen -dSm screen node-prod geth --dadatir node-prod etc
#~/swissdlt/start-node.sh

#archvie node only
screen -dSm node-prod geth --datadir node-prod/ --syncmode 'full' --gcmode=archive  --port 30312 --rpc --rpcaddr 'localhost' --rpcport 8550 --rpcapi 'personal,eth,net,web3,txpool,miner' --networkid 999 --gasprice '1'

#validating node (don't use this option for unlocking !)
#screen -dSm node-prod geth --datadir node-prod/ --syncmode 'full' --port 30312 --rpc --rpcaddr 'localhost' --rpccorsdomain "*" --rpcport 8550 --rpcapi 'personal,eth,net,web3,txpool,miner' --networkid 999 --gasprice '1' -unlock 'VALIDATING-ADDRESS-withouth-0x' --password passwort.txt --mine --allow-insecure-unlock

sleep 3
#    cho "node1 is NOT running!"
     echo 'dead node-prod restarted '$NOW'' >> ~/swissdlt/servercheck.txt;
fi
