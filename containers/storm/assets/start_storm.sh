
echo ""
echo ""
echo "Cleaning files in Storm directory..."
rm -rf /storm/supervisor/isupervisor/* 
rm -rf /storm/supervisor/localstate/* 
rm -rf /storm/supervisor/stormdist/* 
rm -rf /storm/supervisor/tmp/* 
rm -rf /storm/workers/* 
rm -rf /storm/workers-users/*
echo ""
echo ""
echo "Starting Zookeeper..."
/zookeeper/bin/zkServer.sh start
sleep 10
echo ""
echo ""
echo "Starting Storm Nimbus..."
/storm/bin/storm nimbus &
sleep 10
echo ""
echo ""
echo "Starting Storm Supervisor..."
/storm/bin/storm supervisor &
sleep 10
echo ""
echo ""
echo "Starting Storm UI..."
/storm/bin/storm ui &
echo 10
echo ""
echo ""
echo "****************************************"
echo "Zookeeper and Storm should be running"
echo "Go to http://localhost:8090 for the UI"
echo "****************************************"
echo ""
echo ""
