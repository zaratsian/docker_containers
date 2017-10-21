
docker stop sparkling_water
docker rm sparkling_water

docker run -it -d -p 18088:8088 -p 19090:8080 -p 54321:54321 -p 14444:4444 -p 15555:5555 --hostname sparkling_water --net dev --name sparkling_water sparkling_water

################################################################################
# Copy assets into container
################################################################################
docker cp containers/spark_sparkling_water/assets sparkling_water:/.

################################################################################
# Start Superset
################################################################################
echo ""
echo "[ INFO ] Starting Apache Superset on Port 18088..."
sleep 5
docker exec sparkling_water superset runserver &

################################################################################
# Start Zeppelin
################################################################################
echo ""
echo "[ INFO ] Starting Apache Zeppelin on Port 19090..."
sleep 5
docker exec sparkling_water /zeppelin/bin/zeppelin-daemon.sh start &

################################################################################
# Run install.sh to setup dependencies for H2O
# Start Livy
################################################################################
echo ""
echo "[ INFO ] Installing Dependencies..."
sleep 30
docker exec sparkling_water /bin/sh -c "chmod +x /assets/install.sh"
docker exec sparkling_water /bin/sh -c "/assets/install.sh" &

################################################################################
# Started as part of Dependencies (at the start of this script).

echo ""
echo ""
echo "*****************************************************"
echo "*"
echo "*  Container has been started..."
echo "*"
echo "*  Port (Superset):  18088"
echo "*  Port (Zeppelin):  19090"
echo "*  Port (H2O):       54321"
echo "*  Port (Livy):      8998"
echo "*"
echo "*  Usage: docker exec -it sparkling_water bash"
echo "*"
echo "*****************************************************"
echo ""
echo ""








