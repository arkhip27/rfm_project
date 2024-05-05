CREATE table analysis.dm_rfm_segments (
	user_id INT4,
	recency INT4,
	frequency INT4,
	monetary_value INT4,
	FOREIGN KEY (user_id) REFERENCES production.users(id)
)
