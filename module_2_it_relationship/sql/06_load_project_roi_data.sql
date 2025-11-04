-- =====================================================
-- Module 2 Enhancement: Load Project ROI Metrics Data
-- =====================================================
-- Purpose: Load detailed ROI metrics for IT projects
-- =====================================================

USE DATABASE DEMO_JAM;
USE SCHEMA ENGINEERING_OPS;
USE WAREHOUSE APP_WH;

-- =====================================================
-- PRJ-HC-001: Field Service Management System
-- =====================================================

INSERT INTO PROJECT_ROI_METRICS SELECT
'METRIC-HC-001-001',
'PRJ-HC-001',
'Reduce Mean-Time-To-Repair (MTTR)',
'Efficiency Gain',
'Operational',
30.00, 'percent',
240.00, 180.00, -- Baseline 240 min, Current 180 min (25% reduction so far)
'2025-06-30',
'On Track',
'Reduce average equipment repair time from 4 hours to 2.8 hours, improving patient care continuity and equipment availability.',
3.5, 2100000.00,
'Monthly',
'Field Service Operations Manager',
'Ahead of target - mobile technician app reducing diagnostic time significantly',
CURRENT_DATE(), CURRENT_DATE();

INSERT INTO PROJECT_ROI_METRICS SELECT
'METRIC-HC-001-002',
'PRJ-HC-001',
'Improve Equipment Uptime',
'Quality Improvement',
'Operational',
98.00, 'percent',
94.00, 96.50,
'2025-06-30',
'On Track',
'Increase medical equipment uptime from 94% to 98%, reducing patient care disruptions.',
NULL, 850000.00,
'Monthly',
'Clinical Engineering Director',
'Proactive maintenance alerts working well',
CURRENT_DATE(), CURRENT_DATE();

INSERT INTO PROJECT_ROI_METRICS SELECT
'METRIC-HC-001-003',
'PRJ-HC-001',
'Reduce Field Service Errors',
'Quality Improvement',
'Customer',
10.00, 'percent',
8.50, 7.20,
'2025-06-30',
'Achieved',
'Reduce incorrect parts or repeat visits from 8.5% to 7.65% (10% reduction) through better diagnostic tools.',
NULL, NULL,
'Quarterly',
'Field Service Quality Lead',
'Already exceeded target - mobile app providing better diagnostic information',
CURRENT_DATE(), CURRENT_DATE();

-- =====================================================
-- PRJ-HC-002: Telehealth Platform Expansion
-- =====================================================

INSERT INTO PROJECT_ROI_METRICS SELECT
'METRIC-HC-002-001',
'PRJ-HC-002',
'Increase Telehealth Visit Capacity',
'Efficiency Gain',
'Operational',
1000.00, 'percent',
50.00, 50.00, -- From 50 to 500 concurrent sessions
'2026-03-31',
'Not Started',
'Expand from 50 to 500 concurrent video sessions to support rural expansion strategy.',
2.8, 1500000.00,
'Quarterly',
'Telehealth Program Director',
'Infrastructure planning in progress',
CURRENT_DATE(), CURRENT_DATE();

INSERT INTO PROJECT_ROI_METRICS SELECT
'METRIC-HC-002-002',
'PRJ-HC-002',
'Reduce Cost Per Patient Visit',
'Cost Reduction',
'Financial',
40.00, 'percent',
150.00, 150.00, -- From $150 to $90 per visit
'2026-03-31',
'Not Started',
'Reduce average cost per patient encounter by 40% through telehealth vs. in-person visits.',
NULL, 3600000.00,
'Monthly',
'Finance Director - Healthcare',
'Cost model validated, awaiting implementation',
CURRENT_DATE(), CURRENT_DATE();

-- =====================================================
-- PRJ-FIN-001: Financial Reporting Modernization
-- =====================================================

INSERT INTO PROJECT_ROI_METRICS SELECT
'METRIC-FIN-001-001',
'PRJ-FIN-001',
'Reduce Month-End Close Time',
'Efficiency Gain',
'Operational',
70.00, 'percent',
10.00, 5.00, -- From 10 days to 3 days (currently at 5)
'2025-05-31',
'On Track',
'Reduce financial close process from 10 days to 3 days, enabling faster business decisions.',
4.2, 850000.00,
'Monthly',
'Controller',
'Phase 1 complete - already at 5 days, targeting 3 days by completion',
CURRENT_DATE(), CURRENT_DATE();

INSERT INTO PROJECT_ROI_METRICS SELECT
'METRIC-FIN-001-002',
'PRJ-FIN-001',
'Enable Self-Service Reporting',
'Efficiency Gain',
'Employee',
90.00, 'percent',
10.00, 65.00, -- Target 90% of reports self-service
'2025-05-31',
'On Track',
'Enable business users to create 90% of reports without IT/Finance support.',
NULL, 425000.00,
'Quarterly',
'Business Intelligence Manager',
'User adoption strong - 65% of reports now self-service',
CURRENT_DATE(), CURRENT_DATE();

