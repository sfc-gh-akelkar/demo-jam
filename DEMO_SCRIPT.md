# Snowflake Intelligence Demo Jam - Execution Script

## Pre-Demo Setup Checklist

Before starting the demo, ensure:
- [ ] All SQL scripts 01-07 have been run successfully
- [ ] Semantic model uploaded to stage
- [ ] Cortex Search Service is active (check: `SHOW CORTEX SEARCH SERVICES`)
- [ ] Cortex Agent created in Snowsight UI
- [ ] Snowflake Intelligence UI loaded and ready
- [ ] Test query executed to warm up services
- [ ] Browser tab with one-pager plan open for reference

---

## Demo Flow (5 Minutes Total)

### Opening Hook (30 seconds)
**Say:**
> "Picture this: It's the day after a major P1 incident. You're in the post-mortem meeting and your team needs to understand: 'Have we seen similar database timeout patterns before?' AND 'What do our runbooks say we should have done differently?' Today, that requires digging through Jira, Confluence, old Slack threads, and tribal knowledge—hours of work across fragmented systems. With Snowflake Intelligence, you get both answers in seconds—in plain English."

**Action:** Show Snowflake Intelligence UI (already open)

---

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

**Action:** No screen action, maintain eye contact with judges

---

### Demo Part 1: Structured Data with Cortex Analyst (45 seconds)

**Say:**
> "Let me show you how Snowflake Intelligence eliminates all four barriers in one integrated platform. I'm going to use your actual incident data and engineering documentation.
>
> First, let me ask a question you might ask during an incident review:"

**Query 1:**
```
What are the top 5 incident categories by volume this quarter?
```

**Type and hit enter, then while results load, say:**
> "Watch what happens—no SQL required. Behind the scenes, Cortex Analyst used a YAML semantic model to understand 'incident categories' maps to your INCIDENT_TYPE dimension, translate 'this quarter' to precise date filters, generate optimized SQL that respects all your existing RBAC policies, and execute entirely within Snowflake's governance boundary."

**When results appear, highlight:**
- Point to "Database Connection Pool Exhausted" at the top
- "Notice a pattern here - connection pool issues are our most common incident type"

**Say:**
> "The semantic model? It's just a lightweight YAML file that maps your business terms to your data schema. Your analysts can build and maintain it in hours, not months. No ML team required."

---

### Demo Part 2: Unstructured Data with Cortex Search (30 seconds)

**Say:**
> "Now here's the game-changer. Let me ask:"

**Query 2:**
```
Show me what our runbooks say about database connection pool troubleshooting
```

**Type and hit enter, then while results load, say:**
> "I'm now doing semantic search across thousands of your documents—runbooks, postmortems, architecture docs—using Cortex Search Service. This is fully-managed vector search built INTO Snowflake. You don't deploy a separate vector database. You don't move data. You don't manage infrastructure."

**When results appear, highlight:**
- Point to the runbook title that appears
- "Here's our actual runbook with the troubleshooting procedures"
- Click to expand content (if UI supports) or read key point: "Immediate mitigation: increase pool size, restart instances, identify slow queries"

---

### Demo Part 3: The Magic - Orchestrated Query (45 seconds)

**Say:**
> "Here's where it gets powerful. Watch this:"

**Query 3:**
```
Compare last month's database connection pool incidents with what our runbooks recommend for mitigation
```

**Type and hit enter, then while results load, say:**
> "The Cortex Agent just orchestrated across BOTH tools automatically:
> - Used Cortex Analyst to query your structured incident metrics
> - Used Cortex Search to pull relevant runbook sections  
> - Synthesized insights combining both sources
> - All in one response, governed by your existing RBAC policies
>
> Your engineers get the answer they need in one query, not bouncing between three different systems."

**When results appear, highlight:**
- Point to incident data section (dates, resolution times)
- Point to runbook recommendations section
- "Notice it's giving me both the historical data AND the operational procedures in one unified response"

**Say:**
> "Notice what you didn't have to build. No Kubernetes clusters. No vector databases. No model deployment pipelines. No 6-month ML platform project. This goes from zero to production-ready in days. It automatically scales from 10 queries to 10 million. Your existing Snowflake warehouse handles compute—you pay only for what you use."

---

### Business Impact (45 seconds)

**Say:**
> "Let me connect this to what I know matters to you:
> 
> - **Engineering Velocity**: Your teams find answers in seconds, not hours—redirect that 30% time waste directly to shipping features
> - **Cost Efficiency**: No $2M AI infrastructure project. No dedicated ML platform team to hire. You pay only for query compute you actually use
> - **Security & Trust**: Your data and LLM inference never leave Snowflake's governance boundary. Full RBAC integration. Your security team doesn't have to review a new attack surface
> - **Scale Without Complexity**: This same setup handles 10 users or 10,000. You go from prototype to production without re-architecting anything"

**Action:** Can quickly show one more query if time permits, or move to close

---

### The Winning Close - "Aha Moment" (30 seconds)

