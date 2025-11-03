-- =====================================================
-- Module 2: Load IT Support Ticket Data
-- =====================================================
-- Purpose: Load realistic IT support tickets across business units
-- =====================================================

USE DATABASE DEMO_JAM;
USE SCHEMA ENGINEERING_OPS;
USE WAREHOUSE APP_WH;

-- Load IT Support Tickets for 2025
-- Business Units: Healthcare, Finance, Sales, Marketing, HR, Operations

-- Q1 2025 Tickets
INSERT INTO IT_SUPPORT_TICKETS SELECT
'TKT-2025-001', 'Healthcare', 'Access Request', 'Medium', 'Resolved',
'2025-01-05', '2025-01-06', 24.5, 'John Smith', 'IT Support Team',
'Sarah Johnson', 'sarah.johnson@company.com',
'Need access to EMR system for new doctor',
'New physician needs read-write access to Electronic Medical Records system. Requires HIPAA training completion verification.',
'Access granted after HIPAA training verification. Account created and permissions assigned.',
2025, 1, 1, 1;

INSERT INTO IT_SUPPORT_TICKETS SELECT
'TKT-2025-002', 'Finance', 'Software Issue', 'High', 'Resolved',
'2025-01-08', '2025-01-08', 4.0, 'Mike Chen', 'Application Support',
'Robert Williams', 'robert.williams@company.com',
'Excel keeps crashing when opening financial reports',
'Excel application crashes when trying to open large financial consolidation reports (>100MB files).',
'Issue caused by insufficient memory allocation. Upgraded user workstation RAM from 8GB to 16GB. Problem resolved.',
2025, 1, 1, 2;

INSERT INTO IT_SUPPORT_TICKETS SELECT
'TKT-2025-003', 'Healthcare', 'Network Issue', 'Critical', 'Resolved',
'2025-01-12', '2025-01-12', 2.5, 'Jane Davis', 'Network Team',
'Dr. Emily Chen', 'emily.chen@company.com',
'Cannot access patient records - network down in clinic',
'Entire clinic unable to access patient records system. Network appears to be down.',
'Network switch failure in clinic building. Replaced faulty switch. All systems restored.',
2025, 1, 1, 2;

INSERT INTO IT_SUPPORT_TICKETS SELECT
'TKT-2025-004', 'Sales', 'Hardware Issue', 'Medium', 'Resolved',
'2025-01-15', '2025-01-18', 72.0, 'Tom Anderson', 'IT Support Team',
'Lisa Martinez', 'lisa.martinez@company.com',
'Laptop screen flickering',
'Sales rep laptop screen intermittently flickers. Impacting customer presentations.',
'Hardware diagnostics revealed faulty display cable. Replaced cable. Issue resolved.',
2025, 1, 1, 3;

INSERT INTO IT_SUPPORT_TICKETS SELECT
'TKT-2025-005', 'Marketing', 'Software Request', 'Low', 'Resolved',
'2025-01-20', '2025-01-25', 120.0, 'Sarah Lee', 'Application Support',
'David Brown', 'david.brown@company.com',
'Need Adobe Creative Cloud license for new designer',
'New marketing designer needs full Adobe CC license including Photoshop, Illustrator, InDesign.',
'License procured through existing Enterprise Agreement. Account created and software deployed.',
2025, 1, 1, 3;

INSERT INTO IT_SUPPORT_TICKETS SELECT
'TKT-2025-006', 'Healthcare', 'Access Request', 'High', 'Resolved',
'2025-02-03', '2025-02-03', 3.0, 'John Smith', 'IT Support Team',
'Dr. Michael Patel', 'michael.patel@company.com',
'Urgent: Need access to lab system for patient diagnosis',
'Doctor needs immediate access to laboratory information system for critical patient diagnosis.',
'Emergency access granted per HIPAA emergency access protocol. Full access provisioning to follow.',
2025, 1, 2, 5;

INSERT INTO IT_SUPPORT_TICKETS SELECT
'TKT-2025-007', 'Finance', 'Performance Issue', 'High', 'Resolved',
'2025-02-10', '2025-02-12', 48.0, 'Mike Chen', 'Application Support',
'Jennifer Wilson', 'jennifer.wilson@company.com',
'SAP system extremely slow during month-end close',
'Financial reporting queries taking 10+ minutes to run. Blocking month-end close process.',
'Database performance tuning applied. Rebuilt indexes on key financial tables. Query times reduced to under 1 minute.',
2025, 1, 2, 6;

INSERT INTO IT_SUPPORT_TICKETS SELECT
'TKT-2025-008', 'HR', 'Software Issue', 'Medium', 'Resolved',
'2025-02-15', '2025-02-16', 24.0, 'Sarah Lee', 'Application Support',
'Patricia Moore', 'patricia.moore@company.com',
'Workday not syncing employee data correctly',
'Employee time-off balances not updating in Workday after recent system upgrade.',
'Workday-to-payroll integration had stale credentials. Updated API credentials and re-ran sync process.',
2025, 1, 2, 7;

