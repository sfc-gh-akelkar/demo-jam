# Snowflake Intelligence Demo - Multi-Module Platform

**Winner of Snowflake Internal Demo Jam Competition!** 🏆

A comprehensive, production-quality demonstration of Snowflake Intelligence capabilities, organized into modular use cases for different audiences and personas.

---

## 📦 Modules

### Module 1: Engineering Operations Intelligence
**Persona:** VP of Engineering, SRE Teams  
**Use Case:** Post-incident analysis (structured metrics + unstructured docs)  
**Duration:** 5 minutes  
**[Full Documentation →](module_1_engineering_operations/README.md)**

### Module 2: IT Relationship & Value Management
**Persona:** CIO, IT Directors, PMO Leaders  
**Use Case:** IT performance, project ROI, roadmap tracking  
**Duration:** 5-7 minutes  
**[Full Documentation →](module_2_it_relationship/README.md)**

---

## 🚀 Quick Start

### Prerequisites
- Snowflake account with `SF_INTELLIGENCE_DEMO` role
- Warehouse: `APP_WH` with USAGE and OPERATE privileges
- `CORTEX_USER` database role granted
- Snowflake Intelligence enabled

### Module 1 Setup (30-45 min)

```sql
-- Step 1: Grant permissions (run as ACCOUNTADMIN)
-- Run: module_1_engineering_operations/sql/00_grant_warehouse_access.sql

-- Step 2: Create database, schema, tables
-- Run: module_1_engineering_operations/sql/01_setup_environment.sql
-- Run: module_1_engineering_operations/sql/02_create_tables.sql

-- Step 3: Load sample data
-- Run: module_1_engineering_operations/sql/03_load_incident_data.sql
-- Run: module_1_engineering_operations/sql/04_load_documentation.sql
-- Run: module_1_engineering_operations/sql/08_add_more_q4_incidents.sql (optional)

-- Step 4: Create Cortex Search Service
-- Run: module_1_engineering_operations/sql/05_create_cortex_search.sql

-- Step 5: Upload semantic model
-- Upload: module_1_engineering_operations/semantic_model/incidents_semantic_model.yaml
--   to @DEMO_JAM.ENGINEERING_OPS.DEMO_STAGE

-- Step 6: Create Cortex Agent in Snowsight UI (see Agent Setup section below)
```

### Module 2 Setup (20-30 min, after Module 1)

```sql
-- Step 1: Create IT tables
-- Run: module_2_it_relationship/sql/01_create_it_tables.sql

-- Step 2: Load IT data
-- Run: module_2_it_relationship/sql/02_load_it_support_data.sql
-- Run: module_2_it_relationship/sql/03_load_it_projects_data.sql
-- Run: module_2_it_relationship/sql/04_load_app_roadmap_data.sql
-- Run: module_2_it_relationship/sql/05_create_project_roi_table.sql
-- Run: module_2_it_relationship/sql/06_load_project_roi_data.sql
-- Run: module_2_it_relationship/sql/07_load_it_sla_documentation.sql

-- Step 3: Create Cortex Search Service for IT documentation
-- Run: module_2_it_relationship/sql/08_create_cortex_search.sql

-- Step 4: Upload semantic model (consolidated)
-- Upload: module_2_it_relationship/semantic_model/module_2_semantic_model.yaml
--   to @DEMO_JAM.ENGINEERING_OPS.DEMO_STAGE

-- Step 5: Update Cortex Agent with Module 2 tools (see Agent Setup section)
```

---

## 🤖 Cortex Agent Setup

### Create Agent (Snowsight UI)

1. Navigate to: **Intelligence** → **Cortex Agents** → **+ Agent**

2. **Basic Configuration:**
   - Name: `Engineering & IT Intelligence Agent`
   - Description: `Unified agent for engineering operations and IT relationship management`
   - Database: `DEMO_JAM`
   - Schema: `ENGINEERING_OPS`
   - Warehouse: `APP_WH`
   - Role: `SF_INTELLIGENCE_DEMO`

3. **Add Tools:**

#### Tool 1: Engineering Incidents (Cortex Analyst)
```
Name: engineering_incidents_analyst
Type: Cortex Analyst
Semantic Model: @DEMO_STAGE/incidents_semantic_model.yaml
Description: Query production incidents, root causes, resolution times
```

