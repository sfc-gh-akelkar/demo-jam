# Unified Cortex Agent Setup Guide

## Overview

This guide shows how to configure a single Cortex Agent that can query across **both Module 1 (Engineering Operations) and Module 2 (IT Relationship Management)**.

The unified agent enables cross-module intelligence queries like:
- "Were there any production incidents during the Field Service Management project deployment?"
- "Which business units have both high incident rates AND slow IT support response times?"

---

## Prerequisites

- ✅ Module 1 fully deployed and tested
- ✅ Module 2 fully deployed and tested
- ✅ All semantic models uploaded to Snowflake stage
- ✅ Access to Snowsight UI with SF_INTELLIGENCE_DEMO role

---

## Step 1: Upload All Semantic Models

Upload both module semantic models to the same stage:

```sql
USE DATABASE DEMO_JAM;
USE SCHEMA ENGINEERING_OPS;
USE WAREHOUSE APP_WH;

-- Verify stage exists
SHOW STAGES LIKE 'DEMO_STAGE';

-- List uploaded semantic models
LIST @DEMO_STAGE;
```

**Expected files on stage:**
- `incidents_semantic_model.yaml` (Module 1)
- `it_support_semantic_model.yaml` (Module 2)

### Python Upload Example

```python
import snowflake.connector

conn = snowflake.connector.connect(
    account='YOUR_ACCOUNT',
    user='YOUR_USER',
    password='YOUR_PASSWORD',
    role='SF_INTELLIGENCE_DEMO',
    database='DEMO_JAM',
    schema='ENGINEERING_OPS',
    warehouse='APP_WH'
)

# Upload Module 1 semantic model
conn.cursor().execute("""
    PUT file://module_1_engineering_operations/semantic_model/incidents_semantic_model.yaml 
    @DEMO_STAGE 
    AUTO_COMPRESS=FALSE 
    OVERWRITE=TRUE
""")

# Upload Module 2 semantic model  
conn.cursor().execute("""
    PUT file://module_2_it_relationship/semantic_model/it_support_semantic_model.yaml 
    @DEMO_STAGE 
    AUTO_COMPRESS=FALSE 
    OVERWRITE=TRUE
""")

conn.close()
```

---

## Step 2: Create Unified Cortex Agent

### Via Snowsight UI:

1. **Navigate to Intelligence**
   - Go to: `Intelligence` (left sidebar) → `Cortex Agents`
   - Click: `+ Agent`

2. **Configure Agent Basic Info**
   ```
   Agent Name: Engineering & IT Intelligence Agent
   Description: Unified agent for engineering operations and IT relationship management
   Database: DEMO_JAM
   Schema: ENGINEERING_OPS
   Warehouse: APP_WH
   Role: SF_INTELLIGENCE_DEMO
   ```

3. **Add Tool #1: Engineering Incidents (Cortex Analyst)**
   ```yaml
   Tool Name: engineering_incidents_analyst
   Tool Type: Cortex Analyst
   Semantic Model: @DEMO_STAGE/incidents_semantic_model.yaml
   Description: Query production incidents, root causes, resolution times, and incident patterns
   ```

4. **Add Tool #2: IT Support Tickets (Cortex Analyst)**
   ```yaml
   Tool Name: it_support_analyst
   Tool Type: Cortex Analyst
   Semantic Model: @DEMO_STAGE/it_support_semantic_model.yaml
   Description: Query IT support performance, resolution times, and ticket volumes by business unit
   ```

5. **Add Tool #3: Engineering Documentation (Cortex Search)**
   ```yaml
   Tool Name: engineering_docs_search
   Tool Type: Cortex Search
   Search Service: ENGINEERING_DOCS_SEARCH
   Description: Search engineering runbooks, postmortems, and architecture documentation
   ```

6. **Configure Agent Instructions**
   ```
   You are an intelligent assistant for engineering leadership and IT management.
   
   You have access to:
   - Production incident data (structured metrics)
   - IT support ticket data (structured metrics)
   - Engineering documentation (unstructured - runbooks, postmortems)
   
   When answering questions:
   1. Determine which tool(s) are needed
   2. Query structured data using the appropriate Cortex Analyst tool
   3. Search documentation using Cortex Search when needed
   4. Synthesize insights across multiple data sources
   5. Correlate incidents with IT support patterns when relevant
   
   Business units to recognize: Healthcare, Finance, Sales, Marketing, HR, Operations
   Healthcare is a critical business unit requiring special attention.
   
   Always provide context and actionable insights, not just raw numbers.
   ```

7. **Save and Test Agent**

---

## Step 3: Test Cross-Module Queries

### Test Query 1: Basic Module 1 (Engineering)
```
What were the top 5 incident types in Q4 2025?
```

**Expected:** Should query `engineering_incidents_analyst` tool

### Test Query 2: Basic Module 2 (IT Support)
```
What is the average resolution time for Healthcare IT tickets?
```

**Expected:** Should query `it_support_analyst` tool

### Test Query 3: Engineering Documentation Search
```
Show me our runbooks for database connection pool issues
```

**Expected:** Should search `engineering_docs_search`

### Test Query 4: Cross-Module Intelligence (ADVANCED)
```
Compare Healthcare's production incident rate with their IT support ticket volume
```

**Expected:** Should query BOTH:
1. `engineering_incidents_analyst` for incident data
2. `it_support_analyst` for support ticket data
3. Synthesize comparison

