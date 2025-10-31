# Snowflake Intelligence Demo Jam

## 🎯 Quick Start

This is a complete, ready-to-execute demo for the Snowflake Intelligence Demo Jam competition. The demo showcases how a VP of Engineering can use Snowflake Intelligence to analyze both structured incident data AND unstructured documentation using natural language.

**Demo Scenario:** Post-incident analysis combining incident metrics with engineering runbooks - powered by Cortex Analyst, Cortex Search, and Cortex Agent orchestration.

---

## 📁 What's Included

### Core Documents
- **`DEMO_JAM_ONE_PAGER.md`** - Complete strategy, talk track, and winning message
- **`DEMO_SCRIPT.md`** - Word-for-word execution script with timing and Q&A
- **`SETUP_GUIDE.md`** - Step-by-step setup instructions (30-45 min)

### SQL Scripts (Run in Order)
1. **`sql/01_setup_environment.sql`** - Create database, schema, warehouse
2. **`sql/02_create_tables.sql`** - Create tables for incidents and docs
3. **`sql/03_load_incident_data.sql`** - Load 45 realistic incidents
4. **`sql/04_load_documentation.sql`** - Load runbooks and postmortems
5. **`sql/05_create_cortex_search.sql`** - Create search service
6. **`sql/06_upload_semantic_model.sql`** - Upload instructions
7. **`sql/07_create_cortex_agent.sql`** - Agent configuration guide

### Semantic Model
- **`semantic_model/incidents_semantic_model.yaml`** - Cortex Analyst semantic model with business terminology mappings

---

## ⚡ Quick Setup (30-45 minutes)

### Prerequisites
- Snowflake account with ACCOUNTADMIN access
- Cortex features enabled in your region
- Snowflake Intelligence enabled (preview feature)

### Setup Steps

```bash
# 1. Navigate to your Snowsight UI

# 2. Run SQL scripts in order (01 through 05)
#    Copy/paste each script into a worksheet and execute

# 3. Upload semantic model
#    Navigate to: Data → DEMO_JAM → ENGINEERING_OPS → Stages → DEMO_STAGE
#    Upload: semantic_model/incidents_semantic_model.yaml

# 4. Create Cortex Agent via Snowsight UI
#    Follow detailed instructions in sql/07_create_cortex_agent.sql
#    Or see SETUP_GUIDE.md for step-by-step walkthrough

# 5. Test the agent with sample queries
#    Navigate to: AI & ML → Snowflake Intelligence
#    Try: "What are the top 5 incident types by volume this quarter?"
```

**Need help?** See **`SETUP_GUIDE.md`** for detailed instructions with screenshots and troubleshooting.

---

## 🎬 Running the Demo

1. **Before the demo:**
   - Review **`DEMO_JAM_ONE_PAGER.md`** for strategy and key messages
   - Open **`DEMO_SCRIPT.md`** for word-for-word script
   - Warm up services with a test query

2. **During the demo (5 minutes):**
   - Follow the script timing precisely
   - Execute the 3 demo queries in order:
     1. Structured data only (Cortex Analyst)
     2. Unstructured data only (Cortex Search)
     3. Orchestrated query (both tools working together)
   - End with the "Aha Moment" close

3. **Key Message:**
   > "Every vendor is trying to get you to bring your data to their AI. Snowflake Intelligence flips the script: we bring AI to where your data already lives, governed, secured, and scaled."

---

## 🏗️ Architecture Overview

```
┌─────────────────────────────────────────────────────────┐
│         Snowflake Intelligence UI (Snowsight)           │
│              (Natural Language Interface)               │
└────────────────────┬────────────────────────────────────┘
                     │
                     ▼
          ┌──────────────────────┐
          │   Cortex Agent       │
          │  (Orchestration)     │
          │  LLM: llama3.3-70b   │
          └─────────┬────────────┘
                    │
         ┌──────────┴──────────┐
         ▼                     ▼
┌────────────────┐    ┌──────────────────┐
│ Cortex Analyst │    │ Cortex Search    │
│  (Structured)  │    │  (Unstructured)  │
└───────┬────────┘    └────────┬─────────┘
        │                      │
        ▼                      ▼
┌───────────────┐      ┌──────────────────┐
│   INCIDENTS   │      │ ENGINEERING_DOCS │
│    (Table)    │      │     (Table)      │
│   45 rows     │      │   Runbooks &     │
│               │      │   Postmortems    │
└───────────────┘      └──────────────────┘
        ▲                      ▲
        │                      │
        └──────────────────────┘
        Semantic Model YAML
```

---

## 📊 Sample Data Included

### Structured Data: Incidents
- **45 realistic incidents** spanning Q1-Q4 2025
- **10 incident types** including:
  - Database Connection Pool Exhausted (most common)
  - Memory Leak in Background Worker
  - API Gateway Timeout
  - SSL Certificate Expiration
  - Deployment Rollback Required
- **3 severity levels**: Critical, High, Medium
- **10 microservices** affected
- Includes resolution times, affected users, root causes

### Unstructured Data: Documentation
- **Runbooks:**
  - Database Connection Pool Management
  - Service Deployment and Rollback Procedures
  - Memory Leak Detection and Resolution
