
SELECT 
    DATE_TRUNC('day', t_stamp) AS day,
	MAX("Downtime")
FROM downtime
WHERE 	t_stamp <=  :date_to 
		AND t_stamp >=  :date_from 
		and t_stamp::time >= '00:00:00' and t_stamp::time < '06:00:00'
GROUP BY day
