
docker stop spark_162 spark_202 nifi kafka phoenix
docker rm -f spark_162 spark_202 nifi kafka phoenix

docker run -it -d -p 8079:8080 -p 4040:4040 --hostname spark_202 --net dev --name spark_202 spark_202
docker run -it -d -p 8080:8080 --hostname nifi --net dev --name nifi nifi
docker run -it -d --hostname kafka --net dev --name kafka kafka
docker run -it -d -p 8765:8765 --hostname phoenix --net dev --name phoenix phoenix


# Spark 2.0.2
docker cp containers/spark_202/assets/log4j.properties spark_202:/spark/conf/log4j.properties
docker exec spark_202 wget https://archive.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
docker exec spark_202 tar xvf apache-maven-3.3.9-bin.tar.gz
docker exec spark_202 wget http://central.maven.org/maven2/org/apache/phoenix/phoenix-spark/4.8.1-HBase-1.1/phoenix-spark-4.8.1-HBase-1.1.jar
docker exec spark_202 rm -rf /zeppelin/notebook
docker exec spark_202 cp -rf /assets/notebook/ /zeppelin/notebook/


# NiFi


# Kafka
docker cp /containers/kafka/assets/stream_kafka.py kafka:/stream_kafka.py
docker exec kafka /kafka/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic dztopic1
docker exec kafka /kafka/bin/kafka-topics.sh --zookeeper localhost:2181 --list
docker exec kafka curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
docker exec kafka python get-pip.py
docker exec kafka pip install kafka


# Phoenix


echo "*****************************************************"
echo "*"
echo "*  Spark Container has been started..."
echo "*"
echo "*  Port (NiFi):     8080"
echo "*  Port (Zeppelin): 8079"
echo "*  Port (Phoenix):  8765"
echo "*"
echo "*  Usage: docker exec -it kafka bash"
echo "*"
echo "*****************************************************"


