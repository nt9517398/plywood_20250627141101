	
SELECT 
	t_stamp
FROM public.core_drop

where 	t_stamp <=  :date_to 
		AND t_stamp >=  :date_from
		AND "DroppedCoreActDiameter" >= 100
Order by t_stamp desc
limit 1
		
		