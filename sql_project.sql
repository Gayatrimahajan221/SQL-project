-- Creaate a batabase
show databases;
create database salesDataWalmart;


-- use dataset

use  salesDataWalmart;

-- create a table

create table sales(
invoice_id varchar(30) not null primary key,
branch varchar(5) not null,
city varchar(30)  not null,
customer_type varchar(30)  not null,
gender varchar(10)  not null,
product_line varchar(100)  not null,
unit_price decimal(10,2)  not null,
quatity int  not null,
VAT float (6,4)  not null,
total decimal(32, 5)  not null,
date Datetime not null,
time Time not null,
payment_method varchar(15)not null,
cogs decimal (10, 3) not null,
gross_margin_pct float(11,9),
gross_income decimal(12,2) not null,
rating float(2,1)
);

 show tables;
 
 select * from sales;
 
 
 -- ------------------------------------------------ Feature Engineering ----------------------------------------------------------
 
select time,
(case
	when "time" between "00:00:00" and "12:36:00" Then " Morning"
	when "time" between "12:01:00" and "16:00:00" Then "Afternoon"
else "Evening"
end
) as time_of_date
from sales;
 select * from sales;
alter table sales 
drop column time_of_day ;

alter table sales add column time_of_day varchar(10);
update sales
set time_of_day=

(case
	when "time" between "00:00:00" and "12:36:00" Then " Morning"
	when "time" between "12:01:00" and "16:00:00" Then "Afternoon"
else "Evening"
end
);
 select * from sales;

-- day time
 select date,
	dayname(date) as day_name
from sales;
 select * from sales;
alter table sales add column day_name varchar(10);
select * from sales;

update sales
set day_name = dayname(date);
 select * from sales;


-- for month

select 
date,
monthname(date)
from sales;
alter table sales add column month_name varchar(10);
 select * from sales;
 
 update sales 
 set month_name =  monthname(date);
 
-- _______________________________generic questions___________________________________________________________________________________________________________________________

--  How many unique cities does the data have
     select distinct(city) from sales;

	select distinct(branch) from sales;
	select * from sales;


     select distinct city, branch from sales;

-- -------------------------------------------------------Product questions_-------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 1.  how many unique product lines does the data have
      select count(product_line) as cp from sales;


-- what the most comman payment method
      select count(distinct payment_method) from sales;

	 select payment_method ,count(payment_method) as cp from sales
	 group by payment_method
	 order by cp desc;
 
 
 
-- what is most selling produt line
	select product_line , count(product_line) as sellproduct
	 from sales
	 group by product_line
	 order by sellproduct desc;

-- what is total revenue by month.
	select month_name as month ,
	sum(total) as total_revenue
	from sales
	group by month_name
	order by total_revenue desc;

-- what month had the largest cogs.

		select month_name as month ,
		sum(cogs) as totalcogs
		from sales
		group by month_name
		order by totalcogs desc;


 select * from sales;

-- what is the city with the largest revenue.
		select branch, city,
		sum(total) as total_revenue
		from sales
		group by city, branch
		order by total_revenue desc;

-- what product had largest revenue.
      select product_line , sum(total) as pt from sales
      group by product_line
      order by pt desc;


-- what product line had largest vat
      select product_line , avg (VAT) as avg_tax from sales
      group by product_line
      order by pv desc;


	-- fetch each product line and add column to those product line showing "Good", "Bad", 
	-- "Good", "Bad" . good if its greater than ave sales


	-- select peoduct_line avg((* from sales

	-- which branch sold more product than average product dold
		select 
			branch,
			sum(quatity) as qty
		from sales
		group by branch
		having sum(quatity) > (select avg(quality) from sales);

-- what is the most common product line by gender

		select product_line gender , count(gender)as total_cnt from sales
		group by product_line, gender
		order by total_cnt;


-- what is the average rating od each product line
		select product_line, 
        round(avg(rating), 2) as avg_rating from sales
		group by product_line
		order by avg_rating desc;

--  --------------------- sales-------------------------

-- number of sales made in each time of the day per weekday
	select time_of_day, count(*) as total_sales from sales
	where day_name = "Monday"
	group by time_of_day
	order by total_sales  desc;


-- which of the customer types bring the modt reneue

	select  customer_type,sum(total) as total_revenue from sales
	group by customer_type
	order  by total_revenue desc;

-- which city has the largest tax percent/ VAt (value added tax)
		select city, avg(VAT) as avgvat from sales 
		group by city
		order by avgvat desc;

-- ---------------------------------customers---------------------------------------------

-- how many unique customer types does the data have 
	
    select distinct (customer_type) from sales;
	
-- how many unique payment method does the data have
	select distinct (payment_method) from sales;
    
--   what is the most comman customer type
	select distinct (customer_type) from sales;

--  which customer type buy the most
	select customer_type, 
		count(*) as cstm_cnt 
	from sales
    group by customer_type
    order by cstm_cnt;
    

 -- what is the gender of most of the customer
 
	 select gender,
	 count(*) as gender_cnt from sales
	 group by gender
	order by gender_cnt desc ;
	 
 
 -- what is gender distrubut per branch
 
	 select gender branch,
	 count(*) as gender_cnt from sales
	 where branch= "C"
	 group by gender
	order by gender_cnt desc ;
	 
 -- which time of the day do customer give most rating 
	 
	 select time_of_day , avg(rating) as cus_rating from sales
	 group by time_of_day
	 order by cus_rating;

  select * from sales;
 -- which time of the day do customer give most rating per branch
 
	  select time_of_day , avg(rating) as cus_rating from sales
	  where branch = "A"
	 group by time_of_day
	 order by cus_rating;
	 
 -- which the day of the week has the best avvg rating 
    
		 
	  select day_name, avg(rating) as cus_rating from sales
	 group by day_name
	 order by cus_rating;
		
		-- which day of the week has the best average rating per branch
		select day_name , avg(rating) as avgrating from sales
		  where branch = "A"
		 group by day_name
		 order by avgrating desc;
    
 -- -----------------------------------************************-------------------------------------------------------------------------------------------------------------    
 

  
    
    
    
    
    
    