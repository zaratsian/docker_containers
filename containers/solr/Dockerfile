FROM base


##########################################################################################
#
# Install Solr
#
##########################################################################################

RUN wget http://archive.apache.org/dist/lucene/solr/5.5.3/solr-5.5.3.tgz -O /solr.tgz
RUN tar -xzvf /solr.tgz
RUN mv /solr-5.5.3 /solr


##########################################################################################
#
# Install Zookeeper
#
##########################################################################################

RUN wget http://www-eu.apache.org/dist/zookeeper/stable/zookeeper-3.4.10.tar.gz -O /zookeeper.tgz
RUN tar -xzvf /zookeeper.tgz
RUN mv /zookeeper-3.4.10 /zookeeper
RUN mkdir /zookeeper/data

RUN echo "tickTime = 2000" >> /zookeeper/conf/zoo.cfg
RUN echo "dataDir = /zookeeper/data" >> /zookeeper/conf/zoo.cfg
RUN echo "clientPort = 2181" >> /zookeeper/conf/zoo.cfg
RUN echo "initLimit = 5" >> /zookeeper/conf/zoo.cfg
RUN echo "syncLimit = 2" >> /zookeeper/conf/zoo.cfg


ADD assets /assets
ADD assets/start_solr.sh /start_solr.sh
ADD assets/solr_cmds.txt /solr_cmds.txt
ADD assets/start_zk.sh /start_zk.sh
