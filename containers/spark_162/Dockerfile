FROM base
ARG ZEPPELIN_URL=https://archive.apache.org/dist/zeppelin/zeppelin-0.6.2/zeppelin-0.6.2-bin-all.tgz
ARG ZEPPELIN_VER=zeppelin-0.6.2-bin-all

RUN yum install -y epel-release 
RUN yum update -y
RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
RUN python get-pip.py

ARG SPARK_URL=https://archive.apache.org/dist/spark/spark-1.6.2/spark-1.6.2-bin-hadoop2.6.tgz
ARG SPARK_VER=spark-1.6.2-bin-hadoop2.6

RUN wget ${SPARK_URL} -O /spark.tgz
RUN tar -xzvf spark.tgz
RUN mv ${SPARK_VER} /spark

RUN wget ${ZEPPELIN_URL} -O /zeppelin.tgz
RUN tar -xzvf zeppelin.tgz
RUN mv ${ZEPPELIN_VER} /zeppelin
RUN echo "export SPARK_HOME=/spark" >> /zeppelin/conf/zeppelin-env.sh

# Install R (then, manually install knitr)
RUN yum install -y R R-devel libcurl-devel openssl-devel

# Install Maven
#RUN wget https://archive.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz -O /apache-maven-3.3.9-bin.tar.gz
#RUN tar xvf /apache-maven-3.3.9-bin.tar.gz

ADD assets /assets
ADD assets/start_zeppelin.sh /start_zeppelin.sh

#CMD source /root/.bashrc; cd /spark; /zeppelin/bin/zeppelin.sh run
