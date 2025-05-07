SELECT
	yearID,
    lgID,
    AVG(salary) AS avg_salary,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary
FROM
	salaries
WHERE
	salary <> 0
GROUP BY
	yearID,
    lgID;