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
-- 3. Which were the best campaigns of the year based on campaign objective and efficiency?
-- ============================================================

-- Business objective:
-- Identify the best-performing campaigns of 2025 by analyzing them according
-- to their campaign objective. Campaigns focused on reach should be evaluated
-- differently from campaigns focused on link clicks or interaction.

-- Metrics to analyze:
-- - Campaign objective / result indicator
-- - Investment
-- - Reach
-- - Link clicks
-- - Cost per result
-- - Cost per click
-- - Performance ranking by campaign objective

-- Original business question:
-- Which was the best campaign of the year?

-- Original SQL query adapted for a complete executable SQL Server script:
-- This analysis identifies the best campaigns of 2025 by separating campaigns
-- based on their main objective: reach-focused campaigns and click-focused campaigns.

IF OBJECT_ID('tempdb..#campaign_metrics') IS NOT NULL
    DROP TABLE #campaign_metrics;

WITH annual_data AS (
    SELECT
        YEAR(Finalización) AS Año,
        Indicador_de_resultado,
        Nombre_de_la_campaña,
        Costo_por_resultados AS CPR,
        Importe_gastado_ARS AS Inversion,
        Alcance,
        Clics_en_el_enlace,
        CAST((Importe_gastado_ARS / Clics_en_el_enlace) AS DECIMAL(18,2)) AS CPC
    FROM Central
    WHERE YEAR(Finalización) = 2025
      AND Indicador_de_resultado IS NOT NULL
),

metrics AS (
    SELECT
        ROW_NUMBER() OVER(ORDER BY Nombre_de_la_campaña) AS campaign_number,
        Indicador_de_resultado,
        Nombre_de_la_campaña,
        CPR,
        Inversion,
        Alcance,
        Clics_en_el_enlace,
        CPC,
        DENSE_RANK() OVER(ORDER BY Alcance DESC) AS reach_rank,
        DENSE_RANK() OVER(ORDER BY Inversion DESC) AS investment_rank,
        DENSE_RANK() OVER(ORDER BY Clics_en_el_enlace DESC) AS clicks_rank,
        DENSE_RANK() OVER(ORDER BY CPC ASC) AS cpc_rank
    FROM annual_data
    WHERE Clics_en_el_enlace IS NOT NULL
      AND CPC IS NOT NULL
)

SELECT *
INTO #campaign_metrics
FROM metrics;


-- Reach-focused campaigns:
-- These campaigns were selected because their main objective was reach.
-- The recommendation considers the balance between reach, investment,
-- and cost efficiency.

SELECT
    campaign_number,
    Nombre_de_la_campaña,
    Indicador_de_resultado,
    CPR,
    Inversion,
    Alcance,
    Clics_en_el_enlace,
    CPC,
    reach_rank,
    investment_rank,
    clicks_rank,
    cpc_rank
FROM #campaign_metrics
WHERE campaign_number IN (121, 190, 179)
ORDER BY reach_rank;


-- Click-focused campaigns:
-- These campaigns were selected because their main objective was interaction
-- or link clicks. The recommendation considers low CPC, reasonable investment,
-- and strong click volume.

SELECT
    campaign_number,
    Nombre_de_la_campaña,
    Indicador_de_resultado,
    CPR,
    Inversion,
    Alcance,
    Clics_en_el_enlace,
    CPC,
    reach_rank,
    investment_rank,
    clicks_rank,
    cpc_rank
FROM #campaign_metrics
WHERE campaign_number IN (150, 111, 110)
ORDER BY cpc_rank;


/*
Business conclusion:

The best campaign of the year should not be selected using a single metric.
Campaign performance must be evaluated according to the campaign objective.

For reach-focused campaigns, the strongest options were selected based on
a strong balance between reach, investment level and cost efficiency.

For click-focused or interaction campaigns, the strongest options were selected
based on low CPC, reasonable investment and strong link click results.

This analysis supports better budget allocation because it separates campaigns
by objective instead of comparing all campaigns under the same performance rule.
*/
