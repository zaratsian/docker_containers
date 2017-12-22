<h3>Docker Containers - Rapid Prototyping Env</h3>
Contains the following Hortonworks tech stack (within Docker containers):
<br>&nbsp;&nbsp;&nbsp;&nbsp;&bull; Apache Spark & Apache Zeppelin (multiple versions - 1.6.2, 2.0.0, 2.1.0)
<br>&nbsp;&nbsp;&nbsp;&nbsp;&bull; Apache NiFi
<br>&nbsp;&nbsp;&nbsp;&nbsp;&bull; Apache Kafka
<br>&nbsp;&nbsp;&nbsp;&nbsp;&bull; Apache HBase & Apache Phoenix
<br>&nbsp;&nbsp;&nbsp;&nbsp;&bull; Apache Storm
<br>&nbsp;&nbsp;&nbsp;&nbsp;&bull; Apache Solr
<br>
<br>
Other containers / services incorporate:
<br>&nbsp;&nbsp;&nbsp;&nbsp;&bull; H2O Sparkling Water
<br>&nbsp;&nbsp;&nbsp;&nbsp;&bull; Apache Airflow
<br>
<br>
<br><b>Docker cleanup:</b>
<br>docker system prune
<br>docker volume prune
<br>docker volume rm $(docker volume ls -qf dangling=true)
<br>
