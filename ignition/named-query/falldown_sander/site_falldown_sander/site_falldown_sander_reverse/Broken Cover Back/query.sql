SELECT 
    thickness,
    grade,
    product,
    construction,
    COUNT(CASE WHEN bc_ns_back = 1 OR bc_g1s_back = 1  THEN 1 ELSE NULL END) AS total_count
   	
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
