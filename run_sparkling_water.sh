
docker stop sparkling_water
docker rm sparkling_water

docker run -it -d -p 18088:8088 -p 19090:8080 -p 54321:54321 -p 14444:4444 -p 15555:5555 --hostname sparkling_water --net dev --name sparkling_water sparkling_water

#echo ""
#echo "Enter password for Apache Superset (username=admin):"
#sleep 5
#docker exec sparkling_water /bin/sh -c 'fabmanager create-admin --app superset < /admin.config'

echo ""
echo "Starting Apache Superset on Port 18088..."
sleep 5
docker exec sparkling_water superset runserver &

echo ""
echo "Starting Apache Zeppelin on Port 19090..."
sleep 5
docker exec sparkling_water /zeppelin/bin/zeppelin-daemon.sh start &

# Copy assets into container
docker cp containers/spark_sparkling_water/assets sparkling_water:/.

# Setup a few dependancies are setup for H2O Sparkling Water
docker exec sparkling_water sh -c "echo '' >> /root/.bashrc"
docker exec sparkling_water sh -c "echo 'export SPARK_HOME=/spark' >> /root/.bashrc"
docker exec sparkling_water sh -c "chmod +x /assets/pip_install_packages.sh"
docker exec sparkling_water sh -c "/assets/pip_install_packages.sh"

echo ""
echo ""
echo "*****************************************************"
echo "*"
echo "*  Container has been started..."
echo "*"
echo "*  Port (Superset):  18088"
echo "*  Port (Zeppelin):  19090"
echo "*  Port (H2O):       54321"
echo "*"
echo "*  Usage: docker exec -it sparkling_water bash"
echo "*"
echo "*****************************************************"
echo ""
echo ""








