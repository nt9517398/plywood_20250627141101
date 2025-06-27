
SELECT 
    DATE_TRUNC('day', t_stamp) AS day,
	MIN("Downtime")
FROM downtime
WHERE 	t_stamp <=  :date_to 
		AND t_stamp >=  :date_from 
		and t_stamp::time > '22:00:00' and t_stamp::time <= '23:59:59'
GROUP BY day
