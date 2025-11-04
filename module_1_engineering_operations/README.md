# Module 1: Engineering Operations Intelligence

**Target Audience:** VP of Engineering, Engineering Managers, SRE Teams  
**Use Case:** Post-incident analysis combining structured metrics with unstructured documentation  
**Demo Duration:** 5 minutes  
**Setup Time:** 30-45 minutes

---

## Overview

This module demonstrates how engineering leadership can use Snowflake Intelligence to analyze production incidents by querying both:
- **Structured data** - Incident metrics, resolution times, patterns
- **Unstructured data** - Engineering runbooks, postmortems, architecture docs

The "magic" happens when these are combined through intelligent orchestration.

---

## What's Included

### Tables
1. **INCIDENTS** - 55+ production incidents across 2025
   - 10 incident types (Database Connection Pool, Memory Leak, API Timeout, etc.)
   - 10 microservices
   - Resolution times, affected users, root causes

2. **ENGINEERING_DOCS** - 10+ technical documents
   - Runbooks (connection pool management, deployment, memory debugging)
   - Postmortems (past incident analysis)
   - Architecture documentation

3. **SERVICES** - Microservices catalog

### Cortex Components
- **Cortex Analyst** - Natural language to SQL on incident metrics
- **Cortex Search** - Semantic search across engineering documentation
- **Cortex Agent** - Orchestrates across both tools

### Semantic Model
- `incidents_semantic_model.yaml` - Maps business terminology to incident database schema

---

## Quick Setup

### Prerequisites
- Snowflake account with `SF_INTELLIGENCE_DEMO` role
- Warehouse: `APP_WH` with USAGE and OPERATE privileges
- `CORTEX_USER` database role granted

### Step-by-Step Setup (30-45 min)

```sql
-- Step 1: Grant permissions (run as ACCOUNTADMIN)
-- File: sql/00_grant_warehouse_access.sql
USE ROLE ACCOUNTADMIN;
GRANT USAGE ON WAREHOUSE APP_WH TO ROLE SF_INTELLIGENCE_DEMO;
GRANT OPERATE ON WAREHOUSE APP_WH TO ROLE SF_INTELLIGENCE_DEMO;
GRANT USAGE ON DATABASE DEMO_JAM TO ROLE SF_INTELLIGENCE_DEMO;
GRANT USAGE ON SCHEMA DEMO_JAM.ENGINEERING_OPS TO ROLE SF_INTELLIGENCE_DEMO;
GRANT CREATE CORTEX SEARCH SERVICE ON SCHEMA DEMO_JAM.ENGINEERING_OPS TO ROLE SF_INTELLIGENCE_DEMO;

-- Step 2: Create database and schema
-- File: sql/01_setup_environment.sql
USE ROLE SF_INTELLIGENCE_DEMO;
CREATE DATABASE IF NOT EXISTS DEMO_JAM;
CREATE SCHEMA IF NOT EXISTS ENGINEERING_OPS;
USE WAREHOUSE APP_WH;

-- Step 3: Create tables
-- File: sql/02_create_tables.sql
-- Creates INCIDENTS, ENGINEERING_DOCS, SERVICES tables

-- Step 4: Load incident data
-- File: sql/03_load_incident_data.sql (45 incidents)
-- File: sql/08_add_more_q4_incidents.sql (10 more Q4 incidents)

-- Step 5: Load documentation
-- File: sql/04_load_documentation.sql (10 docs)

-- Step 6: Create Cortex Search Service
-- File: sql/05_create_cortex_search.sql
CREATE OR REPLACE CORTEX SEARCH SERVICE ENGINEERING_DOCS_SEARCH
    ON CONTENT
    ATTRIBUTES TITLE, DOC_TYPE, TAGS, AUTHOR
    WAREHOUSE = APP_WH
    TARGET_LAG = '1 minute'
    COMMENT = 'Semantic search service for engineering documentation'
    AS (
        SELECT
            DOC_ID, CONTENT, TITLE, DOC_TYPE, TAGS, AUTHOR,
            CREATED_TIMESTAMP, LAST_UPDATED
        FROM ENGINEERING_DOCS
    );

-- Step 7: Upload semantic model
-- File: semantic_model/incidents_semantic_model.yaml
-- Upload to @DEMO_JAM.ENGINEERING_OPS.DEMO_STAGE
-- (See upload instructions below)

-- Step 8: Create Cortex Agent (via Snowsight UI)
-- (See agent setup section below)
```

