--- Exercise 1
SELECT NAME
FROM CITY
WHERE POPULATION >120000
AND COUNTRYCODE = 'USA';

--- Exercise 2
SELECT *
FROM CITY
WHERE COUNTRYCODE = 'JPN';

--- Exercise 3
SELECT CITY, STATE
FROM STATION;

--- Exercise 4
SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE 'A%'
OR CITY LIKE 'E%'
OR CITY LIKE 'I%'
OR CITY LIKE 'O%'
OR CITY LIKE 'U%';


--- Exercise 5
SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE '%A'
OR CITY LIKE '%E'
OR CITY LIKE '%I'
OR CITY LIKE '%O'
OR CITY LIKE '%U';


--- Exercise 6
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT LIKE 'A%'
AND CITY NOT LIKE 'E%'
AND CITY NOT LIKE 'I%'
AND CITY NOT LIKE 'O%'
AND CITY NOT LIKE 'U%';


--- Exercise 7
SELECT name
FROM Employee
ORDER BY name ASC;

--- Exercise 8 
SELECT name
FROM Employee
WHERE salary >2000
AND months <10
ORDER BY employee_id ASC;

--- Exercise 9 


--- Exercise 10


--- Exercise 11


--- Exercise 12


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
