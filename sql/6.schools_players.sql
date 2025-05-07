SELECT
	sd.name_full,
    COUNT(DISTINCT playerID) AS num_players
FROM
	schools s
LEFT JOIN
	school_details sd ON s.schoolID = sd.schoolID
GROUP BY
	sd.name_full
ORDER BY 
	COUNT(DISTINCT playerID) DESC
LIMIT 10;