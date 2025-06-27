SELECT 
	count("MIS_Board_Number") 

FROM group_table

WHERE group_table.t_stamp <= :date_to AND
  group_table.t_stamp >= :date_from