#### Tool 2: IT Relationship & Value (Cortex Analyst)
```
Name: it_relationship_analyst
Type: Cortex Analyst
Semantic Model: @DEMO_STAGE/module_2_semantic_model.yaml
Description: Query IT support performance, project ROI, success metrics, and application roadmap
```

#### Tool 3: Engineering Documentation (Cortex Search)
```
Name: engineering_docs_search
Type: Cortex Search
Search Service: ENGINEERING_DOCS_SEARCH
Description: Search engineering runbooks, postmortems, architecture docs
```

#### Tool 4: IT Documentation (Cortex Search)
```
Name: it_docs_search
Type: Cortex Search
Search Service: IT_DOCS_SEARCH
Description: Search IT policies, SLAs, project governance, best practices
```

4. **Agent Instructions:**
```
You are an intelligent assistant for engineering and IT leadership.

You have access to:
- Production incident data (structured via engineering_incidents_analyst)
- IT support ticket data (structured via it_relationship_analyst)
- IT project portfolio, ROI metrics, and application roadmap (structured via it_relationship_analyst)
- Engineering documentation (unstructured - runbooks, postmortems via engineering_docs_search)
- IT policies and documentation (unstructured - SLAs, governance via it_docs_search)

When answering questions:
1. Determine which tool(s) are needed
2. For incident patterns and trends → use engineering_incidents_analyst
3. For IT support performance, project ROI, or roadmap → use it_relationship_analyst
4. For engineering procedures and best practices → search engineering_docs_search
5. For IT policies, SLAs, and governance → search it_docs_search
6. Synthesize insights across multiple data sources when relevant
7. Correlate incidents with IT support patterns when relevant
8. Reference SLAs and policies when discussing support performance

Business units: Healthcare, Finance, Sales, Marketing, HR, Operations
Healthcare is a critical business unit with premium SLA (50% faster response times).

Always provide context and actionable insights, not just raw numbers.
When discussing ROI, reference both the multiple (e.g., 3.5:1) and annual dollar value.
When discussing SLAs, cite specific targets from IT documentation.
```

5. **Save and test with sample queries below**

---

## 📊 Sample Queries

### Module 1: Engineering Operations

```
What are the top 5 incident types by volume this quarter?
```

```
Show me what our runbooks say about database connection pool troubleshooting
```

```
Compare last month's database connection pool incidents with what our runbooks recommend for mitigation
```

### Module 2: IT Performance & Value

```
What is the average time-to-resolution for Healthcare IT tickets vs other business units?
```

```
What is the average ROI across all IT projects?
```

```
Show me projects with ROI greater than 3:1 and their expected annual value
```

```
Which project metrics are currently at risk?
```

### Cross-Module Intelligence (THE MAGIC!)

```
Which business units have both high production incident rates AND slow IT support response times?
```

```
Show me IT support tickets that were created during major production incidents
```

---

## 🎤 Demo Presentation Strategies

### For 5-Minute Demo Jams
**Choose ONE module** and go deep:
- Module 1 for technical audiences (Engineering, DevOps)
- Module 2 for business audiences (CIO, PMO)

### For 10-15 Minute Customer Demos
**Show progression:**
1. Module 1 (5 min) - Establish technical credibility
2. Module 2 (5 min) - Show business value
3. Cross-module query (2 min) - Demonstrate platform power

### For 30-Minute Deep Dives
**Full platform showcase:**
- Module 1 deep dive (10 min)
- Module 2 deep dive (10 min)
- Cross-module intelligence (5 min)
- Architecture & governance (5 min)

**[View Complete Demo Scripts →](DEMO_GUIDE.md)**

---

## 🏗️ Architecture

```
Snowflake Intelligence Platform
│
├── Module 1: Engineering Operations
│   ├── INCIDENTS table (structured)
│   ├── ENGINEERING_DOCS table (unstructured)
│   ├── ENGINEERING_DOCS_SEARCH (Cortex Search)
│   └── incidents_semantic_model.yaml
│
├── Module 2: IT Relationship & Value
│   ├── IT_SUPPORT_TICKETS table
│   ├── IT_PROJECTS table
│   ├── APP_ROADMAP table
│   ├── PROJECT_ROI_METRICS table
│   └── Semantic models (2)
│
└── Unified Cortex Agent
    ├── Engineering Incidents Analyst
    ├── IT Support Analyst
    ├── Project ROI Analyst
    └── Documentation Search
```

