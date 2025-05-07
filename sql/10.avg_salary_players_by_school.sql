WITH player_avg AS
(SELECT
	playerID,
    AVG(salary) AS avg_player_salary
FROM
	salaries
GROUP BY
	playerID)
SELECT
	sd.name_full,
    ROUND(AVG(pa.avg_player_salary)) AS school_avg,
    COUNT(pa.playerID)
FROM
	player_avg pa
INNER JOIN
	schools s ON pa.playerID = s.playerID INNER JOIN school_details sd ON s.schoolID = sd.schoolID
GROUP BY
	sd.name_full
HAVING
	COUNT(pa.playerID) > 10;