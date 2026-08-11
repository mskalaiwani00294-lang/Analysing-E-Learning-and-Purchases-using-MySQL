-- Create Database
CREATE DATABASE  if not exists OnlineLearningDB;
USE OnlineLearningDB;
-- Learners Table
Create Table Learners (
Learner_Id Int Primary Key,
Full_Name Varchar(100) Not Null,
Country Varchar(50) Not Null
);
-- 2. Courses Table

Create Table Courses (
Course_Id Int Primary Key,
Course_Name Varchar(100) Not Null,
Category Varchar(50) Not Null,
Unit_Price Decimal(10,2) Not Null
);

-- 3. Purchases Table

Create Table Purchases (
Purchase_Id Int Primary Key,
Learner_Id Int,
Course_Id Int,
Quantity Int Not Null,
Purchase_Date Date Not Null,

Foreign Key (Learner_Id)
References Learners(Learner_Id),

Foreign Key (Course_Id)
References Courses(Course_Id)
);
-- Insert Learners
INSERT INTO learners
(learner_id, full_name, country)
VALUES
(1, 'Arun Kumar', 'India'),
(2, 'Priya sathiya', 'India'),
(3, 'Kalai Maha', 'USA'),
(4, 'Kathivel', 'Spain'),
(5, 'Tittu', 'USA'),
(6, 'Anitha Raj', 'India'),
(7, 'Karthik Kumar', 'India'),
(8, 'Robert jo', 'USA'),
(9, 'Sofia Karthick', 'Spain'),
(10, 'Vijay Jones', 'UK'),
(11, 'Divya Priya', 'India'),
(12, 'Daniel Wilson', 'USA'),
(13, 'Emma vel', 'UK'),
(14, 'Mala', 'France'),
(15, 'Aisha ', 'India');


-- Insert Courses
Insert Into Courses
(Course_Id, Course_Name, Category, Unit_Price)
Values
(101, 'Sql Basics', 'Beginner', 3000.00),
(102, 'Excel Analytics', 'Beginner', 4000.00),
(103, 'Power Bi', 'Intermediate', 6000.00),
(104, 'Python For Data Analysis', 'Advanced', 9000.00),
(105, 'Machine Learning', 'Advanced', 12000.00),
(106, 'Advanced Excel', 'Beginner', 4500.00),
(107, 'SQL Advanced', 'Intermediate', 5500.00),
(108, 'Power BI Advanced', 'Intermediate', 7500.00),
(109, 'Python Programming', 'Advanced', 8500.00),
(110, 'Data Science', 'Advanced', 10000.00),
(111, 'Statistics for Data Analysis', 'Beginner', 5000.00),
(112, 'Tableau Analytics', 'Intermediate', 6500.00),
(113, 'Deep Learning', 'Advanced', 15000.00),
(114, 'Data Visualization', 'Beginner', 3500.00),
(115, 'Artificial Intelligence', 'Advanced', 14000.00);

-- Insert Purchases

insert into purchases
(purchase_id, learner_id, course_id, quantity, purchase_date)
values
(1, 1, 101, 2, '2026-01-10'),
(2, 1, 103, 2, '2026-01-15'),
(3, 1, 104, 1, '2026-02-05'),
(4, 2, 102, 2, '2026-01-20'),
(5, 2, 103, 1, '2026-02-10'),
(6, 3, 105, 2, '2026-02-15'),
(7, 4, 104, 2, '2026-03-01'),
(8, 5, 101, 1, '2026-03-05'),
(9, 6, 106, 1, '2026-03-10'),
(10, 7, 107, 2, '2026-03-12'),
(11, 8, 108, 1, '2026-03-15'),
(12, 9, 109, 2, '2026-03-18'),
(13, 10, 110, 1, '2026-03-20'),
(14, 11, 111, 2, '2026-03-22'),
(15, 12, 112, 1, '2026-03-25'),
(16, 13, 113, 1, '2026-03-28'),
(17, 14, 114, 3, '2026-04-01'),
(18, 15, 115, 1, '2026-04-05');

-- Combine learner, course, and purchase data
SELECT
l.learner_id,
l.full_name,
l.country,
c.course_id,
c.course_name,
c.category,
c.unit_price,
p.purchase_id,
p.quantity,
p.purchase_date,
(p.quantity * c.unit_price) AS Total_Amount
FROM learners l
INNER JOIN purchases p ON l.learner_id = p.learner_id
INNER JOIN courses c ON p.course_id = c.course_id;

-- Display: Learner name, Course name, Category, Quantity, Total amount, Purchase date

SELECT
l.full_name AS Learner_Name,
c.course_name AS Course_Name,
c.category AS Category,
p.quantity AS Quantity,
(p.quantity * c.unit_price) AS Total_Amount,
p.purchase_date AS Purchase_Date
FROM learners l
inner join purchases p ON l.learner_id = p.learner_id
inner join courses c ON p.course_id = c.course_id;

 -- Presentation Requirements
-- Format currency to 2 decimal places 
-- Use column aliases
 -- Sort by the highest total amount
 
 SELECT
l.full_name AS Learner_Name,
c.course_name AS Course_Name,
c.category AS Category,
p.quantity AS Quantity,
FORMAT(p.quantity * c.unit_price, 2) AS Total_Amount,
p.purchase_date AS Purchase_Date
from learners l
Left Join purchases p ON l.learner_id = p.learner_id
Left Join courses c ON p.course_id = c.course_id
order by  Total_Amount DESC;

