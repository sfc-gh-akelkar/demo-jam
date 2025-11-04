-- =====================================================
-- Module 2: Load IT SLA and Policy Documentation
-- =====================================================
-- Purpose: Load IT policies, SLAs, and governance docs for Cortex Search
-- =====================================================

USE DATABASE DEMO_JAM;
USE SCHEMA ENGINEERING_OPS;
USE WAREHOUSE APP_WH;

-- =====================================================
-- IT SERVICE LEVEL AGREEMENTS (SLAs)
-- =====================================================

INSERT INTO IT_DOCUMENTATION SELECT
'DOC-SLA-001',
'Policy',
'IT Service Level Agreements - Support Ticket Resolution',
'
# IT Service Level Agreement (SLA) - Support Ticket Resolution

## Purpose
This document defines the Service Level Agreements for IT support ticket resolution across all business units.

## Standard Resolution Time Targets by Priority

### Critical Priority
- **Target Resolution:** 4 hours
- **Definition:** System down, business-critical function unavailable, patient care impacted (Healthcare), financial system unavailable
- **Examples:** 
  - Network outage in clinical areas
  - Payment system completely unavailable
  - Security breach or data loss
- **Escalation:** Immediate notification to IT Director and CIO
- **After-hours:** 24/7 support available

### High Priority  
- **Target Resolution:** 24 hours
- **Definition:** Significant business impact, workaround available but not sustainable
- **Examples:**
  - Slow system performance affecting multiple users
  - Access requests for time-sensitive business needs
  - Integration failures between systems
- **Escalation:** If not resolved within 12 hours, escalate to IT Manager
- **After-hours:** On-call support available

### Medium Priority
- **Target Resolution:** 48 hours (2 business days)
- **Definition:** Moderate impact, standard business requests
- **Examples:**
  - Standard access requests
  - Software installation requests
  - Report generation issues
  - Non-critical hardware issues
- **Escalation:** If not resolved within 36 hours, escalate to team lead
- **After-hours:** Next business day

### Low Priority
- **Target Resolution:** 5 business days
- **Definition:** Minimal impact, enhancement requests, questions
- **Examples:**
  - How-to questions
  - Feature requests
  - Documentation updates
  - Training requests
- **Escalation:** If not resolved within 7 days, review with IT Manager
- **After-hours:** Next business day

## Business Unit-Specific SLAs

### Healthcare Premium SLA
Due to patient care implications, Healthcare receives enhanced SLA:
- Critical: 2 hours (50% faster than standard)
- High: 12 hours (50% faster than standard)
- Medium: 24 hours (50% faster than standard)
- Low: 3 business days (40% faster than standard)

**Justification:** Patient safety and care continuity requirements mandate faster IT response times.

### Finance Month-End SLA
During month-end close periods (days 25-5 of each month):
- All Finance tickets elevated by one priority level
- Critical: 2 hours
- High: 12 hours
- Medium: 24 hours

**Justification:** Financial reporting deadlines and regulatory compliance requirements.

## SLA Performance Metrics

### Target Achievement
- 90% of tickets resolved within SLA target
- 95% of Critical tickets resolved within SLA
- Monthly SLA compliance reporting to business unit leaders

### Current Performance (YTD 2025)
- Overall SLA Achievement: 87%
- Healthcare SLA Achievement: 94%
- Finance SLA Achievement: 82%
- Sales SLA Achievement: 76%
- Marketing SLA Achievement: 71%
- HR SLA Achievement: 85%
- Operations SLA Achievement: 79%

## Exclusions and Exceptions

### Out of Scope
- Third-party vendor issues (escalated to vendor)
- User training (separate training SLA applies)
- Hardware procurement lead times (separate procurement SLA)
- Major incidents requiring emergency change (incident management process applies)

### SLA Clock Stops When
- Waiting for user response or information
- Waiting for third-party vendor
- Approved change freeze period
- User requests delayed implementation

## Escalation Matrix

**Level 1:** IT Support Team  
**Level 2:** Senior Support Engineer or Application Support Team  
**Level 3:** IT Manager or Technical Lead  
**Level 4:** IT Director  
**Level 5:** CIO  

## Review and Updates
This SLA document is reviewed quarterly and updated annually or as business needs change.

**Last Review:** January 2025  
**Next Review:** April 2025  
**Owner:** IT Service Management Team  
**Approved By:** CIO
',
NULL, -- No specific business unit (applies to all)
'IT Service Management',
CURRENT_TIMESTAMP(),
CURRENT_TIMESTAMP(),
ARRAY_CONSTRUCT('SLA', 'service-level-agreement', 'resolution-time', 'support', 'priority', 'escalation'),
PARSE_JSON('{"document_type": "policy", "criticality": "high", "review_frequency": "quarterly", "compliance_required": true}');

