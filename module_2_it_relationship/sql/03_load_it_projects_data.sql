-- =====================================================
-- Module 2: Load IT Project Portfolio Data
-- =====================================================
-- Purpose: Load realistic IT project data for value tracking
-- =====================================================

USE DATABASE DEMO_JAM;
USE SCHEMA ENGINEERING_OPS;
USE WAREHOUSE APP_WH;

-- Healthcare IT Projects
INSERT INTO IT_PROJECTS SELECT
'PRJ-HC-001',
'Field Service Management System',
'Healthcare',
'Application Development',
'In Progress',
'High',
850000.00,
625000.00,
225000.00,
'2024-10-01',
'2025-06-30',
NULL,
73.5,
'Amanda Foster',
'Raj Patel',
12,
'Enable mobile field service capabilities for 150+ medical equipment technicians. Expected to reduce mean-time-to-repair by 30% and improve equipment uptime from 94% to 98%. Estimated annual value: $2.1M in reduced equipment downtime and faster patient service.',
'Success Metrics: (1) Equipment uptime >98%, (2) Technician productivity +25%, (3) Customer satisfaction score >4.5/5, (4) ROI breakeven within 18 months',
'Risk: Integration with legacy equipment tracking system. Mitigation: Phased rollout starting with 2 pilot sites.',
2025, 2;

INSERT INTO IT_PROJECTS SELECT
'PRJ-HC-002',
'Telehealth Platform Expansion',
'Healthcare',
'Infrastructure Upgrade',
'Planning',
'High',
1200000.00,
85000.00,
1115000.00,
'2025-07-01',
'2026-03-31',
NULL,
7.1,
'David Kim',
'Sarah Thompson',
18,
'Expand telehealth capacity from 50 to 500 concurrent video sessions. Support rural clinic expansion strategy. Expected to enable 15,000 additional patient visits annually with 40% cost reduction vs. in-person visits.',
'Success Metrics: (1) Support 500 concurrent sessions with <100ms latency, (2) 99.9% uptime, (3) <5% call drop rate, (4) Patient satisfaction >90%',
'Risk: Network bandwidth at rural sites may be insufficient. Mitigation: Network assessment completed, bandwidth upgrades included in budget.',
2025, 3;

INSERT INTO IT_PROJECTS SELECT
'PRJ-HC-003',
'HIPAA Compliance Automation',
'Healthcare',
'Governance & Compliance',
'In Progress',
'High',
425000.00,
290000.00,
135000.00,
'2025-01-15',
'2025-12-31',
NULL,
68.2,
'Jennifer Martinez',
'Chris Anderson',
6,
'Automate HIPAA compliance reporting and access auditing. Reduce manual compliance effort by 200 hours/month. Improve audit response time from 2 weeks to 24 hours. Reduce compliance risk exposure.',
'Success Metrics: (1) Automated 80% of compliance reports, (2) Audit trail completeness 100%, (3) Compliance reporting time reduced by 90%, (4) Zero audit findings in next review',
'Risk: Integration with 15+ clinical systems required. Mitigation: Phased approach, starting with highest-risk systems.',
2025, 4;

-- Finance IT Projects
INSERT INTO IT_PROJECTS SELECT
'PRJ-FIN-001',
'Financial Reporting Modernization',
'Finance',
'Application Development',
'In Progress',
675000.00,
520000.00,
155000.00,
'2024-09-01',
'2025-05-31',
NULL,
77.0,
'Michael Roberts',
'Lisa Wang',
10,
'Replace legacy financial reporting with modern BI platform. Reduce month-end close from 10 days to 3 days. Enable self-service reporting for business units. Expected value: $850K annual labor savings plus faster business insights.',
'Success Metrics: (1) Month-end close time <4 days, (2) 90% of reports self-service, (3) Report generation time -75%, (4) Finance team satisfaction >85%',
'Risk: Data quality issues in source systems. Mitigation: Data cleansing phase completed in Q4 2024.',
2025, 2;

INSERT INTO IT_PROJECTS SELECT
'PRJ-FIN-002',
'Expense Management System Upgrade',
'Finance',
'System Upgrade',
'Completed',
'Medium',
185000.00,
178000.00,
7000.00,
'2024-11-01',
'2025-02-28',
'2025-02-24',
100.0,
'Patricia Lopez',
'Kevin Chang',
5,
'Upgrade Concur expense system to latest version. Add mobile receipt capture. Improve approval workflow. Expected to reduce expense processing time by 40% and improve employee satisfaction.',
'Success Metrics: (1) Expense processing time -40%, (2) Mobile adoption >70%, (3) Manual data entry -60%, (4) Employee satisfaction +25%',
'Risk: User adoption of mobile app. Mitigation: Training program and executive sponsorship campaign.',
2025, 1;