- **Postmortem:**
  - Authentication Service Connection Pool Incident (January 2025)
- **Architecture Docs:**
  - Database Connection Pooling Architecture

All content is realistic, detailed, and designed to demonstrate semantic search capabilities.

---

## 🎯 Demo Queries (The "Big 3")

### Query 1: Structured Data Analysis
```
What are the top 5 incident categories by volume this quarter?
```
**Demonstrates:** Cortex Analyst translating natural language to SQL

### Query 2: Unstructured Data Search
```
Show me what our runbooks say about database connection pool troubleshooting
```
**Demonstrates:** Cortex Search semantic retrieval across documents

### Query 3: Orchestrated Intelligence (THE MAGIC)
```
Compare last month's database connection pool incidents with what our runbooks recommend for mitigation
```
**Demonstrates:** Cortex Agent orchestrating across both tools and synthesizing insights

---

## 💡 Why This Demo Wins

### 1. Authentic Use Case
Post-incident analysis is a real pain point for VPs of Engineering. This isn't a toy problem.

### 2. Technical Depth
Shows three distinct Cortex capabilities working together:
- Semantic models (Cortex Analyst)
- Vector search (Cortex Search)
- AI orchestration (Cortex Agent)

### 3. Executive-Friendly Message
Speaks to business outcomes (velocity, cost, security, scale) not just technical features.

### 4. The "Aha Moment"
**"AI where your data lives, not where it doesn't"** - A paradigm shift, not incremental improvement.

### 5. Production-Ready
Everything shown can be deployed in days, not months. No custom infrastructure required.

---

## 🔧 Customization Tips

### For Different Industries
- **Financial Services:** Replace incidents with fraud cases, runbooks with compliance procedures
- **Healthcare:** Replace incidents with patient safety events, runbooks with clinical protocols
- **Retail:** Replace incidents with order fulfillment issues, runbooks with logistics procedures

### For Different Personas
- **CTO:** Emphasize technical depth and architecture
- **CFO:** Focus on cost efficiency and ROI
- **CISO:** Highlight security and governance boundaries

### For Different Time Slots
- **3 minutes:** Skip the engineering challenges section, go straight to demo
- **10 minutes:** Add deep dive into semantic model YAML, show agent configuration
- **15 minutes:** Include live agent creation, add more test queries

---

## 📚 File Reference Guide

| File | Purpose | When to Use |
|------|---------|-------------|
| `DEMO_JAM_ONE_PAGER.md` | Strategy & messaging | Read before preparing demo |
| `DEMO_SCRIPT.md` | Execution script | Follow during demo |
| `SETUP_GUIDE.md` | Setup instructions | Follow during setup |
| `README.md` | Overview (this file) | Starting point |
| `sql/01-07_*.sql` | Setup scripts | Run in Snowsight |
| `semantic_model/*.yaml` | Cortex Analyst config | Upload to stage |

---

## ⚠️ Important Notes

### Snowflake Intelligence is Preview
- Feature availability may vary by region
- UI may change slightly between versions
- Some features may require enablement by Snowflake

### Best Practices
- **Practice the demo 2-3 times** before presenting
- **Warm up services** 5-10 minutes before demo
- **Have backup screenshots** in case of connectivity issues
- **Know the Q&A section** in DEMO_SCRIPT.md

### Common Pitfalls to Avoid
- ❌ Don't skip the opening hook - it sets the context
- ❌ Don't get lost in technical details - stay executive-level
- ❌ Don't forget to end with the "Aha Moment"
- ❌ Don't apologize for any UI quirks - own the demo

---

## 🎤 Presenting Tips

### Tone and Delivery
- **Confident, not cocky:** You're solving real problems
- **Consultative, not salesy:** You understand their pain
- **Technical, but accessible:** Show depth without jargon

### Body Language
- Maintain eye contact with judges during talk track
- Point to screen during query results
- Use hand gestures to emphasize "AI where data lives"

### Timing
- Watch the clock but don't rush
- If running over, skip "Business Impact" section
- Always save time for the closing "Aha Moment"

---

## 🚀 Success Checklist

Before you present, confirm:
- [ ] All SQL scripts run successfully
- [ ] Semantic model uploaded to stage
- [ ] Cortex Search Service status is "READY"
- [ ] Cortex Agent responds to test queries
- [ ] Demo queries tested and working
- [ ] DEMO_SCRIPT.md reviewed and rehearsed
- [ ] Backup plan ready (screenshots/video)
- [ ] Confident in Q&A responses

**You've got this! Go win that Demo Jam! 🏆**

---

## 📞 Questions or Issues?

If you encounter setup issues:
1. Check **SETUP_GUIDE.md** troubleshooting section
2. Verify all prerequisites are met
3. Review Snowflake documentation for latest updates
4. Check service status in Snowsight

---

## 📝 Version History

- **v1.0** (2025-10-30) - Initial demo package with complete setup
- Updated opening hook to post-incident review scenario (more authentic)

---

**Demo created for:** Snowflake Intelligence Demo Jam
**Target Audience:** VP of Engineering at Large Enterprise
**Demo Duration:** 5 minutes
**Setup Time:** 30-45 minutes

*Let's show them how the AI Data Cloud wins.* ⚡️

