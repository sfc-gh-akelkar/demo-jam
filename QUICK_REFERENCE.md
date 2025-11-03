# Demo Quick Reference Card

## 🚀 5-Minute Setup Checklist

### Module 1 (Engineering Operations)
```sql
☐ Run: module_1_engineering_operations/sql/00_grant_warehouse_access.sql
☐ Run: module_1_engineering_operations/sql/01-05 (setup, tables, data, search)
☐ Upload: incidents_semantic_model.yaml to @DEMO_STAGE
☐ Create: Cortex Agent with engineering tools
☐ Test: "What are top 5 incidents this quarter?"
```

### Module 2 (IT Relationship) - Optional Extension
```sql
☐ Run: module_2_it_relationship/sql/01_create_it_tables.sql
☐ Run: module_2_it_relationship/sql/02-04 (load data)
☐ Upload: it_support_semantic_model.yaml to @DEMO_STAGE
☐ Update: Cortex Agent with IT support tool
☐ Test: "What's Healthcare's avg ticket resolution time?"
```

---

## 🎤 Demo Queries (Copy-Paste Ready)

### Module 1: Engineering Operations

**Structured Query:**
```
What are the top 5 incident types by volume this quarter?
```

**Unstructured Query:**
```
Show me what our runbooks say about database connection pool troubleshooting
```

**Orchestrated Query (THE MAGIC):**
```
Compare last month's database connection pool incidents with what our runbooks recommend for mitigation
```

### Module 2: IT Relationship

**IT Performance:**
```
What is the average time-to-resolution for Healthcare IT tickets vs other business units?
```

**Cross-Module Intelligence:**
```
Which business units have both high incident rates AND slow IT support response times?
```

---

## 📊 Key Data Points

### Module 1 Data
- **Incidents:** 55+ incidents across 2025
- **Incident Types:** 10 types (DB Connection Pool, Memory Leak, API Timeout, etc.)
- **Services:** 10 microservices
- **Documentation:** 10+ runbooks, postmortems, architecture docs

### Module 2 Data
- **IT Tickets:** 16+ support tickets (expandable)
- **Business Units:** Healthcare, Finance, Sales, Marketing, HR, Operations
- **IT Projects:** 10 projects with budgets and ROI data
- **Roadmap Features:** 12+ features across CRM, ERP, EMR, HRIS

---

## 🎯 Key Messages (30-Second Versions)

### Technical Differentiation
> "Every vendor wants you to bring your data to their AI. Snowflake Intelligence brings AI to where your data already lives—governed, secured, and scaled."

### Business Value
> "No $2M AI infrastructure project. No vector databases to manage. No new security attack surfaces. Just production-ready AI within your existing Snowflake data platform."

### Platform Power
> "This isn't just about querying data—it's about intelligent orchestration across structured metrics AND unstructured documentation, all with natural language."

---

## 🛠️ Emergency Troubleshooting

### "Object does not exist or not authorized"
```sql
USE ROLE ACCOUNTADMIN;
GRANT SELECT ON ALL TABLES IN SCHEMA DEMO_JAM.ENGINEERING_OPS 
TO ROLE SF_INTELLIGENCE_DEMO;
```

### "Warehouse is missing"
```sql
GRANT USAGE ON WAREHOUSE APP_WH TO ROLE SF_INTELLIGENCE_DEMO;
GRANT OPERATE ON WAREHOUSE APP_WH TO ROLE SF_INTELLIGENCE_DEMO;
```

### "Semantic model validation error"
- Check YAML indentation (use spaces, not tabs)
- Verify all `name` fields exist
- Ensure `custom_instructions` is a single string (use `>` for multi-line)

### "Search service not refreshing"
```sql
-- Check search service status
SHOW CORTEX SEARCH SERVICES;

-- Force refresh (if needed)
ALTER CORTEX SEARCH SERVICE ENGINEERING_DOCS_SEARCH REFRESH;
```

---

## 📁 File Locations (Quick Nav)

```
Module 1 Demo Script:  module_1_engineering_operations/docs/DEMO_SCRIPT.md
Module 1 Talk Track:   module_1_engineering_operations/docs/DEMO_JAM_ONE_PAGER.md
Module 1 SQL Scripts:  module_1_engineering_operations/sql/
Module 2 Overview:     module_2_it_relationship/docs/MODULE_README.md
Agent Setup:           UNIFIED_AGENT_SETUP.md
Main README:           README.md
```

---

## 🎬 30-Second Elevator Pitch

> "Imagine it's the day after a P1 incident. Your engineering team needs to know: 'Have we seen similar database timeout patterns before?' AND 'What do our runbooks say we should have done differently?' Today, that requires digging through Jira, Confluence, and tribal knowledge—hours of work. With Snowflake Intelligence, you get both answers in seconds using natural language. No infrastructure to deploy. No data to move. No new security risks. Just production-ready AI where your data already lives."

---

## 🎓 Common Demo Variations

### For Technical Audiences (CTOs, VPs Engineering)
- Deep dive on semantic models
- Show YAML configuration
- Demonstrate cross-tool orchestration
- Discuss architecture and governance

### For Business Audiences (CIOs, CFOs)
- Focus on time-to-value
- Emphasize cost savings (no $2M AI project)
- Show business value metrics
- Highlight risk reduction

### For 5-Minute Demos
- Module 1 only
- 3 queries maximum (structured → unstructured → orchestrated)
- End with "Aha Moment"

### For 15-Minute Demos
- Both modules
- Show cross-module intelligence
- Discuss architecture
- Q&A time

---

*Keep this open during demos for quick copy-paste of queries and troubleshooting!*
