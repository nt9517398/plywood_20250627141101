SELECT 
    thickness,
    grade,
    product,
    construction,
    COUNT(CASE WHEN scl_ns_face = 1 OR scl_g1s_face = 1  THEN 1 ELSE NULL END) AS total_count
   	
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
