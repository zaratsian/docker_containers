
docker stop spark_162 spark_202
docker rm -f spark_162 spark_202

docker run -it -d -p 8079:8080 -p 4040:4040 --hostname spark_202 --net dev --name spark_202 spark_202

docker cp containers/spark_202/assets/log4j.properties spark_202:/spark/conf/log4j.properties
docker exec spark_202 wget http://central.maven.org/maven2/org/apache/phoenix/phoenix-spark/4.8.1-HBase-1.1/phoenix-spark-4.8.1-HBase-1.1.jar
docker exec spark_202 rm -rf /zeppelin/notebook
docker exec spark_202 cp -rf /assets/notebook/ /zeppelin/notebook/


# Install R (for SparkR jobs)
#docker exec spark_202 yum -y update
#docker exec spark_202 yum install -y R R-devel libcurl-devel openssl-devel
#docker exec spark_202 yum install -y initscripts
#docker exec spark_202 wget https://download2.rstudio.org/rstudio-server-rhel-1.0.44-x86_64.rpm
#docker exec spark_202 yum -y install --nogpgcheck rstudio-server-rhel-1.0.44-x86_64.rpm
#docker exec spark_202 /usr/lib/rstudio-server/bin/rstudio-server verify-installation
#docker exec spark_202 /usr/lib/rstudio-server/bin/rstudio-server stop
#docker exec spark_202 /usr/lib/rstudio-server/bin/rstudio-server start
# This will start the RServer: /usr/lib/rstudio-server/bin/rserver


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

