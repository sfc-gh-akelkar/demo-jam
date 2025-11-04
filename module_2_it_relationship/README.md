# Module 2: IT Relationship & Value Management

**Target Audience:** CIO, IT Directors, PMO Leaders  
**Use Case:** IT performance tracking, project portfolio management, ROI demonstration  
**Demo Duration:** 5-7 minutes  
**Setup Time:** 20-30 minutes (after Module 1)

---

## Overview

This module demonstrates how IT leadership can use Snowflake Intelligence to:
- Track IT support performance across business units
- Manage project portfolios with quantifiable ROI metrics
- Communicate application roadmaps to stakeholders
- **Transform IT from cost center to measurable value driver**

---

## What's Included

### Tables

**Structured Data:**
1. **IT_SUPPORT_TICKETS** - 16+ IT support tickets
   - 6 business units (Healthcare, Finance, Sales, Marketing, HR, Operations)
   - Multiple ticket types (Access Request, Software Issue, Hardware Issue, etc.)
   - Resolution times and status tracking

2. **IT_PROJECTS** - 10 IT projects
   - Budget tracking (allocated, spent, remaining)
   - Project status and completion percentage
   - Business unit sponsors

3. **PROJECT_ROI_METRICS** - 13 ROI metrics across projects
   - Baseline → Current → Target tracking
   - ROI multiples (e.g., 3.5:1 return)
   - Annual dollar values ($17.5M+ total)
   - Status tracking (On Track, At Risk, Achieved, Not Started)

4. **APP_ROADMAP** - 12+ planned features
   - CRM, ERP, EMR, HRIS applications
   - Release quarters and priorities
   - Business value descriptions

**Unstructured Data:**
5. **IT_DOCUMENTATION** - IT policies and governance
   - IT Service Level Agreements (SLA targets, escalation)
   - Project prioritization framework
   - ROI measurement methodology
   - IT support best practices

### Cortex Components
- **Cortex Analyst** - Natural language to SQL on IT metrics and ROI data
- **Cortex Search** - Semantic search across IT policies and SLAs
- **Cortex Agent** - Orchestrates across structured data AND unstructured documentation

### Semantic Model
- **`module_2_semantic_model.yaml`** (Consolidated) - Covers all Module 2 tables
  - IT Support Tickets
  - IT Projects
  - Project ROI Metrics
  - Application Roadmap

---

## Quick Setup

### Prerequisites
- **Module 1 must be set up first** (provides database, schema, warehouse access)
- Snowflake account with `SF_INTELLIGENCE_DEMO` role
- Warehouse: `APP_WH` with USAGE and OPERATE privileges

### Step-by-Step Setup (20-30 min)

```sql
-- Step 1: Create IT tables
-- File: sql/01_create_it_tables.sql
USE DATABASE DEMO_JAM;
USE SCHEMA ENGINEERING_OPS;
USE WAREHOUSE APP_WH;

CREATE OR REPLACE TABLE IT_SUPPORT_TICKETS (...);
CREATE OR REPLACE TABLE IT_PROJECTS (...);
CREATE OR REPLACE TABLE APP_ROADMAP (...);
-- (See script for full table definitions)

-- Step 2: Load IT support ticket data
-- File: sql/02_load_it_support_data.sql
-- Loads 16 tickets across 6 business units

-- Step 3: Load IT project data
-- File: sql/03_load_it_projects_data.sql
-- Loads 10 projects with budgets and status

-- Step 4: Load application roadmap data
-- File: sql/04_load_app_roadmap_data.sql
-- Loads 12 planned features across multiple applications

-- Step 5: Create PROJECT_ROI_METRICS table
-- File: sql/05_create_project_roi_table.sql
CREATE OR REPLACE TABLE PROJECT_ROI_METRICS (...);

-- Step 6: Load ROI metrics data
-- File: sql/06_load_project_roi_data.sql
-- Loads 13 metrics with baseline/current/target values
-- Total annual value: $17.5M+

-- Step 7: Load IT documentation (policies, SLAs)
-- File: sql/07_load_it_sla_documentation.sql
-- Loads IT SLA policies, project governance, ROI framework

-- Step 8: Create Cortex Search Service for IT documentation
-- File: sql/08_create_cortex_search.sql
CREATE OR REPLACE CORTEX SEARCH SERVICE IT_DOCS_SEARCH
    ON CONTENT
    ATTRIBUTES TITLE, DOC_TYPE, TAGS, AUTHOR
    WAREHOUSE = APP_WH
    AS (SELECT DOC_ID, CONTENT, TITLE, DOC_TYPE, TAGS, AUTHOR FROM IT_DOCUMENTATION);

-- Step 9: Upload semantic model
-- File: semantic_model/module_2_semantic_model.yaml
-- Upload to @DEMO_JAM.ENGINEERING_OPS.DEMO_STAGE
-- (See upload instructions below)

-- Step 8: Update Cortex Agent
-- Add Module 2 tool(s) to your existing agent
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
    PUT file://module_2_it_relationship/semantic_model/module_2_semantic_model.yaml 
    @DEMO_STAGE 
    AUTO_COMPRESS=FALSE 
    OVERWRITE=TRUE
""")

conn.close()
```