---

## Upload Semantic Model

### Option 1: Python
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

conn.cursor().execute("""
    PUT file://module_1_engineering_operations/semantic_model/incidents_semantic_model.yaml 
    @DEMO_STAGE 
    AUTO_COMPRESS=FALSE 
    OVERWRITE=TRUE
""")

conn.close()
```

### Option 2: Snowsight UI
1. Navigate to: Data → Databases → DEMO_JAM → ENGINEERING_OPS → Stages → DEMO_STAGE
2. Click "Upload Files"
3. Select `incidents_semantic_model.yaml`

---

## Create Cortex Agent

### Via Snowsight UI

1. Navigate to: **Intelligence** → **Cortex Agents** → **+ Agent**

2. **Basic Configuration:**
   - Name: `Engineering Operations Agent`
   - Database: `DEMO_JAM`
   - Schema: `ENGINEERING_OPS`
   - Warehouse: `APP_WH`
   - Role: `SF_INTELLIGENCE_DEMO`

3. **Add Tool #1: Engineering Incidents Analyst**
   - Type: Cortex Analyst
   - Semantic Model: `@DEMO_STAGE/incidents_semantic_model.yaml`
   - Description: Query production incidents, root causes, resolution times

4. **Add Tool #2: Engineering Documentation Search**
   - Type: Cortex Search
   - Search Service: `ENGINEERING_DOCS_SEARCH`
   - Description: Search engineering runbooks, postmortems, architecture docs

5. **Agent Instructions:**
```
You are an intelligent assistant for engineering leadership and SRE teams.

You have access to:
- Production incident data (structured metrics)
- Engineering documentation (unstructured - runbooks, postmortems, architecture)

When answering questions:
1. Determine which tool is needed (Analyst for metrics, Search for docs)
2. Query structured data using Cortex Analyst when asking about incident patterns, volumes, or trends
3. Search documentation using Cortex Search when looking for procedures, best practices, or past learnings
4. Synthesize insights across both sources when comparing incidents with documented procedures

