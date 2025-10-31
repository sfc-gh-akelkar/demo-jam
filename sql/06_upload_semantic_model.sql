-- =====================================================
-- Snowflake Intelligence Demo Jam - Upload Semantic Model
-- =====================================================
-- Purpose: Upload semantic model to stage for Cortex Analyst
-- =====================================================

USE DATABASE DEMO_JAM;
USE SCHEMA ENGINEERING_OPS;
USE WAREHOUSE DEMO_JAM_WH;

-- =====================================================
-- Upload Semantic Model File
-- =====================================================

-- NOTE: You need to upload the YAML file using one of these methods:
-- 
-- METHOD 1: Using Snowsight UI
-- 1. Navigate to Data > Databases > DEMO_JAM > ENGINEERING_OPS > Stages > DEMO_STAGE
-- 2. Click "+ Files" button
-- 3. Upload the file: semantic_model/incidents_semantic_model.yaml
-- 4. File will be available at: @DEMO_STAGE/incidents_semantic_model.yaml
--
-- METHOD 2: Using SnowSQL CLI
-- snowsql -q "PUT file:///Users/akelkar/src/Cursor/demo-jam/semantic_model/incidents_semantic_model.yaml @DEMO_JAM.ENGINEERING_OPS.DEMO_STAGE AUTO_COMPRESS=FALSE OVERWRITE=TRUE"
--
-- METHOD 3: Using Python (see below)

-- Verify the file is uploaded
LIST @DEMO_STAGE;

-- Verify file contents (preview)
SELECT $1 FROM @DEMO_STAGE/incidents_semantic_model.yaml LIMIT 10;

-- Create a view of the semantic model file for reference
CREATE OR REPLACE VIEW SEMANTIC_MODEL_PATH AS
SELECT 
    '@DEMO_STAGE/incidents_semantic_model.yaml' AS model_path,
    'DEMO_JAM' AS database_name,
    'ENGINEERING_OPS' AS schema_name
;

SELECT * FROM SEMANTIC_MODEL_PATH;

SELECT 'Semantic model uploaded! Path: @DEMO_STAGE/incidents_semantic_model.yaml' AS status;

-- =====================================================
-- Python Script for Uploading (Optional)
-- =====================================================

/*
To upload using Python with Snowflake connector:

```python
import snowflake.connector

conn = snowflake.connector.connect(
    user='<your_user>',
    password='<your_password>',
    account='<your_account>',
    warehouse='DEMO_JAM_WH',
    database='DEMO_JAM',
    schema='ENGINEERING_OPS'
)

cursor = conn.cursor()

# Upload semantic model file
cursor.execute("""
    PUT file:///Users/akelkar/src/Cursor/demo-jam/semantic_model/incidents_semantic_model.yaml 
    @DEMO_STAGE 
    AUTO_COMPRESS=FALSE 
    OVERWRITE=TRUE
""")

# Verify
cursor.execute("LIST @DEMO_STAGE")
for row in cursor:
    print(row)

cursor.close()
conn.close()
```
*/