### Option 2: Snowsight UI
1. Navigate to: Data → Databases → DEMO_JAM → ENGINEERING_OPS → Stages → DEMO_STAGE
2. Click "Upload Files"
3. Select `module_2_semantic_model.yaml`

---

## Update Cortex Agent

Add Module 2 tools to your existing Cortex Agent:

### Via Snowsight UI

1. Navigate to your existing agent: **Intelligence** → **Cortex Agents** → *Your Agent*

2. **Add Tool #1: IT Relationship Analyst**
   - Type: Cortex Analyst
   - Semantic Model: `@DEMO_STAGE/module_2_semantic_model.yaml`
   - Description: Query IT support performance, project ROI, and application roadmap

3. **Add Tool #2: IT Documentation Search**
   - Type: Cortex Search
   - Search Service: `IT_DOCS_SEARCH`
   - Description: Search IT policies, SLAs, project governance, and best practices

4. **Update Agent Instructions** (add to existing):
```
You also have access to:
- IT support ticket data (performance by business unit)
- IT project portfolio (budgets, ROI, success metrics)
- Application roadmap (planned features and release schedules)
- IT policies and documentation (SLAs, governance, best practices)

For IT-related questions:
- Compare support performance across business units (Healthcare is critical)
- Analyze project ROI and quantifiable business value
- Track progress on success metrics (baseline → current → target)
- Identify at-risk metrics needing attention
- Reference IT SLAs and policies when discussing support performance
- Explain project prioritization and governance frameworks
- Search documentation for policies, procedures, and best practices
```

---

## Sample Queries

### IT Support Performance

```
What is the average time-to-resolution for Healthcare IT tickets vs other business units?
```

```
Which business units have the most IT support tickets?
```

```
Show me all critical priority tickets from last month
```

```
What is the average resolution time by ticket type?
```

```
Which IT support teams handle the most tickets?
```

### Project Portfolio & Budgets

```
Show me all active IT projects for Healthcare
```

```
Which projects are over budget?
```

```
What is the total IT project spend across all business units?
```

```
Show me completed projects and their final budget vs actual spend
```

### ROI & Business Value (THE MONEY QUESTIONS!)

```
What is the average ROI across all IT projects?
```

```
Show me projects with ROI greater than 3:1
```

```
What is the total projected annual value of all IT projects?
```
*Answer: $17.5M+*

```
Which project metrics are currently at risk?
```

```
Show me metrics that have already achieved their targets
```

```
For the Field Service Management project, show me all success metrics and their business value
```

```
What is Healthcare's total projected annual value from IT projects?
```

### Application Roadmap

```
What CRM features are coming in Q1 2026?
```

```
Show me all planned features for the Healthcare business unit
```

```
Which applications have the most features in development?
```

### IT Policies & SLAs (Cortex Search on Unstructured)

```
What are the IT support SLA targets for critical priority tickets?
```

```
How does Healthcare's IT SLA differ from other business units?
```

```
What is the process for prioritizing new IT projects?
```

```
How do we measure IT project ROI and success?
```

```
What are the best practices for submitting IT support tickets?
```

### Cross-Domain Intelligence

```
Show me business units with high IT support volumes and their active projects
```

```
Compare project budgets with support ticket volumes by business unit
```

### Cross-Module (with Module 1)

```
Which business units have both high production incident rates AND slow IT support response times?
```

---

## Data Overview

### IT_SUPPORT_TICKETS (16+ tickets)
- **Business Units:** Healthcare, Finance, Sales, Marketing, HR, Operations
- **Ticket Types:** Access Request, Software Issue, Hardware Issue, Performance Issue, Network Issue
- **Priorities:** Critical, High, Medium, Low
- **Resolution Times:** Tracked in hours
- **Teams:** IT Support Team, Application Support, Network Team

### IT_PROJECTS (10 projects, $5.5M total budget)

| Project | Business Unit | Budget | Status | Priority |
|---------|--------------|---------|---------|----------|
| Field Service Management | Healthcare | $850K | In Progress | High |
| Telehealth Platform | Healthcare | $1.2M | Planning | High |
| HIPAA Compliance Automation | Healthcare | $425K | In Progress | High |
| Financial Reporting Modernization | Finance | $675K | In Progress | High |
| Expense Management Upgrade | Finance | $185K | Completed | Medium |
| CRM Analytics Enhancement | Sales | $425K | In Progress | High |
| Supply Chain Visibility | Operations | $950K | Planning | High |
| Marketing Automation | Marketing | $385K | In Progress | High |
| Employee Self-Service Portal | HR | $275K | Completed | Medium |

### PROJECT_ROI_METRICS (13 metrics, $17.5M+ annual value)

**Key ROI Examples:**
- Field Service Management: 3.5:1 ROI, $2.95M annual value
- Telehealth Platform: 2.8:1 ROI, $5.1M annual value
- Financial Reporting: 4.2:1 ROI, $1.28M annual value
- CRM Analytics: 3.0:1 ROI, $2.05M annual value
- Supply Chain: 2.5:1 ROI, $5.5M annual value