Always provide context and actionable insights, not just raw numbers.
```

---

## Sample Queries

### Structured Data Queries (Cortex Analyst)

```
What are the top 5 incident types by volume this quarter?
```

```
What is the average resolution time for database incidents?
```

```
Show me critical incidents from last month
```

```
Which services have the most incidents?
```

```
What were the incident trends month over month in 2025?
```

### Unstructured Data Queries (Cortex Search)

```
Show me what our runbooks say about database connection pool troubleshooting
```

```
Search our postmortems for memory leak debugging procedures
```

```
What do our architecture docs say about microservices best practices?
```

```
Find documentation about deployment rollback procedures
```

### Orchestrated Queries (THE MAGIC!)

These queries require both tools working together:

```
Compare last month's database connection pool incidents with what our runbooks recommend for mitigation
```

```
Show me API timeout incidents and relevant architecture documentation
```

```
What incidents did we have in November and what do our postmortems say about similar issues?
```

---

## Data Overview

### INCIDENTS Table (55 incidents)
- **Date Range:** January - November 2025
- **Incident Types:** 
  - Database Connection Pool Exhausted
  - Memory Leak
  - API Gateway Timeout
  - Disk Space Critical
  - Third-Party Service Degradation
  - SSL Certificate Expired
  - Network Latency Spike
  - Database Query Timeout
  - Container Orchestration Failure
  - Cache Invalidation Issue

- **Services:** User-Service, Payment-Service, Order-Service, Inventory-Service, Notification-Service, Auth-Service, Analytics-Service, Search-Service, Reporting-Service, Integration-Service

- **Severities:** Critical, High, Medium, Low

### ENGINEERING_DOCS Table (10+ documents)
- **Runbooks:**
  - Database Connection Pool Management
  - Production Deployment Procedures
  - Memory Leak Debugging Guide
  - SSL Certificate Renewal

- **Postmortems:**
  - Payment Gateway Outage Analysis
  - Database Connection Pool Incident
  
- **Architecture Docs:**
  - Microservices Best Practices
  - Error Handling Patterns

---

## Troubleshooting

### "Warehouse is missing" error
```sql
-- Grant warehouse access (run as ACCOUNTADMIN)
GRANT USAGE ON WAREHOUSE APP_WH TO ROLE SF_INTELLIGENCE_DEMO;
GRANT OPERATE ON WAREHOUSE APP_WH TO ROLE SF_INTELLIGENCE_DEMO;
```

### "Object does not exist or not authorized"
```sql
-- Grant table permissions (run as ACCOUNTADMIN)
GRANT SELECT ON ALL TABLES IN SCHEMA DEMO_JAM.ENGINEERING_OPS TO ROLE SF_INTELLIGENCE_DEMO;
```

### "Search service not refreshing"
```sql
-- Check service status
SHOW CORTEX SEARCH SERVICES;

-- Manually refresh
ALTER CORTEX SEARCH SERVICE ENGINEERING_DOCS_SEARCH REFRESH;
```

### "Semantic model validation error"
- Check YAML indentation (use spaces, not tabs)
- Ensure all `name` fields exist
- Use lowercase column names in SQL expressions
- Verify `custom_instructions` is a single string (use `>` for multi-line)

---

## Demo Execution

**[Full demo script in main DEMO_GUIDE.md](../DEMO_GUIDE.md#module-1-engineering-operations-5-min-demo-jam)**

### Quick Demo Flow (5 minutes)

1. **Opening Hook** (30 sec) - Set the scene: post-P1 incident review
2. **Structured Query** (45 sec) - "What are the top 5 incident types this quarter?"
3. **Unstructured Query** (30 sec) - "Show me runbooks about connection pool troubleshooting"
4. **Orchestrated Query** (45 sec) - "Compare incidents with runbook recommendations"
5. **Business Impact** (45 sec) - Velocity, cost, security, scale
6. **Aha Moment** (15 sec) - "AI where data lives, not where vendors want it"

---

## Files in This Module

```
module_1_engineering_operations/
├── README.md (this file)
├── sql/
│   ├── 00_grant_warehouse_access.sql
│   ├── 01_setup_environment.sql
│   ├── 02_create_tables.sql
│   ├── 03_load_incident_data.sql
│   ├── 04_load_documentation.sql
│   ├── 05_create_cortex_search.sql
│   ├── 06_upload_semantic_model.sql (instructions)
│   ├── 07_create_cortex_agent.sql (instructions)
│   └── 08_add_more_q4_incidents.sql (optional)
└── semantic_model/
    └── incidents_semantic_model.yaml
```

---

## Key Differentiators

- ✅ **Zero Infrastructure** - No vector databases to deploy
- ✅ **Unified Governance** - All queries respect RBAC
- ✅ **Production Scale** - From 10 to 10,000 users, same setup
- ✅ **Multi-Source Intelligence** - Structured + unstructured in one query

---

## Next Steps

1. ✅ Complete setup above
2. ✅ Test all sample queries
3. ✅ Review demo script
4. Consider adding [Module 2: IT Relationship & Value](../module_2_it_relationship/README.md) for IT leadership use cases
5. See [main README](../README.md) for cross-module platform demos

---

**This module won the Snowflake Internal Demo Jam competition!** 🏆

