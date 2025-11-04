-- =====================================================
-- Module 2: Create Cortex Search Service for IT Documentation
-- =====================================================
-- Purpose: Enable semantic search across IT policies, SLAs, and governance docs
-- Parallel to Module 1's ENGINEERING_DOCS_SEARCH
-- =====================================================

USE DATABASE DEMO_JAM;
USE SCHEMA ENGINEERING_OPS;
USE WAREHOUSE APP_WH;

-- =====================================================
-- Create Cortex Search Service
-- =====================================================

-- Create search service on IT documentation
-- This enables semantic search across IT policies, SLAs, and best practices
CREATE OR REPLACE CORTEX SEARCH SERVICE IT_DOCS_SEARCH
    ON CONTENT
    ATTRIBUTES TITLE, DOC_TYPE, TAGS, AUTHOR
    WAREHOUSE = APP_WH
    TARGET_LAG = '1 minute'
    COMMENT = 'Semantic search service for IT policies, SLAs, and governance documentation'
    AS (
        SELECT 
            DOC_ID,
            CONTENT,
            TITLE,
            DOC_TYPE,
            TAGS,
            AUTHOR,
            BUSINESS_UNIT,
            CREATED_TIMESTAMP,
            LAST_UPDATED
        FROM IT_DOCUMENTATION
    );

-- Grant usage permissions to SF_INTELLIGENCE_DEMO (if using different role)
-- GRANT USAGE ON CORTEX SEARCH SERVICE IT_DOCS_SEARCH TO ROLE SF_INTELLIGENCE_DEMO;

-- Wait for initial indexing
-- Note: In real demo, wait 1-2 minutes for service to be ready
SELECT SYSTEM$WAIT(60); -- Wait 60 seconds

-- =====================================================
-- Test the search service
-- =====================================================

-- Test 1: Search for SLA information
SELECT PARSE_JSON(
    SNOWFLAKE.CORTEX.SEARCH_PREVIEW(
        'IT_DOCS_SEARCH',
        '{
            "query": "IT support service level agreement resolution time",
            "columns": ["CONTENT", "TITLE", "DOC_TYPE"],
            "limit": 3
        }'
    )
) AS search_results;

-- Test 2: Search for project prioritization
SELECT PARSE_JSON(
    SNOWFLAKE.CORTEX.SEARCH_PREVIEW(
        'IT_DOCS_SEARCH',
        '{
            "query": "how are IT projects prioritized and approved",
            "columns": ["CONTENT", "TITLE", "DOC_TYPE"],
            "limit": 3
        }'
    )
) AS search_results;

-- Test 3: Search for ROI measurement
SELECT PARSE_JSON(
    SNOWFLAKE.CORTEX.SEARCH_PREVIEW(
        'IT_DOCS_SEARCH',
        '{
            "query": "how to measure project ROI and business value",
            "columns": ["CONTENT", "TITLE", "DOC_TYPE"],
            "limit": 3
        }'
    )
) AS search_results;

-- Test 4: Search for Healthcare SLA
SELECT PARSE_JSON(
    SNOWFLAKE.CORTEX.SEARCH_PREVIEW(
        'IT_DOCS_SEARCH',
        '{
            "query": "Healthcare premium SLA resolution time targets",
            "columns": ["CONTENT", "TITLE", "DOC_TYPE"],
            "limit": 3
        }'
    )
) AS search_results;

-- =====================================================
-- Verify service status
-- =====================================================

SHOW CORTEX SEARCH SERVICES;

-- Check service details
DESC CORTEX SEARCH SERVICE IT_DOCS_SEARCH;

SELECT 'IT Cortex Search Service created successfully!' AS status;
SELECT 'Wait 1-2 minutes for initial indexing to complete before using in Cortex Agent' AS note;

-- =====================================================
-- Sample Queries to Test in Snowflake Intelligence UI
-- =====================================================

-- After adding this search service to your Cortex Agent, try these queries:

-- Query 1: "What are the IT support SLA targets for critical priority tickets?"
-- Expected: Should find SLA policy with 4-hour target for critical tickets

-- Query 2: "How does Healthcare's IT SLA differ from other business units?"
-- Expected: Should find Healthcare premium SLA (2 hours for critical vs 4 hours standard)

-- Query 3: "What is the process for prioritizing new IT projects?"
-- Expected: Should find project prioritization framework with scoring criteria

-- Query 4: "How do we measure IT project ROI and success?"
-- Expected: Should find ROI measurement framework with baseline/target methodology

