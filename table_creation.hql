set hive.support.concurrency = true;       
set hive.enforce.bucketing = true;       
set hive.exec.dynamic.partition.mode = nonstrict;       
set hive.txn.manager = org.apache.hadoop.hive.ql.lockmgr.DbTxnManager;       
set hive.compactor.initiator.on = true;       
set hive.compactor.worker.threads = 1;

set hive.execution.engine=tez;
set hive.cli.print.header=true;
set hive.exec.parallel=true;
set hive.auto.convert.join=false;
set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;
set hive.optimize.sort.dynamic.partition=true;
set hive.support.concurrency = true;
set hive.merge.tezfiles=true;
set hive.merge.size.per.task;
set hive.merge.smallfiles.avgsize;
set hive.vectorized.execution.enabled = true;
set hive.vectorized.execution.reduce.enabled = true;
set hive.auto.convert.join=false;
set tez.am.resource.memory.mb=16384;
set hive.tez.container.size=10240;
set hive.tez.java.opts=-server -Xmx16384m -Djava.net.preferIPv4Stack=true -XX:NewRatio=8 -XX:+UseNUMA -XX:+UseParallelGC -XX:+PrintGCDetails -verbose:gc -XX:+PrintGCTimeStamps;
set hive.merge.mapfiles=true;
set hive.merge.mapredfiles=true;
set hive.merge.tezfiles=true;
set hive.merge.smallfiles.avgsize=128000000;
set hive.merge.size.per.task=128000000;
set mapred.max.split.size=128000000;
set mapred.min.split.size=128000000;


DROP TABLE IF EXISTS dopsmdm_db.report_load;
create table dopsmdm_db.report_load 
( Brand String, 
Make String, 
Model varchar(65355), 
Position varchar(65355), 
Fuel_Type String, 
Primary_Market_Area String, 
ts timestamp, 
Number Int) 
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\n' 
STORED AS TEXTFILE
LOCATION '/project/dz/collab/dopsmdm_test/Testing/';


--Main Table 

create external table dopsmdm_db.report 
( Brand String, 
Make String, 
Model varchar(65355), 
Position varchar(65355), 
Fuel_Type String, 
Primary_Market_Area String, 
ts timestamp, 
Number Int) 
partitioned by(file_date string) 
ROW FORMAT 
DELIMITED FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
STORED AS ORC;

