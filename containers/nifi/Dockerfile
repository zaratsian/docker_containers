FROM base
ARG NIFI_URL=https://archive.apache.org/dist/nifi/1.1.0/nifi-1.1.0-bin.tar.gz
ARG NIFI_VER=nifi-1.1.0

RUN wget ${NIFI_URL} -O /nifi.tgz
RUN tar -xzvf /nifi.tgz
RUN mv ${NIFI_VER} /nifi

ADD assets /assets
ADD assets/start_nifi.sh /start_nifi.sh

#RUN mv /resources/flow.xml.gz /nifi/conf/
#CMD source /root/.bashrc; /nifi/bin/nifi.sh start; tail -f /nifi/logs/nifi-app.log
