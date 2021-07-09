CREATE TABLE ccf(
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
	
ALTER TABLE ccf
ADD COLUMN id SERIAL PRIMARY KEY;
	
SELECT * FROM ccf
