#!/bin/bash

export COMPRESSION="NONE"

if [ ! -e /opt/opentsdb_tables_created.txt ]; then
	echo "creating tsdb tables"
	cd /usr/share/opentsdb/tools/
	./create_table.sh
	touch /opt/opentsdb_tables_created.txt
	echo "created tsdb tables"
fi


echo "starting opentsdb on master"
service opentsdb start

# Start opentsdb on slaves
echo "starting opentsdb on slave(s)"


slaves=$(cat /tmp/slaves)
echo $slaves

for slave in $slaves; do
     if [ "${slave:0:1}" != 'm' ]; then
     	echo "Starting OpenTSDB on " $slave
        ssh $slave 'service opentsdb start && sleep 5'
     fi
done

# stop:  service opentsdb stop
# logfiles: /var/log/opentsdb 

# mkmetric: /usr/share/opentsdb/bin/tsdb mkmetric sys.cpu.user
# import: echo "sys.cpu.user 1356998400 42.5 host=webserver01 cpu=0" > metrics.txt && /usr/share/opentsdb/bin/tsdb import metrics.txt

