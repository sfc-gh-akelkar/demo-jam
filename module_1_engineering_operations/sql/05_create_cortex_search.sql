-- =====================================================
-- Snowflake Intelligence Demo Jam - Cortex Search Setup
-- =====================================================
-- Purpose: Create Cortex Search Service for documentation
-- =====================================================

USE DATABASE DEMO_JAM;
USE SCHEMA ENGINEERING_OPS;
USE WAREHOUSE APP_WH;

-- =====================================================
-- Create Cortex Search Service
-- =====================================================

-- Create search service on engineering documentation
-- This enables semantic search across runbooks and postmortems
CREATE OR REPLACE CORTEX SEARCH SERVICE ENGINEERING_DOCS_SEARCH
    ON CONTENT
    ATTRIBUTES TITLE, DOC_TYPE, TAGS, AUTHOR
    WAREHOUSE = APP_WH
    TARGET_LAG = '1 minute'
    COMMENT = 'Semantic search service for engineering documentation'
    AS (
        SELECT 
            DOC_ID,
            CONTENT,
            TITLE,
            DOC_TYPE,
            TAGS,
            AUTHOR,
            CREATED_TIMESTAMP,
            LAST_UPDATED
        FROM ENGINEERING_DOCS
    );

-- Grant usage permissions to SF_INTELLIGENCE_DEMO (if using different role)
-- GRANT USAGE ON CORTEX SEARCH SERVICE ENGINEERING_DOCS_SEARCH TO ROLE SF_INTELLIGENCE_DEMO;

-- Wait for initial indexing
-- Note: In real demo, wait 1-2 minutes for service to be ready
SELECT SYSTEM$WAIT(60); -- Wait 60 seconds

-- Test the search service
SELECT PARSE_JSON(
    SNOWFLAKE.CORTEX.SEARCH_PREVIEW(
        'ENGINEERING_DOCS_SEARCH',
        '{
            "query": "database connection pool troubleshooting",
            "columns": ["CONTENT", "TITLE", "DOC_TYPE"],
            "limit": 3
        }'
    )
) AS search_results;

-- Verify search service is ready
SHOW CORTEX SEARCH SERVICES;

SELECT 'Cortex Search Service created successfully! Service: ENGINEERING_DOCS_SEARCH' AS status;

-- =====================================================
-- Test Search Functionality
-- =====================================================

-- Test 1: Search for connection pool issues
SELECT 'Test 1: Connection pool search' AS test_name,
       PARSE_JSON(
           SNOWFLAKE.CORTEX.SEARCH_PREVIEW(
               'ENGINEERING_DOCS_SEARCH',
               '{
                   "query": "connection pool exhaustion mitigation steps",
                   "columns": ["TITLE", "DOC_TYPE"],
                   "limit": 2
               }'
           )
       ) AS results;

-- Test 2: Search for memory leak troubleshooting
SELECT 'Test 2: Memory leak search' AS test_name,
       PARSE_JSON(
           SNOWFLAKE.CORTEX.SEARCH_PREVIEW(
               'ENGINEERING_DOCS_SEARCH',
               '{
                   "query": "how to detect and fix memory leaks",
                   "columns": ["TITLE", "DOC_TYPE"],
                   "limit": 2
               }'
           )
       ) AS results;

-- Test 3: Search for deployment procedures
SELECT 'Test 3: Deployment search' AS test_name,
       PARSE_JSON(
           SNOWFLAKE.CORTEX.SEARCH_PREVIEW(
               'ENGINEERING_DOCS_SEARCH',
               '{
                   "query": "emergency rollback procedures",
                   "columns": ["TITLE", "DOC_TYPE"],
                   "limit": 2
               }'
           )
       ) AS results;

SELECT '✓ Cortex Search Service is operational and ready for demo!' AS status;

