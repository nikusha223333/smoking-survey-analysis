-- ============================================================
-- Smoking Survey Project — SQL Portfolio Queries
-- Database: smoking_project | Table: smoking_survey
-- ============================================================

-- ------------------------------------------------------------
-- 1. DATABASE & TABLE SETUP
-- ------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS smoking_project;
USE smoking_project;

CREATE TABLE IF NOT EXISTS smoking_survey (
    respondent_id INT,
    survey_date VARCHAR(20),   -- imported as text due to DD.MM.YYYY format from Excel
    start_time TIME,
    end_time TIME,
    area VARCHAR(50),
    companion VARCHAR(20),
    weather VARCHAR(20),
    gender VARCHAR(10),
    smoking_at_moment VARCHAR(5),
    brand VARCHAR(30),
    agreed_to_share VARCHAR(5),
    quantity_given INT
);

-- Quick structure check
DESCRIBE smoking_survey;

-- Row count check (should be 450 after import)
SELECT COUNT(*) FROM smoking_survey;


-- ------------------------------------------------------------
-- 2. AGREE % BY COMPANION
--    (Excel: COUNTIFS / COUNTIF | Power BI: DAX measure)
-- ------------------------------------------------------------

SELECT 
    companion,
    COUNT(*) AS total_respondents,
    SUM(CASE WHEN agreed_to_share = 'Yes' THEN 1 ELSE 0 END) AS agreed_count,
    ROUND(SUM(CASE WHEN agreed_to_share = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS agree_percentage
FROM smoking_survey
GROUP BY companion;


-- ------------------------------------------------------------
-- 3. TOP 5 BRANDS (by number of people who received them)
--    (Excel: LARGE/INDEX-MATCH | Power BI: Top N filter)
-- ------------------------------------------------------------

SELECT 
    brand,
    COUNT(*) AS times_given
FROM smoking_survey
WHERE agreed_to_share = 'Yes'
GROUP BY brand
ORDER BY times_given DESC
LIMIT 5;


-- ------------------------------------------------------------
-- 4. CROSS-TAB: COMPANION x AGREED/DECLINED
--    (Excel: manual cross-tab | Power BI: clustered column)
-- ------------------------------------------------------------

SELECT 
    companion,
    SUM(CASE WHEN agreed_to_share = 'Yes' THEN 1 ELSE 0 END) AS agreed_count,
    SUM(CASE WHEN agreed_to_share = 'No' THEN 1 ELSE 0 END) AS declined_count
FROM smoking_survey
GROUP BY companion;


-- ------------------------------------------------------------
-- 5. AGREE % BY AREA
-- ------------------------------------------------------------

SELECT 
    area,
    COUNT(*) AS total,
    ROUND(SUM(CASE WHEN agreed_to_share = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS agree_percentage
FROM smoking_survey
GROUP BY area
ORDER BY agree_percentage DESC;


-- ------------------------------------------------------------
-- 6. SMOKER VS NON-SMOKER — AGREE %
-- ------------------------------------------------------------

SELECT 
    smoking_at_moment,
    ROUND(SUM(CASE WHEN agreed_to_share = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS agree_percentage
FROM smoking_survey
GROUP BY smoking_at_moment;


-- ------------------------------------------------------------
-- 7. AVERAGE QUANTITY GIVEN, BY COMPANION
-- ------------------------------------------------------------

SELECT 
    companion,
    ROUND(AVG(quantity_given), 2) AS avg_quantity
FROM smoking_survey
GROUP BY companion;


-- ============================================================
-- End of queries
-- ============================================================
