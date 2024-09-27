USE db;

-- 1. Analyse the data
-- Hint: use a SELECT statement via a JOIN to sample the data
-- ****************************************************************

SELECT p.*, u.*
FROM progress p
JOIN users u
ON p.user_id = u.user_id;


-- 2. What are the Top 25 schools (.edu domains)?
-- Hint: use an aggregate function to COUNT() schools with most students
-- ****************************************************************

SELECT u.email_domain AS "Top 25 schools based on no. of students", COUNT(*) AS "Number of students"
FROM users u
GROUP BY u.email_domain
ORDER BY COUNT(*) DESC
LIMIT 25;

-- 3. How many .edu learners are located in New York?
-- Hint: use an aggregate function to COUNT() students in New York
-- ****************************************************************

SELECT u.city AS "City", COUNT(u.user_id) AS "Number of student learners"
FROM users u
WHERE u.city = "New York";

-- 4. The mobile_app column contains either mobile-user or NULL. 
-- How many of these learners are using the mobile app?
-- Hint: COUNT()...WHERE...IN()...GROUP BY...
-- Hint: Alternate answers are accepted.
-- ****************************************************************

SELECT u.mobile_app, COUNT(u.user_id) AS "Number of learners using mobile app"
FROM users u
WHERE u.mobile_app = "mobile-user";

-- 5. Query for the sign up counts for each hour.
-- Hint: https://dev.mysql.com/doc/refman/5.7/en/date-and-time-functions.html#function_date-format 
-- ****************************************************************

SELECT HOUR(sign_up_at) AS "Hour", COUNT(*) AS "Sign up count"
FROM users u
GROUP BY HOUR(sign_up_at)
ORDER BY HOUR;

-- 6. What courses are the New Yorker Students taking?
-- Hint: SUM(CASE WHEN learn_cpp NOT IN('') THEN 1 ELSE 0 END) AS "New Yorker learners taking C++"
-- ****************************************************************

SELECT u.city AS "City",
	SUM(CASE WHEN p.learn_cpp NOT IN('') THEN 1 ELSE 0 END) AS "Learners taking C++",
	SUM(CASE WHEN p.learn_sql NOT IN('') THEN 1 ELSE 0 END) AS "Learners taking SQL",
	SUM(CASE WHEN p.learn_html NOT IN('') THEN 1 ELSE 0 END) AS "Learners taking HTML",
	SUM(CASE WHEN p.learn_javascript NOT IN('') THEN 1 ELSE 0 END) AS "Learners taking JavaScript",
	SUM(CASE WHEN p.learn_java NOT IN('') THEN 1 ELSE 0 END) AS "Learners taking Java"
    
FROM users u
JOIN progress p
ON u.user_id = p.user_id
WHERE u.city = "New York";

-- 7. What courses are the Chicago Students taking?
-- Hint: SUM(CASE WHEN learn_cpp NOT IN('') THEN 1 ELSE 0 END) AS "Chicago learners taking C++"
-- ****************************************************************

SELECT u.city AS "City",
	SUM(CASE WHEN p.learn_cpp NOT IN('') THEN 1 ELSE 0 END) AS "Learners taking C++",
	SUM(CASE WHEN p.learn_sql NOT IN('') THEN 1 ELSE 0 END) AS "Learners taking SQL",
	SUM(CASE WHEN p.learn_html NOT IN('') THEN 1 ELSE 0 END) AS "Learners taking HTML",
	SUM(CASE WHEN p.learn_javascript NOT IN('') THEN 1 ELSE 0 END) AS "Learners taking JavaScript",
	SUM(CASE WHEN p.learn_java NOT IN('') THEN 1 ELSE 0 END) AS "Learners taking Java"
    
FROM users u
JOIN progress p
ON u.user_id = p.user_id
WHERE u.city = "Chicago";
