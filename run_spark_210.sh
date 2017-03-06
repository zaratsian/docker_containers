docker stop spark_162 spark_202 spark_210
docker rm -f spark_162 spark_202 spark_210

docker run -it -d -p 8079:8080 -p 4040:4040 --hostname spark_210 --net dev --name spark_210 spark_210

docker cp containers/spark_210/assets/log4j.properties spark_210:/spark/conf/log4j.properties
docker exec spark_210 wget http://central.maven.org/maven2/org/apache/phoenix/phoenix-spark/4.8.1-HBase-1.1/phoenix-spark-4.8.1-HBase-1.1.jar


docker exec spark_210 wget https://archive.apache.org/dist/kafka/0.10.1.1/kafka_2.10-0.10.1.1.tgz -O /kafka.tgz
docker exec spark_210 tar -xzvf /kafka.tgz
docker exec spark_210 mv kafka_2.10-0.10.1.1 /kafka

docker cp containers/kafka/assets/start_kafka.sh spark_210:/start_kafka.sh
docker cp containers/kafka/assets/stream_kafka.py spark_210:/stream_kafka.py


echo "*****************************************************"
echo "*"
echo "*  Spark Container has been started..."
echo "*"
echo "*  Port (NiFi):     8080"
echo "*  Port (Zeppelin): 8079"
echo "*  Port (Phoenix):  8765"
echo "*"
echo "*  Usage: docker exec -it spark_210 bash"
echo "*"
echo "*****************************************************"
