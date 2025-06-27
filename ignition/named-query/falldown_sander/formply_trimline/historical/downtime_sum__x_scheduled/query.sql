SELECT 
	
	sum("duration"::decimal) 
FROM public.downtime_formply_trimline
where downtime_formply_trimline.end_time::timestamp <= (((current_date - :x) - 1) + TIME '15:30:00' )  AND
 		downtime_formply_trimline.start_time::timestamp >= (((current_date - :x)- 1) + TIME '05:30:00' ) AND
 		downtime_formply_trimline.fault != 'OS-OVERNIGHT SHUT'