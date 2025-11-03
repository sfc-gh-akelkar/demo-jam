-- =====================================================
-- Module 2: Load Application Roadmap Data
-- =====================================================
-- Purpose: Load application feature roadmap for business communication
-- =====================================================

USE DATABASE DEMO_JAM;
USE SCHEMA ENGINEERING_OPS;
USE WAREHOUSE APP_WH;

-- CRM (Salesforce) Roadmap
INSERT INTO APP_ROADMAP SELECT
'RDMP-CRM-001', 'Salesforce CRM', 'Customer Relationship Management',
'AI-Powered Lead Scoring', 
'Implement machine learning model to automatically score and prioritize leads based on historical conversion data, engagement patterns, and firmographic data.',
'Analytics & AI', 'Q1 2026', '2026-03-15', NULL,
'Expected to improve lead conversion rates by 20% and reduce sales cycle time by 15%. Sales team can focus on highest-value opportunities.',
'Sales', 'Planned', 'High', 'CRM Development Team', 45,
'Requires: Data quality improvement project (PRJ-SAL-001), Integration with marketing automation platform';

INSERT INTO APP_ROADMAP SELECT
'RDMP-CRM-002', 'Salesforce CRM', 'Customer Relationship Management',
'Mobile Offline Mode',
'Enable sales reps to access and update CRM data while offline. Automatic sync when connection restored.',
'Mobile Experience', 'Q2 2026', '2026-06-30', NULL,
'Critical for field sales team. Enable productivity during travel and in locations with poor connectivity. Expected to increase mobile CRM usage by 40%.',
'Sales', 'Planned', 'High', 'CRM Development Team', 30,
'Requires: Mobile app architecture review, Conflict resolution strategy';

INSERT INTO APP_ROADMAP SELECT
'RDMP-CRM-003', 'Salesforce CRM', 'Customer Relationship Management',
'Customer Health Scoring Dashboard',
'Executive dashboard showing customer health metrics, renewal risk, and expansion opportunities across portfolio.',
'Reporting & Analytics', 'Q1 2026', '2026-02-28', NULL,
'Provide C-suite visibility into customer base health. Enable proactive account management. Reduce churn by 10%.',
'Sales', 'In Development', 'High', 'CRM Development Team', 25,
'Requires: Integration with customer support system, Financial data integration';

-- ERP (SAP) Roadmap
INSERT INTO APP_ROADMAP SELECT
'RDMP-ERP-001', 'SAP ERP', 'Enterprise Resource Planning',
'Real-Time Financial Reporting',
'Replace batch-based financial reporting with real-time dashboards. Enable instant access to P&L, balance sheet, and cash flow.',
'Financial Management', 'Q3 2026', '2026-09-30', NULL,
'Reduce financial close time from 10 days to 3 days. Enable faster business decision-making with real-time financial visibility.',
'Finance', 'Planned', 'High', 'ERP Development Team', 60,
'Requires: PRJ-FIN-001 completion, Database performance optimization';

INSERT INTO APP_ROADMAP SELECT
'RDMP-ERP-002', 'SAP ERP', 'Enterprise Resource Planning',
'Automated Expense Approval Workflows',
'AI-powered expense policy enforcement and automated approval routing based on business rules.',
'Expense Management', 'Q2 2026', '2026-05-31', NULL,
'Reduce expense processing time by 50%. Improve policy compliance. Reduce manual review workload by 60%.',
'Finance', 'In Development', 'Medium', 'ERP Development Team', 35,
'Requires: PRJ-FIN-002 completion, Policy engine configuration';

-- EMR (Electronic Medical Records) Roadmap
INSERT INTO APP_ROADMAP SELECT
'RDMP-EMR-001', 'Epic EMR', 'Electronic Medical Records',
'Patient Portal Telemedicine Integration',
'Enable patients to initiate telemedicine visits directly from patient portal. Integrated video, scheduling, and billing.',
'Patient Experience', 'Q2 2026', '2026-06-15', NULL,
'Support telehealth expansion strategy. Improve patient access to care. Expected to enable 5,000 additional telehealth visits annually.',
'Healthcare', 'Planned', 'High', 'EMR Development Team', 55,
'Requires: PRJ-HC-002 (Telehealth Platform), HIPAA compliance review';

