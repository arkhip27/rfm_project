--delete from analysis.dm_rfm_segments;
INSERT INTO analysis.dm_rfm_segments (user_id, recency, frequency, monetary_value)


select trr.user_id, trr.recency, trf.frequency, trmv.monetary_value
from tmp_rfm_recency trr 
	inner join tmp_rfm_frequency trf 
		on trr.user_id = trf.user_id 
	inner join tmp_rfm_monetary_value trmv 
		on trr.user_id = trmv.user_id 