**Key Differentiators:**
- ✅ Zero Infrastructure - No vector databases, no RAG pipelines
- ✅ Unified Governance - All data and LLM inference within Snowflake
- ✅ Production Scale - From 10 to 10,000 users without re-architecture
- ✅ Multi-Domain Intelligence - Query across any structured + unstructured data

---

## 🛠️ Troubleshooting

### "Object does not exist or not authorized"
```sql
-- Grant necessary permissions (run as ACCOUNTADMIN)
GRANT USAGE ON DATABASE DEMO_JAM TO ROLE SF_INTELLIGENCE_DEMO;
GRANT USAGE ON SCHEMA DEMO_JAM.ENGINEERING_OPS TO ROLE SF_INTELLIGENCE_DEMO;
GRANT SELECT ON ALL TABLES IN SCHEMA DEMO_JAM.ENGINEERING_OPS TO ROLE SF_INTELLIGENCE_DEMO;
```

### "Warehouse is missing"
```sql
-- Grant warehouse permissions (run as ACCOUNTADMIN)
GRANT USAGE ON WAREHOUSE APP_WH TO ROLE SF_INTELLIGENCE_DEMO;
GRANT OPERATE ON WAREHOUSE APP_WH TO ROLE SF_INTELLIGENCE_DEMO;
```

### "Semantic model validation error"
- Check YAML indentation (use spaces, not tabs)
- Verify all `name` fields exist in verified_queries
- Ensure `custom_instructions` is a single string (use `>` for multi-line)
- Use lowercase column names in verified_queries

### "Search service not refreshing"
```sql
-- Check service status
SHOW CORTEX SEARCH SERVICES;

-- Manually refresh if needed
ALTER CORTEX SEARCH SERVICE ENGINEERING_DOCS_SEARCH REFRESH;
```

---

## 📁 Repository Structure

```
demo-jam/
├── README.md (this file)
├── DEMO_GUIDE.md (demo scripts and talk tracks)
│
├── module_1_engineering_operations/
│   ├── README.md (complete Module 1 documentation)
│   ├── sql/ (8 setup scripts)
│   └── semantic_model/ (incidents_semantic_model.yaml)
│
└── module_2_it_relationship/
    ├── README.md (complete Module 2 documentation)
    ├── sql/ (6 setup scripts)
    └── semantic_model/ (2 semantic models)
```

---

## 🎯 Key Messages

### The "Aha Moment"
> **"Every vendor wants you to bring your data to their AI.  
> Snowflake Intelligence brings AI to where your data already lives—governed, secured, and scaled."**

### Technical Differentiation
- **Zero Infrastructure:** No vector databases, no RAG pipelines to deploy
- **Unified Governance:** All data and LLM inference within Snowflake boundary
- **Production Scale:** From 10 to 10,000 users without re-architecture
- **Multi-Domain Intelligence:** Query across any structured + unstructured data

### Business Value
- **Time to Value:** Days to production, not months
- **Cost Efficiency:** No $2M AI infrastructure projects
- **Risk Reduction:** No new security attack surfaces
- **Resource Optimization:** Insights for better decision-making

---

## 🤝 Customization Guide

### For Different Industries
- **Healthcare:** Patient safety events, clinical protocols
- **Financial Services:** Fraud cases, compliance procedures
- **Retail:** Order fulfillment issues, logistics procedures
- **Manufacturing:** Quality incidents, production procedures

### For Different Personas
- **CTO:** Emphasize architecture and technical depth
- **CFO:** Focus on cost efficiency and ROI (Module 2!)
- **CISO:** Highlight security and governance

---

## 📞 Support & Resources

- **Module 1 Details:** [module_1_engineering_operations/README.md](module_1_engineering_operations/README.md)
- **Module 2 Details:** [module_2_it_relationship/README.md](module_2_it_relationship/README.md)
- **Demo Scripts:** [DEMO_GUIDE.md](DEMO_GUIDE.md)
- **Snowflake Docs:** [docs.snowflake.com](https://docs.snowflake.com)

---

*Last Updated: 2025-11-04*  
*Version: 2.0 (Multi-Module Platform)*
