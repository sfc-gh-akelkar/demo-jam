# Module 2: IT Relationship & Value Management

## Overview
This module demonstrates how IT leadership (CIO, IT Director) can use Snowflake Intelligence to manage IT-business relationships, track project value, and optimize service delivery by analyzing IT support tickets, project portfolios, and application roadmaps.

## Use Case
**IT Performance & Strategic Planning**: Business units often perceive IT as slow or unresponsive. This module shows how to:
- Analyze IT support ticket performance by business unit
- Track IT project status, budgets, and ROI
- Communicate application roadmaps and upcoming features
- Correlate IT performance with resource allocation

## Data Sources

### Structured Data
- **IT_SUPPORT_TICKETS**: Helpdesk and support requests
  - Business unit tracking
  - Resolution time metrics
  - Ticket types and priorities
  
- **IT_PROJECTS**: Project portfolio management
  - Budget vs. actual spend
  - Project status and timelines
  - Expected business value
  
- **PROJECT_ROI_METRICS**: 🆕 Detailed ROI tracking
  - Multiple success metrics per project
  - Baseline → Current → Target progress
  - Numeric ROI projections ($)
  - Metric types: efficiency, cost savings, revenue impact, quality, satisfaction
  
- **APP_ROADMAP**: Application feature roadmap
  - Planned features by quarter
  - Business value articulation
  - Release schedules

### Unstructured Data
- **IT_DOCUMENTATION**: IT policies, procedures, project charters
  - IT governance policies
  - Project business cases
  - Service level agreements (SLAs)

## Key Features Demonstrated

1. **Multi-Domain Analytics** - Query across tickets, projects, and roadmaps
2. **Cross-Module Intelligence** - Correlate with Module 1 incident data
3. **Business Value Tracking** - ROI and value articulation

## Demo Queries

### Query 1: IT Performance by Business Unit
```
What is the average time-to-resolution for Healthcare IT tickets vs other business units?
```

### Query 2: Project Portfolio Status
```
Show me all active IT projects for the Healthcare business unit, their budgets, and current status
```

### Query 3: 🆕 ROI & Business Value (ENHANCED!)
```
What is the expected business value and ROI of the Field Service Management project?
```
**Now returns:** Detailed breakdown of 4 success metrics: equipment uptime ($2.1M), technician productivity ($450K), customer satisfaction, and mean time to repair ($850K)

### Query 4: 🆕 ROI Progress Tracking
```
Show me the current progress on Field Service Management success metrics
```
**Shows:** Baseline → Current → Target for each metric, proving measurable value delivery

### Query 5: 🆕 Portfolio-Level ROI
```
What is the total projected annual ROI across all IT projects?
```
**Demonstrates:** Quantitative IT value ($20M+) to justify investments

### Query 6: Application Roadmap
```
What new features are coming to our CRM in Q1 2026?
```

### Query 7: Cross-Module Correlation (ADVANCED)
```
Were there any production incidents during the Field Service Management project deployment?
```

## Setup Instructions

Quick setup for this module:
1. Ensure Module 1 is set up (reuses same database and warehouse)
2. Run `sql/01_create_it_tables.sql` - Create IT tables
3. Run `sql/02_load_it_support_data.sql` - Load support tickets
4. Run `sql/03_load_it_projects_data.sql` - Load project data
5. Run `sql/04_load_app_roadmap_data.sql` - Load roadmap
6. Run `sql/05_load_it_documentation.sql` - Load IT docs
7. Upload semantic models to stage
8. Update Cortex Agent to include new tools

## Files

### SQL Scripts
- `sql/01_create_it_tables.sql` - IT table schemas
- `sql/02_load_it_support_data.sql` - Support ticket data
- `sql/03_load_it_projects_data.sql` - Project portfolio data
- `sql/04_load_app_roadmap_data.sql` - Application roadmap
- `sql/05_load_it_documentation.sql` - IT policy docs

### Semantic Models
- `semantic_model/it_support_semantic_model.yaml` - Support tickets
- `semantic_model/it_projects_semantic_model.yaml` - Project portfolio
- `semantic_model/app_roadmap_semantic_model.yaml` - Application roadmap

### Documentation
- `docs/MODULE_README.md` - This file
- `docs/DEMO_SCRIPT.md` - Module 2 demo script
- `docs/IT_VALUE_METRICS.md` - How to measure IT business value

## Target Personas

- CIO (Chief Information Officer)
- IT Director
- PMO (Project Management Office) Leaders
- Business Relationship Managers

## Success Metrics

After this demo, audience should understand:
✅ How to measure and communicate IT performance objectively
✅ Track project value and ROI transparently
✅ Provide clear roadmap visibility to business stakeholders
✅ Optimize IT resource allocation based on data

