#!/bin/bash

# Set the URL for the data
URL="https://www2.census.gov/programs-surveys/popest/datasets/2010-2019/national/totals/nst-est2019-alldata.csv"

# Set the HDFS directory where the data will be stored
HDFS_DIR="/user/hive/warehouse/census_data"

# Create the HDFS directory if it doesn't exist
hadoop fs -mkdir -p $HDFS_DIR

# Fetch the data and store it in HDFS
wget -q -O - $URL | hadoop fs -put - $HDFS_DIR/nst-est2019-alldata.csv

echo "Data has been downloaded and stored in HDFS at $HDFS_DIR"