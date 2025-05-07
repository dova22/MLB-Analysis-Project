SELECT
	yearID,
    p.bats,
    MAX(s.salary) AS max_salary,
    MIN(s.salary) AS min_salary,
    ROUND(AVG(s.salary)) AS avg_salary,
    COUNT(DISTINCT p.playerID) count_unique_players
FROM
	salaries s
LEFT JOIN
	players p ON s.playerID = p.playerID
WHERE
	p.bats IS NOT NULL AND s.salary <> 0
GROUP BY
	yearID,
    p.bats;
