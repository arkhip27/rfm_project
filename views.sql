CREATE VIEW analysis.v_Users AS
	select * 
    from production.Users;
CREATE VIEW analysis.v_OrderItems AS
	select * 
    from production.OrderItems;
CREATE VIEW analysis.v_OrderStatuses AS
	select * 
    from production.OrderStatuses;
CREATE VIEW analysis.v_Products AS
	select * 
    from production.Products;
CREATE VIEW analysis.v_Orders AS
	select * 
    from production.Orders
    
