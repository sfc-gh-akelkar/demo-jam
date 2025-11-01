-- =====================================================
-- Snowflake Intelligence Demo Jam - Grant Warehouse Access
-- =====================================================
-- Purpose: Grant warehouse access to SF_INTELLIGENCE_DEMO role
-- Run this BEFORE running other scripts if you get warehouse errors
-- =====================================================

-- NOTE: You need to run this with a role that has GRANT privileges
-- (like ACCOUNTADMIN or SYSADMIN)

-- Switch to admin role
USE ROLE ACCOUNTADMIN;

-- Grant warehouse access to demo role
GRANT USAGE ON WAREHOUSE APP_WH TO ROLE SF_INTELLIGENCE_DEMO;
GRANT OPERATE ON WAREHOUSE APP_WH TO ROLE SF_INTELLIGENCE_DEMO;

-- Verify grants
SHOW GRANTS TO ROLE SF_INTELLIGENCE_DEMO;

-- Switch back to demo role
USE ROLE SF_INTELLIGENCE_DEMO;

-- Test warehouse access
USE WAREHOUSE APP_WH;

SELECT 'Warehouse access granted successfully!' AS status;

