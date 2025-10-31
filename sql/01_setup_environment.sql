-- =====================================================
-- Snowflake Intelligence Demo Jam - Environment Setup
-- =====================================================
-- Purpose: Create database, schema, and base objects
-- Run this first in Snowsight
-- =====================================================

-- Set context
USE ROLE ACCOUNTADMIN;

-- Create database and schema
CREATE DATABASE IF NOT EXISTS DEMO_JAM;
USE DATABASE DEMO_JAM;

CREATE SCHEMA IF NOT EXISTS ENGINEERING_OPS;
USE SCHEMA ENGINEERING_OPS;

-- Create warehouse for demo
CREATE WAREHOUSE IF NOT EXISTS DEMO_JAM_WH
    WAREHOUSE_SIZE = 'SMALL'
    AUTO_SUSPEND = 60
    AUTO_RESUME = TRUE
    INITIALLY_SUSPENDED = TRUE
    COMMENT = 'Warehouse for Demo Jam presentation';

USE WAREHOUSE DEMO_JAM_WH;

-- Grant Cortex permissions
GRANT DATABASE ROLE SNOWFLAKE.CORTEX_USER TO ROLE ACCOUNTADMIN;

-- Create stage for semantic model and unstructured data
CREATE STAGE IF NOT EXISTS DEMO_STAGE
    COMMENT = 'Stage for semantic models and documents';

-- Verify setup
SELECT 'Setup Complete! Database: ' || CURRENT_DATABASE() || 
       ', Schema: ' || CURRENT_SCHEMA() || 
       ', Warehouse: ' || CURRENT_WAREHOUSE() AS status;