-- Q1. Display each learner’s total spending with their country.
select
l.full_name AS Learner_Name,
l.country AS Country,
SUM(p.quantity * c.unit_price) AS Total_Spending
From learners l
Join purchases p ON l.learner_id = p.learner_id
Join  courses c ON p.course_id = c.course_id
group by 
    l.learner_id,
    l.full_name,
    l.country
order by Total_Spending DESC;

-- Q2. Find the top 3 most purchased courses by quantity

select
c.course_name as Course_Name,
sum(p.quantity) as Total_Quantity
from Courses c
inner join purchases p on c.course_id=p.Course_id
group by c.course_id,c.course_name
order by Total_Quantity desc
limit 3;

-- Q3. Show each category’s:
 -- Total revenue 
-- Number of unique learners
SELECT
c.category AS Category,
SUM(p.quantity * c.unit_price) AS Total_Revenue,
COUNT(DISTINCT p.learner_id) AS Unique_Learners
FROM courses c
INNER JOIN purchases p ON c.course_id = p.course_id
GROUP BY c.category
ORDER BY Total_Revenue DESC;

-- Q4. List learners who purchased from more than one category.

select 
l.learner_id,
l.full_name
from learners l
inner join purchases p on l.learner_id =p.learner_id
inner join courses c on p.course_id =c.course_id
group by l.learner_id,l.full_name
having count(distinct c.category)>1;

 -- Q5. Identify courses never purchased.
 select
 c.course_id,
 c.course_name
 from courses c
 left join purchases p on c.course_id=p.course_id
 where p.course_id is null;
 
-- Q6. Find learners whose total spending is above the average learner spending.
Select 
L.Learner_Id,
L.Full_Name,
Sum(P.Quantity * C.Unit_Price) As Total_Spending
From Learners L
Inner Join Purchases P On L.Learner_Id = P.Learner_Id
Inner Join Courses C On P.Course_Id = C.Course_Id
Group By L.Learner_Id, L.Full_Name
Having Sum(P.Quantity * C.Unit_Price) > (Select Avg(Total_Spending)
From (Select Sum(P2.Quantity * C2.Unit_Price) As Total_Spending
From Purchases P2
Inner Join Courses C2 On P2.Course_Id = C2.Course_Id
Group By P2.Learner_Id) As Avg_Spending
);

-- Q7. Display courses whose price is higher than any course in the ‘Beginner’ category
select 
course_id,
course_name,
unit_price
from courses
where unit_price> any(select unit_price
from courses
where category="beginner");

-- Q8 . Find learners who spent more than the average spending in their country.

 select 
l.learner_id,
l.full_name,
l.country,
sum(p.quantity * c.unit_price) as total_spending
from learners l
inner join purchases p on l.learner_id = p.learner_id
inner join courses c on p.course_id = c.course_id
group by l.learner_id, l.full_name, l.country
having sum(p.quantity * c.unit_price) > (select avg(country_spending)
from (select l2.country,sum(p2.quantity * c2.unit_price) as country_spending
from learners l2
inner join purchases p2 on l2.learner_id = p2.learner_id
inner join courses c2 on p2.course_id = c2.course_id
group by l2.country, l2.learner_id) as country_avg
);

-- Q9. Use a CTE to calculate total spending per learner, then:
 -- Display learners with spending above 10,000
 with learner_spending as (
select 
l.learner_id,
l.full_name,
sum(p.quantity * c.unit_price) as total_spending
from learners l
join purchases p on l.learner_id = p.learner_id
join courses c on p.course_id = c.course_id
group by l.learner_id, l.full_name)
select 
learner_id,
full_name,
total_spending
FROM learner_spending
WHERE total_spending > 10000;

-- Q10. CASE Expression
-- Classify learners based on spending:
-- Above 15,000 → “High Value”,
-- 8,000–15,000 → “Medium Value”,
-- Below 8,000 → “Low Value”.
select
l.learner_id,
l.full_name,
sum(p.quantity * c.unit_price) as total_spending,
case
when sum(p.quantity * c.unit_price) > 15000 then 'high value'
when sum(p.quantity * c.unit_price) >= 8000 then 'medium value'
else 'low value'
end as spending_category
from learners l
join purchases p on l.learner_id = p.learner_id
join courses c on p.course_id = c.course_id
group by l.learner_id, l.full_name;

-- Q11 . NULL Handling
-- Display all courses and replace NULL purchase counts with 0 using: IFNULL() or COALESCE()
select
c.course_id,
c.course_name,
ifnull(count(p.purchase_id), 0) as purchase_count
from courses c
left join purchases p on c.course_id = p.course_id
group by c.course_id, c.course_name;


-- Q12 . View
-- Create a view: category_performance_view
-- Showing:
-- Category
-- Total revenue
-- Number of purchases
-- Average revenue per purchase
use OnlineLearningDB;
CREATE VIEW category_performance_view AS
select
c.category as category,
sum(p.quantity * c.unit_price) as total_revenue,
count(p.purchase_id) as number_of_purchases,
avg(p.quantity * c.unit_price) as average_revenue_per_purchase
from courses c
join purchases p on c.course_id = p.course_id
group by c.category;

select*from  category_performance_view;
       