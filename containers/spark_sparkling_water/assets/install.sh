
export JAVA_HOME=/usr/lib/jvm/java
export SPARK_HOME=/spark
export PYTHONPATH=/sparkling-water-2.1.14/py/build/dist/h2o_pysparkling_2.1-2.1.14.zip:$PYTHONPATH
export PYSPARK_PYTHON=/opt/conda/bin/python2.7

pip install tabulate
pip install future

# Start Livy Server
/livy/bin/livy-server &
