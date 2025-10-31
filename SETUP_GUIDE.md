# Snowflake Intelligence Demo Jam - Complete Setup Guide

## Overview

This guide walks you through setting up the complete Snowflake Intelligence demo from scratch. Total setup time: **30-45 minutes**.

---

## Prerequisites

### Required Access
- [ ] Snowflake account with ACCOUNTADMIN role (or equivalent)
- [ ] Warehouse with compute resources (SMALL or larger)
- [ ] Cortex features enabled in your region
- [ ] Snowflake Intelligence enabled (preview feature)

### Required Tools
- [ ] Snowsight web UI access
- [ ] (Optional) SnowSQL CLI for file uploads
- [ ] Text editor to view/edit YAML files

### Verify Cortex Availability
```sql
-- Check if Cortex features are available
SELECT SYSTEM$CORTEX_ENABLED() AS cortex_status;

-- Check available models
SELECT * FROM TABLE(CORTEX_MODELS());
```

---

## Setup Steps

### Step 1: Clone or Download Demo Files (2 minutes)

You should have these files:
```
demo-jam/
├── sql/
│   ├── 01_setup_environment.sql
│   ├── 02_create_tables.sql
│   ├── 03_load_incident_data.sql
│   ├── 04_load_documentation.sql
│   ├── 05_create_cortex_search.sql
│   ├── 06_upload_semantic_model.sql
│   └── 07_create_cortex_agent.sql
├── semantic_model/
│   └── incidents_semantic_model.yaml
├── DEMO_JAM_ONE_PAGER.md
├── DEMO_SCRIPT.md
└── SETUP_GUIDE.md (this file)
```

---

### Step 2: Setup Database and Schema (3 minutes)

1. **Open Snowsight** and navigate to Worksheets
2. **Create a new SQL worksheet**
3. **Copy and paste** contents of `sql/01_setup_environment.sql`
4. **Run all statements** (Ctrl/Cmd + Enter for all)

**Expected result:**
```
Setup Complete! Database: DEMO_JAM, Schema: ENGINEERING_OPS, Warehouse: DEMO_JAM_WH
```

**Verify:**
```sql
USE DATABASE DEMO_JAM;
USE SCHEMA ENGINEERING_OPS;
SHOW TABLES; -- Should show empty (no tables yet)
```

---

### Step 3: Create Tables (2 minutes)

1. **Open new worksheet** or clear existing one
2. **Copy and paste** contents of `sql/02_create_tables.sql`
3. **Run all statements**

**Expected result:**
```
Tables created successfully!
```

**Verify:**
```sql
SHOW TABLES;
-- Should show: INCIDENTS, ENGINEERING_DOCS, SERVICES
```

---

### Step 4: Load Sample Data (5 minutes)

#### 4a. Load Incident Data

1. **Open new worksheet**
2. **Copy and paste** contents of `sql/03_load_incident_data.sql`
3. **Run all statements** (this inserts ~45 incidents)

**Expected result:**
```
total_incidents: 45
unique_types: 10
affected_services: 10
```

**Verify:**
```sql
SELECT COUNT(*) FROM INCIDENTS;
-- Should return: 45

SELECT DISTINCT INCIDENT_TYPE FROM INCIDENTS;
-- Should show various incident types including "Database Connection Pool Exhausted"
```

#### 4b. Load Documentation

1. **Open new worksheet**
2. **Copy and paste** contents of `sql/04_load_documentation.sql`
3. **Run all statements** (this inserts runbooks and postmortems)

**Expected result:**
```
Documentation loaded successfully!
```

**Verify:**
```sql
SELECT COUNT(*) FROM ENGINEERING_DOCS;
-- Should return: 4 (or more)

SELECT DOC_TYPE, TITLE FROM ENGINEERING_DOCS;
-- Should show runbooks, postmortems, and architecture docs
```

---

### Step 5: Create Cortex Search Service (5-7 minutes)

1. **Open new worksheet**
2. **Copy and paste** contents of `sql/05_create_cortex_search.sql`
3. **Run all statements**

