#!/bin/bash

# Exit on first error
set -e
docker pull --platform linux/x86_64 hyperledger/fabric-nodeenv:2.4
docker pull --platform linux/x86_64 hyperledger/fabric-javaenv:2.4 
export MSYS_NO_PATHCONV=1
starttime=$(date +%s)
CC_SRC_LANGUAGE=${1:-"javascript"}
CC_SRC_LANGUAGE=$(echo "$CC_SRC_LANGUAGE" | tr [:upper:] [:lower:])
if [ "$CC_SRC_LANGUAGE" != "go" -a \
  "$CC_SRC_LANGUAGE" != "golang" -a \
  "$CC_SRC_LANGUAGE" != "java" \
  -a "$CC_SRC_LANGUAGE" != "javascript" -a \
  "$CC_SRC_LANGUAGE" != "typescript" ]; then

  echo The chaincode language ${CC_SRC_LANGUAGE} is not supported by this script
  echo Supported chaincode languages are: go, java, javascript, and typescript
  exit 1

fi

# clean out any old identites in the wallets
rm -rf ../wallet/*
rm -rf ../certs/*

# launch network; create channel and join peer to channel
pushd ./test-network
./network.sh down
./network.sh up createChannel -ca -s couchdb
echo ---------------------------------MASUK DINISINIII------------------------------------
# changed default language to js

./network.sh deployCC -ccn starterChaincode -ccp ../chaincode/javascript/ -ccl javascript -ccep "OR('Org1MSP.peer','Org2MSP.peer')" -cccg /Users/gayuhkautaman/Documents/code/research/kyc-local/hyperledger-fabric/collection_config.json
# -ccep "OR('Org1MSP.peer','Org2MSP.peer')" -cccg ../chaincode/chaincode_private/collection_config.json
popd

echo ---------------------------------SETUP SUCCESSFULLY------------------------------------