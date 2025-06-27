select sub_area as sub_area, sum(duration::decimal) as duration_total

FROM downtime_composer2

WHERE
			end_time <=  :date_to
		AND start_time >=  :date_from
		AND duration::decimal <= 470
		
GROUP BY  sub_area

order by duration_total desc limit 5