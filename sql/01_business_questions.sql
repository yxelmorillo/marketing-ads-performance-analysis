/*
Project: Marketing Ads Performance Analysis
File: 01_business_questions.sql

Purpose:
This file documents the main business questions analyzed in this project
and the SQL queries used to answer them.

Business focus:
The analysis focuses on marketing budget efficiency, campaign investment
decisions, and campaign performance changes over time.

Note:
The dataset used for this project was anonymized to protect sensitive
business and client information.
*/

---- ============================================================
-- 1. Are campaigns spending efficiently, or is budget being wasted?
-- ============================================================

-- Business objective:
-- Analyze how marketing spend evolved over time and compare it against
-- click growth in order to evaluate whether budget increases were
-- accompanied by stronger performance.

-- Note:
-- The SQL query below is kept in its original working version because
-- its result table is used as part of the project evidence and matches
-- the screenshot included in the images folder.

-- Original SQL query:

WITH Trimestre AS(
SELECT Trimestre, DATEFROMPARTS(CAST(RIGHT(trimestre, 4) AS INT),
(CASE
	WHEN trimestre LIKE '%1.er trimestre de%' THEN 1
	WHEN trimestre LIKE '%2.º trimestre de%' THEN 2
	WHEN trimestre LIKE '%3.er trimestre de%' THEN 3
	WHEN trimestre LIKE '%4.º trimestre de%' THEN 4
	END - 1) * 3 + 1, 1) AS Fecha_trimestre, TRY_CAST(REPLACE(REPLACE(REPLACE(REPLACE(coste, 'ARS',''),CHAR(160),''),'.',''),',', '.') AS decimal(15,2)) AS Costo, Clics
FROM Serie_temporal
),

Costos AS(
SELECT Fecha_trimestre,clics, Costo, LAG(Costo,1) OVER (ORDER BY Fecha_trimestre) AS Coste_anterior
FROM trimestre
),

Aumento AS(
SELECT Fecha_trimestre,clics, Costo, (costo-coste_anterior)*100/coste_anterior AS Aumento_presupuesto
FROM Costos
)

SELECT YEAR(Fecha_trimestre) AÑOS,SUM(clics) AS Clics, (SUM(clics) - LAG(SUM(clics)) OVER(ORDER BY YEAR(Fecha_trimestre))) * 100.0/  LAG(SUM(clics)) OVER(ORDER BY YEAR(Fecha_trimestre)) AS Aumento_Clics_anuales,SUM(costo) AS Inversion_total, (SUM(Costo) - LAG(SUM(Costo)) OVER(ORDER BY YEAR(Fecha_trimestre))) *100.0/ LAG(SUM(Costo)) OVER(ORDER BY YEAR(Fecha_trimestre)) AS Porcentaje_crecimiento_de_inversio_anual
FROM Aumento
GROUP BY YEAR(Fecha_trimestre);

-- Business conclusion:
-- Marketing investment increased significantly over time.
-- In 2025, investment grew by approximately 77% versus 2024,
-- while clicks increased by approximately 111%, suggesting that
-- the additional budget was accompanied by stronger traffic results.
-- However, the 2026 projection shows a sharp reduction in investment
-- and clicks, which may indicate a contraction in budget or a change
-- in campaign strategy.


-- ============================================================
-- 2. Which campaigns should receive more budget based on performance?
-- ============================================================

-- Business objective:
-- Identify campaigns that show strong performance and could justify
-- additional investment. These campaigns should combine good result volume,
-- efficient cost per result, and stable or improving performance.

-- Metrics to analyze:
-- - Results / conversions
-- - Cost per result / CPA
-- - CTR
-- - CPC
-- - Conversion rate, if available
-- - Performance trend over time

-- Original SQL query:
-- This analysis identifies campaigns with strong CTR, cost visibility,
-- CPC performance, and budget share in order to support investment decisions.

-- Step 1: Review campaign performance, budget share and cost per click.