**Important:** The search service takes 1-2 minutes to index documents.

**Expected result:**
```
Cortex Search Service created successfully! Service: ENGINEERING_DOCS_SEARCH
```

**Verify search is working:**
```sql
SELECT PARSE_JSON(
    SNOWFLAKE.CORTEX.SEARCH_PREVIEW(
        'ENGINEERING_DOCS_SEARCH',
        '{
            "query": "database connection pool",
            "columns": ["TITLE", "DOC_TYPE"],
            "limit": 3
        }'
    )
) AS search_results;
```

**Troubleshooting:**
- If you get an error about service not ready, wait another minute and try again
- Check service status: `SHOW CORTEX SEARCH SERVICES;`
- Service should show status as "READY"

---

### Step 6: Upload Semantic Model (3 minutes)

#### Method 1: Using Snowsight UI (Recommended)

1. **Navigate to**: Data → Databases → DEMO_JAM → ENGINEERING_OPS → Stages → DEMO_STAGE
2. **Click** the "+ Files" button
3. **Upload** the file: `semantic_model/incidents_semantic_model.yaml`
4. **Verify** file appears in stage listing

**Verify:**
```sql
LIST @DEMO_STAGE;
-- Should show: incidents_semantic_model.yaml
```

#### Method 2: Using SnowSQL CLI (Alternative)

```bash
snowsql -a <your_account> -u <your_user>

# Upload file
PUT file:///path/to/demo-jam/semantic_model/incidents_semantic_model.yaml 
    @DEMO_JAM.ENGINEERING_OPS.DEMO_STAGE 
    AUTO_COMPRESS=FALSE 
    OVERWRITE=TRUE;
```

---

### Step 7: Create Cortex Agent (10-15 minutes)

**Note:** Cortex Agents are created through the Snowsight UI, not SQL.

#### 7a. Navigate to Snowflake Intelligence

1. In Snowsight, click **"AI & ML"** in left navigation
2. Select **"Snowflake Intelligence"**
3. Click **"Create Agent"** button

#### 7b. Configure Basic Settings

- **Agent Name:** `Engineering Operations Agent`
- **Database:** `DEMO_JAM`
- **Schema:** `ENGINEERING_OPS`
- **Description:** `AI agent for engineering operations analysis combining incident metrics and documentation`

#### 7c. Add Tool #1 - Cortex Analyst (Structured Data)

Click "Add Tool" → Select "Cortex Analyst Semantic View"

- **Tool Name:** `Incident Metrics`
- **Semantic Model Path:** `@DEMO_STAGE/incidents_semantic_model.yaml`
- **Description:** `Query incident data, metrics, and trends using natural language`
- **Usage Guidelines:** `Use this tool for quantitative questions about incidents, resolution times, service reliability, and trend analysis`

Click "Save Tool"

#### 7d. Add Tool #2 - Cortex Search (Unstructured Data)

Click "Add Tool" → Select "Cortex Search Service"

- **Tool Name:** `Documentation Search`
- **Search Service:** `ENGINEERING_DOCS_SEARCH`
- **Description:** `Search engineering runbooks, postmortems, and technical documentation`
- **Usage Guidelines:** `Use this tool for qualitative questions about procedures, best practices, troubleshooting steps, and historical context`

Click "Save Tool"

#### 7e. Configure Orchestration

Click on "Orchestration" tab

**Orchestration Model:** Select `llama3.3-70b` (or `claude-3-5-sonnet` if available)

**Planning Instructions:**
```
You are an engineering operations assistant helping a VP of Engineering analyze incidents and access operational knowledge.

Tool Selection Guidelines:
- Use 'Incident Metrics' for quantitative questions: counts, trends, averages, comparisons, time-based analysis
- Use 'Documentation Search' for qualitative questions: procedures, best practices, troubleshooting steps, root cause examples
- For questions spanning both (e.g., 'Show me connection pool incidents and what our runbook says'), use BOTH tools and synthesize the results

Always cite specific incident IDs when referring to incident data.
Always cite document titles when referencing documentation.
```

