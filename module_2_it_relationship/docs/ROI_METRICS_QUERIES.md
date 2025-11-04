# Project ROI Metrics - Sample Queries

## 🎯 Overview

The `PROJECT_ROI_METRICS` table enables **quantitative business value tracking** for IT projects. This enhancement separates ROI metrics from project metadata, allowing:

- Multiple success metrics per project
- Baseline → Current → Target progress tracking
- Numeric ROI projections for analytics
- Different metric types (efficiency, cost savings, revenue impact, quality, satisfaction)

---

## 📊 Sample Queries by Category

### Basic ROI Queries

```
What is the total projected ROI across all IT projects?
```

```
Which project has the highest ROI projection?
```

```
Show me all projects with ROI projections greater than $1 million
```

```
What is the average ROI projection by business unit?
```

### Business Value Demonstration (for CIOs)

```
What is the expected business value and ROI of the Field Service Management project?
```

```
Show me the ROI projections for all Healthcare IT projects
```

```
Which projects will deliver cost savings vs revenue impact?
```

```
What is the total expected annual value from all active IT projects?
```

### Success Metrics Tracking

```
Show me all primary success metrics for the Financial Reporting Modernization project
```

```
Which metrics are behind target?
```

```
What is the current progress on Field Service Management success metrics?
```

```
Show me efficiency metrics across all projects
```

### Progress Analysis

```
Which projects are making the most progress toward their targets?
```

```
Show me metrics that have achieved their target values
```

```
What percentage of our projects have measured their success metrics in the last 30 days?
```

### Metric Type Analysis

```
Show me all cost savings metrics and their projected annual savings
```

```
What revenue impact are we expecting from Sales and Marketing projects?
```

```
Show me customer satisfaction metrics for Healthcare projects
```

```
Which projects focus on efficiency improvements?
```

### Executive Dashboard Queries

```
What is our total IT portfolio ROI projection by business unit?
```

```
Show me the top 5 projects by expected business value
```

```
Which projects have more than 3 success metrics defined?
```

```
What percentage of our project value comes from Healthcare initiatives?
```

### Specific Project Deep Dives

```
What are all the success metrics for the Field Service Management project and their current values?
```

```
Show me baseline, current, and target values for the CRM Analytics Enhancement project
```

```
What is the ROI breakdown for the Financial Reporting Modernization project?
```

---

## 🚀 Most Impressive Demo Queries

### 1. Quantitative Business Value
```
What is the expected business value and ROI of the Field Service Management project?
```
**Expected Result:** Multiple metrics showing $2.1M equipment uptime value, $450K productivity gains, $850K MTTR reduction

### 2. Portfolio-Level ROI
```
What is the total projected annual ROI across all IT projects?
```
**Expected Result:** ~$20M+ in total projected value across all projects

### 3. Progress Tracking
```
Show me which Healthcare projects are making progress toward their targets
```
**Expected Result:** Field Service Management at 96.5% uptime (target 98%), showing measurable progress

### 4. ROI by Type
```
Compare cost savings versus revenue impact across our project portfolio
```
**Expected Result:** Shows mix of efficiency (cost reduction) vs. growth (revenue) initiatives

### 5. Metric Accountability
```
Who owns the success metrics for our highest-value projects?
```
**Expected Result:** Shows executive accountability (CMO, CFO, VP Sales, etc.)

---

## 💡 Cross-Table Intelligence Queries

These queries combine ROI metrics with other Module 2 tables:

### ROI + Project Status
```
What is the ROI projection for projects that are currently in progress?
```

### ROI + Budget
```
Which projects have the best ROI projection relative to their budget?
```

### ROI + Business Unit Performance  
```
Compare Healthcare's IT project ROI with their IT support ticket resolution times
```

### ROI + App Roadmap
```
Which application features on our roadmap will deliver the highest business value?
```

---

## 📈 Analytics-Focused Queries

### Metric Progress Calculation
```
What is the average progress percentage across all primary metrics?
```

### ROI Concentration
```
What percentage of our total ROI comes from the top 3 projects?
```

### Measurement Maturity
```
How many projects have monthly vs quarterly vs annual measurement frequency?
```

### Metric Coverage
```
Show me projects that have defined success metrics vs those that don't
```

---

## 🎤 Demo Script Suggestion

### Opening (30 seconds)
> "IT leaders constantly face the question: 'What's the value of our IT investments?' Let me show you how we track quantitative ROI..."

### Query 1: Executive Summary
```
What is the total projected ROI across all IT projects?
```
> "Our current IT portfolio is projected to deliver over $20M in annual value."

### Query 2: Specific Project Value
```
What is the expected business value and ROI of the Field Service Management project?
```
> "For example, the Field Service Management project alone has 4 defined success metrics: equipment uptime improvement worth $2.1M annually, technician productivity gains worth $450K, and customer satisfaction improvements."

### Query 3: Progress Tracking
```
Show me the current progress on Field Service Management success metrics
```
> "And we're not just projecting—we're measuring. Equipment uptime is currently at 96.5%, up from 94% baseline, on our way to 98% target."

### Query 4: Portfolio View
```
What is the total expected annual value from Healthcare IT projects?
```
> "When we look at Healthcare specifically—our most critical business unit—we're projecting over $9M in annual value from telehealth expansion, field service improvements, and compliance automation."

### Closing (15 seconds)
> "This is how we turn IT from a cost center into a strategic value driver—with quantifiable metrics, executive accountability, and progress tracking built into Snowflake Intelligence."

---

## 🔧 Technical Notes

### Data Model Benefits

1. **Normalized Structure**: Separates metrics from projects (one-to-many)
2. **Multiple Metric Types**: efficiency, cost_savings, revenue_impact, quality, satisfaction
3. **Progress Tracking**: baseline → current → target values
4. **Flexible Measurement**: Different units (percent, dollars, hours, days, ratings)
5. **Accountability**: Metric owners tracked

### Metric Progress Formula
```sql
Progress % = ((Current - Baseline) / (Target - Baseline)) * 100
```

This shows what percentage of the journey from baseline to target has been achieved.

---

## 📚 Setup Instructions

### 1. Create Table
```sql
-- Run: module_2_it_relationship/sql/05_create_roi_metrics_table.sql
```

### 2. Load Data
```sql
-- Run: module_2_it_relationship/sql/06_load_roi_metrics_data.sql
```

### 3. Upload Semantic Model
```sql
-- Upload: module_2_it_relationship/semantic_model/project_roi_semantic_model.yaml
-- To: @DEMO_STAGE
```

### 4. Update Cortex Agent
Add a new Cortex Analyst tool:
- **Tool Name:** project_roi_analyst
- **Semantic Model:** @DEMO_STAGE/project_roi_semantic_model.yaml
- **Description:** Query IT project ROI and business value metrics

---

## 🎯 Key Messages for Demos

### For CIOs
- "Demonstrate IT value quantitatively, not anecdotally"
- "Track progress toward business outcomes in real-time"
- "Show ROI before, during, and after project completion"

### For CFOs
- "Every IT dollar tied to measurable business value"
- "$20M+ in projected annual value from current IT portfolio"
- "Cost savings AND revenue impact tracked separately"

### For Board/Executives
- "IT as a strategic value driver, not cost center"
- "Executive accountability for success metrics"
- "Data-driven investment decisions"

---

*This enhancement transforms Module 2 from project tracking to **business value management**.*

