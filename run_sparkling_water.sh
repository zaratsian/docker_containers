
docker run -it -d -p 18088:8088 -p 14040:4040 -p 14444:4444 -p 12181:2181 --hostname sparkling_water --net dev --name sparkling_water sparkling_water

echo ""
echo "Enter password for Apache Superset (username=admin):"
sleep 5
docker exec sparkling_water /bin/sh -c 'fabmanager create-admin --app superset < /admin.config'

echo "*****************************************************"
echo "*"
echo "*  Container has been started..."
echo "*"
echo "*  Port (Superset):  18088"
echo "*  Port (Zookeeper): 12181"
echo "*"
echo "*  Usage: docker exec -it sparkling_water bash"
echo "*"
echo "*****************************************************"
echo ""
echo ""








