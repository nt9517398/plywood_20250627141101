	
SELECT 
	count(*) 
FROM public.core_drop

where 	t_stamp <=  :date_to 
		AND t_stamp >=  :date_from
		
		
		