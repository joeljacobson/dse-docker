#!/bin/sh

if [ ! -f OpscDockerfile ]; then
  echo "Please run this command in the folder where the Dockerfile's reside"
  exit 1
fi

echo "Warning: This will remove and recreate two images:"
echo "  opscenter"
echo "  dse"
echo "Please make sure those images are no longer in use"

read -p "Proceed: y/n" yn
if [ "$yn" != "y" -a "$yn" != "Y" ]; then
  exit 0
fi

echo "Building OpsCenter image named: opscenter"
docker rmi opscenter
docker build . -t opscenter -f ./OpscDockerfile

echo "Building DSE image named: dse"
docker rmi dse
docker build . -t dse

