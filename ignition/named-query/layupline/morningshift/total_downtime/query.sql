SELECT 
    SUM(gap) AS total_gap
From(
SELECT 
    DATE_TRUNC('day', t_stamp) AS day,
	MAX("Downtime") -  MIN("Downtime") as gap
FROM downtime
WHERE 	t_stamp <=  :date_to 
		AND t_stamp >=  :date_from 
		and t_stamp::time >= '06:00:00' and t_stamp::time < '14:00:00'
GROUP BY day
) as subquery;