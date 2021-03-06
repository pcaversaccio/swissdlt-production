# Swiss DLT Staging / Production

*****************************
# How to Install a Full Node on Ubuntu 20.4
*****************************
```
sudo apt install git

sudo apt-get install screen

sudo apt-get install ntpdate

sudo ntpdate -s time.nist.gov

sudo add-apt-repository -y ppa:ethereum/ethereum

sudo apt-get update

sudo apt-get install ethereum

git clone https://github.com/pcaversaccio/swissdlt-production.git

cd swissdlt-production

geth --datadir node-prod/ account new

``` 

Send the address that is created to BCTS (toni.caradonna@bcts.ch)

```
geth --datadir node-prod/ init swissdlt.json
chmod +x start-node.sh
```

start up a node that runs with a RPC on http://localhost:8550

```./start-node.sh```

*****************************
# How to Install a Validating Node
*********************************

Like above but after creating the address:

send the address that is created to BCTS 

send the enode-info that is created to BCTC eg using `geth attach node-prod/geth.ipc` and then `>admin.nodeInfo` and send the output to BCTS

BCTS will send out a request to all node validators to add you and add your node-info to `node-prod/static-node.json` if you do not have a static IP please use ngrok or similar to get a static IP and let us know

wait for confirmation until all validators have added you

add the adress to the `start-validating-node.sh` script

use the password that you created correctly with unlocking either via `geth --unlock <YOUR_ACCOUNT_ADDRESS> --password <YOUR_PASSWORD>` or, and this is **NOT RECOMMENDED**

`screen -S node-prod geth --datadir node-prod/ --syncmode 'full'  --gcmode=archive  --port 30312 --rpc --rpcaddr 'localhost' --rpccorsdomain "*" --rpcport 8550 --rpcapi 'personal,eth,net,web3,txpool,miner'  --networkid 999 --gasprice '1' -unlock 'ACCOUNTADDRESSwithoutTHE_0x' --password node-prod/passwort.txt --mine --allow-insecure-unlock`

you could put this screen command in a startup script eg. `./start-node_validating.sh`

## Add Health Check

`cd ~/swissdlt; chmod +x health-check.sh`

make sure `health-check.sh` is in crontab:

`crontab -e`

add these two lines and save

```
@reboot ~/swissdlt/health-check.sh
*/1 * * * * ~/swissdlt/health-check.sh
```

*****************************
# Java Console
*********************************

`geth attach node-prod/geth.ipc`

for a full list of commands check https://geth.ethereum.org/docs/rpc/server

*****************************
# Accounts
*********************************

please backup up your pwd for your wallet, also backup the file: ~/swissdlt/node-prod/keystore/UTC-.........json you will need that to restore access to the validator, also think about intercompany access policy.
