-- 1 create database cars93
   create database cars93;

-- 2  use database
   use cars93;

--  3 read the tables
   show tables;

-- 4  order by
   select * from cars93
   order by Manufacturer;

   select count( *) from cars93;

-- 5 count cars order by  type
   select count(*) from cars93
   order by Type;

-- 6 count  cars records belonging to type Sporty
	select count(*)from cars93
	where type = 'Sporty';


-- 7 display cars records belonging to type compact.
	select * from cars93
	where type = 'compact';

	select * from cars93
	where type = 'compact' and  AirBags= 'Driver & Passenger' ;

-- 8 count the cars who belongs to manufacturer Audi and  passeger less than 5.
	select count( *) from cars93
	where  Manufacturer= 'Audi'and Passengers >'5';


-- 9 display count of cars based on muanufacturer and passegers
	select Manufacturer, Passengers, count(*) as counttotal from cars93
	group by Manufacturer, Passengers
	order by counttotal;


-- 10 display count of cars based on muanufacturer and type
	select Manufacturer,Type, count(*) as counttotal from cars93
	group by Manufacturer,Type
	order by counttotal;


 -- 11 Find out cars whose price between 15.9 & 29.1
	select * from cars93
	where Price between 15.9 and 29.1;

--  12 count cars whose price between 15.9 & 29.1
	select count(*) from cars93
	where Price between 15.9 and 29.1;

--  13 find out the cars type is midsize or Horsepower is less than equal to 200.
	select * from cars93
	where Type="Midsize" or Horsepower>="200";


 -- 14. . Find out cars whose price is in between 15 lakh to 40.1 lakh and origin is USA 
	select * from cars93
	 where  (Price between 15.9 and 40.1)
	and (Origin="USA");

-- 15. display car based on highest Price
	select  * from cars93
	order by Price desc
	limit 1;

-- 16 display car based on lowest Price
	select  * from cars93
	order by Price asc
	limit 1;

-- 17 display Manufacturer , Origin and count of cars93 order based on Origin
	select Manufacturer, Origin,count(*) from cars93
	group by Manufacturer, Origin
	order by Origin;


-- 18. Combination Show count of cars, Average Price, min and max Price
	select count(*), avg(Price),min(Price),max(Price)
	from cars93;

	select distinct(Origin) from cars93;

    select distinct(Type) from cars93;
    
    
-- 19. Find out models of cars which have atleast 1 Airbag
    select Model, Airbags,count(*) from cars93
    where Airbags= "Driver Only" or "Driver & Passenger"
    group by Model, Airbags
    order by Airbags;
   
-- 20 count  all 5 seater cars that are of compact type
   select Passengers, Type,  count( *) from cars93
   where passengers= 5 and Type = "Compact"
   group by Passengers , Type 
   order by Type;


-- 21  Fetch only car type and Price and sort that data based on both
	select Type, Price 
	cars93
	group by Type, Price
	order by Price, Type asc;
 
-- 22 Model and  Type wise average HOrsepower
    select  Model,Type ,avg(Horsepower) as avgpower
    from cars93
    Group by  Model, Type, Horsepower
    order by avgpower;

-- 23 Find out all USA based Sporty cars
select * from cars93
 where origin = "USA" and Type = "Sporty";


--  24 Find out the Manufacturer of the car having highest horsepower   
    Select  Manufacturer, Horsepower from cars93
    group by  Manufacturer, Horsepower
    order by  Manufacturer, Horsepower desc
    limit 1;
    
-- 25. Find out Models of cars which are having Price between 17 and 25
	select Model ,Price
    from cars93
	where Price between 17 and 25;
    

-- 26. Find out top 7 most fuel economic cars for city, show results in sorted manner based on Horsepower.
    select MPG.city, Fuel.tank.capacity, Horsepower
     from cars93
     Group by  MPG.city, Fuel.tank.capacity, Horsepower
     order by Horsepower desc
    limit 7;
    
-- 27. Find out Cars with US based origin¶
	 Select Model, Origin 
	 from cars93
	 where Origin= "USA";
 
-- 28. Find out Cars with no airbags and which are compact in type, from the output retrieve only Model,Type, Airbags

	select Model, Type , Airbags,count(*) from cars93
    where Airbags= "None" and Type="compact"
    group by Model,Type, Airbags
    order by Airbags;
    
 -- 29 display all Models,  Cylinder, and make of the cars having  Maximum  EngineSize, 
 Select Model, Max(Enginesize),Cylinders, Make
 from cars93
group by Model, Enginesize,Cylinders, Make;