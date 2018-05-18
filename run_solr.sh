
docker stop solr
docker rm -f solr

docker run -it -d -p 8983:8983 -p 12181:2181 -p 18080:8080 -p 19999:9999 --hostname solr --net dev --name solr solr

echo "****************************************************************"
echo "*"
echo "*  Solr Container has been started..."
echo "*"
echo "*  Port (Solr):       8983"
echo "*  Port (Zookeeper):  12181"
echo "*  Port (Zeppelin):   18080"
echo "*"
echo "*"
echo "*  Start Zookeeper: /assets/start_zk.sh"
echo "*  Start Solr: /assets/start_solr.sh"
echo "*"
echo "*  Usage: docker exec -it solr bash"
echo "*"
echo "****************************************************************"

