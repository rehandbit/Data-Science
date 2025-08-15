CREATE table users (
	user_id integer PRIMARY key,
	singup_date Date,
	device_type varchar(20),
	location varchar(20)
);
 
create table subscription(
	subcription_id integer PRIMARY key,
	user_id INTEGER references users(user_id),
	plan_type varchar(20),
	start_date Date,
	end_date Date
);

create table watch_history(
	history_id integer PRIMARY key,
	user_id INTEGER REFERENCES users(user_id),
	watch_date date,
	minute_watched integer
);

INSERT INTO users (user_id, singup_date, device_type, location) VALUES
(1, '2023-01-15', 'Desktop', 'California'),
(2, '2023-02-20', 'Mobile', 'New York'),
(3, '2023-03-10', 'Tablet', 'California'),
(4, '2023-04-05', 'Mobile', 'Texas'),
(5, '2023-05-12', 'Desktop', 'Texas'),
(6, '2023-06-18', 'Mobile', 'New York'),
(7, '2023-07-25', 'Desktop', 'California'),
(8, '2023-08-30', 'Mobile', 'Florida');


INSERT INTO subscription (subcription_id, user_id, plan_type, start_date, end_date) VALUES
(1, 1, 'Premium', '2023-01-15', NULL),          -- Active
(2, 2, 'Basic', '2023-02-20', '2024-03-20'),   -- CHURNED
(3, 3, 'Basic', '2023-03-10', NULL),          -- Active
(4, 4, 'Premium', '2023-04-05', '2024-02-05'),   -- CHURNED
(5, 5, 'Premium', '2023-05-12', NULL),          -- Active
(6, 6, 'Basic', '2023-06-18', '2024-01-18'),   -- CHURNED
(7, 7, 'Premium', '2023-07-25', NULL),          -- Active
(8, 8, 'Basic', '2023-08-30', NULL);          -- Active

INSERT INTO watch_history (history_id, user_id, watch_date, minute_watched) VALUES
(1, 1, '2024-01-10', 120),
(2, 1, '2024-01-12', 150),
(3, 2, '2024-02-05', 30),  -- Low watch time before churning
(4, 3, '2024-01-20', 800),
(5, 3, '2024-02-15', 750),
(6, 4, '2024-01-15', 60),  -- Low watch time before churning
(7, 5, '2024-02-18', 1100),
(8, 6, '2024-01-01', 15),  -- Very low watch time before churning
(9, 7, '2024-02-25', 1300),
(10, 8, '2024-02-28', 400);











select * from subscription;





select users.user_id, users.singup_date, users.device_type, users.location, end_date from subscription
JOIN users on users.user_id = subscription.user_id;


-- calculate the overall churn Rate, 
select count(end_date)* 100.0 / count(user_id) as churn_rate_percentage from subscription;

============================================
-- how to calculate number of churn users
SELECT
SUM(CASE WHEN end_date IS NOT NULL THEN 1 ELSE 0 END) AS churned_users,
COUNT(user_id) AS total_users,
SUM(CASE WHEN end_date IS NOT NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(user_id) AS churn_rate_percentage
FROM subscription;
===========================================

-- find the 'who' segment by device_type
select * from subscription;
select * from users;
==================================================
select u.device_type,
COUNT(s.end_date) *100.0 / COUNT(u.user_id) AS churn_rate
from subscription as s
join users as u ON u.user_id = s.user_id
GROUP BY u.device_type;
================================================
-- find the 'why' analyze user engagement
-- write the sql query to compare the average total minute watch for users who are still active versus users who have churned
select * from watch_history;

select avg(minute_watched), user_id from watch_history
GROUP by user_id ORDER by user_id;

select avg(minute_watched), u.user_id from watch_history as wh
 join users as u on u.user_id = wh.user_id
 GROUP BY u.user_id;


------------------------------------------------
-- use a CTE to first calculate the toal minute watched per user
===================================================
WITH user_watch_total as 
(SELECT user_id, sum(minute_watched) as total_minute_watched from watch_history as wh group by user_id order by user_id)

-- use a case statement to create active subscriber or churn subscriber
select 
	case
		when s.end_date is null then 'Active Subcriber'
		else 'churned Subcriber'
	end as subscription_status,
-- calculate the avg of the toal minute for each group
--  use coalesce to show 0 if a user has no watch history, which is good practice


avg(coalesce(uwt.total_minute_watched, 0)) as avg_total_minute from subscription as s left join
-- left join is safer here, in case a user has subcriber but watched nothing
	user_watch_total as uwt on s.user_id = uwt.user_id
	group by subscription_status ORDER by subscription_status;
==========================================================================
