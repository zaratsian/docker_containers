echo ""
echo ""
echo "[ INFO ] Setting port 1985 as the NiFi port..."
sed -i 's/8080/1985/g' /nifi/conf/nifi.properties 
echo ""
echo "[ INFO ] Starting NiFi..."
/nifi/bin/nifi.sh start
echo ""
#tail -f /nifi/logs/nifi-app.log
echo ""
echo ""
echo "NiFi started on Port 1985"
echo ""