WITH Costo_limpio AS(
SELECT Nombre_de_la_campaña, Clics, TRY_CAST(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(CTR)), '%',''),',','.'),CHAR(160),'') AS Decimal (10,4)) AS CTR_limpio, Estado_de_la_campaña, TRY_CAST(REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(coste)), 'ARS', ''), '.',''), ',','.'), CHAR(160),'') AS decimal(18,2)) AS Costo
FROM Campañas
)

SELECT ROW_NUMBER() OVER(ORDER BY Nombre_de_la_campaña) AS #_Campaña, Nombre_de_la_campaña,clics,CTR_limpio,estado_de_la_campaña,Costo,(SUM(Costo) *100.0)/ SUM(Costo) OVER() AS Porcentaje_de_presupuesto, CAST((Costo/clics) AS Decimal(18,2)) AS Costo_por_clic, DENSE_RANK() OVER(ORDER BY Costo DESC) AS Rank_por_costos, DENSE_RANK() OVER (ORDER BY Costo/clics DESC) AS RANK_por_CPC
FROM costo_limpio
GROUP BY Nombre_de_la_campaña, Estado_de_la_campaña,clics,CTR_limpio,Costo
ORDER BY CTR_limpio DESC;


-- Step 2: Recommended campaigns for additional investment.
-- These campaigns were selected based on performance review, CTR,
-- CPC, budget share and campaign status.

WITH Costo_limpio AS(
SELECT Nombre_de_la_campaña, Clics, TRY_CAST(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(CTR)), '%',''),',','.'),CHAR(160),'') AS Decimal (10,4)) AS CTR_limpio, Estado_de_la_campaña, TRY_CAST(REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(coste)), 'ARS', ''), '.',''), ',','.'), CHAR(160),'') AS decimal(18,2)) AS Costo
FROM Campañas
),

mejores AS(
SELECT ROW_NUMBER() OVER(ORDER BY Nombre_de_la_campaña) AS #_Campaña, Nombre_de_la_campaña,clics,CTR_limpio,estado_de_la_campaña,Costo,CAST((SUM(Costo) *100.0)/ SUM(Costo) OVER() AS DECIMAL (18,2)) AS Porcentaje_de_presupuesto, CAST((Costo/clics) AS Decimal(18,2)) AS Costo_por_clic, DENSE_RANK() OVER(ORDER BY Costo DESC) AS Rank_por_costos, DENSE_RANK() OVER (ORDER BY Costo/clics DESC) AS RANK_por_CPC
FROM costo_limpio
GROUP BY  Nombre_de_la_campaña, Estado_de_la_campaña,clics,CTR_limpio,Costo
)

SELECT #_Campaña, Nombre_de_la_campaña,clics,CTR_limpio,estado_de_la_campaña,Costo,Porcentaje_de_presupuesto, Costo_por_clic,  Rank_por_costos, RANK_por_CPC
FROM mejores
Where #_Campaña IN (3, 35,4, 8, 15)
ORDER BY CTR_limpio DESC;


/*
Business conclusion:

This analysis helps identify which campaigns could justify additional budget.
The selected campaigns show stronger performance signals based on CTR, cost per
click, budget share and campaign status.

The recommendation is not to increase budget only because a campaign has high
clicks, but because the campaign combines performance, efficiency and potential
for scale.

Before increasing investment, these campaigns should be monitored to confirm
that higher budget does not reduce efficiency or increase CPC significantly.
*/




-- ============================================================
-- 3. Which campaigns are losing performance compared to previous periods?
-- ============================================================

-- Business objective:
-- Detect campaigns that are no longer performing as well as before.
-- The goal is to identify drops in results, increased cost per result,
-- lower CTR, or declining efficiency over time.

-- Metrics to analyze:
-- - Results by period
-- - Spend by period
-- - Cost per result by period
-- - CTR by period
-- - CPC by period
-- - Month-over-month or week-over-week variation

-- SQL query:
-- Paste your query below this line
