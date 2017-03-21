
docker stop spark_162 spark_202
docker rm -f spark_162 spark_202

docker run -it -d -p 8079:8080 -p 4040:4040 --hostname spark_202 --net dev --name spark_202 spark_202

# Install pip
docker exec spark_202 curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
docker exec spark_202 python get-pip.py


echo "*****************************************************"
echo "*"
echo "*  Spark Container has been started..."
echo "*"
echo "*  Port (NiFi):     8080"
echo "*  Port (Zeppelin): 8079"
echo "*  Port (Phoenix):  8765"
echo "*"
echo "*  Usage: docker exec -it spark_202 bash"
echo "*"
echo "*****************************************************"

