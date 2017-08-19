docker stop superset
docker rm -f superset

docker run -it -d -p 8088:8088 -p 14040:4040 -p 14444:4444 --hostname superset --net dev --name superset superset


echo "*****************************************************"
echo "*"
echo "*  Starting Superset..."
echo "*"
echo "*  Port (Superset):  ""
echo "*"
echo "*  Usage: docker exec -it spark_210 bash"
echo "*"
echo "*****************************************************"
echo ""
echo ""








