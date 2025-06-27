

SELECT *
FROM inkjet_signal

where 	t_stamp <=  :date_to 
		AND t_stamp >=  :date_from
		
ORDER BY t_stamp DESC 