SELECT
	birthState,
    COUNT(DISTINCT playerID) AS players_count FROM players
WHERE
	birthCountry = 'USA'
GROUP BY
	birthState
ORDER BY
	players_count DESC;