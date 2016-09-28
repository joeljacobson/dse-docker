#!/bin/sh

NUM_NODES=$1

if [ -z "$NUM_NODES" ]; then
  echo "usage teardown_docker_cluster.sh NumNodes"
  echo "  NumNodes the number of nodes started when using start_docker_cluster.sh"
  exit 1
fi

echo "Stop opscenter (if available)"
docker stop opscenter > /dev/null 2>&1 
echo "Remove opscenter (if available)"
docker rm opscenter > /dev/null 2>&1

let n=1
let NUM_NODES=NUM_NODES+1

while [ $n != $NUM_NODES ]; do
  echo "Stop node${n}"
  docker stop node${n}
  echo "Remove node${n}"
  docker rm node${n}
  let n=n+1
done

