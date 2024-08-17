#!/bin/bash

# Step 1: Fetch the data and store it in HDFS
./fetch_data.sh

# Step 2: Create the Hive table and load the data
hive -f create_hive_table.hql

echo "Data fetching, storing in HDFS, and loading into Hive table is complete."