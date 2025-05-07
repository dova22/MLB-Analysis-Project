WITH team_avg_salaries AS
(SELECT
	yearID,
    teamID,
    AVG(salary) AS avg_salary,
    COUNT(playerID) AS num_players
FROM
	salaries
GROUP BY
	yearID,
    teamID),
salary_ranks AS
(SELECT
	yearID,
    teamID,
    avg_salary,
    MAX(avg_salary) OVER(PARTITION BY yearID ORDER BY avg_salary DESC) AS highest_avg_salary,
	MIN(avg_salary) OVER(PARTITION BY yearID ORDER BY avg_salary) AS lowest_avg_salary
FROM
	team_avg_salaries)
SELECT
	yearID,
    teamID,
    avg_salary
FROM
	salary_ranks
WHERE
	avg_salary = highest_avg_salary
UNION ALL
SELECT
	yearID,
    teamID,
    avg_salary
FROM
	salary_ranks
WHERE
	avg_salary = lowest_avg_salary
ORDER BY
	yearID;