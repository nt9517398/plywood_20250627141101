
SELECT 
	
CASE
	WHEN downtime_debarker.responsibility = 'MECHANICAL' THEN 'MECHANICAL'
	WHEN downtime_debarker.responsibility = 'ELECTRICAL' THEN 'ELECTRICAL'
    WHEN downtime_debarker.responsibility = 'PRODUCTION' THEN 'PRODUCTION'
    WHEN downtime_debarker.responsibility = 'EMERGENCY SERVICES' THEN 'EMERGENCY SERVICES'
   
    
END as respon_reason,


CASE
	 WHEN downtime_debarker.responsibility = 'EMERGENCY SERVICES' THEN sum(downtime_debarker.duration::decimal)
	WHEN downtime_debarker.responsibility = 'MECHANICAL' THEN sum(downtime_debarker.duration::decimal)
	WHEN downtime_debarker.responsibility = 'ELECTRICAL' THEN sum(downtime_debarker.duration::decimal)
    WHEN downtime_debarker.responsibility = 'PRODUCTION' THEN sum(downtime_debarker.duration::decimal)
END as duration_total


FROM downtime_debarker
WHERE
			end_time <=  :date_to
		AND start_time >=  :date_from
		and start_time::time >= '05:00:00' and end_time::time <= '15:00:00'
        and extract(isodow from start_time::date) >0 and extract(isodow from end_time::date) < 5
GROUP BY  responsibility

order by responsibility desc limit 5