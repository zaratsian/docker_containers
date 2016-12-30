
docker stop nifi
docker rm -f nifi

docker run -it -d -p 8080:8080 --hostname nifi --net dev --name nifi nifi

echo "*****************************************************"
echo "*"
echo "*  Spark Container has been started..."
echo "*"
echo "*  Port (NiFi):     8080"
echo "*  Port (Zeppelin): 8079"
echo "*  Port (Phoenix):  8765"
echo "*"
echo "*  Usage: docker exec -it nifi bash"
echo "*"
echo "*****************************************************"

