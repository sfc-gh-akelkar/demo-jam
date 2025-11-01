-- =====================================================
-- Snowflake Intelligence Demo Jam - Table Creation
-- =====================================================
-- Purpose: Create incident and documentation tables
-- =====================================================

USE DATABASE DEMO_JAM;
USE SCHEMA ENGINEERING_OPS;
USE WAREHOUSE APP_WH;

-- =====================================================
-- STRUCTURED DATA: Incidents Table
-- =====================================================

CREATE OR REPLACE TABLE INCIDENTS (
    INCIDENT_ID VARCHAR(50) PRIMARY KEY,
    INCIDENT_TYPE VARCHAR(100) NOT NULL,
    SEVERITY VARCHAR(20) NOT NULL,
    STATUS VARCHAR(50) NOT NULL,
    SERVICE_NAME VARCHAR(200) NOT NULL,
    INCIDENT_TIMESTAMP TIMESTAMP_NTZ NOT NULL,
    RESOLUTION_TIMESTAMP TIMESTAMP_NTZ,
    RESOLUTION_TIME_MINUTES NUMBER(10,2),
    AFFECTED_USERS NUMBER(10,0),
    ROOT_CAUSE_CATEGORY VARCHAR(100),
    DESCRIPTION VARCHAR(5000),
    CREATED_DATE DATE NOT NULL,
    YEAR NUMBER(4) NOT NULL,
    QUARTER NUMBER(1) NOT NULL,
    MONTH NUMBER(2) NOT NULL,
    WEEK_OF_YEAR NUMBER(2) NOT NULL
) COMMENT = 'Production incident tracking for engineering operations';

-- Note: Snowflake does not support traditional indexes
-- Query performance is optimized through automatic micro-partitions and clustering keys
-- Optionally, you can add a clustering key for frequently filtered columns:
-- ALTER TABLE INCIDENTS CLUSTER BY (CREATED_DATE, SEVERITY);

-- =====================================================
-- UNSTRUCTURED DATA: Engineering Documents
-- =====================================================

CREATE OR REPLACE TABLE ENGINEERING_DOCS (
    DOC_ID VARCHAR(50) PRIMARY KEY,
    DOC_TYPE VARCHAR(50) NOT NULL,
    TITLE VARCHAR(500) NOT NULL,
    CONTENT VARCHAR(16777216) NOT NULL,  -- Max VARCHAR size in Snowflake
    AUTHOR VARCHAR(100),
    CREATED_TIMESTAMP TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    LAST_UPDATED TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    TAGS ARRAY,
    METADATA VARIANT
) COMMENT = 'Engineering runbooks, postmortems, and technical documentation';

-- =====================================================
-- REFERENCE DATA: Services Catalog
-- =====================================================

CREATE OR REPLACE TABLE SERVICES (
    SERVICE_ID VARCHAR(50) PRIMARY KEY,
    SERVICE_NAME VARCHAR(200) NOT NULL,
    SERVICE_TYPE VARCHAR(100),
    TEAM_OWNER VARCHAR(100),
    CRITICALITY VARCHAR(20),
    TECH_STACK VARCHAR(500)
) COMMENT = 'Microservices catalog for reference';

-- Verify tables created
SHOW TABLES;

SELECT 'Tables created successfully!' AS status;