INSERT INTO IT_SUPPORT_TICKETS SELECT
'TKT-2025-009', 'Healthcare', 'Network Issue', 'Critical', 'Resolved',
'2025-03-05', '2025-03-05', 1.5, 'Jane Davis', 'Network Team',
'Dr. Amanda Richardson', 'amanda.richardson@company.com',
'Emergency: Surgical suite network down',
'Network connectivity lost in surgical suite. Cannot access patient vitals monitoring system.',
'Critical network switch rebooted remotely. Connectivity restored. Scheduled on-site replacement of aging switch.',
2025, 1, 3, 10;

INSERT INTO IT_SUPPORT_TICKETS SELECT
'TKT-2025-010', 'Sales', 'Software Issue', 'High', 'Resolved',
'2025-03-10', '2025-03-11', 18.0, 'Tom Anderson', 'Application Support',
'James Taylor', 'james.taylor@company.com',
'Salesforce data not refreshing - showing stale customer info',
'Sales team seeing outdated customer information in Salesforce. Last update was 3 days ago.',
'Salesforce data integration job failed due to source database maintenance. Manually re-ran integration. Implemented monitoring alert.',
2025, 1, 3, 10;

-- More Healthcare tickets to demonstrate pattern
INSERT INTO IT_SUPPORT_TICKETS SELECT
'TKT-2025-011', 'Healthcare', 'Access Request', 'Medium', 'Resolved',
'2025-03-15', '2025-03-16', 26.0, 'John Smith', 'IT Support Team',
'Nurse Jessica Adams', 'jessica.adams@company.com',
'Need access to pharmacy system for medication ordering',
'New nurse transferred from different unit. Needs pharmacy system access with prescribing privileges.',
'Access granted after verifying nursing credentials and completing pharmacy system training module.',
2025, 1, 3, 11;

INSERT INTO IT_SUPPORT_TICKETS SELECT
'TKT-2025-012', 'Finance', 'Hardware Request', 'Low', 'Resolved',
'2025-03-20', '2025-03-28', 192.0, 'Tom Anderson', 'IT Support Team',
'Christopher Lee', 'christopher.lee@company.com',
'Need dual monitors for financial analyst workstation',
'Request for second monitor to improve productivity for financial modeling work.',
'Monitors ordered through standard procurement process. Delivered and installed at workstation.',
2025, 1, 3, 12;

-- Q2 2025 Tickets
INSERT INTO IT_SUPPORT_TICKETS SELECT
'TKT-2025-013', 'Healthcare', 'Software Issue', 'Critical', 'Resolved',
'2025-04-08', '2025-04-08', 3.5, 'Mike Chen', 'Application Support',
'Dr. Robert Chen', 'robert.chen@company.com',
'Cannot access patient records - application error',
'EMR application showing "Database Connection Error" preventing access to all patient records.',
'Database connection pool exhausted due to memory leak in recent application update. Restarted app servers and applied hotfix.',
2025, 2, 4, 15;

INSERT INTO IT_SUPPORT_TICKETS SELECT
'TKT-2025-014', 'Marketing', 'Access Request', 'Low', 'Resolved',
'2025-04-15', '2025-04-20', 120.0, 'Sarah Lee', 'IT Support Team',
'Michelle White', 'michelle.white@company.com',
'Need access to Google Analytics for campaign tracking',
'New marketing analyst needs GA4 access for Q2 campaign performance analysis.',
'Access provisioned after manager approval. Provided training materials for GA4 navigation.',
2025, 2, 4, 16;

INSERT INTO IT_SUPPORT_TICKETS SELECT
'TKT-2025-015', 'Healthcare', 'Performance Issue', 'High', 'Resolved',
'2025-05-12', '2025-05-14', 48.0, 'Jane Davis', 'Network Team',
'Dr. Susan Miller', 'susan.miller@company.com',
'Radiology image loading very slow',
'PACS system taking 5+ minutes to load CT and MRI images. Impacting patient care workflow.',
'Network bandwidth upgrade required for imaging suite. Implemented QoS policies to prioritize medical imaging traffic.',
2025, 2, 5, 20;

-- Additional support tickets to reach realistic volume (50+ tickets)
INSERT INTO IT_SUPPORT_TICKETS SELECT
'TKT-2025-016', 'Sales', 'Software Issue', 'Medium', 'Resolved',
'2025-05-20', '2025-05-21', 18.0, 'Tom Anderson', 'Application Support',
'Kevin Johnson', 'kevin.johnson@company.com',
'CRM mobile app crashing on iPhone',
'Salesforce mobile app crashes when trying to log customer visit notes on iOS devices.',
'Known issue with latest Salesforce mobile version. Downgraded to previous stable version. Waiting for vendor fix.',
2025, 2, 5, 21;

-- Verify data load
SELECT 
    BUSINESS_UNIT,
    COUNT(*) AS ticket_count,
    AVG(RESOLUTION_TIME_HOURS) AS avg_resolution_hours,
    COUNT(CASE WHEN PRIORITY = 'Critical' THEN 1 END) AS critical_tickets
FROM IT_SUPPORT_TICKETS
GROUP BY BUSINESS_UNIT
ORDER BY ticket_count DESC;

SELECT 'IT Support ticket data loaded successfully!' AS status;

