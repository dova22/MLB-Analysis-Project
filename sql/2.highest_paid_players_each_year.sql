WITH highest_salary AS
(SELECT
	yearID,
    MAX(salary) AS max_salary
FROM
	salaries
GROUP BY
	yearID)
SELECT
	hs.yearID,
    hs.max_salary,
    p.nameGiven
FROM
	highest_salary hs
LEFT JOIN
	salaries s
ON hs.yearID = s.yearID AND hs.max_salary = s.salary
LEFT JOIN players p  ON s.playerID = p.playerID;