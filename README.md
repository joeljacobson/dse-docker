Pre-requiste :
You must have a copy of DSE, Ops Center and the Ops Center Agent, in the same directory as your Dockerfile.
In order to download the files, you will need to have a DataStax Academy login.
You can sign up for a free DataStax Academy account at : https://academy.datastax.com
The directions for obtaining the files (with a valid login) can be found in the respective Docker files;
* Dockerfile
* OpscDockerfile

Build Images :
To build images run the script `./scripts/build_images.sh`. This will create two images named opscenter and dse.

Start a Cluster :
To start a cluster run the script `./scripts/start_docker_cluster.sh` like this:
   `./scripts/start_docker_cluster.sh dse opscenter 3`
You can add more commandline optons to control the DSE nodes (for example pass
in a `-s` to enable search).

Remove a Cluster :
To remove the cluster completely (the images will remain), please run:
  `./scripts/teardown_docker_cluster.sh 3`
Use the same node count as for the start (argument `3` above).


For more information please refer to the docker whitepaper at;
http://www.datastax.com/resources/whitepapers/best-practices-running-datastax-enterprise-within-docker
