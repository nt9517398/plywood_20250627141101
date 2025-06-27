SELECT sub_area, fault, SUM(duration::decimal) as durational_total
FROM downtime_composer2
WHERE
			end_time <=  :date_to
		AND start_time >=  :date_from
		AND duration::decimal <= 470
Group by  sub_area, fault
Order by durational_total desc
LIMIT 10