docker stop hdp_search
docker rm -f hdp_search

docker run -it -d -p 8080:8080 -p 5555:5555 -p 4444:4444 -p 2181:2181 -p 8983:8983 --hostname hdp_search --net dev --name hdp_search hdp_search

# Start Zookeeper
docker exec hdp_search /zookeeper/bin/zkServer.sh start

# Start Solr
docker exec hdp_search /opt/lucidworks-hdpsearch/solr/bin/solr start -c -z localhost:2181

# Create Solr Collection
docker exec hdp_search /opt/lucidworks-hdpsearch/solr/bin/solr create -c hwx_search -d data_driven_schema_configs -s 1 -rf 1 -p 8983

# Backup Solr Collection
#curl "http://localhost:8983/solr/hwx_search/replication?command=backup&location=/tmp&name=hwx_search_backup&wt=json"
#echo ""
#echo "Solr Backup Status:"
#echo ""
#curl "http://localhost:8983/solr/hwx_search/replication?command=details&wt=json"
#docker exec hdp_search tar -zcvf /tmp/snapshot_hwx_search_backup.tar.gz /tmp/snapshot.hwx_search_backup
#docker cp hdp_search:/tmp/snapshot_hwx_search_backup.tar.gz containers/hdp_search/assets/. 

# Restore Solr Collection
docker cp containers/hdp_search/assets/snapshot_hwx_search_backup.tar.gz hdp_search:/tmp/snapshot_hwx_search_backup.tar.gz
docker exec hdp_search tar -zxvf /tmp/snapshot_hwx_search_backup.tar.gz
docker exec hdp_search curl "http://localhost:8983/solr/hwx_search/replication?command=restore&location=/tmp&name=snapshot.hwx_search_backup&wt=json"


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


