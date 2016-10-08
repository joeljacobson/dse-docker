To build images run the script ./scripts/build_images.sh. This will create two images named opscenter and dse.

If you don’t already have the downloads for Ops Centre and DSE, you can obtain them from;
http://downloads.datastax.com/enterprise. You will require a free, DataStax Academy user account to access the downloads URL.

You can sign up for a DataStax Academy account at;
https://academy.datastax.com

If you would like to retrieve the downloads as part of the Docker build;
Edit the files;
Dockerfile
OpsDockerfile

then, uncomment the ‘wget’ commands and replace $USER and $PASSWORD with your DataStax Academy username and password.


To start a cluster run the script ./scripts/start_docker_cluster.sh like this:
   ./scripts/start_docker_cluster.sh dse/docker opscenter 3
You can add more commandline optons to control the DSE nodes (for example pass
in a -s to enable search).

To remove the cluster completely (the images will remain), please run:
  ./scripts/teardown_docker_cluster.sh 3
Use the same node count as for the start (argument 3 above).

For more information please refer to the docker whitepaper at;
http://www.datastax.com/resources/whitepapers/best-practices-running-datastax-enterprise-within-docker

