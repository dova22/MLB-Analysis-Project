WITH total_sal AS
(SELECT
	teamID,
    SUM(salary) AS total_salaries
FROM
	salaries
GROUP BY
	teamID),
teams_pct AS(
SELECT
	teamID,
    total_salaries,
    NTILE(5) OVER(ORDER BY total_salaries DESC) AS team_pct
FROM
	total_sal)
SELECT
	*
FROM
	teams_pct
WHERE
	team_pct = 1;