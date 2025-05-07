SELECT
	p.bats,
    FLOOR(s.salary / 100000) AS salary_100k,
    COUNT(*) AS count_salaries
FROM
	salaries s LEFT JOIN players p ON s.playerID = p.playerID 
WHERE s.salary <> 0 AND bats = 'R'
GROUP BY
    p.bats,
    salary_100k;