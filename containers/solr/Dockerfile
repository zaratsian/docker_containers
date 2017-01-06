FROM base


# Install Solr

RUN wget http://archive.apache.org/dist/lucene/solr/5.5.3/solr-5.5.3.tgz -O /solr.tgz
RUN tar -xzvf /solr.tgz
RUN mv /solr-5.5.3 /solr


ADD assets /assets
ADD assets/start_solr.sh /start_solr.sh
ADD assets/solr_cmds.txt /solr_cmds.txt

