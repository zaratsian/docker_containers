docker network create dev
docker build -t base containers/base
docker build -t spark_162 containers/spark_162
docker build -t spark_202 containers/spark_202
docker build -t spark_210 containers/spark_210
docker build -t kafka containers/kafka
docker build -t nifi containers/nifi
docker build -t phoenix containers/phoenix
docker build -t solr containers/solr
docker build -t storm containers/storm
