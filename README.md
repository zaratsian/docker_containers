<h3>Docker Containers - Rapid Prototyping Env</h3>
Contains the following Hortonworks tech stack (within Docker containers):
<br>&nbsp;&nbsp;&nbsp;&nbsp;&bull; Apache Spark (multiple versions - 1.6.2, 2.0.0, 2.1.0, 2.2.0)
<br>&nbsp;&nbsp;&nbsp;&nbsp;&bull; Apache Zeppelin
<br>&nbsp;&nbsp;&nbsp;&nbsp;&bull; Apache NiFi
<br>&nbsp;&nbsp;&nbsp;&nbsp;&bull; Apache Kafka
<br>&nbsp;&nbsp;&nbsp;&nbsp;&bull; Apache HBase & Apache Phoenix
<br>&nbsp;&nbsp;&nbsp;&nbsp;&bull; Apache Storm
<br>&nbsp;&nbsp;&nbsp;&nbsp;&bull; Apache Solr
<br>&nbsp;&nbsp;&nbsp;&nbsp;&bull; Apache Superset
<br>
<br>
Other containers / services incorporate:
<br>&nbsp;&nbsp;&nbsp;&nbsp;&bull; H2O Sparkling Water
<br>&nbsp;&nbsp;&nbsp;&nbsp;&bull; Apache Airflow
<br>&nbsp;&nbsp;&nbsp;&nbsp;&bull; Tensorflow
<br>&nbsp;&nbsp;&nbsp;&nbsp;&bull; MongoDB
<br>
<br>
<br><b>Docker cleanup:</b>
<br>docker rm $(docker ps -qa)  # Working, cleans up active container instances
<br>docker system prune
<br>docker volume prune
<br>docker volume rm $(docker volume ls -qf dangling=true)
<br>docker system prune -a -f
<br>
