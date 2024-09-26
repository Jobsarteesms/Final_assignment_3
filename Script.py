import os
import subprocess
import requests

# Download Data
url = "https://www2.census.gov/programs-surveys/popest/datasets/2010-2019/national/totals/nst-est2019-alldata.csv"
local_file = "nst-est2019-alldata.csv"

# Download the file
response = requests.get(url)
if response.status_code == 200:
    with open(local_file, 'wb') as f:
        f.write(response.content)
    print(f"Downloaded {local_file}")
else:
    print("Failed to download the file.")

# Upload to HDFS
hdfs_directory = "/user/census_data"
subprocess.run(["hdfs", "dfs", "-mkdir", "-p", hdfs_directory])
subprocess.run(["hdfs", "dfs", "-put", "-f", local_file, hdfs_directory])
print(f"Uploaded {local_file} to HDFS at {hdfs_directory}")

# Load Data into Hive
hive_query = f"LOAD DATA INPATH '{hdfs_directory}/{local_file}' INTO TABLE census_data;"
subprocess.run(["hive", "-e", hive_query])
print("Data loaded into Hive table census_data.")
