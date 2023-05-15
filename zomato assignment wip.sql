use zomato;

select * from sheet1;
select * from sheet2;
select count(restaurantid) from sheet1;

CREATE TABLE COUNTRIES (COUNTRY_CODE INT, COUNTRY_NAME VARCHAR (100), CURRENCY VARCHAR(100), INR decimal(15,4), USD decimal(15,4));
insert into countries values 
(1,"India","Indian Rupees(Rs.)",1,0.012),
(14,"Australia","Dollar($)",0.018,1.48),
(30,"BrazilBrazilian","Real(R$)",0.06,4.93),
(37,"Canada","Dollar($)",0.016,1.33),
(94,"Indonesia","IndonesianRupiah(IDR)",180,14711.6),
(148,"New Zealand","NewZealand($)",0.019,1.59),
(162,"Philippines","Botswana Pula(P)",0.16,13.24),
(166,"Qatar","Qatari Rial(QR)",0.045,3.64),
(184,"Singapore","Dollar($)",0.016,1.32),
(189,"South Africa","Rand(R)",0.22,18.09),
(191,"Srilanka","Sri Lankan Rupee(LKR)",3.96,322.98),
(208,"Turkey","Turkish Lira(TL)",0.24,19.38),
(214,"United Arab Emirates","Emirati Diram(AED)",0.045,3.67),
(215,"United Kingdom","Pounds(Œ£)",0.0098,0.8),
(216,"United States","Dollar($)",0.012,1);
SELECT * FROM COUNTRIES;

drop table if exists Calendar_Table;
create table Calendar_Table (Datekey_Opening varchar (12), year int (4), month_no int (2), month__name varchar (20), querter varchar(2), yearmonth varchar(10), Weekdayno int (2), weekday_name varchar (10), FinancialMOnth varchar (4), Financial_Quarter varchar (3));
select * from Calendar_Table;

insert into Calendar_Table (Datekey_Opening) select Datekey_Opening from sheet1;
select count(Datekey_Opening) from Calendar_Table;

select * from Calendar_Table;
update Calendar_Table set year=year(Datekey_Opening);
update Calendar_Table set month_no=month(Datekey_Opening);
update Calendar_Table set month__name=monthname(Datekey_Opening);
update Calendar_Table set querter=quarter(Datekey_Opening);
update Calendar_Table set yearmonth=concat(left(Datekey_Opening,6),left(month__name,3));
update Calendar_Table set Weekdayno= weekday(Datekey_Opening);
update Calendar_Table set weekday_name= DAYNAME(Datekey_Opening);
update Calendar_Table set FinancialMOnth=concat("fm",IF(MONTH(Datekey_Opening)>=4,MONTH(Datekey_Opening)-3,MONTH(Datekey_Opening)+9));
update Calendar_Table set Financial_Quarter=concat("fq",if(quarter(Datekey_Opening)=1,quarter(Datekey_Opening)+3,quarter(Datekey_Opening)-1));
select * from Calendar_Table;

select city, count(restaurantid) from sheet1 group by city;
select count(sheet1.restaurantid), sheet1.country_code, sheet2.country_name from sheet1 join sheet2 on sheet1.country_code=sheet2.countryid group by sheet1.country_code; 

select count(restaurantid), year(Datekey_Opening) from sheet1 group by year(Datekey_Opening);
select count(restaurantid), quarter(Datekey_Opening) from sheet1 group by quarter(Datekey_Opening);
select count(restaurantid), month(Datekey_Opening) from sheet1 group by month(Datekey_Opening);

select count(restaurantid), avg(rating) from sheet1 group by rating;



select (select count(restaurantid) from sheet1 where Has_Table_booking='	Yes	 ')*100/count(restaurantid) as "Percentage of Resturants Has Table booking" from sheet1;

select (select count(restaurantid) from sheet1 where Has_Online_delivery='	Yes	 ')*100/count(restaurantid) as "Percentage of Resturants Has Online delivery" from sheet1;

