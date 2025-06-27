Select area, sub_area, responsibility, equipment, action, SUM(duration::decimal) as durational_total
FROM downtime_debarker
WHERE
			end_time <=  :date_to
		AND start_time >=  :date_from
		AND	duration::decimal <= 300
		and start_time::time >= '05:00:00' and end_time::time <= '15:00:00'
        and extract(isodow from start_time::date) >0 and extract(isodow from end_time::date) < 5
Group by area, sub_area, responsibility, equipment, action
Order by durational_total desc
limit 10