SELECT 
    'Blows' AS falldown,
    date_trunc('day', t_stamp::timestamp) - (EXTRACT(day FROM t_stamp::timestamp)::integer % 7) * interval '1 day' AS period_start,
    ((COUNT(CASE WHEN hm_reject = 1 THEN 1 ELSE NULL END))::float / COUNT(*)) * 100 AS percentage
FROM 
    public.falldown_sander
WHERE  
    t_stamp::timestamp >= :date_from AND t_stamp::timestamp <= :date_to
GROUP BY 
    period_start
ORDER BY 
    period_start;
