
docker stop spark_162 spark_202
docker rm -f spark_162 spark_202

docker run -it -d -p 8079:8080 -p 4040:4040 --hostname spark_202 --net dev --name spark_202 spark_202

docker cp containers/spark_202/assets/log4j.properties spark_202:/spark/conf/log4j.properties
docker exec spark_202 wget https://archive.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
docker exec spark_202 tar xvf apache-maven-3.3.9-bin.tar.gz
docker exec spark_202 wget http://central.maven.org/maven2/org/apache/phoenix/phoenix-spark/4.8.1-HBase-1.1/phoenix-spark-4.8.1-HBase-1.1.jar
docker exec spark_202 rm -rf /zeppelin/notebook
docker exec spark_202 cp -rf /assets/notebook/ /zeppelin/notebook/


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

