#kinit -k -t "yalla1.keytab" "yalla1@HPC.FORD.COM"
hdfs dfs -copyFromLocal /s/yalla1/FORD_PIN22RGN_FT.txt /project/dz/collab/dopsmdm_test/File/

hive -f table_creation.hql

