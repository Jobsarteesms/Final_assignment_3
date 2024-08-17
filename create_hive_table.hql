-- Create a database if not exists
CREATE DATABASE IF NOT EXISTS census_data;

-- Use the created database
USE census_data;

-- Drop the table if it already exists
DROP TABLE IF EXISTS national_totals;

-- Create the Hive table
CREATE TABLE national_totals (
    SUMLEV INT,
    REGION INT,
    DIVISION INT,
    STATE INT,
    NAME STRING,
    CENSUS2010POP BIGINT,
    ESTIMATESBASE2010 BIGINT,
    POPESTIMATE2010 BIGINT,
    POPESTIMATE2011 BIGINT,
    POPESTIMATE2012 BIGINT,
    POPESTIMATE2013 BIGINT,
    POPESTIMATE2014 BIGINT,
    POPESTIMATE2015 BIGINT,
    POPESTIMATE2016 BIGINT,
    POPESTIMATE2017 BIGINT,
    POPESTIMATE2018 BIGINT,
    POPESTIMATE2019 BIGINT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

-- Load data into the table
LOAD DATA INPATH '/user/hive/warehouse/census_data/nst-est2019-alldata.csv' INTO TABLE national_totals;

-- Verify the data
SELECT * FROM national_totals LIMIT 10;