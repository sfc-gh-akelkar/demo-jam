-- =====================================================
-- Snowflake Intelligence Demo Jam - Create Cortex Agent
-- =====================================================
-- Purpose: Create and configure Cortex Agent with tools
-- Note: Cortex Agent creation is done via Snowsight UI
-- This file documents the configuration
-- =====================================================

/*
===============================================================
CORTEX AGENT SETUP INSTRUCTIONS
===============================================================

Cortex Agents are created through the Snowsight UI, not SQL.
Follow these steps to create the agent for the demo:

STEP 1: Navigate to Snowflake Intelligence
------------------------------------------------------------
1. In Snowsight, click "AI & ML" in the left navigation
2. Select "Snowflake Intelligence"
3. Click "Create Agent" button

STEP 2: Configure Basic Settings
------------------------------------------------------------
Agent Name: Engineering Operations Agent
Database: DEMO_JAM
Schema: ENGINEERING_OPS
Description: AI agent for engineering operations analysis combining incident metrics and documentation

STEP 3: Add Tools
------------------------------------------------------------

Tool 1: Cortex Analyst (Structured Data)
  - Name: Incident Metrics
  - Type: Cortex Analyst Semantic View
  - Semantic Model: @DEMO_STAGE/incidents_semantic_model.yaml
  - Description: Query incident data, metrics, and trends using natural language
  - Usage: Use this tool for quantitative questions about incidents, 
           resolution times, service reliability, and trend analysis

Tool 2: Cortex Search Service (Unstructured Data)
  - Name: Documentation Search
  - Type: Cortex Search Service
  - Service: ENGINEERING_DOCS_SEARCH
  - Description: Search engineering runbooks, postmortems, and technical documentation
  - Usage: Use this tool for qualitative questions about procedures, 
           best practices, troubleshooting steps, and historical context

STEP 4: Configure Orchestration
------------------------------------------------------------

Orchestration Model: llama3.3-70b (or claude-3-5-sonnet)

Planning Instructions:
"You are an engineering operations assistant helping a VP of Engineering analyze
incidents and access operational knowledge. 

Tool Selection Guidelines:
- Use 'Incident Metrics' for quantitative questions: counts, trends, averages, 
  comparisons, time-based analysis
- Use 'Documentation Search' for qualitative questions: procedures, best practices, 
  troubleshooting steps, root cause examples
- For questions spanning both (e.g., 'Show me connection pool incidents and what 
  our runbook says'), use BOTH tools and synthesize the results

Always cite specific incident IDs when referring to incident data.
Always cite document titles when referencing documentation."

Response Instructions:
"Provide clear, executive-friendly responses with:
1. Direct answer to the question
2. Key supporting data or evidence
3. Actionable insights when appropriate
4. Citations to source data

Keep responses concise but comprehensive. Use bullet points for clarity.
When showing incident patterns, highlight business impact (affected users, downtime).
When referencing procedures, include the key mitigation steps."

System Instructions:
"You are a trusted engineering operations advisor with deep expertise in
incident management, system reliability, and operational best practices.
Your goal is to help engineering leaders make data-driven decisions quickly."

STEP 5: Add Sample Questions
------------------------------------------------------------
Add these sample questions to help users get started:

1. "What are the top 5 incident types by volume this quarter?"
2. "Show me critical incidents from last month and their resolution times"
3. "What does our runbook say about database connection pool troubleshooting?"
4. "Compare connection pool incidents with what our runbooks recommend for mitigation"
5. "Which services have the highest incident rates and what are the common patterns?"
6. "What's the average resolution time for database-related incidents?"
7. "Pull up the postmortem for authentication service incidents"
8. "What are best practices for preventing memory leaks based on our documentation?"

STEP 6: Access Control
------------------------------------------------------------
Grant access to:
- SF_INTELLIGENCE_DEMO role
- Any additional roles that need demo access

STEP 7: Save and Test
------------------------------------------------------------
1. Click "Create Agent"
2. Wait for agent to be provisioned (1-2 minutes)
3. Test with sample questions
4. Verify both tools are being invoked appropriately

===============================================================
*/

-- =====================================================
-- Verification Queries
-- =====================================================

-- After creating agent in UI, verify components:

-- Check semantic model is accessible
SELECT $1 FROM @DEMO_STAGE/incidents_semantic_model.yaml LIMIT 5;

-- Verify Cortex Search Service
SHOW CORTEX SEARCH SERVICES LIKE 'ENGINEERING_DOCS_SEARCH';

-- Test Cortex Search directly
SELECT PARSE_JSON(
    SNOWFLAKE.CORTEX.SEARCH_PREVIEW(
        'ENGINEERING_DOCS_SEARCH',
        '{
            "query": "connection pool best practices",
            "columns": ["TITLE"],
            "limit": 3
        }'
    )
) AS test_result;

-- Verify data is available
SELECT COUNT(*) as incident_count FROM INCIDENTS;
SELECT COUNT(*) as doc_count FROM ENGINEERING_DOCS;

-- Check agent exists (run after creating in UI)
-- Note: Replace 'ENGINEERING_OPERATIONS_AGENT' with your actual agent name
USE ROLE SF_INTELLIGENCE_DEMO;
SHOW CORTEX AGENTS LIKE 'ENGINEERING_OPERATIONS_AGENT';

SELECT 'All components ready for Cortex Agent!' AS status;

-- =====================================================
-- REST API Examples (Alternative to UI)
-- =====================================================

/*
If you prefer to create the agent via REST API:

1. Get your Snowflake account URL and authentication token
2. Use the Cortex Agent REST API (documentation: docs.snowflake.com)

Example API call structure:

POST https://<account>.snowflakecomputing.com/api/v2/databases/DEMO_JAM/schemas/ENGINEERING_OPS/agents

Headers:
  Authorization: Bearer <your_token>
  Content-Type: application/json

Body:
{
  "name": "ENGINEERING_OPERATIONS_AGENT",
  "description": "AI agent for engineering operations analysis",
  "tools": [
    {
      "type": "CORTEX_ANALYST_SEMANTIC_VIEW",
      "name": "incident_metrics",
      "semantic_model_path": "@DEMO_STAGE/incidents_semantic_model.yaml",
      "description": "Query incident metrics and trends"
    },
    {
      "type": "CORTEX_SEARCH_SERVICE",
      "name": "documentation_search",
      "service_name": "ENGINEERING_DOCS_SEARCH",
      "description": "Search engineering documentation"
    }
  ],
  "models": {
    "orchestration": "llama3.3-70b"
  },
  "instructions": {
    "planning": "<planning instructions here>",
    "response": "<response instructions here>",
    "system": "<system instructions here>"
  }
}
*/

