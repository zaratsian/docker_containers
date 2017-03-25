
docker stop nifi
docker rm -f nifi

docker run -it -d -p 8080:8080 --hostname nifi --net dev --name nifi nifi

# Change NiFi Port number (default is 8080), but I change it to 1985 here. 
sed -i 's/8080/1985/g' /nifi/conf/nifi.properties 


echo "*****************************************************"
echo "*"
echo "*  Spark Container has been started..."
echo "*"
echo "*  Port (NiFi):     1985"
echo "*  Port (Zeppelin): 8079"
echo "*  Port (Phoenix):  8765"
echo "*"
echo "*  Usage: docker exec -it nifi bash"
echo "*"
echo "*****************************************************"
echo ""

