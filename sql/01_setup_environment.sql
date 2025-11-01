-- =====================================================
-- Snowflake Intelligence Demo Jam - Environment Setup
-- =====================================================
-- Purpose: Create database, schema, and base objects
-- Run this first in Snowsight
-- =====================================================

-- Set context
USE ROLE SF_INTELLIGENCE_DEMO;

-- Create database and schema
CREATE DATABASE IF NOT EXISTS DEMO_JAM;
USE DATABASE DEMO_JAM;

CREATE SCHEMA IF NOT EXISTS ENGINEERING_OPS;
USE SCHEMA ENGINEERING_OPS;

-- Use existing warehouse
USE WAREHOUSE APP_WH;

-- Grant Cortex permissions (if not already granted)
-- GRANT DATABASE ROLE SNOWFLAKE.CORTEX_USER TO ROLE SF_INTELLIGENCE_DEMO;

-- Create stage for semantic model and unstructured data
CREATE STAGE IF NOT EXISTS DEMO_STAGE
    COMMENT = 'Stage for semantic models and documents';

-- Verify setup
SELECT 'Setup Complete! Database: ' || CURRENT_DATABASE() || 
       ', Schema: ' || CURRENT_SCHEMA() || 
       ', Warehouse: ' || CURRENT_WAREHOUSE() AS status;

