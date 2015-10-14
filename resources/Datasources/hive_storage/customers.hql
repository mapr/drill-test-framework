DROP TABLE IF EXISTS CUSTOMERS;
CREATE EXTERNAL TABLE CUSTOMERS (
    FirstName string,
    LastName string,
    Company string,
    Address string,
    City string,
    County string,
    State string,
    Zip string,
    Phone string,
    Fax string,
    Email string,
    Web string
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/drill/testdata/customers.csv';
