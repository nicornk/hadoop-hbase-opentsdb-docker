# hadoop-hbase-opentsdb
Docker Image for cluster of hadoop-hbase-opentsdb based on [krejcmat's fabolous hadoop-hbase docker image](https://github.com/krejcmat/hadoop-hbase-docker)

## Pull from DockerHub

```
$ docker pull nicornk/hadoop-hbase-opentsdb-master:latest
$ docker pull nicornk/hadoop-hbase-opentsdb-slave:latest
```

## Build

```
$ cd hadoop-hbase-opentsdb-master
$ docker build -t "nicornk/hadoop-hbase-opentsdb-master:latest" .
$ cd ../hadoop-hbase-opentsdb-slave
$ docker build -t "nicornk/hadoop-hbase-opentsdb-slave:latest" .
```

## Start
 This will start the cluster with one master and 2 slaves:
 
 ```
 $ ./start-container.sh latest 3
 ```
 After the cluster has started, the logfile of OpenTSDB is shown. You can quit with CTRL + C.
 
## Use

TSDB is available on port 4242 of all cluster members.

Make metric

```
$ docker exec -it master.krejcmat.com /bin/bash -c "/usr/share/opentsdb/bin/tsdb mkmetric <MetricName>"
```

Import measurements from file

```
$ docker cp ${file}.txt master.krejcmat.com:/root
$ docker exec -it master.krejcmat.com /bin/bash -c "/usr/share/opentsdb/bin/tsdb import ${file}.txt"
```


