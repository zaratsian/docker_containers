docker stop airflow
docker rm -f airflow

docker run -it -d -p 28088:8088 --hostname airflow --net dev --name airflow airflow

echo "*****************************************************"
echo "*"
echo "*  Starting Airflow on Port 8080 (localhost port 28080)..."
echo "*"
echo "*  Port (Airflow):  28080"
echo "*"
echo "*  Usage: docker exec -it airflow bash"
echo "*"
echo "*****************************************************"
echo ""
echo ""








