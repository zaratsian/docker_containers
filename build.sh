docker network create dev
docker build -t base containers/base
docker build -t spark_162 containers/spark_162
docker build -t spark_202 containers/spark_202
docker build -t spark_210 containers/spark_210
docker build -t spark_220 containers/spark_220
docker build -t kafka containers/kafka
docker build -t nifi containers/nifi
docker build -t phoenix containers/phoenix
docker build -t solr containers/solr
docker build -t hdp_search containers/hdp_search
docker build -t storm containers/storm
docker build -t superset containers/superset
docker build -t airflow containers/airflow
docker build -t sparkling_water containers/spark_sparkling_water
docker build -t ubuntu_mongo containers/ubuntu_mongo
