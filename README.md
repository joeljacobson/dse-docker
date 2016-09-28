# Provided without any warranty, these files are intended 
# to accompany the whitepaper about DSE on Docker and are 
# not intended for production and are not actively maintained.

Download the opscenter tar ball, the dse tar ball and the datastax agent 
debian package. The docker files expect filenames to not have versions
so either change the docker files, rename the downloaded files or
create symlinks like this:
  ln -s opscenter-6.0.0.tar.gz opscenter.tar.gz
  ln -s dse-5.0.0-bin.tar.gz dse-bin.tar.gz 
  ln -s datastax-agent_6.0.0_all.deb datastax-agent_all.deb

To build images run the script ./scripts/build_images.sh. This will create two images named opscenter and dse.

To start a cluster run the script ./scripts/start_docker_cluster.sh like this:
   ./scripts/start_docker_cluster.sh dse opscenter 3
You can add more commandline optons to control the DSE nodes (for example pass
in a -s to enable search).

To remove the cluster completely (the images will remain), please run:
  ./scripts/teardown_docker_cluster.sh 3
Use the same node count as for the start (argument 3 above).

For more information please refer to the docker whitepaper at datastax.com.

