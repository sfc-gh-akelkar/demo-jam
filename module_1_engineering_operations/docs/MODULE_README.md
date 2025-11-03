# Module 1: Engineering Operations Intelligence

## Overview
This module demonstrates how a VP of Engineering can use Snowflake Intelligence to analyze production incidents and access operational knowledge by querying both structured incident metrics AND unstructured engineering documentation using natural language.

## Use Case
**Post-Incident Review**: After a major P1 incident, engineering teams need to understand historical patterns and best practices quickly. This module shows how to:
- Query structured incident data (metrics, trends, patterns)
- Search unstructured documentation (runbooks, postmortems, architecture docs)
- Get synthesized insights combining both sources

## Data Sources

### Structured Data
- **INCIDENTS Table**: Production incidents with metadata, resolution times, affected users, root causes
  - 55+ incidents across 2025 (Q1-Q4)
  - 10 incident types (Database Connection Pool, Memory Leak, API Timeout, etc.)
  - 10 microservices tracked

### Unstructured Data
- **ENGINEERING_DOCS Table**: Technical documentation
  - Runbooks (connection pool management, deployment procedures, memory leak debugging)
  - Postmortems (past incident analysis)
  - Architecture documentation (best practices, patterns)

## Key Features Demonstrated

1. **Cortex Analyst** - Natural language to SQL on incident metrics
2. **Cortex Search** - Semantic search across engineering documentation  
3. **Cortex Agent** - Intelligent orchestration across both tools

## Demo Queries

### Query 1: Structured Data Analysis
```
What are the top 5 incident types by volume this quarter?
```

### Query 2: Unstructured Data Search
```
Show me what our runbooks say about database connection pool troubleshooting
```

### Query 3: Orchestrated Intelligence (THE MAGIC)
```
Compare last month's database connection pool incidents with what our runbooks recommend for mitigation
```

## Setup Instructions

See main repository README for complete setup instructions.

Quick setup for this module:
1. Run `sql/00_grant_warehouse_access.sql` (ACCOUNTADMIN role)
2. Run `sql/01_setup_environment.sql` through `sql/05_create_cortex_search.sql`
3. Upload `semantic_model/incidents_semantic_model.yaml` to stage
4. Create Cortex Agent via Snowsight UI

## Files

### SQL Scripts
- `sql/00_grant_warehouse_access.sql` - Grant permissions
- `sql/01_setup_environment.sql` - Database and schema setup
- `sql/02_create_tables.sql` - Table definitions
- `sql/03_load_incident_data.sql` - Load 45 base incidents
- `sql/04_load_documentation.sql` - Load engineering docs
- `sql/05_create_cortex_search.sql` - Create search service
- `sql/06_upload_semantic_model.sql` - Upload instructions
- `sql/07_create_cortex_agent.sql` - Agent configuration guide
- `sql/08_add_more_q4_incidents.sql` - Additional Q4 data

### Semantic Model
- `semantic_model/incidents_semantic_model.yaml` - Cortex Analyst semantic model

### Documentation
- `docs/DEMO_JAM_ONE_PAGER.md` - Strategic overview and talk track
- `docs/DEMO_SCRIPT.md` - Word-for-word execution script (5 minutes)
- `docs/MODULE_README.md` - This file

## Target Personas

- VP of Engineering
- Engineering Managers
- Site Reliability Engineers (SRE)
- DevOps Leaders

## Success Metrics

After this demo, audience should understand:
✅ How Snowflake Intelligence unifies structured + unstructured data analysis
✅ Zero infrastructure required (no vector DBs, no separate RAG systems)
✅ Production-ready AI within existing governance boundary
✅ Scalable from prototype to enterprise without re-architecture

