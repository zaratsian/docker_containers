
docker run -it -d -p 18088:8088 -p 19090:8080 -p 14444:4444 -p 15555:5555 --hostname sparkling_water --net dev --name sparkling_water sparkling_water

echo ""
echo "Enter password for Apache Superset (username=admin):"
sleep 5
docker exec sparkling_water /bin/sh -c 'fabmanager create-admin --app superset < /admin.config'

docker exec sparkling_water superset runserver &

docker cp containers/spark_sparkling_water/assets sparkling_water:/.

echo "*****************************************************"
echo "*"
echo "*  Container has been started..."
echo "*"
echo "*  Port (Superset):  18088"
echo "*  Port (Zeppelin):  19090"
echo "*"
echo "*  Usage: docker exec -it sparkling_water bash"
echo "*"
echo "*****************************************************"
echo ""
echo ""








