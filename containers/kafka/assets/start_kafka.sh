source /root/.bashrc

echo ""
echo ""
echo "Starting Kafka..."
./kafka/bin/zookeeper-server-start.sh /kafka/config/zookeeper.properties &
./kafka/bin/kafka-server-start.sh /kafka/config/server.properties &

echo ""
echo ""
echo "Creating Kafka topic..."
/kafka/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic dztopic1
/kafka/bin/kafka-topics.sh --zookeeper localhost:2181 --list
echo ""
echo ""
echo "Installing python kafka and pip..."
curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
python get-pip.py
pip install kafka
echo ""
echo ""
echo "Startup Complete!"
