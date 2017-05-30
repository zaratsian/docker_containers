echo ""
echo ""
echo "Starting Zookeeper..."
sleep 2
/zookeeper/bin/zkServer.sh start
sleep 10
echo ""
echo ""
echo "Starting Solr in Cloud mode on Port 8983 (and trying to connect to zookeeper port 2181)..."
sleep 2
/solr/bin/solr start -c -z localhost:2181 -p 8983
sleep 10
echo ""
echo ""
echo "Creating Tweets Solr collection for Solr-Twitter Demo..."
sleep 2
/solr/bin/solr create -c tweets -d tweet_configs -s 1 -rf 1 -p 8983
sleep 10
echo ""
echo ""
echo "SolrCloud started on Port 8983 (external port 18983)"
echo "Zookeeper started on Port 2181 (external port 12181)"
echo ""
echo "If an error is encountered, check to make sure zookeeper is running on port 2181"
echo ""
