# Snowflake Intelligence Demo - Multi-Module Platform

## 🎯 Overview

This is a comprehensive, production-quality demonstration of **Snowflake Intelligence** capabilities, organized into modular use cases that can be presented individually or combined for different audiences.

**Key Achievement:** Winner of Snowflake Internal Demo Jam Competition! 🏆

---

## 📦 Module Structure

### Module 1: Engineering Operations Intelligence
**Target Persona:** VP of Engineering, Engineering Managers, SRE Teams  
**Use Case:** Post-incident analysis combining structured incident metrics with unstructured engineering documentation

**Features Demonstrated:**
- Cortex Analyst (natural language to SQL on structured data)
- Cortex Search (semantic search on unstructured docs)
- Cortex Agent (intelligent orchestration)

**Demo Duration:** 5 minutes  
**Setup Time:** 30-45 minutes

📁 Location: `module_1_engineering_operations/`

[View Module 1 Documentation →](module_1_engineering_operations/docs/MODULE_README.md)

---

### Module 2: IT Relationship & Value Management
**Target Persona:** CIO, IT Directors, PMO Leaders  
**Use Case:** IT performance tracking, project portfolio management, and application roadmap communication

**Features Demonstrated:**
- Multi-domain analytics (tickets + projects + roadmap)
- Cross-module correlation with Module 1 incidents
- Business value and ROI tracking

**Demo Duration:** 5-7 minutes  
**Setup Time:** 20-30 minutes (after Module 1)

📁 Location: `module_2_it_relationship/`

[View Module 2 Documentation →](module_2_it_relationship/docs/MODULE_README.md)

---

## 🚀 Quick Start

### Prerequisites
- Snowflake account with SF_INTELLIGENCE_DEMO role
- Access to APP_WH warehouse
- CORTEX_USER database role granted
- Snowflake Intelligence enabled (preview feature)

### Module 1 Setup (Required First)
```bash
# 1. Grant permissions
#    Run: module_1_engineering_operations/sql/00_grant_warehouse_access.sql

# 2. Setup environment and load data
#    Run scripts 01 through 05 in module_1_engineering_operations/sql/

# 3. Upload semantic model
#    Upload module_1_engineering_operations/semantic_model/*.yaml to stage

# 4. Create Cortex Agent
#    Follow instructions in sql/07_create_cortex_agent.sql
```

### Module 2 Setup (After Module 1)
```bash
# 1. Create IT tables
#    Run: module_2_it_relationship/sql/01_create_it_tables.sql

# 2. Load IT data
#    Run scripts 02 through 05 in module_2_it_relationship/sql/

# 3. Upload semantic models
#    Upload module_2_it_relationship/semantic_model/*.yaml to stage

# 4. Update Cortex Agent
#    Add new tools for IT support, projects, roadmap
```

---

## 📊 Sample Demo Queries

### Module 1 Queries
```sql
-- Structured: Analyze incident patterns
"What are the top 5 incident types by volume this quarter?"

-- Unstructured: Search documentation
"Show me what our runbooks say about database connection pool troubleshooting"

-- Orchestrated: Combine both sources
"Compare last month's database connection pool incidents with what our runbooks recommend for mitigation"
```

### Module 2 Queries
```sql
-- IT Performance
"What is the average time-to-resolution for Healthcare IT tickets vs other business units?"

-- Project Portfolio
"Show me all active IT projects for Healthcare, their budgets, and current status"

-- Application Roadmap
"What new features are coming to our CRM in Q1 2026?"
```

### Cross-Module Intelligence
```sql
-- Correlate across domains
"Were there any production incidents during the Field Service Management project deployment?"

-- Resource optimization
"Which teams are handling the most incidents AND have active IT projects?"
```

---

## 🏗️ Architecture