**Metric Status:**
- 9 metrics "On Track"
- 3 metrics "Not Started"
- 1 metric "Achieved" (exceeded target)

### APP_ROADMAP (12+ features)
- **Applications:** Salesforce CRM, SAP ERP, Epic EMR, Workday HRIS, Marketo
- **Release Timeframe:** Q1 2026 - Q4 2026
- **Status:** Planned, In Development, Released

---

## Key Value Propositions

### Before Snowflake Intelligence

**Question:** "What's our IT ROI?"  
**Answer:** "Let me pull together some spreadsheets... I'll get back to you in a few days..."

**Question:** "Why is Healthcare complaining about IT support?"  
**Answer:** "It's subjective... let me manually analyze ticket data..."

### After Snowflake Intelligence

**Question:** "What's our IT ROI?"  
**Answer (in 2 seconds):** "Average ROI is 3.3:1 across 6 active projects with $17.5M in projected annual value. 69% of metrics are on track, 8% already achieved."

**Question:** "Why is Healthcare complaining about IT support?"  
**Answer (in 2 seconds):** "Healthcare's average resolution time is 28 hours vs 18 hours for other units. They also have 35% of critical tickets. Here's the data."

---

## ROI Metrics Deep Dive

### What Makes Module 2 Special: Quantifiable Value

Instead of qualitative descriptions:
> "We're improving field service operations..."

You get quantifiable metrics:
> "We're reducing mean-time-to-repair by 30% (from 240 to 168 minutes), improving equipment uptime from 94% to 98%, and reducing errors by 10%. Current progress: 25% MTTR improvement achieved, uptime at 96.5%, errors reduced by 15% (exceeded target). Total annual value: $2.95M with 3.5:1 ROI."

### ROI Metric Structure

Each metric tracks:
- **Baseline** - Starting value before project
- **Current** - Measured progress to date
- **Target** - Goal to achieve
- **Status** - On Track, At Risk, Achieved, Not Started
- **ROI Multiple** - Return ratio (e.g., 3.5:1)
- **Annual Value** - Dollar value per year

### Example: Field Service Management Project

**Metric 1: Reduce MTTR**
- Baseline: 240 minutes
- Current: 180 minutes (25% improvement)
- Target: 168 minutes (30% improvement)
- Status: On Track
- Annual Value: $2.1M

**Metric 2: Improve Uptime**
- Baseline: 94%
- Current: 96.5%
- Target: 98%
- Status: On Track
- Annual Value: $850K

**Metric 3: Reduce Errors**
- Baseline: 8.5%
- Current: 7.2%
- Target: 7.65% (10% reduction)
- Status: Achieved ✓
- Already exceeded target!

---

## Demo Execution

**[Full demo script in main DEMO_GUIDE.md](../DEMO_GUIDE.md#module-2-it-relationship--value-5-7-min)**

### Quick Demo Flow (5-7 minutes)

1. **Opening** (30 sec) - "What's our IT ROI?" challenge
2. **IT Performance** (1.5 min) - Compare resolution times across business units
3. **Project ROI** (2 min) - Show quantifiable value and metrics at risk
4. **Value Storytelling** (1.5 min) - "$17.5M in value, not just 'improving efficiency'"
5. **Impact** (30 sec) - Transform IT from cost center to value driver

---

## Files in This Module

```
module_2_it_relationship/
├── README.md (this file)
├── sql/
│   ├── 01_create_it_tables.sql
│   ├── 02_load_it_support_data.sql
│   ├── 03_load_it_projects_data.sql
│   ├── 04_load_app_roadmap_data.sql
│   ├── 05_create_project_roi_table.sql
│   ├── 06_load_project_roi_data.sql
│   ├── 07_load_it_sla_documentation.sql (NEW!)
│   └── 08_create_cortex_search.sql (NEW!)
└── semantic_model/
    ├── module_2_semantic_model.yaml (RECOMMENDED - consolidated)
    └── README.md (semantic model documentation)
```

---

## Troubleshooting

### Common Issues

**"Table does not exist"**
- Ensure Module 1 setup completed first (creates database/schema)
- Run scripts in order (01 through 06)

**"Permission denied"**
- Grant necessary permissions (should be inherited from Module 1 setup)
- See Module 1 README for permission grants

**"Semantic model validation error"**
- Check YAML indentation (use spaces, not tabs)
- Verify all table names match actual database tables
- Use lowercase column names in expressions

---

## Next Steps

1. ✅ Complete setup above
2. ✅ Test IT support and ROI queries
3. ✅ Review demo script
4. Consider cross-module queries with [Module 1](../module_1_engineering_operations/README.md)
5. See [main README](../README.md) for platform-level demos

---

**Key Differentiator:** This module transforms "We're spending money on IT" into "We're generating $17.5M+ in measurable annual value with an average 3.3:1 ROI" - all queryable in natural language with zero infrastructure!

