docker stop spark_162 spark_202 spark_210 spark_220
docker rm -f spark_162 spark_202 spark_210 spark_220

docker run -it -d -p 18080:8080 -p 14040:4040 -p 14444:4444 -p 12181:2181 --hostname spark_220 --net dev --name spark_220 spark_220


# Install pip
docker exec spark_220 curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
docker exec spark_220 python get-pip.py

# Install Kafka (for structured streaming and other use cases)
#docker exec spark_220 wget https://archive.apache.org/dist/kafka/0.11.0.2/kafka_2.11-0.11.0.2.tgz -O /kafka.tgz
#docker exec spark_220 tar -xzvf /kafka.tgz
#docker exec spark_220 mv kafka_2.11-0.11.0.2 /kafka

# Install Tensorflow
#docker exec spark_220 pip install --upgrade tensorflow
#docker exec spark_220 pip install Pillow
#docker exec spark_220 yum install -y python-devel
#docker exec spark_220 yum install -y libevent-devel
#docker exec spark_220 pip install matplotlib
#docker exec spark_220 pip install flask
#docker exec spark_220 pip install flask_login
#docker exec spark_220 pip install requests

# Install R (then, manually install knitr)
#docker exec spark_220 yum install -y epel-release
#docker exec spark_220 yum install -y R R-devel libcurl-devel openssl-devel

# Copy Assets
docker cp ~/Dropbox/data/airlines.csv spark_220:/.
docker cp ~/Dropbox/data/nyc_taxi_data.csv spark_220:/.
docker cp ~/Dropbox/data/NFLPlaybyPlay2015.csv spark_220:/.
docker cp ~/Dropbox/data/loan_full.csv spark_220:/.

echo "*****************************************************"
echo "*"
echo "*  Spark Container has been started..."
echo "*"
echo "*  Port (Zeppelin):  18080"
echo "*  Port (Zookeeper): 12181"
echo "*"
echo "*  Usage: docker exec -it spark_220 bash"
echo "*"
echo "*****************************************************"
echo ""
echo "Manually install knitr for SparkR"
echo ""
echo ""








