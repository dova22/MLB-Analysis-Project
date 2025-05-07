WITH combined_tbl AS
(SELECT
	s.teamID,
    p.bats
FROM
	salaries s
INNER JOIN
	players p ON s.playerID = p.playerID),
categorized_bats_tbl AS(
SELECT
	teamID,
    SUM(CASE
		WHEN bats = 'R' THEN 1 END) AS bat_right,
	SUM(CASE
		WHEN bats = 'L' THEN 1 END) AS bat_left,
	SUM(CASE
		WHEN bats = 'B' THEN 1 END) AS bat_both,
	COUNT(bats) AS total_players
FROM
	combined_tbl
GROUP BY
	teamID
)
SELECT
	teamID,
    CONCAT(ROUND(bat_right / total_players * 100),'%') AS pct_right,
    CONCAT(ROUND(bat_left / total_players * 100), '%') AS pct_left,
    CONCAT(ROUND(bat_both / total_players * 100), '%') AS pct_both
FROM
	categorized_bats_tbl;
