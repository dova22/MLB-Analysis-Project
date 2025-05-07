SELECT
	p.nameGiven,
    CONCAT(ROUND(s.salary / 1000000), ' million') AS highest_salary
FROM
	salaries s
LEFT JOIN
	players p  On s.playerID = p.playerID
WHERE
	salary = (
SELECT MAX(salary)
FROM salaries)
LIMIT 1;