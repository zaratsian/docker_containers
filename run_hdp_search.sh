docker stop hdp_search
docker rm -f hdp_search

docker run -it -d -p 8080:8080 -p 5555:5555 -p 4444:4444 -p 2181:2181 -p 8983:8983 --hostname hdp_search --net dev --name hdp_search hdp_search

# Start Zookeeper
docker exec hdp_search /zookeeper/bin/zkServer.sh start

# Start Solr
docker exec hdp_search /opt/lucidworks-hdpsearch/solr/bin/solr start -c -z localhost:2181

# Create Solr Collection
docker exec hdp_search /opt/lucidworks-hdpsearch/solr/bin/solr create -c hwx_search -d data_driven_schema_configs -s 1 -rf 1 -p 8983


echo ""
echo ""
echo "*****************************************************"
echo "*"
echo "*  HDP Search Container has been started..."
echo "*"
echo "*  Port (Solr):      8983"
echo "*  Port (Zookeeper): 2181"
echo "*"
echo "*  Usage: docker exec -it hdp_search bash"
echo "*"
echo "*****************************************************"
echo ""
echo ""








