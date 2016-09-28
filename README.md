To build images run the script ./scripts/build_images.sh. This will create two images named opscenter and dse.

To start a cluster run the script ./scripts/start_docker_cluster.sh like this:
   ./scripts/start_docker_cluster.sh dse/docker opscenter 3
You can add more commandline optons to control the DSE nodes (for example pass
in a -s to enable search).

To remove the cluster completely (the images will remain), please run:
  ./scripts/teardown_docker_cluster.sh 3
Use the same node count as for the start (argument 3 above).

For more information please refer to the docker whitepaper at datastax.com.

