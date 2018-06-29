
#######################################################################################################################
#
#   HDP Search (Apache Solr 5.5.2)
#   https://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.6.4/bk_solr-search-installation/content/ch_hdp-search.html
#   https://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.6.4/bk_solr-search-installation/content/ch_hdp-search-install-nonambari.html
#
#   Build:      docker build -t hdp_search containers/hdp_search
#
#   Run:        docker run -it -d -p 8983:8983 -p 2181:2181 -p 18080:8080 -p 19999:9999 --hostname hdp_search --net dev --name hdp_search hdp_search
#
#######################################################################################################################

FROM centos:7.4.1708

######################################################################################################
#
#   Dependancies
#
######################################################################################################

RUN yum install -y java-1.8.0-openjdk-devel
RUN echo "export JAVA_HOME=/usr/lib/jvm/java" >> /root/.bashrc

RUN yum install -y epel-release
RUN yum update -y

RUN yum install -y wget
RUN yum install -y unzip
RUN yum install -y net-tools
RUN yum install -y git

#######################################################################################################################
#
#   Install HDP Search (Solr 5.5)
#
#######################################################################################################################

RUN rpm --import http://public-repo-1.hortonworks.com/HDP-SOLR-2.6-100/repos/centos7/RPM-GPG-KEY/RPM-GPG-KEY-Jenkins
RUN wget http://public-repo-1.hortonworks.com/HDP-SOLR-2.6-100/repos/centos7/hdp-solr.repo -O /etc/yum.repos.d/hdp-solr.repo
RUN yum install -y lucidworks-hdpsearch

#RUN /opt/lucidworks-hdpsearch/solr/bin/solr start -c -z localhost:2181
#RUN /opt/lucidworks-hdpsearch/solr/bin/solr create -c hwx_search -d data_driven_schema_configs -s 1 -rf 1 -p 8983

#######################################################################################################################
#
#   Zookeeper
#
#######################################################################################################################

RUN wget https://archive.apache.org/dist/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz -O /zookeeper.tgz
RUN tar -xzvf /zookeeper.tgz
RUN mv /zookeeper-3.4.6 /zookeeper
RUN mkdir /zookeeper/data

RUN echo "tickTime = 2000" >> /zookeeper/conf/zoo.cfg
RUN echo "dataDir = /zookeeper/data" >> /zookeeper/conf/zoo.cfg
RUN echo "clientPort = 2181" >> /zookeeper/conf/zoo.cfg
RUN echo "initLimit = 5" >> /zookeeper/conf/zoo.cfg
RUN echo "syncLimit = 2" >> /zookeeper/conf/zoo.cfg

#RUN /zookeeper/bin/zkServer.sh start

######################################################################################################
#
#   Install Anaconda (and any required packages)
#
######################################################################################################

#RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
#RUN python get-pip.py
#RUN rm get-pip.py
#RUN yum -y install bzip2
#RUN wget https://repo.continuum.io/archive/Anaconda2-5.0.1-Linux-x86_64.sh -O /tmp/Anaconda2-5.0.1-Linux-x86_64.sh
#RUN chmod +x /tmp/Anaconda2-5.0.1-Linux-x86_64.sh
#RUN /tmp/Anaconda2-5.0.1-Linux-x86_64.sh -b -p /opt/anaconda2
#RUN echo 'export PATH="/opt/anaconda2/bin:$PATH"' >> ~/.bashrc
#RUN rm /tmp/Anaconda2-5.0.1-Linux-x86_64.sh
#RUN /opt/anaconda2/bin/pip install pysolr

#######################################################################################################################
#
#   Assets
#
#######################################################################################################################

RUN wget https://raw.githubusercontent.com/elastic/examples/master/Common%20Data%20Formats/apache_logs/apache_logs -O /tmp/apache.log
#ADD assets /assets



#ZEND
