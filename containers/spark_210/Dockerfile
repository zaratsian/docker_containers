FROM base
ARG ZEPPELIN_URL=https://archive.apache.org/dist/zeppelin/zeppelin-0.7.0/zeppelin-0.7.0-bin-all.tgz
ARG ZEPPELIN_VER=zeppelin-0.7.0-bin-all

ARG SPARK_URL=https://archive.apache.org/dist/spark/spark-2.1.0/spark-2.1.0-bin-hadoop2.7.tgz
ARG SPARK_VER=spark-2.1.0-bin-hadoop2.7

RUN yum install -y epel-release 
RUN yum update -y

# Install Spark
RUN wget ${SPARK_URL} -O /spark.tgz
RUN tar -xzvf spark.tgz
RUN mv ${SPARK_VER} /spark

# Install Zeppelin
RUN wget ${ZEPPELIN_URL} -O /zeppelin.tgz
RUN tar -xzvf zeppelin.tgz
RUN mv ${ZEPPELIN_VER} /zeppelin
RUN echo "export SPARK_HOME=/spark" >> /zeppelin/conf/zeppelin-env.sh

# Install Anaconda
RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
RUN python get-pip.py
RUN yum -y install bzip2
RUN wget https://repo.continuum.io/archive/Anaconda2-4.3.0-Linux-x86_64.sh -O /Anaconda.sh

# Install R (then, manually install knitr)
RUN yum install -y epel-release
RUN yum install -y R R-devel libcurl-devel openssl-devel

# Install Maven
RUN wget https://archive.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz -O /apache-maven-3.3.9-bin.tar.gz
RUN tar xvf /apache-maven-3.3.9-bin.tar.gz

ADD assets /assets
ADD assets/start_zeppelin.sh /start_zeppelin.sh


#CMD source /root/.bashrc; cd /spark; /zeppelin/bin/zeppelin.sh run
