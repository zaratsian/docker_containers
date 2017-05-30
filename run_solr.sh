
docker stop solr
docker rm -f solr

docker run -it -d -p 18983:8983 -p 12181:2181 --hostname solr --net dev --name solr solr

# Download and Install Banana UI for Solr
docker exec solr git clone https://github.com/lucidworks/banana.git
docker exec solr cp -r /banana /solr/server/solr-webapp/webapp/banana
# Browse to http://localhost:8983/solr/banana/src/index.html

# Solr-Twitter Demo setup

# Install pip
docker exec solr curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
docker exec solr python get-pip.py

# Install Kafka
docker exec solr wget https://archive.apache.org/dist/kafka/0.10.1.1/kafka_2.10-0.10.1.1.tgz -O /kafka.tgz
docker exec solr tar -xzvf /kafka.tgz
docker exec solr mv kafka_2.10-0.10.1.1 /kafka
docker cp containers/kafka/assets/start_kafka.sh solr:/.
docker cp containers/kafka/assets/stream_kafka.py solr:/.


echo "****************************************************************"
echo "*"
echo "*  Solr Container has been started..."
echo "*"
echo "*  Port (Solr):      18983"
echo "*  Port (Zookeeper): 12181"
echo "*"
echo "*"
echo "*  Banana UI:  http://localhost:8983/solr/banana/src/index.html"
echo "*"
echo "*"
echo "*  Usage: docker exec -it solr bash"
echo "*"
echo "****************************************************************"

