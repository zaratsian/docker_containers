docker stop image_classification
docker rm -f image_classification

docker run -it -d -p 18080:8080 -p 14040:4040 -p 14444:4444 -p 15555:5555 --hostname image_classification --net dev --name image_classification image_classification

echo ""
echo ""
echo "*****************************************************"
echo "*"
echo "*  Spark Container has been started..."
echo "*"
echo "*  Port (Zeppelin):  18080"
echo "*  Port (Web App):   14444"
echo "*"
echo "*  Usage: docker exec -it image_classification bash"
echo "*"
echo "*****************************************************"
echo ""
echo ""