-- =====================================================
-- IT GOVERNANCE POLICY
-- =====================================================

INSERT INTO IT_DOCUMENTATION SELECT
'DOC-GOV-001',
'Policy',
'IT Project Prioritization and Portfolio Management Framework',
'
# IT Project Prioritization and Portfolio Management Framework

## Purpose
Define the framework for prioritizing IT projects and managing the IT project portfolio to maximize business value and align with strategic objectives.

## Project Intake Process

### Step 1: Request Submission
- Business unit submits project request via IT portal
- Required information:
  - Business problem or opportunity
  - Expected business value (quantified)
  - Success metrics
  - Urgency and timeline
  - Budget estimate
  - Resource requirements

### Step 2: Initial Assessment
- IT PMO reviews within 5 business days
- Validates completeness
- Estimates technical complexity
- Identifies dependencies

### Step 3: Prioritization Scoring
Projects scored on 5-point scale (1-5) across criteria:

**Strategic Alignment (30% weight)**
- Supports corporate strategic initiatives
- Aligns with IT strategic plan
- Regulatory or compliance requirement

**Business Value (30% weight)**
- Quantifiable ROI or cost savings
- Revenue impact
- Efficiency gains
- Customer/employee satisfaction improvement

**Risk & Compliance (20% weight)**
- Security or compliance risk mitigation
- Business continuity impact
- Regulatory deadline

**Feasibility (10% weight)**
- Technical complexity
- Resource availability
- Vendor dependencies
- Timeline reasonableness

**Urgency (10% weight)**
- Time sensitivity
- Competitive pressure
- Market window

### Step 4: Portfolio Review
- Monthly IT Steering Committee reviews prioritized backlog
- Approves new project starts based on:
  - Available budget
  - Resource capacity
  - Strategic priorities
  - Risk balance

## Business Unit Allocation

### Healthcare Projects
- Minimum 30% of IT budget allocated
- Rationale: Patient care, regulatory compliance, clinical safety
- Fast-track process for patient safety-related projects

### Finance Projects
- Minimum 20% of IT budget allocated
- Rationale: Regulatory reporting, audit compliance, financial controls

### Revenue-Generating Units (Sales, Marketing)
- 25% of IT budget allocated
- Prioritize projects with measurable revenue impact

### Support Functions (HR, Operations)
- 15% of IT budget allocated
- Focus on efficiency and cost reduction

### IT Infrastructure & Security
- 10% of budget allocated
- Foundational capabilities, security, technical debt

## Project Success Criteria

### Required Documentation
Every approved project must define:
- Baseline metrics (current state)
- Target metrics (future state)
- Success criteria (how we measure achievement)
- ROI calculation (payback period, annual value)
- Risk assessment and mitigation plan

### Post-Implementation Review
- Conducted 3-6 months after project completion
- Validates actual benefits vs. projected
- Captures lessons learned
- Updates project ROI database

## Resource Capacity Management

### Current IT Capacity
- Development: 25 FTE
- Infrastructure: 12 FTE
- Support: 15 FTE
- PMO: 5 FTE

### Capacity Rules
- No individual assigned >1.2 FTE (max 120% allocation)
- Maintain 10% capacity buffer for urgent issues
- External contractors for peak demand or specialized skills

## Change Request Process

### In-Flight Project Changes
- Scope changes require business unit VP approval
- Budget changes >10% require CFO approval
- Timeline changes >1 month require steering committee review

### Emergency Projects
- CIO can fast-track critical projects
- Must be added to portfolio within 30 days
- Requires retroactive steering committee approval

## Portfolio Health Metrics

### Monthly Reporting
- Active project count and status
- Budget vs. actual spend
- Resource utilization
- On-time/on-budget percentage
- Risk exposure summary

### Quarterly Business Reviews
- Portfolio ROI achievement
- Strategic alignment assessment  
- Capacity planning for next quarter
- Lessons learned and process improvements

**Document Owner:** IT PMO  
**Last Updated:** January 2025  
**Review Frequency:** Semi-annual
',
NULL,
'IT PMO',
CURRENT_TIMESTAMP(),
CURRENT_TIMESTAMP(),
ARRAY_CONSTRUCT('governance', 'project-prioritization', 'portfolio-management', 'resource-allocation', 'budget'),
PARSE_JSON('{"document_type": "framework", "criticality": "high", "review_frequency": "semi-annual"}');

-- =====================================================
-- IT SUPPORT BEST PRACTICES
-- =====================================================

INSERT INTO IT_DOCUMENTATION SELECT
'DOC-GUIDE-001',
'Guide',
'IT Support Ticket Best Practices - For Requestors',
'
# IT Support Ticket Best Practices - For Requestors

## How to Get Faster Resolution

