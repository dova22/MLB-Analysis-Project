SELECT
	birthCountry,
    COUNT(DISTINCT playerID) AS players_count
FROM
	players
WHERE
	birthCountry IS NOT NULL
GROUP BY
	birthCountry
ORDER BY
	players_count DESC;