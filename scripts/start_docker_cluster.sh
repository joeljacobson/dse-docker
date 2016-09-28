#!/bin/bash

# Provided without any warranty, these files are intended
# to accompany the whitepaper about DSE on Docker and are 
# not intended for production and are not actively maintained.

DSE_IMAGE=$1
OPSC_IMAGE=$2
NUM_NODES=$3
NODE_OPTS=$4

if [ -z "$DSE_IMAGE" ]; then
  echo "usage: start_docker_cluster.sh DSEImageName [OPSCImageName] [NumberOfNodes] [NodeOptions]"
  echo "  DSImageName   mandatory nam of docker image"
  echo "  OPSCImageName use and empty string "" or none if you have no OpsCenter image"
  echo "  NumberOfNodes how many nodes to start (default 3)"
  echo "  NodeOptions   additional options for the node (like -s or -g)"
  exit 1
fi

 [ -z "$NUM_NODES" ] && NUM_NODES=3
 [ -z "$CLUSTER_NAME" ] && CLUSTER_NAME="Test_Cluster"

if [ "$OPSC_IMAGE" != "" -a "$OPSC_IMAGE" != "none" ]; then
  echo "Run node opscenter"
  docker run -d --name opscenter -p 8888:8888 $OPSC_IMAGE
  STOMP_INTERFACE=`docker exec opscenter hostname -I`
fi

if [ "$OPSC_IMAGE" != "" -a "$OPSC_IMAGE" != "none" ]; then
  echo "Run node node1 (linked to opscenter)"
  docker run --link opscenter -d -e CLUSTER_NAME="$CLUSTER_NAME" -e STOMP_INTERFACE="$STOMP_INTERFACE" --name node1 $DSE_IMAGE $NODE_OPTS
  echo "Seed node IP address for OpsCenter cluster lookup"
  docker inspect --format '{{ .NetworkSettings.IPAddress }}' node1
else
  echo "Run node node1"
  docker run -d -e CLUSTER_NAME="$CLUSTER_NAME" --name node1 $DSE_IMAGE $NODE_OPTS
fi

SEEDS=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' node1)

let n=1

while [ $n != $NUM_NODES ]; do
  let n=n+1
  if [ "$OPSC_IMAGE" != "" -a "$OPSC_IMAGE" != "none" ]; then
    echo "Run node node${n} (linked to opscenter)"
    docker run --link opscenter -d -e SEEDS=$SEEDS -e CLUSTER_NAME="$CLUSTER_NAME" -e STOMP_INTERFACE="$STOMP_INTERFACE" --name node${n} $DSE_IMAGE $NODE_OPTS
  else
    echo "Run node node${n}"
    docker run -d -e SEEDS=$SEEDS -e CLUSTER_NAME="$CLUSTER_NAME" --name node${n} $DSE_IMAGE $NODE_OPTS
  fi
done

