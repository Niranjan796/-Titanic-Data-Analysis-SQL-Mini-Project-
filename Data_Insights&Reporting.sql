select * from titanic_data;

-- 1ST QUESTION) How many passengers were in each class (Pclass)?

select distinct(pclass) from titanic_data order by pclass;
select pclass, count(pclass) as NO_OF_Pass_Each_Class from titanic_data group by pclass order by pclass;



-- 2ND QUESTION) How many passengers were on the Titanic?

select count(*) as Pass_Count from titanic_data;




-- 3RD QUESTION) What is the average age of the passengers?

select avg(age) as Average_Age_of_Passengers from titanic_data;




-- 4TH QUESTION) How many male and female passengers were there?


select count(sex) as Male_Pass_Count from titanic_data where sex = "male";
select count(sex) as Female_Pass_Count from titanic_data where sex = "female";

SELECT sex, COUNT(*) AS Passenger_Count
FROM titanic_data
WHERE sex IN ('Male', 'Female')
GROUP BY sex;

-- If you want them in a single row (Male and Female counts as separate columns), you can use CASE WHEN:

SELECT 
    COUNT(CASE WHEN sex = 'male' THEN 1 END) AS Male_Pass_Count,
    COUNT(CASE WHEN sex = 'female' THEN 1 END) AS Female_Pass_Count
FROM titanic_data;




-- 5TH QUESTION) What was the survival rate by gender?

select * from titanic_data;

select survived, count(*) from titanic_data where Survived in (0, 1) group by survived;

select sex, survived, count(*) as Pass_Survival_Count from titanic_data where survived in (0, 1) GROUP BY sex, survived
ORDER BY sex, survived;





-- 6TH QUESTION) Which cabin had the most survivors?

select * from titanic_data;

select distinct(cabin) from titanic_data;

select cabin, count(survived) as Survived_Count_Each_Cabin from titanic_data where survived in (0, 1) GROUP BY cabin, survived
ORDER BY cabin, survived desc;



-- 7TH QUESTION) Categorize passengers based on their class (Pclass) into "Economy", "Business", and "First Class" groups.

SELECT 
    PassengerId,
    Name,
    pclass,
    CASE 
        WHEN pclass = 0 THEN 'Economy'
        WHEN pclass = 1 THEN 'Business'
        ELSE 'First_Class'
    END AS Fare_Category
FROM titanic_data;       




-- 8TH QUESTION) What is the rank of passengers based on their fare within each class (Pclass)?

-- By Rank() :

SELECT 
    PassengerId,
    Pclass,
    Fare,
    RANK() OVER (PARTITION BY Pclass ORDER BY Fare DESC) AS Fare_Rank
FROM Titanic_Data;

-- BY Dense_Rank :

select
     PassengerId,
     pclass,
     fare,
     dense_rank() over (Partition by pclass order by fare desc) as Fare_Rank
from titanic_data;

-- By Row_Number :

SELECT 
    PassengerId,
    Pclass,
    Fare,
    row_number() over (PARTITION BY Pclass ORDER BY Fare DESC) AS Fare_wise_Rank
from titanic_data;




-- 9TH QUESTION) What is the first (lowest) fare paid by passengers in each class (Pclass)?

select PCLASS, min(fare) as Min_Fare_Each_Cls from titanic_data group by pclass order by pclass; 


SELECT * FROM titanic_data; 

