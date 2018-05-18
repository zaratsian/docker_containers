# docker build -t solr containers/solr
# docker run -it -d -p 8983:8983 -p 12181:2181 -p 18080:8080 -p 19999:9999 --hostname solr --net dev --name solr solr
FROM centos:7.4.1708


ARG JAVA_VERSION=java-1.8.0-openjdk-devel
ARG SOLR_VERSION=6.6.4
ARG MINICONDA_URL=https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
ARG ZEPPELIN_VER=0.7.3
ARG ZOOKEEPER_VER=3.4.12


##########################################################################################
#
# Install Dependencies
#
##########################################################################################

RUN yum install -y ${JAVA_VERSION}
RUN echo "export JAVA_HOME=/usr/lib/jvm/java" >> /root/.bashrc

RUN yum install -y net-tools
RUN yum install -y wget
RUN yum install -y unzip
RUN yum install -y git

##########################################################################################
#
# Install Solr
#
##########################################################################################

RUN wget http://archive.apache.org/dist/lucene/solr/${SOLR_VERSION}/solr-${SOLR_VERSION}.tgz -O /solr.tgz
RUN tar -xzvf /solr.tgz
RUN mv /solr-${SOLR_VERSION} /solr

##########################################################################################
#
# Install Zookeeper
#
##########################################################################################

RUN wget http://www-eu.apache.org/dist/zookeeper/zookeeper-${ZOOKEEPER_VER}/zookeeper-${ZOOKEEPER_VER}.tar.gz -O /zookeeper.tgz
RUN tar -xzvf /zookeeper.tgz
RUN mv /zookeeper-${ZOOKEEPER_VER} /zookeeper
RUN mkdir /zookeeper/data

RUN echo "tickTime = 2000" >> /zookeeper/conf/zoo.cfg
RUN echo "dataDir = /zookeeper/data" >> /zookeeper/conf/zoo.cfg
RUN echo "clientPort = 2181" >> /zookeeper/conf/zoo.cfg
RUN echo "initLimit = 5" >> /zookeeper/conf/zoo.cfg
RUN echo "syncLimit = 2" >> /zookeeper/conf/zoo.cfg

##########################################################################################
#
# Install MiniConda
#
##########################################################################################

RUN yum install -y bzip2
RUN wget ${MINICONDA_URL} -O miniconda.sh -O /tmp/miniconda.sh
RUN chmod +x /tmp/miniconda.sh
RUN /tmp/miniconda.sh -b -p /opt/miniconda
ENV PATH="/opt/miniconda/bin:$PATH"

RUN /opt/miniconda/bin/conda install -c anaconda requests
RUN /opt/miniconda/bin/conda install -c conda-forge pysolr
RUN /opt/miniconda/bin/conda install -c conda-forge textblob
RUN /opt/miniconda/bin/conda install -c conda-forge spacy

##########################################################################################
#
# Install Zeppelin
#
##########################################################################################

RUN wget https://archive.apache.org/dist/zeppelin/zeppelin-${ZEPPELIN_VER}/zeppelin-${ZEPPELIN_VER}-bin-all.tgz -O /zeppelin.tgz
RUN tar -xzvf zeppelin.tgz
RUN mv zeppelin-${ZEPPELIN_VER}-bin-all /zeppelin
RUN echo "export SPARK_HOME=/spark" >> /zeppelin/conf/zeppelin-env.sh
RUN rm /zeppelin.tgz

##########################################################################################
#
# Copy Assets
#
##########################################################################################

ADD assets /assets
ADD assets/start_solr.sh /start_solr.sh
ADD assets/solr_cmds.txt /solr_cmds.txt
ADD assets/start_zk.sh /start_zk.sh

##########################################################################################
#
# Start Services
#
##########################################################################################

#CMD /start_zk.sh
#CMD /start_solr.sh
#CMD /zeppelin/bin/zeppelin-daemon.sh start

#ZEND
