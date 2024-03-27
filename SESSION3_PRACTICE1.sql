

--- Exercise 13
SELECT part, assembly_step 
FROM parts_assembly
WHERE finish_date IS NULL;

--- Exercise 14
SELECT *
FROM lyft_drivers
WHERE yearly_salary <=30000
OR yearly_salary >=70000;

--- Exercise 15
SELECT advertising_channel
FROM uber_advertising
WHERE money_spent >100000
AND year = 2019;
