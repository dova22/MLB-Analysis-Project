WITH avg_sal AS
(SELECT
	yearID,
    ROUND(AVG(salary)) AS avg_sal
FROM
	salaries
GROUP BY
	yearID),
prior_avg_sal AS (
SELECT
	yearID,
    avg_sal,
    LAG(avg_sal) OVER(ORDER BY yearID) AS avg_sal_prior FROM avg_sal)
SELECT
	yearID,
    (avg_sal - avg_sal_prior) / avg_sal_prior * 100 AS pct_change
FROM
	prior_avg_sal;