INSERT INTO APP_ROADMAP SELECT
'RDMP-EMR-002', 'Epic EMR', 'Electronic Medical Records',
'Clinical Decision Support - Drug Interactions',
'Enhanced drug interaction checking with real-time alerts for contraindications, allergies, and dosing guidance.',
'Patient Safety', 'Q1 2026', '2026-03-31', NULL,
'Reduce medication errors by 30%. Improve patient safety. Support quality metrics and regulatory compliance.',
'Healthcare', 'In Development', 'Critical', 'EMR Development Team', 40,
'Requires: Pharmacy system integration, Clinical knowledge base licensing';

INSERT INTO APP_ROADMAP SELECT
'RDMP-EMR-003', 'Epic EMR', 'Electronic Medical Records',
'Mobile Nurse Charting Application',
'Native mobile app for nurses to document patient care at bedside. Reduce time spent at nursing station.',
'Clinical Workflows', 'Q3 2026', '2026-08-31', NULL,
'Improve nurse satisfaction and productivity. More time with patients. Reduce charting time by 25%.',
'Healthcare', 'Planned', 'Medium', 'EMR Development Team', 50,
'Requires: Mobile security review, Nurse workflow analysis';

-- HRIS (Workday) Roadmap
INSERT INTO APP_ROADMAP SELECT
'RDMP-HRIS-001', 'Workday HRIS', 'Human Resources Information System',
'AI-Powered Recruitment Assistance',
'Automated resume screening, candidate matching to job requirements, and interview scheduling automation.',
'Talent Acquisition', 'Q2 2026', '2026-05-15', NULL,
'Reduce time-to-hire by 30%. Improve candidate quality through better matching. Reduce recruiter workload by 40%.',
'HR', 'Planned', 'Medium', 'HRIS Development Team', 45,
'Requires: ATS integration, AI model training, Bias mitigation review';

INSERT INTO APP_ROADMAP SELECT
'RDMP-HRIS-002', 'Workday HRIS', 'Human Resources Information System',
'Performance Review Modernization',
'Continuous feedback model replacing annual reviews. Real-time goal tracking and 360-degree feedback.',
'Performance Management', 'Q3 2026', '2026-09-15', NULL,
'Improve employee engagement. Enable continuous performance improvement. Reduce HR administrative burden.',
'HR', 'In Development', 'High', 'HRIS Development Team', 50,
'Requires: Manager training program, Goal-setting workshop';

-- Marketing Automation Roadmap
INSERT INTO APP_ROADMAP SELECT
'RDMP-MKT-001', 'Marketo', 'Marketing Automation',
'Predictive Campaign Optimization',
'AI-driven recommendations for campaign timing, content, and audience segmentation based on historical performance.',
'Campaign Management', 'Q2 2026', '2026-06-30', NULL,
'Improve campaign ROI by 25%. Reduce manual campaign optimization time by 60%. Enable data-driven marketing decisions.',
'Marketing', 'Planned', 'High', 'Marketing Tech Team', 40,
'Requires: PRJ-MKT-001 completion, Historical campaign data cleanup';

-- Supply Chain System Roadmap
INSERT INTO APP_ROADMAP SELECT
'RDMP-SCM-001', 'Supply Chain Management', 'Operations',
'Demand Forecasting with ML',
'Machine learning models for demand forecasting based on historical sales, seasonality, and market trends.',
'Planning & Forecasting', 'Q4 2026', '2026-12-31', NULL,
'Reduce inventory carrying costs by 15%. Decrease stock-outs by 50%. Improve forecast accuracy from 70% to 90%.',
'Operations', 'Planning', 'Medium', 'Supply Chain Tech Team', 60,
'Requires: PRJ-OPS-001 foundation, Data science team engagement';

-- Verify roadmap data
SELECT 
    APPLICATION_NAME,
    COUNT(*) AS feature_count,
    COUNT(CASE WHEN STATUS = 'In Development' THEN 1 END) AS in_dev,
    COUNT(CASE WHEN STATUS = 'Planned' THEN 1 END) AS planned
FROM APP_ROADMAP
GROUP BY APPLICATION_NAME
ORDER BY feature_count DESC;

SELECT 'Application roadmap data loaded successfully!' AS status;

