
docker stop solr
docker rm -f solr

docker run -it -d -p 8983:8983 --hostname solr --net dev --name solr solr


echo "*****************************************************"
echo "*"
echo "*  Spark Container has been started..."
echo "*"
echo "*  Port (NiFi):     8080"
echo "*  Port (Zeppelin): 8079"
echo "*  Port (Phoenix):  8765"
echo "*  Port (Storm):    8090"
echo "*  Port (Solr):     8983"
echo "*"
echo "*  Usage: docker exec -it solr bash"
echo "*"
echo "*****************************************************"

