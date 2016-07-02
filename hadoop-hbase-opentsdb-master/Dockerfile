FROM krejcmat/hadoop-hbase-master:latest

ENV TSDB_VERSION 2.2.0
ENV HBASE_VERSION 1.1.3
ENV HBASE_HOME /usr/local/hbase

RUN apt-get update -y && apt-get install -y --fix-missing gnuplot  && \
apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y && \
rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN wget https://github.com/OpenTSDB/opentsdb/releases/download/v${TSDB_VERSION}/opentsdb-${TSDB_VERSION}_all.deb && \
dpkg -i opentsdb-${TSDB_VERSION}_all.deb && rm -rf opentsdb-${TSDB_VERSION}_all.deb 

ADD start-opentsdb.sh /root/start-opentsdb.sh
RUN chmod +x /root/start-opentsdb.sh

EXPOSE 4242 2818 60000 60010
