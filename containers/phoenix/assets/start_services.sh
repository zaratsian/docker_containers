source /root/.bashrc

echo ""
echo "Starting HBase..."
/hbase/bin/start-hbase.sh

sleep 10

echo ""
echo "Starting Phoenix Query Server..."
/phoenix/bin/queryserver.py start

sleep 5

echo ""
echo ""
echo "******************************************************"
echo "Startup Complete!"
echo "******************************************************"
echo ""
echo "Usage:"
echo "/phoenix/bin/sqlline.py localhost:2181"
echo ""
echo ""
echo "To create Table:"
echo "CREATE TABLE IF NOT EXISTS us_population ("
echo "      state CHAR(2) NOT NULL,"
echo "      city VARCHAR NOT NULL,"
echo "      population BIGINT"
echo "      CONSTRAINT my_pk PRIMARY KEY (state, city))"
echo "       SALT_BUCKETS = 20;"
echo ""
echo "UPSERT INTO us_population VALUES ('NC', 'RALEIGH', 430000);"
echo ""
echo "To load CSV into Table:"
echo "/phoenix/bin/psql.py -t DEVICE_TOPOLOGY localhost /traceroute_google_mapped.csv"
echo ""
echo ""

