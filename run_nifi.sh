
docker stop nifi
docker rm -f nifi

docker run -it -d -p 1985:1985 -p 19999:19999 --hostname nifi --net dev --name nifi nifi

# Port 19999 is used as reserve port

# Copy NiFi Assets
docker cp containers/nifi/assets/start_nifi.sh nifi:/.


echo "*****************************************************"
echo "*"
echo "*  NiFi Container has been started..."
echo "*"
echo "*  Port (NiFi):     1985"
echo "*"
echo "*  Usage: docker exec -it nifi bash"
echo "*"
echo "*****************************************************"
echo ""

