-- 1.	How many rows are in the data_analyst_jobs table?
SELECT COUNT (*)
FROM data_analyst_jobs;

-- 1793

-- 2.	Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
SELECT *
FROM data_analyst_jobs
LIMIT 10;

-- ExxonMobil

-- 3.	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
SELECT location, COUNT (*) AS Total
FROM data_analyst_jobs
GROUP BY location;

-- Tennessee is 21
-- Kentucky is 6

-- 4.	How many postings in Tennessee have a star rating above 4?
SELECT *
FROM data_analyst_jobs
WHERE location = 'TN' AND star_rating > 4;

-- 3 postings above a 4


-- 5.	How many postings in the dataset have a review count between 500 and 1000?
SELECT *
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

-- 151 postings

-- 6.	Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?
SELECT AVG(star_rating) AS avg_rating, location AS state
FROM data_analyst_jobs
GROUP BY location
ORDER BY avg_rating DESC; 

-- Nebraska has the highest average star rating.

-- 7.	Select unique job titles from the data_analyst_jobs table. How many are there?
SELECT DISTINCT title
FROM data_analyst_jobs;

-- There are 881 job titles.

-- 8.	How many unique job titles are there for California companies?
SELECT DISTINCT title, location, company
FROM data_analyst_jobs
WHERE location = 'CA';

-- There are 336 job titles for California companies

-- 9.	Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?
SELECT  AVG(star_rating )AS avg_rating, review_count, company
FROM data_analyst_jobs
WHERE review_count > '5000'
GROUP BY company, review_count;

-- There are 46 companies with over 5000 reviews

-- 10.	Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
SELECT  AVG(star_rating )AS avg_rating, review_count, company
FROM data_analyst_jobs
WHERE review_count > '5000'
GROUP BY company, review_count
ORDER by avg_rating DESC;

-- Microsoft has the highest rating with 4.19 average rating.


-- 11.	Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 
SELECT title
FROM data_analyst_jobs
WHERE title LIKE '%Analyst';

-- There are 1071 diffeerent job titles.

-- 12.	How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?
SELECT title
FROM data_analyst_jobs
WHERE title NOT LIKE '%A%';

-- There are two job titles do not contain the word 'Analyst' or the word 'Analystics'.
	
					  
-- **BONUS:**
-- You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 
--  - Disregard any postings where the domain is NULL. 
--  - Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 
--   - Which four industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?
SELECT  domain, skill, days_since_posting
FROM data_analyst_jobs
WHERE skill = 'SQL' AND domain IS NOT NULL 
ORDER BY days_since_posting DESC;

-- The top 4 industries are Consulting and Business Services, Transport and Freight, Internet and Software, and Computers and Electronics.