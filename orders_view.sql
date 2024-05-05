DROP VIEW analysis.v_Orders;
CREATE VIEW analysis.v_Orders AS
SELECT * FROM(
SELECT 
  o.order_id,
  o.order_ts,
  o.user_id,
  o.bonus_payment,
  o.payment,
  o."cost",
  o.bonus_grant,
  ol.status_id AS status
FROM 
  production.orders o 
INNER JOIN (
  SELECT 
    order_id,
    status_id,
    ROW_NUMBER() OVER (PARTITION BY order_id ORDER BY status_id DESC) AS rn
  FROM 
    production.orderstatuslog
) ol ON o.order_id = ol.order_id 
WHERE 
  ol.rn = 1) o


