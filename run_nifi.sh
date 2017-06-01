
docker stop nifi
docker rm -f nifi

docker run -it -d -p 1985:1985 -p 19999:19999 --hostname nifi --net dev --name nifi nifi

# Port 19999 is used as reserve port

# Copy NiFi Assets
docker cp containers/nifi/assets/start_nifi.sh nifi:/.

# Install pip
docker exec solr curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
docker exec solr python get-pip.py

# Install Kafka
docker exec solr wget https://archive.apache.org/dist/kafka/0.10.1.1/kafka_2.10-0.10.1.1.tgz -O /kafka.tgz
docker exec solr tar -xzvf /kafka.tgz
docker exec solr mv kafka_2.10-0.10.1.1 /kafka
docker cp containers/kafka/assets/start_kafka.sh solr:/.
docker cp containers/kafka/assets/stream_kafka.py solr:/.


echo "*****************************************************"
echo "*"
echo "*  NiFi Container has been started..."
echo "*"
echo "*  Port (NiFi): 1985"
echo "*"
echo "*  Usage: docker exec -it nifi bash"
echo "*"
echo "*****************************************************"
echo ""

