-- =====================================================
-- Module 2 Enhancement: Project ROI Metrics Table
-- =====================================================
-- Purpose: Separate ROI and success metrics for better analytics
-- =====================================================

USE DATABASE DEMO_JAM;
USE SCHEMA ENGINEERING_OPS;
USE WAREHOUSE APP_WH;

-- =====================================================
-- PROJECT ROI METRICS
-- =====================================================

CREATE OR REPLACE TABLE PROJECT_ROI_METRICS (
    METRIC_ID VARCHAR(50) PRIMARY KEY,
    PROJECT_ID VARCHAR(50) NOT NULL,
    METRIC_NAME VARCHAR(200) NOT NULL,
    METRIC_DESCRIPTION VARCHAR(1000),
    METRIC_TYPE VARCHAR(50) NOT NULL,  -- 'efficiency', 'cost_savings', 'revenue_impact', 'quality', 'satisfaction'
    BASELINE_VALUE NUMBER(15,2),
    TARGET_VALUE NUMBER(15,2),
    CURRENT_VALUE NUMBER(15,2),
    UNIT_OF_MEASURE VARCHAR(50),  -- 'percent', 'hours', 'dollars', 'days', 'count'
    ROI_PROJECTION_DOLLARS NUMBER(15,2),
    MEASUREMENT_FREQUENCY VARCHAR(50),  -- 'monthly', 'quarterly', 'annual', 'one-time'
    IS_PRIMARY_METRIC BOOLEAN DEFAULT FALSE,
    METRIC_OWNER VARCHAR(200),
    LAST_MEASURED_DATE DATE,
    NOTES VARCHAR(2000),
    FOREIGN KEY (PROJECT_ID) REFERENCES IT_PROJECTS(PROJECT_ID)
) COMMENT = 'Detailed ROI and success metrics for IT projects - enables quantitative business value tracking';

-- Create index for common queries
-- Note: Snowflake uses micro-partitions, but we document common access patterns
-- ALTER TABLE PROJECT_ROI_METRICS CLUSTER BY (PROJECT_ID, METRIC_TYPE);

-- Grant permissions
GRANT SELECT ON TABLE PROJECT_ROI_METRICS TO ROLE SF_INTELLIGENCE_DEMO;

SHOW TABLES LIKE 'PROJECT_ROI_METRICS';

SELECT 'PROJECT_ROI_METRICS table created successfully!' AS status;

