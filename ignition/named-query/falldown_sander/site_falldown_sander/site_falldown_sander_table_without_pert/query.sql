WITH sander_data AS (
SELECT 
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
)
SELECT 'Harvester Mark', hm_count FROM sander_data
UNION ALL
SELECT 'Blows', blows FROM sander_data
UNION ALL
SELECT 'Narrow Cover', nc_count AS percentage FROM sander_data
UNION ALL
SELECT 'Broken Cover Face', bc_face_count FROM sander_data
UNION ALL
SELECT 'Broken Cover Back', bc_back_count FROM sander_data
UNION ALL
SELECT 'Short Cover', sc_count FROM sander_data
UNION ALL
SELECT 'Short Centre L FRONT', scl_front_count FROM sander_data
UNION ALL
SELECT 'Short Centre L BACK', scl_back_count FROM sander_data
UNION ALL
SELECT 'Short Centre L RJ', scl_rj_count FROM sander_data
UNION ALL
SELECT 'Short Centre W MIRROR', scw_mirror_count FROM sander_data
UNION ALL
SELECT 'Short Centre W BOOTH', scw_booth_count FROM sander_data
UNION ALL
SELECT 'Short Centre W RJ', scw_rj_count FROM sander_data
UNION ALL
SELECT 'Putty', putty_count FROM sander_data
UNION ALL
SELECT 'Waste Indents', wi_count FROM sander_data
UNION ALL
SELECT 'Face Veneer Split', fvs_count FROM sander_data
UNION ALL
SELECT 'LUL', lul_count FROM sander_data
UNION ALL
SELECT 'Too Thin', tt_count FROM sander_data
UNION ALL
SELECT 'Chain Mark', cm_count FROM sander_data
UNION ALL
SELECT 'Other Count', other_count FROM sander_data
UNION ALL
SELECT 'Fork/Line Dam', fld_count FROM sander_data
UNION ALL
SELECT 'Sand Through', st_count FROM sander_data
UNION ALL
SELECT 'Waste On', wo_count FROM sander_data
UNION ALL
SELECT 'Groove Not Centre', gnc_count FROM sander_data
UNION ALL
SELECT 'Delamination', dela_count FROM sander_data
UNION ALL
SELECT 'Wrong Constructions', wrong_constructions FROM sander_data
UNION ALL
SELECT 'Out of Square', outofsq_count FROM sander_data
where hm_count > 0
ORDER BY hm_count DESC;

