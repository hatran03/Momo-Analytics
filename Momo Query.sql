Create database MoMo
select * from ['Data Commission']
select * from ['Data Transactions']
select * from ['Data User_Info']

-- Calculate MoMo's total revenue 
-- in January 2020.

select sum(Revenue) as 'Revenue_01/2020'
from ['Data Transactions']
where Year(Date) = 2020 and Month(Date) = 1

-- What is MoMo's most profitable month?

select top 1 (sum(Revenue)) as 'Revenue',Month(Date) as 'Month'
from  ['Data Transactions']
group by Month(Date)
order by sum(Revenue) DESC

-- What day of the week does MoMo make the most money, on average? The least money?

ALTER TABLE ['Data Transactions']
ADD DayOfWeekName VARCHAR(20);

UPDATE ['Data Transactions']
SET DayOfWeekName = DATENAME(dw, Date);

-- The most money
select top 1 (sum(Revenue)) as 'Revenue',DayOfWeekName
from  ['Data Transactions']
group by DayOfWeekName
order by sum(Revenue) DESC

-- The least money
select top 1 (sum(Revenue)) as 'Revenue',DayOfWeekName
from  ['Data Transactions']
group by DayOfWeekName
order by sum(Revenue) ASC

-- On average
select avg(Revenue) as 'Revenue', DayOfWeekName 
from  ['Data Transactions']
group by DayOfWeekName

-- Calculate the total number of new users in December 2020.
select count (distinct user_id) as 'NumberofNewCustomers'
from  ['Data Transactions']
where Type_user = 'New' and Month(Date) = 12 and Year(Date) = 2020