```
Snowflake Intelligence Platform
│
├── Module 1: Engineering Operations
│   ├── Structured Data (INCIDENTS table)
│   ├── Unstructured Data (ENGINEERING_DOCS table)
│   ├── Semantic Model (incidents_semantic_model.yaml)
│   └── Cortex Search Service (ENGINEERING_DOCS_SEARCH)
│
├── Module 2: IT Relationship Management
│   ├── Structured Data (IT_SUPPORT_TICKETS, IT_PROJECTS, APP_ROADMAP)
│   ├── Unstructured Data (IT_DOCUMENTATION table)
│   ├── Semantic Models (3 separate YAML files)
│   └── Cortex Search Service (IT_DOCS_SEARCH)
│
└── Unified Cortex Agent
    ├── Tool 1: Engineering Incidents (Cortex Analyst)
    ├── Tool 2: IT Support Tickets (Cortex Analyst)
    ├── Tool 3: IT Projects (Cortex Analyst)
    ├── Tool 4: App Roadmap (Cortex Analyst)
    └── Tool 5: Documentation Search (Cortex Search)
```

---

## 📁 Repository Structure

```
demo-jam/
├── README.md (this file)
├── SETUP_GUIDE.md (legacy - kept for reference)
├── QUICK_REFERENCE.md (cross-module quick reference)
│
├── module_1_engineering_operations/
│   ├── sql/ (setup and data loading scripts)
│   ├── semantic_model/ (YAML files)
│   └── docs/ (demo scripts and documentation)
│
└── module_2_it_relationship/
    ├── sql/ (setup and data loading scripts)
    ├── semantic_model/ (YAML files)
    └── docs/ (demo scripts and documentation)
```

---

## 🎤 Presentation Strategies

### For 5-Minute Demo Jams
**Choose ONE module** and go deep:
- Module 1 for technical audiences (Engineering, DevOps)
- Module 2 for business audiences (CIO, PMO)

### For 10-15 Minute Customer Demos
**Show progression:**
1. Start with Module 1 (5 min) - establish technical credibility
2. Add Module 2 (5 min) - show business value
3. Cross-module query (2 min) - demonstrate platform power

### For 30-Minute Deep Dives
**Full platform showcase:**
- Module 1 deep dive (10 min)
- Module 2 deep dive (10 min)
- Cross-module intelligence (5 min)
- Architecture & governance discussion (5 min)

---

## 🎯 Key Messages

### Technical Differentiators
✅ **Zero Infrastructure** - No vector databases, no RAG pipelines to deploy  
✅ **Unified Governance** - All data and LLM inference within Snowflake boundary  
✅ **Production Scale** - From 10 to 10,000 users without re-architecture  
✅ **Multi-Domain Intelligence** - Query across any structured + unstructured data

### Business Value
✅ **Time to Value** - Days to production, not months  
✅ **Cost Efficiency** - No $2M AI infrastructure projects  
✅ **Risk Reduction** - No new security attack surfaces  
✅ **Resource Optimization** - Insights for better decision-making

### The "Aha Moment"
> **"Every vendor wants you to bring your data to their AI.  
> Snowflake Intelligence brings AI to where your data already lives—governed, secured, and scaled."**

---

## 🛠️ Customization Guide

### For Different Industries
- **Healthcare:** Replace with patient safety events, clinical protocols
- **Financial Services:** Use fraud cases, compliance procedures
- **Retail:** Order fulfillment issues, logistics procedures
- **Manufacturing:** Quality incidents, production procedures

### For Different Personas
- **CTO:** Emphasize architecture and technical depth
- **CFO:** Focus on cost efficiency and ROI
- **CISO:** Highlight security and governance

---

## 📚 Additional Resources

- **Snowflake Documentation:** [Snowflake Intelligence](https://docs.snowflake.com)
- **Demo Jam Winning Submission:** See `module_1_engineering_operations/docs/`
- **Setup Troubleshooting:** See individual module README files

---

## 🤝 Contributing

To add a new module:
1. Create `module_N_[name]/` directory
2. Follow the structure of existing modules
3. Create module README with use case, personas, queries
4. Update this main README

---

## 📞 Support

For questions or issues:
1. Check module-specific README files
2. Review SETUP_GUIDE.md for common troubleshooting
3. Verify Snowflake Intelligence is enabled in your region

---

## 🏆 Success Story

**Original Demo Jam Feedback:**
- ✅ "Technically impressive AND business-relevant"
- ✅ "Clear competitive differentiation"
- ✅ "Production-ready, not a science experiment"
- ✅ "The 'AI where data lives' message is powerful"

**Now evolved into a comprehensive platform demonstration showcasing Snowflake Intelligence across multiple enterprise use cases.**

---

*Last Updated: 2025-11-03*  
*Version: 2.0 (Multi-Module Platform)*
