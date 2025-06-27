
SELECT
        TO_CHAR(DATE_TRUNC('HOUR', t_stamp), 'DD/mm HH24') AS hour_interval,
 	 ROUND(SUM(CASE WHEN "MIS_ProducedBillets" <> 0 THEN "Vol" ELSE 0 END)::numeric, 1) AS actual,
	 AVG(runrate_target) AS target
from group_table
WHERE
			t_stamp <=  :date_to
		AND t_stamp >=  :date_from
group by hour_interval
order by hour_interval asc
