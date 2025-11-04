# Snowflake Intelligence Demo Guide

Complete guide for presenting Snowflake Intelligence demos, including talk tracks, sample queries, and execution scripts.

---

## 📋 Table of Contents

1. [Module 1: Engineering Operations (5-min Demo Jam Script)](#module-1-engineering-operations-5-min-demo-jam)
2. [Module 2: IT Relationship & Value (5-7 min Script)](#module-2-it-relationship--value-5-7-min)
3. [Cross-Module Platform Demo (10-15 min)](#cross-module-platform-demo-10-15-min)
4. [Talk Tracks & Key Messages](#talk-tracks--key-messages)
5. [Sample Queries (Copy-Paste Ready)](#sample-queries-copy-paste-ready)

---

## Module 1: Engineering Operations (5-min Demo Jam)

**Audience:** VP of Engineering, Engineering Managers, SRE Teams  
**Goal:** Win "the demo I would want in front of my customer"  
**Key Message:** Zero infrastructure AI for engineering operations

### Pre-Demo Checklist

- [ ] Module 1 SQL scripts (00-05) executed successfully
- [ ] Semantic model uploaded to @DEMO_STAGE
- [ ] Cortex Search Service active (`SHOW CORTEX SEARCH SERVICES`)
- [ ] Cortex Agent created with engineering_incidents_analyst and engineering_docs_search tools
- [ ] Snowflake Intelligence UI loaded
- [ ] Test query executed to warm up services

### Opening Hook (30 seconds)

**Say:**
> "Picture this: It's the day after a major P1 database incident. You're in the post-mortem meeting and your team needs to understand: 'Have we seen similar database timeout patterns before?' AND 'What do our runbooks say we should have done differently?' Today, that requires digging through Jira, Confluence, old Slack threads, and tribal knowledge—hours of work across fragmented systems. With Snowflake Intelligence, you get both answers in seconds—in plain English."

**Action:** Show Snowflake Intelligence UI (already open)

### The Engineering Challenge (45 seconds)

**Say:**
> "Let me address the challenges I know you're facing:
> 
> - **Engineering Velocity Crisis**: Your teams spend 30% of their time searching for answers across fragmented data silos instead of building features
> - **The AI Infrastructure Tax**: You're being quoted millions and 6-12 months to stand up RAG systems, vector databases, and LLM infrastructure  
> - **Security & Governance Nightmare**: Every external AI tool your team wants to use creates new attack surfaces and compliance reviews for your security team
> - **The Scale Problem**: Prototypes work great in demos, but when you try production-scale AI on your enterprise data, performance collapses
> 
> You're being asked by the board to 'do more with AI' while these four walls are closing in."

**Action:** No screen action, maintain eye contact

### Demo Part 1: Structured Data (45 seconds)

**Say:**
> "Let me show you how Snowflake Intelligence eliminates all four barriers in one integrated platform. I'm going to use your actual incident data and engineering documentation.
>
> First, let me ask a question you might ask during an incident review:"

**Query 1:** (Type into Snowflake Intelligence UI)
```
What are the top 5 incident categories by volume this quarter?
```

**While results load, say:**
> "Watch what happens—no SQL required. Behind the scenes, Cortex Analyst used a YAML semantic model to understand 'incident categories' maps to your INCIDENT_TYPE dimension, translate 'this quarter' to precise date filters, generate optimized SQL that respects all your existing RBAC policies, and execute entirely within Snowflake's governance boundary."

**When results appear:**
- Point to "Database Connection Pool Exhausted" at the top
- "Notice a pattern here - connection pool issues are our most common incident type"

**Say:**
> "The semantic model? It's just a lightweight YAML file that maps your business terms to your data schema. Your analysts can build and maintain it in hours, not months. No ML team required."

### Demo Part 2: Unstructured Data (30 seconds)

**Say:**
> "Now here's the game-changer. Let me ask:"

**Query 2:**
```
Show me what our runbooks say about database connection pool troubleshooting
```

**While results load, say:**
> "I'm now doing semantic search across thousands of your documents—runbooks, postmortems, architecture docs—using Cortex Search Service. This is fully-managed vector search built INTO Snowflake. You don't deploy a separate vector database. You don't move data. You don't manage infrastructure."

**When results appear:**
- Point to the runbook title
- "Here's our actual runbook with the troubleshooting procedures"
- Highlight key recommendation

### Demo Part 3: The Magic - Orchestrated Query (45 seconds)

**Say:**
> "Here's where it gets powerful. Watch this:"

**Query 3:**
```
Compare database connection pool incidents with what our runbooks recommend for mitigation
```

**While results load, say:**
> "The Cortex Agent just orchestrated across BOTH tools automatically:
> - Used Cortex Analyst to query your structured incident metrics
> - Used Cortex Search to pull relevant runbook sections  
> - Synthesized insights combining both sources
> - All in one response, governed by your existing RBAC policies
>
> Your engineers get the answer they need in one query, not bouncing between three different systems."

**When results appear:**
- Point to the comparison showing incidents vs runbook recommendations
- "See how it synthesized both sources? Incidents show we had 12 connection pool issues, and here's what our runbooks say we should do"

### The Business Impact (45 seconds)

**Say:**
> "Let me connect this to what I know matters to you:
> 
> - **Engineering Velocity:** Your teams find answers in seconds, not hours—redirect that 30% time waste directly to shipping features
> - **Cost Efficiency:** No $2M AI infrastructure project. No dedicated ML platform team to hire. You pay only for query compute you actually use
> - **Security & Trust:** Your data and LLM inference never leave Snowflake's governance boundary. Full RBAC integration. Your security team doesn't have to review a new attack surface
> - **Scale Without Complexity:** This same setup handles 10 users or 10,000. You go from prototype to production without re-architecting anything"

### The Winning 'Aha' Moment (15 seconds)

**Say:**
> "Here's the bottom line: **Every vendor wants you to bring your data to their AI. Snowflake Intelligence brings AI to where your data already lives—governed, secured, and scaled.** That's the difference between a 12-month science experiment and a production-ready solution you can deploy next week."

**Action:** Pause for impact, then close with confidence

---

## Module 2: IT Relationship & Value (5-7 min)

**Audience:** CIO, IT Directors, PMO Leaders  
**Goal:** Demonstrate quantifiable IT value and ROI tracking  
**Key Message:** Transform IT from cost center to measurable value driver

### Pre-Demo Checklist

- [ ] Module 2 SQL scripts (01-06) executed successfully
- [ ] Semantic models uploaded (it_support, project_roi)
- [ ] Cortex Agent updated with IT support and ROI analyst tools
- [ ] Sample ROI data loaded (17.5M+ annual value)

### Opening (30 seconds)

**Say:**
> "As a CIO or IT Director, you're constantly asked: 'What's our IT ROI?' 'Why is Healthcare saying IT support is slow?' 'What business value are we getting from that $850K project?'
>
> Today, answering these questions means pulling together spreadsheets, running manual reports, and still ending up with qualitative descriptions instead of quantifiable data. Let me show you how Snowflake Intelligence transforms IT from a cost center into a measurable value driver."

### Demo Part 1: IT Performance Analysis (1.5 min)

**Query 1:**
```
What is the average time-to-resolution for Healthcare IT tickets vs other business units?
```

**While results load, say:**
> "I'm querying our IT support ticket data to compare performance across business units. Healthcare is a critical business unit, so we need to ensure they're getting adequate support."

**When results appear:**
- Point to Healthcare's resolution time
- Compare with other business units
- "Now I can objectively show Healthcare their support performance compared to peers"

**Query 2:**
```
Which business units have the most IT support tickets?
```

**Say:**
> "This helps us optimize resource allocation. If Finance has 3x the ticket volume, maybe they need dedicated IT resources."

### Demo Part 2: Project ROI & Value (2 min)

**Query 3:**
```
What is the average ROI across all IT projects?
```

**When results appear:**
- Point to 3.3:1 average ROI
- "That's 3.3 dollars returned for every dollar invested"

**Query 4:**
```
Show me projects with ROI greater than 3:1 and their expected annual value
```

**Say:**
> "Now I can see which projects are the highest value investments. Notice the Field Service Management project—3.5:1 ROI with $2.95M in annual value."

**Query 5:**
```
Which project metrics are currently at risk?
```

**Say:**
> "This is proactive portfolio management. I can immediately identify metrics that need attention before they become problems. The metrics shown as 'Not Started' or 'At Risk' are where I need to focus leadership attention."

### Demo Part 3: Value Storytelling (1.5 min)

**Query 6:**
```
What is the total projected annual value across all IT projects?
```

**When results appear:**
- "$17.5M+ in projected annual value from our IT project portfolio"

**Say:**
> "Let me show you the power of quantifiable value. Before Snowflake Intelligence, I'd say: 'We're spending $850K on the Field Service Management project to improve operations.' 
>
> Now I can say: 'We're investing $850K to generate $2.95M in annual value—a 3.5:1 ROI—through 30% reduction in mean-time-to-repair, improving equipment uptime from 94% to 98%, and reducing field service errors by 10%. We're already at 25% improvement on MTTR and we've exceeded the error reduction target.'"

**Query 7:**
```
For the Field Service Management project, show me all metrics, their current progress, and business value
```

**When results appear:**
- Point to baseline → current → target progression
- "See how we're tracking from baseline to target with measurable progress"

### The Business Impact (30 seconds)

**Say:**
> "This transforms how IT communicates value:
> 
> - **CFO Budget Reviews:** Quantifiable ROI, not qualitative descriptions
> - **Board Presentations:** $17.5M in value creation, not 'we're improving efficiency'
> - **Business Unit Relationships:** Objective performance data, not anecdotes
> - **Portfolio Management:** Proactive risk identification, not reactive firefighting
>
> And it's all natural language. No SQL. No BI developers. Just questions and answers."

---

## Cross-Module Platform Demo (10-15 min)

**Audience:** Technical executives, large enterprise accounts  
**Goal:** Demonstrate platform power through cross-domain intelligence  
**Key Message:** Unified AI across all enterprise data domains

### Demo Flow

1. **Module 1 Demo** (4 min) - Use script above, shorter version
2. **Module 2 Demo** (4 min) - Use script above, shorter version
3. **The Magic Moment** (2 min) - Cross-module query
4. **Architecture** Discussion (3-5 min) - How it works

### The Magic Cross-Module Query

**Say:**
> "Now here's something no other platform can do. Let me ask a question that spans both engineering operations AND IT performance:"

**Query:**
```
Which business units have both high production incident rates AND slow IT support response times?
```

**While results load, say:**
> "The agent just:
> - Queried incident data from our engineering operations system
> - Queried IT support ticket data from our helpdesk system
> - Correlated by business unit
> - Identified where we have both operational problems AND support challenges
>
> This is cross-domain intelligence. No other vendor can do this in natural language without custom integrations."

**When results appear:**
- Highlight correlation between incidents and IT response
- "This tells us where to focus resources for maximum impact"

### Architecture Discussion

**Key Points:**
1. **Zero Infrastructure:** No vector databases, no RAG pipelines, no model deployment
2. **Unified Governance:** All data stays in Snowflake, RBAC respected everywhere
3. **Production Scale:** Same setup for 10 or 10,000 users
4. **Modular Expansion:** Add new domains (HR, Sales, Finance) without re-architecture

---

## Talk Tracks & Key Messages

### 30-Second Elevator Pitch

> "Snowflake Intelligence lets you query any enterprise data—structured metrics AND unstructured documents—using natural language, with zero infrastructure to deploy, unified governance, and production-ready scale. We just showed you engineering operations and IT value tracking, but you can apply this to any domain in your enterprise. It's AI where your data lives, not where vendors want it to go."

### The "Aha Moment" (Multiple Variations)

**For Technical Audiences:**
> "Every vendor wants you to bring your data to their AI. Snowflake Intelligence brings AI to where your data already lives—governed, secured, and scaled."

**For Business Audiences:**
> "This isn't another 12-month AI experiment. This goes from zero to production in days, not months, and handles 10,000 users with the same setup that handles 10."

**For Security/Compliance:**
> "Your data and every LLM inference never leave Snowflake's governance boundary. Your existing RBAC policies apply automatically. No new attack surfaces for your security team to review."

### Objection Handling

**"We already have a data lake/warehouse"**
> "Perfect—if it's Snowflake, this works on your existing data with zero migration. If it's not, you're about to see why Snowflake's unified approach eliminates the complexity you're dealing with in fragmented systems."

**"We're building our own RAG system"**
> "Let me show you what you don't have to build: vector databases, embedding pipelines, LLM orchestration, semantic caching, security layers, scaling infrastructure. All of that is built-in here. Your team can focus on business logic, not plumbing."

**"What about data security?"**
> "Everything you saw stays within Snowflake. The data never leaves. The LLM inference happens inside Snowflake. Your existing RBAC policies control access. This actually reduces your attack surface compared to external AI tools."

**"How long to production?"**
> "The setup you just saw? Days to production-ready, not months. The semantic models are YAML files your analysts can build. The data doesn't move. You're not waiting on infrastructure deployments."

---

## Sample Queries (Copy-Paste Ready)

### Module 1: Engineering Operations

```
What are the top 5 incident types by volume this quarter?
```

```
Show me critical incidents from last month
```

```
What is the average resolution time for database incidents?
```

```
Show me what our runbooks say about database connection pool troubleshooting
```

```
Search our postmortems for memory leak debugging procedures
```

```
Compare last month's database connection pool incidents with what our runbooks recommend for mitigation
```

```
Show me API timeout incidents and relevant architecture documentation
```

### Module 2: IT Support & Performance

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
What's the average resolution time by ticket type?
```

```
Which IT support teams handle the most tickets?
```

### Module 2: Project ROI & Value

```
What is the average ROI across all IT projects?
```

```
Show me projects with ROI greater than 3:1
```

```
What is the total projected annual value of all IT projects?
```

```
Which project metrics are currently at risk?
```

```
Show me metrics that have already achieved their targets
```

```
What is the total annual business value for Healthcare projects?
```

```
For the Field Service Management project, show me all success metrics and their business value
```

```
Which projects are over budget but still showing strong ROI?
```

### Cross-Module Intelligence

```
Which business units have both high production incident rates AND slow IT support response times?
```

```
Show me IT support tickets created during major production incidents
```

```
Compare Healthcare's production incidents with their IT ticket volume
```

```
Which teams are handling both incidents and IT projects?
```

---

## Presentation Tips

### Before the Demo

1. **Know your audience persona** - Adjust talk track accordingly
2. **Test all queries** - Make sure services are warmed up
3. **Have backup queries** - In case one doesn't return expected results
4. **Practice transitions** - Smooth flow between queries
5. **Prepare for questions** - Know your data and setup

### During the Demo

1. **Type queries slowly** - Let audience read as you type
2. **Narrate while loading** - Never let silence happen
3. **Point to results** - Guide eyes to important data
4. **Connect to business value** - Always explain "so what?"
5. **Maintain eye contact** - Don't just stare at screen

### After the Demo

1. **Pause for impact** - Let the "Aha Moment" sink in
2. **Open for questions** - But stay in control
3. **Offer next steps** - Proof of concept, deeper dive
4. **Leave behind materials** - One-pager, architecture diagram

---

## Demo Variations by Time

### 3-Minute Lightning Demo
- Opening hook (30 sec)
- One structured query (45 sec)
- One unstructured query (30 sec)
- One orchestrated query (45 sec)
- Aha moment (30 sec)

### 5-Minute Demo Jam (Module 1)
- Use full Module 1 script above

### 7-Minute Demo (Module 2)
- Use full Module 2 script above

### 15-Minute Platform Demo
- Module 1 (short version, 4 min)
- Module 2 (short version, 4 min)
- Cross-module query (2 min)
- Architecture (5 min)

### 30-Minute Deep Dive
- Module 1 full (10 min)
- Module 2 full (10 min)
- Cross-module (5 min)
- Architecture + Q&A (5 min)

---

*This demo has been battle-tested and won the Snowflake Internal Demo Jam. Adapt the talk tracks to your style, but keep the core message: AI where your data lives, not where vendors want it to go.*

