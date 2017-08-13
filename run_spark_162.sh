
docker stop spark_162 spark_202
docker rm -f spark_162 spark_202

docker run -it -d -p 8079:8080 -p 4040:4040 --hostname spark_162 --net dev --name spark_162 spark_162

#docker cp containers/spark_162/assets/log4j.properties spark_162:/spark/conf/log4j.properties
#docker exec spark_162 wget https://archive.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
#docker exec spark_162 tar xvf apache-maven-3.3.9-bin.tar.gz
#docker exec spark_162 wget http://central.maven.org/maven2/org/apache/phoenix/phoenix-spark/4.8.1-HBase-1.1/phoenix-spark-4.8.1-HBase-1.1.jar
#docker exec spark_162 rm -rf /zeppelin/notebook
#docker exec spark_162 cp -rf /assets/notebook/ /zeppelin/notebook/


echo "*****************************************************"
echo "*"
echo "*  Spark Container has been started..."
echo "*"
echo "*  Port (NiFi):     8080"
echo "*  Port (Zeppelin): 8079"
echo "*  Port (Phoenix):  8765"
echo "*"
echo "*  Usage: docker exec -it spark_162 bash"
echo "*"
echo "*****************************************************"
echo ""
echo "Manually install knitr for SparkR"
echo ""
echo ""