### Provide Complete Information
**Good Ticket:**
"Cannot access Salesforce. Error message: ''Session expired - re-authentication required.'' Tried logging out and back in. Still getting same error. Affects my entire team (5 people). Need access for customer demo at 2pm today."

**Bad Ticket:**
"Salesforce not working. Fix it."

### Include These Details
1. **What are you trying to do?** (Business context)
2. **What is happening?** (Actual behavior)
3. **What should happen?** (Expected behavior)
4. **Error messages** (Exact text or screenshot)
5. **When did it start?** (Timeline)
6. **How many people affected?** (Scope)
7. **Business impact** (Urgency justification)
8. **What you''ve tried** (Troubleshooting steps)

### Choose Correct Priority

**Use CRITICAL only when:**
- System completely unavailable
- Business operations stopped
- Patient care impacted (Healthcare)
- Financial reporting blocked (Finance)
- Security incident or data breach

**Use HIGH when:**
- Significant business impact
- Multiple users affected
- Time-sensitive business need
- Workaround exists but not sustainable

**Use MEDIUM when:**
- Standard business request
- Single user or small team affected
- No immediate business deadline

**Use LOW when:**
- Questions or how-to requests
- Enhancement ideas
- Nice-to-have improvements

### Common Issues and Quick Fixes

**Before Opening a Ticket, Try:**

1. **Application not loading**
   - Clear browser cache and cookies
   - Try different browser
   - Restart computer

2. **Network issues**
   - Check WiFi connection
   - Try wired connection if available
   - Restart network adapter

3. **Access problems**
   - Verify correct username (no typos)
   - Try password reset via self-service portal
   - Check if account is locked (too many attempts)

4. **Slow performance**
   - Close unnecessary applications
   - Check if VPN is connected (if required)
   - Restart application

5. **Email issues**
   - Check spam/junk folder
   - Verify email storage quota
   - Try Outlook web access

### Response Time Expectations

- **Acknowledgment:** All tickets acknowledged within 2 business hours
- **Status Updates:** High/Critical tickets updated every 4 hours
- **Resolution:** See IT SLA document for target resolution times

### How to Check Ticket Status

1. Log into IT portal: itportal.company.com
2. View "My Tickets" dashboard
3. Check ticket for updates and comments
4. Respond promptly to any information requests (clock stops while waiting for your response)

### Escalation Process

**If you need to escalate:**
1. First, respond to any requests for information
2. If resolution time exceeds SLA, contact IT Help Desk directly
3. For critical business impact, email your IT Business Partner
4. For emergency, call IT Help Desk: x5000

### Self-Service Resources

**Many requests can be completed via self-service:**
- Password resets
- Software installation from catalog
- Access request forms
- VPN setup instructions
- Email signature templates
- Calendar sharing settings

**Self-Service Portal:** selfservice.company.com

**Document Owner:** IT Service Management  
**Last Updated:** January 2025
',
NULL,
'IT Service Management',
CURRENT_TIMESTAMP(),
CURRENT_TIMESTAMP(),
ARRAY_CONSTRUCT('best-practices', 'support', 'tickets', 'how-to', 'user-guide'),
PARSE_JSON('{"document_type": "guide", "audience": "end-users", "criticality": "medium"}');

-- =====================================================
-- ROI MEASUREMENT FRAMEWORK
-- =====================================================

INSERT INTO IT_DOCUMENTATION SELECT
'DOC-FRAME-001',
'Framework',
'IT Project ROI Measurement and Tracking Framework',
'
# IT Project ROI Measurement and Tracking Framework

## Purpose
Standardize how we measure, track, and report IT project return on investment (ROI) to demonstrate business value.

## ROI Calculation Methodology

### Standard ROI Formula
```
ROI = (Total Benefits - Total Costs) / Total Costs × 100

ROI Multiple = Total Benefits / Total Costs
```

**Example:**
- Project Cost: $500K
- Annual Benefits: $1.75M over 3 years
- ROI = ($1.75M - $500K) / $500K = 250% or 3.5:1 ROI Multiple

### Benefits Categories

#### 1. Cost Reduction (Hard Savings)
- Labor cost savings (FTE reduction or redeployment)
- Software license cost reduction
- Infrastructure cost reduction
- Operational expense reduction

#### 2. Cost Avoidance (Soft Savings)
- Prevented additional headcount
- Avoided system upgrade costs
- Reduced risk/penalty costs
- Efficiency gains (time savings)

#### 3. Revenue Impact
- Revenue increase from new capabilities
- Revenue protection from retention
- Faster time to market

#### 4. Quality Improvements
- Error reduction
- Improved accuracy
- Better customer satisfaction
- Compliance achievement

### Measurement Types

**Quantitative Metrics (Preferred)**
- Measurable in dollars, time, or percentages
- Example: "Reduce processing time from 4 hours to 1 hour"
- Example: "Increase conversion rate from 15% to 22%"

