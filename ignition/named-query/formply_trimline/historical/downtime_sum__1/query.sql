SELECT 
	
	sum("duration"::decimal) 
FROM public.downtime_formply_trimline
where downtime_formply_trimline.end_time::date < (current_date ) AND
 		downtime_formply_trimline.start_time::date >= (current_date - 1)AND
 		downtime_formply_trimline.fault != 'OS-OVERNIGHT SHUT'
