create database Pro_ject;

use Pro_ject;

show tables;

create table fraudTest(
id int,
trans_date_trans_time int,
cc_num int,
merchant varchar(500),
category varchar(500),
amt int,
first varchar(500),
last varchar(300),
Gender varchar(500),
street  varchar (500),
City varchar(500),
State varchar(300),
zip int,
lat int ,
Long_ int,
city_pop int,
job varchar (500),
dob int,
trans_num int,
unix_time int,
merch_lat int,
merch_long int,
is_fraud int );



show variables like "secure_file_priv";


LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/fraudTest.csv"
INTO TABLE fraudTest
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 ROWS;




-- Basic and Important SQL Queries:

-- 1. Retrieve All Transactions :

select * 
from fraudtest;
   
-- 2. Count Total Transactions :

select Count(*)
from fraudtest;  

-- 3. List Transactions for a Specific Customer id 35:

 select * 
 from fraudtest
 where MyUnknownColumn = 35 ;

-- 4. Count Transactions by Fraud Status :
 
 select is_fraud ,count(*) as count
 from fraudtest
 group by is_fraud;

-- 5. Retrieve Transactions Above 20000 Amount :

select * 
from fraudtest
where amt > 20000;

   

-- 6. Find Average Transaction Amount :

select avg(amt) as avgamt
from fraudtest;
 

-- 7. List Transactions for a Specific Date:

select *
from fraudtest 
where trans_date_trans_time = "31-12-2020 23:59" ;

  -- 8. Sum of All Transaction Amounts :
  
select sum(amt) as sumamt
from fraudtest;
 

-- 9. List Fraudulent Transactions :
   
select *
from fraudtest
where is_fraud = 1;

-- 10. Count Transactions by Merchant :
  
select merchant,count(*) as Trans_count
from fraudtest
group by merchant;


-- Important SQL Queries:


-- 11. Percentage of Fraudulent Transactions:
    
select ( count(*) * 100.0 / (select count(*) from fraudtest)) as Fraud_percentage
from fraudtest
where is_fraud = 1;


-- 12. Distribution of Transaction Amounts :

select amt , Count(*) as frequency
from fraudtest
group by amt 
order by frequency desc;

-- 13. Transactions by Hour of Day :

select trans_date_trans_time as hour , count(*) as Trans_count
from fraudtest
group by hour
order by Trans_count desc;

   
-- 14. Top 10 Customers with Most Fraudulent Transactions :

Select first, Count(*) as Fraud_trans
from fraudtest
where is_fraud = 1
group by first
order by fraud_trans desc
limit 10;

-- 15. Average Transaction Amount by Fraud Status :

select is_fraud , avg(amt) as avg_trans_amount
from fraudtest
group by is_fraud;

-- 16. Top 10 Merchants with Most Fraudulent Transactions :

select merchant , count(*) as fraud_trans
from fraudtest
where is_fraud = 1
group by merchant
order by fraud_trans desc
limit 10;    

-- 17. Total Fraudulent Transaction Amount by Merchant :
 
select merchant , sum(amt) as fraud_trans_amt
from fraudtest
where is_fraud =1
group by merchant
order by fraud_trans_amt desc
limit 10;
 

-- 18. Average Transaction Amount per Customer :
    
select first , avg(amt) as avg_trans
from fraudtest
group by first
order by avg_trans desc
limit 10;
    







