SELECT 
    thickness,
    grade,
    product,
    construction,
    COUNT(CASE WHEN putty_ns_face = 1 OR putty_g1s_face = 1 OR putty_reject = 1  THEN 1 ELSE NULL END) AS total_count
   	
FROM 
    public.falldown_sander
WHERE 
    t_stamp >= :date_from AND t_stamp <= :date_to

GROUP BY 
    thickness,
    grade,
    product,
    construction
order by
	Total_Count DESC