-- Sales IT Projects
INSERT INTO IT_PROJECTS SELECT
'PRJ-SAL-001',
'CRM Analytics Enhancement',
'Sales',
'Application Development',
'In Progress',
425000.00,
195000.00,
230000.00,
'2025-02-01',
'2025-09-30',
NULL,
45.9,
'Thomas Wright',
'Angela Rodriguez',
8,
'Implement AI-powered sales forecasting and pipeline analytics in Salesforce. Improve forecast accuracy from 65% to 85%. Enable predictive lead scoring. Expected value: $1.2M additional revenue from improved pipeline management.',
'Success Metrics: (1) Forecast accuracy >85%, (2) Pipeline conversion rate +15%, (3) Sales rep adoption >90%, (4) ROI 3:1 within first year',
'Risk: Data quality and completeness in CRM. Mitigation: 3-month data cleanup initiative completed Q4 2024.',
2025, 3;

-- Operations IT Projects
INSERT INTO IT_PROJECTS SELECT
'PRJ-OPS-001',
'Supply Chain Visibility Platform',
'Operations',
'Application Development',
'Planning',
'High',
950000.00,
125000.00,
825000.00,
'2025-06-01',
'2026-06-30',
NULL,
13.2,
'Richard Taylor',
'Maria Gonzalez',
15,
'Real-time supply chain tracking and inventory optimization. Integrate with 25+ supplier systems. Expected to reduce inventory carrying costs by $3M annually and improve stock-out rate from 8% to <2%.',
'Success Metrics: (1) Real-time visibility for 80% of suppliers, (2) Inventory carrying costs -20%, (3) Stock-out rate <2%, (4) Supply chain forecast accuracy >90%',
'Risk: Supplier integration complexity - many use legacy systems. Mitigation: Phased rollout by supplier tier, EDI fallback for legacy systems.',
2025, 2;

-- Marketing IT Projects  
INSERT INTO IT_PROJECTS SELECT
'PRJ-MKT-001',
'Marketing Automation Platform',
'Marketing',
'Application Development',
'In Progress',
385000.00,
265000.00,
120000.00,
'2024-12-01',
'2025-07-31',
NULL,
68.8,
'Elizabeth Anderson',
'Daniel Kim',
7,
'Implement marketing automation (Marketo) for lead nurturing and campaign management. Expected to increase marketing qualified leads by 40% and reduce cost-per-lead by 25%.',
'Success Metrics: (1) MQL volume +40%, (2) Cost per lead -25%, (3) Campaign ROI measurement for 100% of campaigns, (4) Marketing team efficiency +30%',
'Risk: CRM integration and lead routing complexity. Mitigation: Dedicated integration architect assigned.',
2025, 3;

-- HR IT Projects
INSERT INTO IT_PROJECTS SELECT
'PRJ-HR-001',
'Employee Self-Service Portal',
'HR',
'Application Development',
'Completed',
'Medium',
275000.00,
268000.00,
7000.00,
'2024-08-01',
'2025-01-31',
'2025-01-29',
100.0,
'Nancy Wilson',
'Peter Chen',
6,
'Employee self-service portal for benefits, payroll, time-off, and HR documents. Expected to reduce HR administrative workload by 150 hours/month and improve employee satisfaction.',
'Success Metrics: (1) HR ticket volume -60%, (2) Employee portal adoption >85%, (3) HR admin time savings 150+ hrs/month, (4) Employee satisfaction +20%',
'Risk: Change management and adoption. Mitigation: Comprehensive training and change management program executed.',
2025, 1;

-- Verify project data
SELECT 
    BUSINESS_UNIT,
    COUNT(*) AS project_count,
    SUM(BUDGET_ALLOCATED) AS total_budget,
    SUM(BUDGET_SPENT) AS total_spent,
    AVG(PERCENT_COMPLETE) AS avg_completion
FROM IT_PROJECTS
GROUP BY BUSINESS_UNIT
ORDER BY total_budget DESC;

SELECT 'IT Project data loaded successfully!' AS status;

