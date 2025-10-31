# Demo Jam Quick Reference Card
**Keep this open during your demo!**

---

## 🎯 THE THREE DEMO QUERIES

### Query 1: Structured Data (45 sec)
```
What are the top 5 incident categories by volume this quarter?
```
**While loading, say:** "Cortex Analyst translates natural language to SQL using semantic model..."
**Point to:** "Database Connection Pool Exhausted" at top

---

### Query 2: Unstructured Data (30 sec)
```
Show me what our runbooks say about database connection pool troubleshooting
```
**While loading, say:** "Semantic search across thousands of documents with Cortex Search..."
**Point to:** Runbook title and key mitigation steps

---

### Query 3: THE MAGIC (45 sec)
```
Compare last month's database connection pool incidents with what our runbooks recommend for mitigation
```
**While loading, say:** "Agent orchestrating across BOTH tools automatically..."
**Point to:** Both incident data AND runbook recommendations in unified response

---

## 💬 KEY TALKING POINTS

### Opening Hook (30s)
"Post-mortem meeting after P1... need to know: Have we seen this before? What do runbooks say? Today = hours across Jira, Confluence, Slack. With SI = seconds."

### Four Challenges (45s)
1. **Velocity Crisis** - 30% time searching not building
2. **AI Tax** - $2M, 6-12 months for RAG/vector DB
3. **Security Nightmare** - Every tool = new attack surface
4. **Scale Problem** - Prototypes work, production fails

### Business Impact (45s)
- **Velocity:** Seconds not hours → ship features
- **Cost:** No $2M project, no ML team, pay per use
- **Security:** Never leaves Snowflake, existing RBAC
- **Scale:** 10 to 10,000 users, no re-arch

### THE AHA MOMENT (30s)
**"Every vendor: bring data to their AI.**
**Snowflake: bring AI to where data lives."**

"You tell the board: deployed in days not years, no new team, no new security risks."

---

## ⏱️ TIMING BREAKDOWN

| Section | Time | Action |
|---------|------|--------|
| Opening Hook | 0:30 | Set context |
| Challenges | 0:45 | Build pain |
| Query 1 | 0:45 | Structured demo |
| Query 2 | 0:30 | Unstructured demo |
| Query 3 | 0:45 | Orchestration |
| Impact | 0:45 | Business value |
| Aha Moment | 0:30 | Close strong |
| **TOTAL** | **4:30** | 30s buffer |

---

## 🔥 IF THINGS GO WRONG

**Search slow?** → Do Query 1 first, come back to 2
**Agent down?** → Show direct Cortex Search/Analyst
**UI frozen?** → Walk through expected results
**Network issue?** → Use backup screenshots

**Stay calm. Own it. Keep moving.**

---

## ❓ Q&A QUICK ANSWERS

**"How long to set up?"**
→ 2-3 days with data, hours if data exists

**"Data security?"**
→ Never leaves Snowflake, respects RBAC, no new attack surface

**"Does it scale?"**
→ Fully managed, customers run on terabytes and millions of docs

**"What about hallucinations?"**
→ Semantic model constrains to actual schema, all responses grounded in real data

**"Cost model?"**
→ Pay for: Search storage + query compute + LLM tokens. Pure consumption, no infrastructure.

---

## ✅ PRE-DEMO CHECKLIST

**30 min before:**
- [ ] Snowsight open, logged in
- [ ] Navigate to Snowflake Intelligence
- [ ] Run one test query (warm up)
- [ ] Demo script open
- [ ] Close extra tabs
- [ ] Check internet

**Right before:**
- [ ] Clear chat history
- [ ] Zoom to 125-150%
- [ ] First query ready
- [ ] Deep breath 🧘

---

## 🎯 REMEMBER

**Confidence.** You're solving real problems.

**Clarity.** Executive language, not tech jargon.

**Conviction.** This is production-ready, not a prototype.

**Close Strong.** "AI where your data lives."

---

**You've got this! Go win! 🏆**
