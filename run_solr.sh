
docker stop solr
docker rm -f solr

docker run -it -d -p 8983:8983 -p 12181:2181 -p 18080:8080 -p 19999:9999 --hostname solr --net dev --name solr solr

# 8983 is Solr
# 2181 is Zookeeper
# 8080 is NiFi
# 9999 is Reserve port


# Copy Solr Assets
docker cp containers/solr/assets/start_solr.sh solr:/.
docker cp containers/solr/assets/start_zk.sh solr:/.
docker cp containers/solr/assets/solr_cmds.txt solr:/.

# Download and Install Banana UI for Solr
docker exec solr git clone https://github.com/lucidworks/banana.git
docker exec solr cp -r /banana /solr/server/solr-webapp/webapp/banana
# Browse to http://localhost:8983/solr/banana/src/index.html

# Install pip
docker exec solr curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
docker exec solr python get-pip.py

# Install Kafka
docker exec solr wget https://archive.apache.org/dist/kafka/0.10.1.1/kafka_2.10-0.10.1.1.tgz -O /kafka.tgz
docker exec solr tar -xzvf /kafka.tgz
docker exec solr mv kafka_2.10-0.10.1.1 /kafka
docker cp containers/kafka/assets/start_kafka.sh solr:/.
docker cp containers/kafka/assets/stream_kafka.py solr:/.

# Solr-Twitter Demo setup
docker exec solr cp -r /solr/server/solr/configsets/data_driven_schema_configs /solr/server/solr/configsets/tweet_configs
docker cp containers/solr/assets/solrconfig.xml solr:/solr/server/solr/configsets/tweet_configs/conf/solrconfig.xml
docker exec solr mv /solr/server/solr-webapp/webapp/banana/src/app/dashboards/default.json /solr/server/solr-webapp/webapp/banana/src/app/dashboards/default.json.orig
docker exec solr wget https://raw.githubusercontent.com/hortonworks/data-tutorials/master/tutorials/hdp/hdp-2.5/analyzing-social-media-and-customer-sentiment-with-apache-nifi-and-hdp-search/assets/default.json
docker exec solr cp /default.json /solr/server/solr-webapp/webapp/banana/src/app/dashboards/default.json

# NiFi
docker exec solr wget http://mirror.cc.columbia.edu/pub/software/apache/nifi/1.2.0/nifi-1.2.0-bin.tar.gz
docker exec solr tar -xzvf /nifi-1.2.0-bin.tar.gz
docker cp assets/core-site.xml solr:/.
docker cp assets/hdfs-site.xml solr:/.

echo "****************************************************************"
echo "*"
echo "*  Solr Container has been started..."
echo "*"
echo "*  Port (Solr):      18983"
echo "*  Port (Zookeeper): 12181"
echo "*  Port (NiFi):      18080"
echo "*"
echo "*"
echo "*  Banana UI:  http://localhost:8983/solr/banana/src/index.html"
echo "*"
echo "*  Start NiFi: /nifi-1.2.0/bin/nifi.sh start"
echo "*"
echo "*  Usage: docker exec -it solr bash"
echo "*"
echo "****************************************************************"

