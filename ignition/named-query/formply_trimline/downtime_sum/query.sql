SELECT 
	
	sum("duration"::decimal) 
FROM public.downtime_formply_trimline

WHERE end_time is not NULL AND
	downtime_formply_trimline.end_time < :date_to AND
 	downtime_formply_trimline.start_time >= :date_from AND
 		downtime_formply_trimline.fault != 'OS-OVERNIGHT SHUT'