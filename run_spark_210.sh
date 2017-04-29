docker stop spark_162 spark_202 spark_210
docker rm -f spark_162 spark_202 spark_210

docker run -it -d -p 8079:8080 -p 4040:4040 p 4444:4444 --hostname spark_210 --net dev --name spark_210 spark_210

docker cp containers/spark_210/assets/log4j.properties spark_210:/spark/conf/log4j.properties

# Install Kafka (for structured streaming and other use cases)
#docker exec spark_210 wget https://archive.apache.org/dist/kafka/0.10.1.1/kafka_2.10-0.10.1.1.tgz -O /kafka.tgz
#docker exec spark_210 tar -xzvf /kafka.tgz
#docker exec spark_210 mv kafka_2.10-0.10.1.1 /kafka

# Install Tensorflow
docker exec spark_210 pip install --upgrade tensorflow
docker exec spark_210 pip install Pillow
docker exec spark_210 yum install -y python-devel
docker exec spark_210 yum install -y libevent-devel
docker exec spark_210 pip install matplotlib
docker exec spark_210 pip install flask
docker exec spark_210 pip install flask_login
docker exec spark_210 pip install requests

# Copy Assets
docker cp containers/kafka/assets/start_kafka.sh spark_210:/.
docker cp containers/kafka/assets/stream_kafka.py spark_210:/.
docker cp ~/Dropbox/data/nyc_taxi_data.csv spark_210:/.
#docker cp ~/Downloads/imagenet_fall11_urls.tgz spark_210:/.
#docker cp ~/Downloads/inception-2015-12-05.tgz spark_210:/tmp/.
docker cp ~/Dropbox/code/python/flask_spark spark_210:/flask_spark


echo "*****************************************************"
echo "*"
echo "*  Spark Container has been started..."
echo "*"
echo "*  Port (NiFi):     1985"
echo "*  Port (Zeppelin): 8079"
echo "*  Port (Phoenix):  8765"
echo "*"
echo "*  Usage: docker exec -it spark_210 bash"
echo "*"
echo "*****************************************************"
echo ""
echo "Manually install knitr for SparkR"
echo ""
echo ""