-- =====================================================
-- PRJ-SAL-001: CRM Analytics Enhancement
-- =====================================================

INSERT INTO PROJECT_ROI_METRICS SELECT
'METRIC-SAL-001-001',
'PRJ-SAL-001',
'Improve Sales Forecast Accuracy',
'Quality Improvement',
'Financial',
30.77, 'percent',
65.00, 72.00, -- From 65% to 85% (currently 72%)
'2025-09-30',
'On Track',
'Improve forecast accuracy from 65% to 85% through AI-powered predictive analytics.',
3.0, 1200000.00,
'Monthly',
'VP Sales Operations',
'ML models showing 72% accuracy in testing, confident we will hit 85%',
CURRENT_DATE(), CURRENT_DATE();

INSERT INTO PROJECT_ROI_METRICS SELECT
'METRIC-SAL-001-002',
'PRJ-SAL-001',
'Increase Pipeline Conversion Rate',
'Revenue Increase',
'Financial',
15.00, 'percent',
22.00, 23.50,
'2025-09-30',
'On Track',
'Improve lead-to-opportunity conversion from 22% to 25.3% through better lead scoring.',
NULL, 850000.00,
'Monthly',
'Director of Sales',
'Early results positive - conversion trending up',
CURRENT_DATE(), CURRENT_DATE();

-- =====================================================
-- PRJ-OPS-001: Supply Chain Visibility Platform
-- =====================================================

INSERT INTO PROJECT_ROI_METRICS SELECT
'METRIC-OPS-001-001',
'PRJ-OPS-001',
'Reduce Inventory Carrying Costs',
'Cost Reduction',
'Financial',
20.00, 'percent',
15000000.00, 15000000.00, -- From $15M to $12M
'2026-06-30',
'Not Started',
'Reduce inventory carrying costs by 20% through better demand forecasting and real-time visibility.',
2.5, 3000000.00,
'Quarterly',
'VP Supply Chain',
'ROI case approved, implementation starting Q2 2025',
CURRENT_DATE(), CURRENT_DATE();

INSERT INTO PROJECT_ROI_METRICS SELECT
'METRIC-OPS-001-002',
'PRJ-OPS-001',
'Reduce Stock-Out Rate',
'Quality Improvement',
'Customer',
75.00, 'percent',
8.00, 8.00, -- From 8% to 2% stock-outs
'2026-06-30',
'Not Started',
'Reduce stock-outs from 8% to 2%, improving customer satisfaction and revenue.',
NULL, 2500000.00,
'Monthly',
'Director of Inventory Management',
'Critical metric for customer experience',
CURRENT_DATE(), CURRENT_DATE();

-- =====================================================
-- PRJ-MKT-001: Marketing Automation Platform
-- =====================================================

INSERT INTO PROJECT_ROI_METRICS SELECT
'METRIC-MKT-001-001',
'PRJ-MKT-001',
'Increase Marketing Qualified Leads',
'Revenue Increase',
'Financial',
40.00, 'percent',
1000.00, 1250.00, -- From 1000 to 1400 MQLs/month
'2025-07-31',
'On Track',
'Increase monthly MQLs from 1,000 to 1,400 through automated nurturing campaigns.',
3.5, 950000.00,
'Monthly',
'VP Marketing',
'Currently at 1,250 MQLs/month - 62% of way to target',
CURRENT_DATE(), CURRENT_DATE();

INSERT INTO PROJECT_ROI_METRICS SELECT
'METRIC-MKT-001-002',
'PRJ-MKT-001',
'Reduce Cost Per Lead',
'Cost Reduction',
'Financial',
25.00, 'percent',
125.00, 110.00, -- From $125 to $93.75
'2025-07-31',
'On Track',
'Reduce average cost per lead by 25% through campaign optimization and automation.',
NULL, 485000.00,
'Monthly',
'Marketing Operations Director',
'Cost per lead trending down nicely',
CURRENT_DATE(), CURRENT_DATE();

-- Verify ROI data
SELECT 
    p.PROJECT_NAME,
    p.BUSINESS_UNIT,
    COUNT(m.METRIC_ID) AS metric_count,
    AVG(m.ROI_PROJECTION_MULTIPLE) AS avg_roi_multiple,
    SUM(m.ROI_PROJECTION_ANNUAL_VALUE) AS total_annual_value
FROM IT_PROJECTS p
LEFT JOIN PROJECT_ROI_METRICS m ON p.PROJECT_ID = m.PROJECT_ID
GROUP BY p.PROJECT_NAME, p.BUSINESS_UNIT
ORDER BY total_annual_value DESC;

SELECT 'Project ROI metrics data loaded successfully!' AS status;

