
docker stop nifi
docker rm -f nifi

docker run -it -d -p 1985:1985 --hostname nifi --net dev --name nifi nifi

docker cp containers/nifi/assets/start_nifi.sh nifi:/.

echo "*****************************************************"
echo "*"
echo "*  NiFi Container has been started..."
echo "*"
echo "*  Port (NiFi):     1985"
echo "*  Port (Zeppelin): 8079"
echo "*  Port (Phoenix):  8765"
echo "*"
echo "*  Usage: docker exec -it nifi bash"
echo "*"
echo "*****************************************************"
echo ""