**Qualitative Metrics (Supporting)**  
- Customer satisfaction scores
- Employee productivity ratings
- Strategic capability enablement

## Baseline Measurement

### Required Before Project Start
1. **Current State Metrics**
   - Document baseline performance
   - Measure over sufficient period (minimum 3 months)
   - Validate data accuracy

2. **Target State Metrics**
   - Define specific, measurable targets
   - Set realistic but ambitious goals
   - Align with business objectives

3. **Success Criteria**
   - Define what "success" means (not just completion)
   - Include multiple measures when appropriate
   - Set minimum acceptable threshold

## Progress Tracking

### During Project (In-Flight Metrics)
- Milestone achievement
- Budget adherence
- Timeline performance
- Risk status
- Scope changes

### Post-Implementation (Benefits Realization)

**Month 1-3:** Early indicators
- System adoption rates
- User satisfaction scores
- Process compliance
- Technical performance metrics

**Month 3-6:** Initial benefits measurement
- First measurement of target metrics
- Compare to baseline
- Identify gaps and corrective actions

**Month 6-12:** Stabilized benefits
- Full benefit realization expected
- Sustained performance verification
- Lessons learned capture

**Annual Review:** Ongoing value
- Multi-year benefits tracking
- ROI recalculation with actuals
- Portfolio analytics

## Metric Status Classification

### On Track
- Progress ≥90% of target trajectory
- No significant blockers
- Expected to achieve target on time

### At Risk  
- Progress <90% of target trajectory
- Identifiable blockers or issues
- May miss target without intervention

### Not Started
- Project approved but not yet begun implementation
- Baseline measured but target state not yet deployed

### Achieved
- Target metric met or exceeded
- Sustained for minimum 3 months
- Documented and validated

## Reporting Requirements

### Monthly Project Status
- Current performance vs. target
- Issues and mitigation plans
- Budget and timeline status

### Quarterly Business Review
- Portfolio-level ROI achievement
- Projects on track vs. at risk
- Benefits realization summary
- Resource utilization

### Annual Portfolio Assessment
- Total IT investment vs. business value delivered
- Average ROI across portfolio
- Project success rate
- Strategic impact assessment

## Example Metric Definitions

### Field Service Management Project

**Metric 1: Reduce Mean Time to Repair (MTTR)**
- Baseline: 240 minutes average
- Target: 168 minutes (30% reduction)
- Measurement: Average time from dispatch to repair completion
- Data Source: Field service management system
- Frequency: Weekly average, reported monthly
- Success: Achieve <180 minutes sustained for 3 months

**Metric 2: Equipment Uptime**
- Baseline: 94% availability
- Target: 98% availability  
- Measurement: Hours operational / total hours
- Data Source: Equipment monitoring system
- Frequency: Daily measurement, weekly reporting
- Success: Achieve ≥97.5% sustained for 3 months

**Metric 3: First-Time Fix Rate**
- Baseline: 85% of service calls
- Target: 93% of service calls (10% improvement)
- Measurement: Service calls completed without return visit
- Data Source: Service completion records
- Frequency: Weekly measurement, monthly reporting
- Success: Achieve ≥92% sustained for 3 months

## Common Pitfalls to Avoid

1. **Overestimating Benefits**
   - Use conservative estimates
   - Validate assumptions with business units
   - Don''t double-count benefits

2. **Underestimating Costs**
   - Include ongoing support costs
   - Factor in training and change management
   - Account for opportunity cost

3. **Ignoring Soft Costs**
   - User time for training
   - Productivity dip during transition
   - Change fatigue on organization

4. **Measuring Too Early**
   - Allow time for adoption
   - Wait for process stabilization
   - Don''t declare victory prematurely

## Governance and Accountability

**Project Sponsor:** Accountable for benefits realization  
**IT PMO:** Responsible for tracking and reporting  
**Finance:** Validates financial calculations  
**Business Unit Leaders:** Provide operational metrics

**Document Owner:** IT PMO  
**Last Updated:** January 2025  
**Review Frequency:** Annual
',
NULL,
'IT PMO',
CURRENT_TIMESTAMP(),
CURRENT_TIMESTAMP(),
ARRAY_CONSTRUCT('ROI', 'measurement', 'metrics', 'business-value', 'framework', 'benefits-realization'),
PARSE_JSON('{"document_type": "framework", "criticality": "high", "review_frequency": "annual"}');

-- Verify documentation loaded
SELECT 
    DOC_TYPE,
    COUNT(*) AS doc_count,
    COUNT(DISTINCT BUSINESS_UNIT) AS business_units_covered
FROM IT_DOCUMENTATION
GROUP BY DOC_TYPE
ORDER BY doc_count DESC;

SELECT 'IT documentation loaded successfully!' AS status;

