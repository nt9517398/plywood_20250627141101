select count("CounterBin1") 
FROM public.site_wet_stacker_bin1

where 	t_stamp <=  :date_to 
		AND t_stamp >=  :date_from
		and bin1_recipe_thickness_after = 240
		