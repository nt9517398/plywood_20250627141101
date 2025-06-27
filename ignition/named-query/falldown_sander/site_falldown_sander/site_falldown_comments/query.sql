SELECT * FROM falldown_sander_comments
where t_stamp < :date_to AND
 	t_stamp >= :date_from
order by t_stamp desc