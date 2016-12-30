
docker stop phoenix
docker rm -f phoenix

docker run -it -d -p 8765:8765 --hostname phoenix --net dev --name phoenix phoenix

echo "*****************************************************"
echo "*"
echo "*  Spark Container has been started..."
echo "*"
echo "*  Port (NiFi):     8080"
echo "*  Port (Zeppelin): 8079"
echo "*  Port (Phoenix):  8765"
echo "*"
echo "*  Usage: docker exec -it phoenix bash"
echo "*"
echo "*****************************************************"

