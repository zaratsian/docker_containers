
docker stop kafka
docker rm -f kafka

docker run -it -d --hostname kafka --net dev --name kafka kafka

docker cp /containers/kafka/assets/stream_kafka.py kafka:/stream_kafka.py
#docker exec kafka /kafka/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic dztopic1
#docker exec kafka /kafka/bin/kafka-topics.sh --zookeeper localhost:2181 --list
#docker exec kafka curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
#docker exec kafka python get-pip.py
#docker exec kafka pip install kafka


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

