
SELECT  avg("_TemperaturePoint3") as core_temperature_avg

FROM core_temperature
where 	t_stamp <=  :date_to 
		AND t_stamp >=  :date_from