**Response Instructions:**
```
Provide clear, executive-friendly responses with:
1. Direct answer to the question
2. Key supporting data or evidence
3. Actionable insights when appropriate
4. Citations to source data

Keep responses concise but comprehensive. Use bullet points for clarity.
When showing incident patterns, highlight business impact (affected users, downtime).
When referencing procedures, include the key mitigation steps.
```

**System Instructions:**
```
You are a trusted engineering operations advisor with deep expertise in incident management, system reliability, and operational best practices. Your goal is to help engineering leaders make data-driven decisions quickly.
```

#### 7f. Add Sample Questions

Click "Sample Questions" tab and add these:

1. `What are the top 5 incident types by volume this quarter?`
2. `Show me critical incidents from last month and their resolution times`
3. `What does our runbook say about database connection pool troubleshooting?`
4. `Compare connection pool incidents with what our runbooks recommend for mitigation`
5. `Which services have the highest incident rates and what are the common patterns?`

#### 7g. Set Access Control

Click "Access" tab

- Grant access to **ACCOUNTADMIN** role
- Add any other roles that need demo access

#### 7h. Create and Verify

1. Click **"Create Agent"**
2. Wait 1-2 minutes for agent provisioning
3. Agent should appear in your Snowflake Intelligence interface

**Verify:**
```sql
-- Check agent exists
SHOW CORTEX AGENTS LIKE 'ENGINEERING_OPERATIONS_AGENT';
```

---

### Step 8: Test the Demo (5-10 minutes)

#### Test Query 1: Structured Data Only
Navigate to Snowflake Intelligence UI and ask:
```
What are the top 5 incident types by volume this quarter?
```

**Expected:** Should return incident types with counts, top one being "Database Connection Pool Exhausted"

#### Test Query 2: Unstructured Data Only
```
Show me what our runbooks say about database connection pool troubleshooting
```

**Expected:** Should return content from the runbook document with troubleshooting steps

#### Test Query 3: Orchestrated (Both Tools)
```
Compare last month's database connection pool incidents with what our runbooks recommend for mitigation
```

**Expected:** Should show both incident data (dates, counts, resolution times) AND runbook recommendations

**Troubleshooting:**
- If agent isn't using both tools, review your planning instructions
- If responses are too verbose, adjust response instructions
- If you get errors, verify both tools are properly configured and accessible

---

## Verification Checklist

Before your demo, verify all components:

### Data Layer
- [ ] `SELECT COUNT(*) FROM INCIDENTS;` returns 45
- [ ] `SELECT COUNT(*) FROM ENGINEERING_DOCS;` returns 4+
- [ ] `SELECT COUNT(*) FROM SERVICES;` returns 10

### Cortex Search Service
- [ ] `SHOW CORTEX SEARCH SERVICES;` shows ENGINEERING_DOCS_SEARCH with status "READY"
- [ ] Test search query returns results

### Semantic Model
- [ ] `LIST @DEMO_STAGE;` shows incidents_semantic_model.yaml
- [ ] File preview shows valid YAML content

### Cortex Agent
- [ ] Agent appears in Snowflake Intelligence UI
- [ ] Both tools are configured and showing in agent details
- [ ] Sample questions appear when opening agent
- [ ] Test queries return expected results

---

## Common Issues and Solutions

### Issue: "Cortex Search Service not found"
**Solution:** 
- Wait 2-3 minutes after creation for indexing
- Verify service exists: `SHOW CORTEX SEARCH SERVICES;`
- Check you're in correct database/schema

### Issue: "Cannot find semantic model file"
**Solution:**
- Verify upload: `LIST @DEMO_STAGE;`
- Check file path in agent configuration matches exactly
- Re-upload file if needed

### Issue: "Agent not responding or timing out"
**Solution:**
- Check warehouse is running: `SHOW WAREHOUSES LIKE 'DEMO_JAM_WH';`
- Resume warehouse if suspended: `ALTER WAREHOUSE DEMO_JAM_WH RESUME;`
- Verify role has CORTEX_USER: `SHOW GRANTS TO ROLE ACCOUNTADMIN;`

