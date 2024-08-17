# Final_assignment_3
Dynamic Data Ingestion and Storage in HDFS using a Configurable Script
# Census Data Pipeline

This repository contains scripts to automate the process of fetching U.S. Census data, storing it in HDFS, and loading it into a Hive table for querying.

## Overview

The process involves the following steps:
1. Downloading the census data from the U.S. Census Bureau website.
2. Storing the downloaded data in HDFS.
3. Creating a Hive table and loading the data into it.
4. Verifying the data load by querying the Hive table.

## Repository Structure

- **fetch_data.sh**: A shell script that downloads the data and stores it in HDFS.
- **create_hive_table.hql**: A HiveQL script that creates a Hive table and loads the data into it.
- **run_all.sh**: A script to automate the entire process by calling the above scripts in sequence.
- **README.md**: This file, providing an overview and instructions for using the repository.

## Prerequisites

Before running these scripts, ensure that you have the following set up:

- **Hadoop**: HDFS should be running and accessible.
- **Hive**: Hive should be installed and configured.
- **wget**: Used for downloading data.

## How to Use

1. Make the scripts executable:chmod +x fetch_data.sh run_all.sh
2. Run the automation script: ./run_all.sh