### Test Query 5: Multi-Tool Orchestration
```
What database incidents did we have in Q2, and what do our runbooks say about those issues?
```

**Expected:** Should use:
1. `engineering_incidents_analyst` for structured incident data
2. `engineering_docs_search` for runbook recommendations

---

## Sample Demo Flow

### Opening
> "Let me show you how Snowflake Intelligence unifies our engineering and IT data..."

### Module 1 Demo (Engineering Operations)
```
Query 1: "Show me critical incidents from last month"
Query 2: "What do our runbooks say about memory leak troubleshooting?"
Query 3: "Compare November's API timeout incidents with our deployment runbook guidance"
```

### Module 2 Demo (IT Support Performance)
```
Query 4: "What's Healthcare's average IT ticket resolution time vs other business units?"
Query 5: "Show me active IT projects for Healthcare"
```

### Cross-Module Intelligence (THE MAGIC MOMENT)
```
Query 6: "Which business units have both high incident rates AND slow IT support response?"
```

This final query demonstrates the power of unified data analysis!

---

## Troubleshooting

### Issue: "Semantic model not found"
**Solution:**
```sql
-- Verify files on stage
LIST @DEMO_STAGE;

-- Re-upload if needed
PUT file://path/to/semantic_model.yaml @DEMO_STAGE AUTO_COMPRESS=FALSE OVERWRITE=TRUE;
```

### Issue: "Search service not available"
**Solution:**
```sql
-- Check search service status
SHOW CORTEX SEARCH SERVICES;

-- Recreate if needed
-- Run module_1_engineering_operations/sql/05_create_cortex_search.sql
```

### Issue: "Agent gives incorrect results"
**Solution:**
- Review agent instructions for clarity
- Check semantic model for accurate column mappings
- Verify sample data is loaded correctly

### Issue: "Permission denied"
**Solution:**
```sql
-- Grant necessary permissions
USE ROLE ACCOUNTADMIN;

GRANT USAGE ON DATABASE DEMO_JAM TO ROLE SF_INTELLIGENCE_DEMO;
GRANT USAGE ON SCHEMA DEMO_JAM.ENGINEERING_OPS TO ROLE SF_INTELLIGENCE_DEMO;
GRANT SELECT ON ALL TABLES IN SCHEMA DEMO_JAM.ENGINEERING_OPS TO ROLE SF_INTELLIGENCE_DEMO;
GRANT USAGE ON WAREHOUSE APP_WH TO ROLE SF_INTELLIGENCE_DEMO;
```

---

## Advanced Configuration

### Adding Module 2 Projects and Roadmap Tools

To add IT Projects and Application Roadmap analysis:

1. **Create additional semantic models:**
   - `it_projects_semantic_model.yaml`
   - `app_roadmap_semantic_model.yaml`

2. **Upload to stage**

3. **Add to agent as additional Cortex Analyst tools:**
   - Tool #4: IT Projects Analyst
   - Tool #5: Application Roadmap Analyst

This enables queries like:
- "What IT projects are at risk of budget overruns?"
- "What CRM features are coming in Q1 2026?"

### Creating Multiple Specialized Agents

Instead of one unified agent, you can create specialized agents:

**Agent 1: Engineering Ops Agent**
- Only Module 1 tools
- Focused on SRE and engineering teams

**Agent 2: IT Relationship Agent**
- Only Module 2 tools
- Focused on CIO and IT directors

**Agent 3: Executive Intelligence Agent**
- All tools from both modules
- High-level strategic insights

---

## Performance Optimization

### For Large Data Volumes

1. **Add clustering keys to tables:**
```sql
ALTER TABLE INCIDENTS CLUSTER BY (CREATED_DATE, SEVERITY);
ALTER TABLE IT_SUPPORT_TICKETS CLUSTER BY (CREATED_DATE, BUSINESS_UNIT);
```

2. **Use materialized views for common aggregations:**
```sql
CREATE MATERIALIZED VIEW MONTHLY_INCIDENT_SUMMARY AS
SELECT 
    DATE_TRUNC('MONTH', CREATED_DATE) AS month,
    INCIDENT_TYPE,
    SEVERITY,
    COUNT(*) AS incident_count,
    AVG(RESOLUTION_TIME_MINUTES) AS avg_resolution_minutes
FROM INCIDENTS
GROUP BY month, INCIDENT_TYPE, SEVERITY;
```

3. **Optimize Cortex Search refresh frequency:**
```sql
-- Adjust TARGET_LAG based on your data update frequency
ALTER CORTEX SEARCH SERVICE ENGINEERING_DOCS_SEARCH 
SET TARGET_LAG = '5 minutes';  -- or '1 hour' for less frequently updated docs
```

---

## Next Steps

1. ✅ Test all sample queries
2. ✅ Share agent with team for testing
3. ✅ Gather feedback on query responses
4. ✅ Iterate on semantic models based on feedback
5. ✅ Add more sample data if needed
6. ✅ Consider adding Module 2 Projects/Roadmap tools
7. ✅ Schedule regular data refreshes

---

## Support

For questions or issues:
- Check module-specific README files
- Review Snowflake Intelligence documentation
- Test queries incrementally (one tool at a time before combining)

---

*Last Updated: 2025-11-03*  
*Version: 2.0 (Multi-Module Platform)*