### Issue: "Agent only uses one tool"
**Solution:**
- Review planning instructions - make sure they're clear about when to use each tool
- Try more explicit queries that clearly require both tools
- Check that both tools are properly configured with correct paths/services

### Issue: "Search returns no results"
**Solution:**
- Verify documents loaded: `SELECT * FROM ENGINEERING_DOCS;`
- Check search service indexed data: `SHOW CORTEX SEARCH SERVICES;` (status should be READY)
- Wait a few minutes if service was just created

---

## Performance Tuning Tips

### For Faster Demo Response Times:

1. **Warm up services before demo:**
   ```sql
   -- Run a test search
   SELECT SNOWFLAKE.CORTEX.SEARCH_PREVIEW('ENGINEERING_DOCS_SEARCH', 
          '{"query": "test", "limit": 1}');
   
   -- Run a test Cortex Analyst query via agent
   ```

2. **Keep warehouse running:**
   ```sql
   ALTER WAREHOUSE DEMO_JAM_WH SET AUTO_SUSPEND = 300; -- 5 minutes
   ```

3. **Pre-load agent UI:**
   - Open Snowflake Intelligence tab 2-3 minutes before demo
   - Keep tab active to maintain session

---

## Demo Day Preparation

### 30 Minutes Before Demo:

- [ ] Log into Snowflake
- [ ] Navigate to Snowflake Intelligence UI
- [ ] Open your agent
- [ ] Run one test query to warm up services
- [ ] Open DEMO_SCRIPT.md in separate window
- [ ] Open DEMO_JAM_ONE_PAGER.md for reference
- [ ] Check internet connectivity
- [ ] Have backup screenshots ready (just in case)

### 5 Minutes Before Demo:

- [ ] Close unnecessary browser tabs
- [ ] Increase browser zoom if presenting (125-150%)
- [ ] Clear any test messages from agent chat
- [ ] Have first query ready to type (or pre-typed if allowed)
- [ ] Take a deep breath - you've got this! 🚀

---

## After the Demo

### Cleanup (Optional)

If you want to remove the demo environment:

```sql
-- Drop all objects
USE ROLE ACCOUNTADMIN;
DROP DATABASE DEMO_JAM CASCADE;
DROP WAREHOUSE DEMO_JAM_WH;

-- Note: Cortex Agent needs to be deleted via UI
-- Go to: AI & ML → Snowflake Intelligence → Your Agent → Delete
```

### For Production Use

If you want to adapt this for a real customer demo:

1. **Replace sample data** with customer's actual data
2. **Customize semantic model** for their business terminology
3. **Update documentation** to include their runbooks
4. **Adjust sample questions** to match their use cases
5. **Configure access controls** for their roles
6. **Test with customer stakeholders** before main demo

---

## Additional Resources

### Snowflake Documentation:
- [Cortex Search Documentation](https://docs.snowflake.com/en/user-guide/snowflake-cortex/cortex-search)
- [Cortex Analyst Documentation](https://docs.snowflake.com/en/user-guide/snowflake-cortex/cortex-analyst)
- [Cortex Agents Documentation](https://docs.snowflake.com/en/user-guide/snowflake-cortex/cortex-agents)
- [Snowflake Intelligence Documentation](https://docs.snowflake.com/en/user-guide/snowflake-intelligence)

### Demo Files Reference:
- **Strategy:** DEMO_JAM_ONE_PAGER.md
- **Execution:** DEMO_SCRIPT.md
- **Setup:** SETUP_GUIDE.md (this file)

---

## Support and Feedback

If you encounter issues during setup:

1. Check the troubleshooting section above
2. Review Snowflake documentation for latest updates
3. Verify all prerequisites are met
4. Check Snowflake status page for service issues

**Good luck with your demo! You're going to crush it! 🎯**

---

*Last Updated: 2025-10-30*