**Say:**
> "Here's what makes this a game-changer: **Every vendor is trying to get you to bring your data to their AI—moving data to vector stores, deploying inference servers, building RAG pipelines. Snowflake Intelligence flips the script: we bring AI to where your data already lives, governed, secured, and scaled.**
>
> You can walk into your next board meeting and say: 'We deployed enterprise AI in days, not years, without hiring a specialized team or creating new security risks.' That's the advantage of the AI Data Cloud. That's how you win the AI race without burning your resources on infrastructure that doesn't differentiate you."

**Action:** Pause for effect, make eye contact with judges

---

## Backup Queries (If Time Allows or Q&A)

### Additional Demo Queries:

**Query 4:** (Trend analysis)
```
Show me the trend of critical incidents over the last 6 months
```

**Query 5:** (Service reliability)
```
Which services had the most incidents this quarter and what's the average resolution time?
```

**Query 6:** (Documentation search)
```
What does our postmortem say about the authentication service incident in January?
```

**Query 7:** (Complex orchestration)
```
What are our most common incident root causes and what do our runbooks say about preventing them?
```

---

## Handling Q&A

### Expected Questions and Answers:

**Q: "How long does it take to set this up?"**
A: "For this demo setup with real data, about 2-3 days. If you already have data in Snowflake, creating the semantic model and Cortex Search Service can be done in hours. The agent configuration itself takes about 30 minutes."

**Q: "What about data governance and security?"**
A: "Everything runs within Snowflake's governance boundary. The agent respects all existing RBAC policies—users only see data they have access to. LLM inference happens on Snowflake-hosted models by default, so no data leaves the platform. You can audit all agent interactions through Snowflake's query history."

**Q: "Can this scale to our real production data volume?"**
A: "Absolutely. Cortex Search and Cortex Analyst are fully managed services that scale automatically. We have customers running this on terabytes of structured data and millions of documents. The agent orchestration is stateless and horizontally scalable."

**Q: "What if the LLM hallucinates or gives wrong answers?"**
A: "Great question. The semantic model constrains Cortex Analyst to only generate SQL based on your actual schema—it can't invent tables or columns. All responses are grounded in your real data. You can also use the Verified Query Repository to provide example Q&A pairs that improve accuracy. And every response shows citations back to source data."

**Q: "Can we customize the agent behavior?"**
A: "Yes, extensively. You control the orchestration instructions, response formatting, tool selection logic, and can even add custom tools using Snowflake functions or stored procedures. You can also specify different LLMs for orchestration based on your needs."

**Q: "What's the cost model?"**
A: "You pay for three things: 1) Cortex Search storage and compute (per GB indexed), 2) Cortex Analyst query execution on your warehouse, and 3) LLM inference tokens for the agent orchestration. No fixed infrastructure costs. It's pure consumption-based pricing aligned with actual usage."

---

## Technical Details (For Deep Dives)

### Architecture Components:

1. **Structured Data Layer**
   - Table: `DEMO_JAM.ENGINEERING_OPS.INCIDENTS`
   - Semantic Model: `@DEMO_STAGE/incidents_semantic_model.yaml`
   - Cortex Analyst translates natural language → SQL → Results

2. **Unstructured Data Layer**
   - Table: `DEMO_JAM.ENGINEERING_OPS.ENGINEERING_DOCS`
   - Cortex Search Service: `ENGINEERING_DOCS_SEARCH`
   - Hybrid search: Vector embeddings + keyword + semantic reranking

3. **Orchestration Layer**
   - Cortex Agent: Coordinates between tools
   - LLM: llama3.3-70b (or claude-3-5-sonnet)
   - Planning instructions guide tool selection
   - Response instructions format output

4. **User Interface**
   - Snowflake Intelligence UI (Snowsight)
   - Natural language input
   - Threaded conversations with context
   - Visual charts for metrics

---

## Demo Recovery (If Something Goes Wrong)

### If Search Service is slow:
- "The search service is indexing - let me show you the structured data query first"
- Skip to Query 1 (Cortex Analyst only)

### If Agent isn't responding:
- Fall back to direct Cortex Search or Cortex Analyst calls
- "Let me show you the underlying tools that power the agent"

### If UI is unresponsive:
- Have screenshots ready as backup
- Walk through the expected results verbally
- Emphasize the architecture and value prop

### Connection/Network Issues:
- Switch to pre-recorded demo video (have ready as backup)
- "While that loads, let me explain what you would see..."

---

## Post-Demo Follow-Up

After the demo, offer:
1. SQL scripts and semantic model files for their own testing
2. Architecture diagram of the solution
3. Cost estimation template based on their data volume
4. Reference customer stories (if available)
5. POC engagement with Snowflake SA team

**End with confidence**: "This is production-ready, not a science experiment. You can have your team testing this in Snowflake this week."

---

## Success Metrics

Judges should walk away thinking:
✓ "That was technically impressive"
✓ "That solves a real customer pain point"  
✓ "I could see this winning a deal"
✓ "The messaging was crisp and executive-friendly"
✓ "I want to demo this to my customers"

**Key Phrase to Leave With Judges:**
> "AI where your data lives, not where it doesn't"

