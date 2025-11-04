-- =====================================================
-- Module 2 Enhancement: Project ROI Metrics
-- =====================================================
-- Purpose: Add structured ROI tracking for IT projects
-- Enhancement: Separate table for multiple metrics per project
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
    METRIC_NAME VARCHAR(500) NOT NULL,
    METRIC_TYPE VARCHAR(100) NOT NULL, -- e.g., 'Cost Reduction', 'Revenue Increase', 'Efficiency Gain', 'Quality Improvement'
    METRIC_CATEGORY VARCHAR(100), -- e.g., 'Financial', 'Operational', 'Customer', 'Employee'
    TARGET_VALUE NUMBER(12,2),
    TARGET_UNIT VARCHAR(50), -- e.g., 'percent', 'dollars', 'hours', 'count'
    BASELINE_VALUE NUMBER(12,2),
    CURRENT_VALUE NUMBER(12,2),
    TARGET_DATE DATE,
    STATUS VARCHAR(50), -- e.g., 'On Track', 'At Risk', 'Achieved', 'Not Started'
    BUSINESS_VALUE_DESCRIPTION VARCHAR(5000),
    ROI_PROJECTION_MULTIPLE NUMBER(10,2), -- e.g., 3.5 means 3.5:1 ROI
    ROI_PROJECTION_ANNUAL_VALUE NUMBER(12,2), -- Annual dollar value
    MEASUREMENT_FREQUENCY VARCHAR(50), -- e.g., 'Monthly', 'Quarterly', 'At Completion'
    RESPONSIBLE_PARTY VARCHAR(200),
    NOTES VARCHAR(5000),
    CREATED_DATE DATE DEFAULT CURRENT_DATE(),
    LAST_UPDATED DATE DEFAULT CURRENT_DATE(),
    FOREIGN KEY (PROJECT_ID) REFERENCES IT_PROJECTS(PROJECT_ID)
) COMMENT = 'ROI metrics and success criteria for IT projects - enables quantifiable value tracking';

-- Create indexes for common queries
-- Note: Snowflake uses automatic micro-partitions, clustering keys optional for large datasets
-- ALTER TABLE PROJECT_ROI_METRICS CLUSTER BY (PROJECT_ID, METRIC_TYPE);

-- Grant permissions
GRANT SELECT ON TABLE PROJECT_ROI_METRICS TO ROLE SF_INTELLIGENCE_DEMO;

-- Verify table created
SHOW TABLES LIKE 'PROJECT_ROI_METRICS';

SELECT 'Project ROI Metrics table created successfully!' AS status;

