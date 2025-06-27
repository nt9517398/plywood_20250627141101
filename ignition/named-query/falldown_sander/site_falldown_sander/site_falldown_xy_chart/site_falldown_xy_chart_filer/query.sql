
WITH sander_data AS (
SELECT 
	   date_trunc('day', t_stamp::timestamp) - (EXTRACT(day FROM t_stamp::timestamp)::integer % 5) * interval '1 day' AS period_start,

       COUNT(*) AS row_count, 
    
       COUNT(CASE WHEN hm_ns_face = 1 THEN 1 ELSE NULL END) +
       COUNT(CASE WHEN hm_g1s_p_face = 1 THEN 1 ELSE NULL END) as hm_count,
    
       COUNT(CASE WHEN hm_reject = 1 THEN 1 ELSE NULL END) as blows,
       
       COUNT(CASE WHEN nc_ns_face = 1 THEN 1 ELSE NULL END)
       + COUNT(CASE WHEN nc_ns_back = 1 THEN 1 ELSE NULL END)
       + COUNT(CASE WHEN nc_g1s_face = 1 THEN 1 ELSE NULL END)
       + COUNT(CASE WHEN nc_g1s_back = 1 THEN 1 ELSE NULL END)
       + COUNT(CASE WHEN nc_reject = 1 THEN 1 ELSE NULL END) as nc_count,
    
       COUNT(CASE WHEN bc_ns_face = 1 THEN 1 ELSE NULL END)  
       + COUNT(CASE WHEN bc_g1s_face = 1 THEN 1 ELSE NULL END) 
       + COUNT(CASE WHEN bc_reject = 1 THEN 1 ELSE NULL END) as bc_face_count,
       
       
       COUNT(CASE WHEN bc_ns_back = 1 THEN 1 ELSE NULL END)
       + COUNT(CASE WHEN bc_g1s_back = 1 THEN 1 ELSE NULL END) as bc_back_count,
       
       COUNT(CASE WHEN sc_ns_face = 1 THEN 1 ELSE NULL END)   
        + COUNT(CASE WHEN sc_g1s_face = 1 THEN 1 ELSE NULL END)
        + COUNT(CASE WHEN sc_reject = 1 THEN 1 ELSE NULL END) as sc_count,
     
       COUNT(CASE WHEN scl_ns_face = 1 THEN 1 ELSE NULL END)
       + COUNT(CASE WHEN scl_g1s_face = 1 THEN 1 ELSE NULL END) as scl_front_count,
       
       COUNT(CASE WHEN scl_ns_back = 1 THEN 1 ELSE NULL END)
       + COUNT(CASE WHEN scl_g1s_back = 1 THEN 1 ELSE NULL END)as scl_back_count,
         
       COUNT(CASE WHEN scl_reject = 1 THEN 1 ELSE NULL END) as scl_rj_count,
        
    
        COUNT(CASE WHEN scw_ns_face = 1 THEN 1 ELSE NULL END)
       + COUNT(CASE WHEN scw_g1s_face = 1 THEN 1 ELSE NULL END) as scw_mirror_count,
       
       + COUNT(CASE WHEN scw_ns_back = 1 THEN 1 ELSE NULL END)
       + COUNT(CASE WHEN scw_g1s_back = 1 THEN 1 ELSE NULL END) as scw_booth_count,
       
       + COUNT(CASE WHEN scw_reject = 1 THEN 1 ELSE NULL END) scw_rj_count,
    
    
        COUNT(CASE WHEN putty_ns_face = 1 THEN 1 ELSE NULL END)
        + COUNT(CASE WHEN putty_g1s_face = 1 THEN 1 ELSE NULL END)
        + COUNT(CASE WHEN putty_reject = 1 THEN 1 ELSE NULL END) as putty_count,

       COUNT(CASE WHEN wi_ns_face = 1 THEN 1 ELSE NULL END)
       + COUNT(CASE WHEN wi_g1s_face = 1 THEN 1 ELSE NULL END) as wi_count,
    
    
       COUNT(CASE WHEN fvs_ns_face = 1 THEN 1 ELSE NULL END)
       + COUNT(CASE WHEN fvs_g1s_face = 1 THEN 1 ELSE NULL END)
       + COUNT(CASE WHEN fvs_reject = 1 THEN 1 ELSE NULL END) as fvs_count,
    
       COUNT(CASE WHEN lul_ns_face = 1 THEN 1 ELSE NULL END)
        + COUNT(CASE WHEN lul_reject = 1 THEN 1 ELSE NULL END)
        + COUNT(CASE WHEN lul_g1s_face = 1 THEN 1 ELSE NULL END) as lul_count,
    
        COUNT(CASE WHEN tt_ns_face = 1 THEN 1 ELSE NULL END)
        + COUNT(CASE WHEN tt_g1s_face = 1 THEN 1 ELSE NULL END)
        + COUNT(CASE WHEN tt_reject = 1 THEN 1 ELSE NULL END) as tt_count,
    
       COUNT(CASE WHEN cm_ns_face = 1 THEN 1 ELSE NULL END)
       + COUNT(CASE WHEN cm_g1s_face = 1 THEN 1 ELSE NULL END)
       + COUNT(CASE WHEN cm_reject = 1 THEN 1 ELSE NULL END) as cm_count,
    
       COUNT(CASE WHEN other1_ns_face = 1 THEN 1 ELSE NULL END)
       + COUNT(CASE WHEN other1_g1s_face = 1 THEN 1 ELSE NULL END)
       + COUNT(CASE WHEN other1_reject = 1 THEN 1 ELSE NULL END) as other_count,
       

       COUNT(CASE WHEN fld_g1s_face = 1 THEN 1 ELSE NULL END)
        + COUNT(CASE WHEN fld_reject = 1 THEN 1 ELSE NULL END) as fld_count,
    
       COUNT(CASE WHEN st_g1s_face = 1 THEN 1 ELSE NULL END)
        + COUNT(CASE WHEN st_ns_face = 1 THEN 1 ELSE NULL END)
        + COUNT(CASE WHEN st_reject = 1 THEN 1 ELSE NULL END) as st_count,
    
       COUNT(CASE WHEN wo_g1s_face = 1 THEN 1 ELSE NULL END)
       + COUNT(CASE WHEN wo_g1s_back = 1 THEN 1 ELSE NULL END)
       + COUNT(CASE WHEN wo_ns_face = 1 THEN 1 ELSE NULL END)
       + COUNT(CASE WHEN wo_ns_back = 1 THEN 1 ELSE NULL END)
       + COUNT(CASE WHEN wo_reject = 1 THEN 1 ELSE NULL END) as wo_count,
    
       COUNT(CASE WHEN gnc_g1s_face = 1 THEN 1 ELSE NULL END)
        + COUNT(CASE WHEN gnc_reject = 1 THEN 1 ELSE NULL END)as gnc_count,
       
      
    
       COUNT(CASE WHEN dela_reject = 1 THEN 1 ELSE NULL END) as dela_count,
    
       COUNT(CASE WHEN wi_reject = 1 THEN 1 ELSE NULL END) as wrong_constructions,
    
       COUNT(CASE WHEN outofsq_reject = 1 THEN 1 ELSE NULL END) as outofsq_count
       
FROM public.falldown_sander
where  t_stamp >= :date_from and t_stamp <= :date_to
GROUP BY period_start
)
, fall_data AS (
SELECT period_start,'Total' AS FALLDOWN,   100 AS percentage FROM sander_data
UNION ALL
SELECT period_start,'Harvester Mark', (hm_count::float / row_count)* 100  AS percentage FROM sander_data
UNION ALL
SELECT period_start,'Blows',  (blows::float / row_count)* 100  AS percentage FROM sander_data
UNION ALL
SELECT period_start,'Narrow Cover',  (nc_count::float / row_count)* 100 AS percentage FROM sander_data
UNION ALL
SELECT period_start,'Broken Cover Face',  (bc_face_count::float / row_count)* 100  AS percentage FROM sander_data
UNION ALL
SELECT period_start,'Broken Cover Back',  (bc_back_count::float / row_count)* 100  AS percentage FROM sander_data
UNION ALL
SELECT period_start,'Short Cover',  (sc_count::float / row_count)* 100 AS percentage FROM sander_data
UNION ALL
SELECT period_start,'Short Centre L FRONT',  (scl_front_count::float / row_count)* 100  AS percentage FROM sander_data
UNION ALL
SELECT period_start,'Short Centre L BACK',  (scl_back_count::float / row_count)* 100  AS percentage FROM sander_data
UNION ALL
SELECT period_start,'Short Centre L RJ',  (scl_rj_count::float / row_count)* 100 AS percentage FROM sander_data
UNION ALL
SELECT period_start,'Short Centre W MIRROR',  (scw_mirror_count::float / row_count)* 100  AS percentage FROM sander_data
UNION ALL
SELECT period_start,'Short Centre W BOOTH',  (scw_booth_count::float / row_count)* 100  AS percentage FROM sander_data
UNION ALL
SELECT period_start,'Short Centre W RJ',  (scw_rj_count::float / row_count)* 100  AS percentage FROM sander_data
UNION ALL
SELECT period_start,'Putty', (putty_count::float / row_count)* 100  AS percentage FROM sander_data
UNION ALL
SELECT period_start,'Waste Indents',  (wi_count::float / row_count)* 100  AS percentage FROM sander_data
UNION ALL
SELECT period_start,'Face Veneer Split', (fvs_count::float / row_count)* 100  AS percentage FROM sander_data
UNION ALL
SELECT period_start,'LUL', (lul_count::float / row_count)* 100  AS percentage FROM sander_data
UNION ALL
SELECT period_start,'Too Thin',  (tt_count::float / row_count)* 100  AS percentage FROM sander_data
UNION ALL
SELECT period_start,'Chain Mark',  (cm_count::float / row_count)* 100  AS percentage FROM sander_data
UNION ALL
SELECT period_start,'Other Count',  (other_count::float / row_count)* 100  AS percentage FROM sander_data
UNION ALL
SELECT period_start,'Fork/Line Dam',  (fld_count::float / row_count)* 100  AS percentage FROM sander_data
UNION ALL
SELECT period_start,'Sand Through',  (st_count::float / row_count)* 100  AS percentage FROM sander_data
UNION ALL
SELECT period_start,'Waste On',  (wo_count::float / row_count)* 100 AS percentage FROM sander_data
UNION ALL
SELECT period_start,'Groove Not Centre',  (gnc_count::float / row_count)* 100  AS percentage FROM sander_data
UNION ALL
SELECT period_start,'Delamination', (dela_count::float / row_count)* 100  AS percentage FROM sander_data
UNION ALL
SELECT period_start,'Wrong Constructions', (wrong_constructions::float / row_count)* 100  AS percentage FROM sander_data
UNION ALL
SELECT period_start,'Out of Square',  (outofsq_count::float / row_count)* 100  AS percentage FROM sander_data
)
SELECT * FROM fall_data
WHERE FALLDOWN = :falldown
ORDER BY period_start, percentage DESC;

