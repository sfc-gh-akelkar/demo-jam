# Module 2 Semantic Models

## Consolidated Model (Recommended)

**File:** `module_2_semantic_model.yaml`

This is a **unified semantic model** that covers all Module 2 domains:
- ✅ IT Support Tickets (`IT_SUPPORT_TICKETS` table)
- ✅ IT Projects (`IT_PROJECTS` table)
- ✅ Project ROI Metrics (`PROJECT_ROI_METRICS` table)
- ✅ Application Roadmap (`APP_ROADMAP` table)

### Benefits of Consolidation

1. **Single file to manage** - Upload once, maintain one YAML file
2. **Cross-domain queries** - Ask questions spanning support, projects, and ROI
3. **Simpler agent setup** - One semantic model tool instead of multiple
4. **Unified namespace** - Consistent naming and relationships

### Example Queries Enabled

```
What is the average ROI across all IT projects?
```

```
Show me Healthcare's IT support metrics and their active projects
```

```
Which projects have metrics at risk and high support ticket volumes?
```

```
Compare project budgets with their projected annual ROI value
```

### Agent Setup

When creating your Cortex Agent, add ONE tool:

```
Tool Name: it_relationship_analyst
Tool Type: Cortex Analyst
Semantic Model: @DEMO_STAGE/module_2_semantic_model.yaml
Description: Query IT support, projects, ROI metrics, and application roadmap
```

---

## Individual Models (Legacy)

If you need separate semantic models for specific use cases:

### `it_support_semantic_model.yaml`
Covers only IT_SUPPORT_TICKETS table.  
Use when you only need IT support performance queries.

### `project_roi_semantic_model.yaml`
Covers IT_PROJECTS and PROJECT_ROI_METRICS tables.  
Use when you only need project portfolio and ROI queries.

---

## Recommendation

**Use `module_2_semantic_model.yaml`** - It's cleaner, easier to maintain, and enables more powerful cross-domain queries.

The individual models are kept for backward compatibility but the consolidated model is the recommended approach.

---

## Upload Instructions

```bash
# Option 1: Python (from repository root)
python << 'EOF'
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
print("✓ Semantic model uploaded successfully")
EOF

# Option 2: SnowSQL
snowsql -c my_connection -q "
USE DATABASE DEMO_JAM;
USE SCHEMA ENGINEERING_OPS;
PUT file://module_2_it_relationship/semantic_model/module_2_semantic_model.yaml @DEMO_STAGE AUTO_COMPRESS=FALSE OVERWRITE=TRUE;
"

# Option 3: Snowsight UI
# Navigate to Data > Databases > DEMO_JAM > ENGINEERING_OPS > Stages > DEMO_STAGE
# Click "Upload Files" and select module_2_semantic_model.yaml
```

## Verify Upload

```sql
LIST @DEMO_STAGE;
-- Should show module_2_semantic_model.yaml
```

