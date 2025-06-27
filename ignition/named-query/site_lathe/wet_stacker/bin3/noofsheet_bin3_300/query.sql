select count("CounterBin3") 
FROM public.site_wet_stacker_bin3

where 	t_stamp <=  :date_to 
		AND t_stamp >=  :date_from
		and bin3_recipe_thickness_after = 300
		