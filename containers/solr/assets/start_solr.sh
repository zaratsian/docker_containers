echo ""
echo ""
echo "Starting Solr in Cloud mode on Port 8983 (and trying to connect to zookeeper port 2181)..."
/solr/bin/solr start -c -z localhost:2181 -p 8983
sleep 10
echo ""
echo ""
echo "SolrCloud start on Port 8983!"
echo "If failed, check to make sure zookeeper is running on port 2181"
echo ""
