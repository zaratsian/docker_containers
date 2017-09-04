
docker run -it -d -p 18080:8080 -p 14040:4040 -p 14444:4444 -p 12181:2181 --hostname base_image --net dev --name base_image base

echo "*****************************************************"
echo "*"
echo "*  Base Container has been started..."
echo "*"
echo "*  Open Ports: 18080:8080 -p 14040:4040 -p 14444:4444 -p 12181:2181"
echo "*"
echo "*  Usage: docker exec -it base bash"
echo "*"
echo "*****************************************************"
echo ""

#ZEND
