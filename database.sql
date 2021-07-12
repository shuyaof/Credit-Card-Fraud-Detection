--import raw data to postgres name table ccf1
CREATE TABLE ccf1(
	user_ int,
	card int,
	year_ int,
	month_ int,
	day_ int,
	time_ time,
	amount varchar,
	use_Chip varchar,
	merchant_Name bigint,
	merchant_City varchar,
	merchant_State varchar,
	zip float,
	mcc int,
	errors varchar,
	is_fraud varchar
	);

--add primary key to table ccf1
ALTER TABLE ccf1
ADD COLUMN id SERIAL PRIMARY KEY;
	
--split table into two tables:features and target
SELECT id,is_fraud
INTO target
FROM ccf1

SELECT id,
       user_,
	   card,
	   year_,
	   month_,
	   day_,
	   time_,
	   amount,
	   use_Chip,
	   merchant_Name
	   merchant_City,
	   merchant_State,
	   zip,
	   mcc,
	   errors
INTO features
FROM ccf1

--create final table ccf from two joined table
CREATE TABLE ccf AS 
  (SELECT f.*,
	   t.is_fraud
FROM features f
INNER JOIN target t
ON t.id=f.id
);
