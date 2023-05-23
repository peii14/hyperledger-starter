# Hyperledger Fabric Network with Predefined Architecture

## Architecture

Our Hyperledger Fabric network is composed of four organizations: Org1, Org2, Org3, and Org4. Each organization has a single peer (Peer0) for a controlled testing environment. The peers and the Certificate Authorities (CAs) for each organization are deployed as Docker containers, making the network setup manageable.

The network includes an orderer node housed within a Docker container, responsible for managing the order of transactions. The chaincode, which manages the KYC process, is also deployed as a Docker container. CouchDB is used as the state database for each peer, providing flexible querying. Each organization maintains a unique communication channel within the Docker environment, enhancing the security and privacy of peer interactions.

![image URL](https://github.com/peii14/hyperledger-starter/blob/main/img/infra.png)

## Imoprtant Notes
* The bash file is still hardcoded to only have 4 org and 1 peer each
* It has a predefine private data colection

## Installation and Setup

1. **Setup Docker**: Run the following script to setup Docker:

````bash

./install-fabric.sh
````

2. **Initiate the network**: Run the following script to setup the network:

```bash
./setUp.sh  # This script will create the network and deploy the chaincode
```

> What will you get is 2 oraganization with one peer each.

![image URL](https://github.com/peii14/hyperledger-starter/blob/main/img/docker-org1andorg2.png)


## Adding New Organizations

To add Org3 or Org4, follow these steps:

3. **Navigate to the respective directory**:

```bash
cd ./test-network/addOrg3
```
> What will you get 

![image URL](https://github.com/peii14/hyperledger-starter/blob/main/img/docker-org3.png)

4. **_Generate a new CA container for Org3_**:

```bash
./addOrg3.sh generate -ca
```

5. **_Join the peer_** to the "mychannel" channel and use CouchDB for the database of the master peer

```bash
./addOrg3.sh -c mychannel -s couchdb
```
To add repeat the process to add org3 but in org4 folder

## Check

As a default, a root account has been creted with 

```
username: admin
password: adminpw
```

> Then connect to couchdb0

![image URL](https://github.com/peii14/hyperledger-starter/blob/main/img/couchdb.png)





