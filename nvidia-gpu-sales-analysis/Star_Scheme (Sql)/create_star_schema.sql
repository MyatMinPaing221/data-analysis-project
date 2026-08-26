-- QUERY 1 : Create Dim_GPU dimension table

CREATE TABLE Dim_GPU AS
SELECT 	
	ROW_NUMBER() OVER (ORDER BY gpu_model) AS gpu_key,
	gpu_model,
	gpu_family,
	launch_year,
	msrp_usd
FROM(
	SELECT 
		DISTINCT gpu_model,
		gpu_family,
		launch_year,
		msrp_usd
	FROM gpu_sales
);
	
-- QUERY 2 : Create Dim_Region dimension table

CREATE TABLE Dim_Region AS
SELECT 
	ROW_NUMBER() OVER (ORDER BY region) AS region_key,
	region
FROM (SELECT DISTINCT region FROM gpu_sales);
	

-- QUERY 3 : Create Dim_Channel dimension table

CREATE TABLE Dim_Channel AS
SELECT 
	ROW_NUMBER() OVER (ORDER BY sales_channel, customer_segment) AS channel_key, 
	sales_channel,
	customer_segment
FROM (SELECT DISTINCT sales_channel, customer_segment FROM gpu_sales)


-- QUERY 4 : Create Fact_Sales table

CREATE TABLE Fact_Sales AS
SELECT 
	g.sale_id,
	g.sale_date,
	gp.gpu_key,
	r.region_key,
	c.channel_key,
	g.units_sold,
	g.avg_street_price_usd,
	g.price_premium_pct,
	g.stock_status,
    g.customer_satisfaction_score,
    g.warranty_months,
    g.bundle_addon,
    g.revenue_usd
FROM gpu_sales g
JOIN Dim_GPU gp ON g.gpu_model = gp.gpu_model 
JOIN Dim_Region r ON g.region = r.region 
JOIN Dim_Channel c ON g.sales_channel = c.sales_channel  AND g.customer_segment = c.customer_segment


--QUERY 6: Check the Tables

SELECT 
    (SELECT COUNT(*) FROM Fact_Sales) AS fact_rows,
    (SELECT COUNT(*) FROM Dim_GPU) AS dim_gpu_rows,
    (SELECT COUNT(*) FROM Dim_Region) AS dim_region_rows,
    (SELECT COUNT(*) FROM Dim_Channel) AS dim_channel_rows;


