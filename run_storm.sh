
docker stop storm
docker rm -f storm

docker run -it -d -p 8090:8080 --hostname storm --net dev --name storm storm

docker exec storm export LEIN_ROOT=/bin/lein

echo "*****************************************************"
echo "*"
echo "*  Spark Container has been started..."
echo "*"
echo "*  Port (NiFi):     1985"
echo "*  Port (Zeppelin): 8079"
echo "*  Port (Phoenix):  8765"
echo "*  Port (Storm):    8090"
echo "*"
echo "*  Usage: docker exec -it storm bash"
echo "*"
echo "*****************************************************"

