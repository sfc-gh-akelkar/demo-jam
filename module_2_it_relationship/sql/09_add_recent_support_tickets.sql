-- =====================================================
-- Module 2: Add Recent IT Support Tickets (Q3-Q4 2025)
-- =====================================================
-- Purpose: Add recent tickets to enable "last 6 months" trend analysis
-- Adds tickets from June-November 2025
-- =====================================================

USE DATABASE DEMO_JAM;
USE SCHEMA ENGINEERING_OPS;
USE WAREHOUSE APP_WH;

-- =====================================================
-- Q3 2025 Healthcare Tickets
-- =====================================================

INSERT INTO IT_SUPPORT_TICKETS SELECT
'TKT-2025-017', 'Healthcare', 'Access Request', 'Medium', 'Resolved',
'2025-06-05', '2025-06-05', 12.0, 'John Smith', 'IT Support Team',
'Dr. James Wilson', 'james.wilson@company.com',
'Need VPN access for remote patient consultations',
'Doctor needs secure VPN access to access EMR from home for telehealth appointments.',
'VPN credentials issued. Provided training on secure access protocols.',
2025, 2, 6, 23;

INSERT INTO IT_SUPPORT_TICKETS SELECT
'TKT-2025-018', 'Healthcare', 'Software Issue', 'Critical', 'Resolved',
'2025-07-08', '2025-07-08', 2.0, 'Mike Chen', 'Application Support',
'Nurse Manager Sarah Kim', 'sarah.kim@company.com',
'Medication administration system not recording doses',
'Medication tracking system failing to record administered doses. Patient safety concern.',
'Database connection issue identified and resolved. Verified all recent administrations were logged correctly.',
2025, 3, 7, 28;

INSERT INTO IT_SUPPORT_TICKETS SELECT
'TKT-2025-019', 'Healthcare', 'Hardware Request', 'Low', 'Resolved',
'2025-07-15', '2025-07-22', 168.0, 'Tom Anderson', 'IT Support Team',
'Dr. Amanda Lee', 'amanda.lee@company.com',
'Request tablet for bedside patient charting',
'Need mobile tablet for bedside charting to improve workflow and patient interaction time.',
'Tablet ordered through standard procurement. Delivered, configured with EMR mobile app, and deployed.',
2025, 3, 7, 29;

INSERT INTO IT_SUPPORT_TICKETS SELECT
'TKT-2025-020', 'Healthcare', 'Network Issue', 'High', 'Resolved',
'2025-08-12', '2025-08-13', 18.0, 'Jane Davis', 'Network Team',
'Dr. Robert Chen', 'robert.chen@company.com',
'Intermittent wireless connectivity in ICU',
'WiFi dropping connections in ICU affecting patient monitoring systems.',
'Identified wireless interference from new medical equipment. Reconfigured access points and frequencies. Issue resolved.',
2025, 3, 8, 33;

INSERT INTO IT_SUPPORT_TICKETS SELECT
'TKT-2025-021', 'Healthcare', 'Access Request', 'High', 'Resolved',
'2025-09-03', '2025-09-03', 4.0, 'John Smith', 'IT Support Team',
'Dr. Maria Gonzalez', 'maria.gonzalez@company.com',
'Urgent: New specialist needs EMR access for incoming patient',
'New cardiology specialist starting today. Needs immediate EMR access for scheduled patient procedures.',
'Emergency access provisioning completed. Standard access and credentialing to follow per policy.',
2025, 3, 9, 36;

-- =====================================================
-- Q4 2025 Healthcare Tickets
-- =====================================================

INSERT INTO IT_SUPPORT_TICKETS SELECT
'TKT-2025-022', 'Healthcare', 'Performance Issue', 'Medium', 'Resolved',
'2025-10-07', '2025-10-09', 48.0, 'Mike Chen', 'Application Support',
'Nurse Practitioner Lisa Brown', 'lisa.brown@company.com',
'Lab results interface loading slowly',
'Lab results taking 20+ seconds to load. Slowing down patient consultation workflow.',
'Database query optimization applied. Interface now loads in <3 seconds. Performance monitoring added.',
2025, 4, 10, 41;

INSERT INTO IT_SUPPORT_TICKETS SELECT
'TKT-2025-023', 'Healthcare', 'Software Issue', 'High', 'Resolved',
'2025-10-15', '2025-10-16', 24.0, 'Sarah Lee', 'Application Support',
'Dr. Kevin Martinez', 'kevin.martinez@company.com',
'E-prescribing system not connecting to pharmacy',
'Cannot send electronic prescriptions. Pharmacy network interface showing connection errors.',
'Network certificate expired. Renewed certificate and restored pharmacy connectivity. All pending prescriptions sent.',
2025, 4, 10, 42;

INSERT INTO IT_SUPPORT_TICKETS SELECT
'TKT-2025-024', 'Healthcare', 'Access Request', 'Medium', 'Resolved',
'2025-11-01', '2025-11-02', 20.0, 'John Smith', 'IT Support Team',
'Medical Assistant Jennifer Taylor', 'jennifer.taylor@company.com',
'Need access to scheduling system for new clinic location',
'Transferred to new clinic. Need scheduling system access for patient appointments.',
'Access provisioned for new location. Verified permissions match role requirements.',
2025, 4, 11, 44;

-- =====================================================
-- Q3-Q4 2025 Other Business Unit Tickets (for comparison)
-- =====================================================

INSERT INTO IT_SUPPORT_TICKETS SELECT
'TKT-2025-025', 'Finance', 'Software Issue', 'High', 'Resolved',
'2025-06-10', '2025-06-12', 48.0, 'Mike Chen', 'Application Support',
'Controller David Smith', 'david.smith@company.com',
'Financial consolidation report failing',
'Month-end consolidation report timing out. Blocking financial close process.',
'Query optimization and index rebuild completed. Report now runs in acceptable time.',
2025, 2, 6, 24;

INSERT INTO IT_SUPPORT_TICKETS SELECT
'TKT-2025-026', 'Sales', 'Access Request', 'Medium', 'Resolved',
'2025-07-20', '2025-07-23', 72.0, 'Sarah Lee', 'IT Support Team',
'Sales Rep Mike Johnson', 'mike.johnson@company.com',
'Need CRM access for new territory',
'Promoted to regional role. Need expanded CRM access for new territory accounts.',
'Manager approval received. Access provisioned with appropriate territory assignments.',
2025, 3, 7, 30;

INSERT INTO IT_SUPPORT_TICKETS SELECT
'TKT-2025-027', 'Marketing', 'Software Request', 'Low', 'Resolved',
'2025-08-15', '2025-09-05', 504.0, 'Tom Anderson', 'IT Support Team',
'Marketing Director Susan Lee', 'susan.lee@company.com',
'Need video editing software for campaign',
'Request Adobe Premiere Pro for video content creation.',
'Budget approved. Software license procured and installed. Training materials provided.',
2025, 3, 8, 33;

INSERT INTO IT_SUPPORT_TICKETS SELECT
'TKT-2025-028', 'HR', 'Software Issue', 'Medium', 'Resolved',
'2025-09-10', '2025-09-12', 48.0, 'Sarah Lee', 'Application Support',
'HR Manager Patricia Garcia', 'patricia.garcia@company.com',
'Workday performance review module not loading',
'Cannot access performance review module. Annual review season deadline approaching.',
'Browser cache issue causing load failure. Cleared cache and verified all users can access module.',
2025, 3, 9, 37;

INSERT INTO IT_SUPPORT_TICKETS SELECT
'TKT-2025-029', 'Operations', 'Hardware Issue', 'Medium', 'Resolved',
'2025-10-20', '2025-10-22', 48.0, 'Tom Anderson', 'IT Support Team',
'Warehouse Manager Carlos Rodriguez', 'carlos.rodriguez@company.com',
'Barcode scanner not syncing with inventory system',
'Handheld scanner failing to upload scan data. Causing inventory count delays.',
'Scanner firmware update required. Updated all warehouse scanners. Issue resolved.',
2025, 4, 10, 43;

-- Verify recent Healthcare tickets
SELECT 
    BUSINESS_UNIT,
    COUNT(*) AS ticket_count,
    MIN(CREATED_DATE) AS earliest_ticket,
    MAX(CREATED_DATE) AS latest_ticket,
    AVG(RESOLUTION_TIME_HOURS) AS avg_resolution_hours
FROM IT_SUPPORT_TICKETS
WHERE CREATED_DATE >= '2025-06-01'
GROUP BY BUSINESS_UNIT
ORDER BY ticket_count DESC;

-- Healthcare ticket summary (last 6 months from Nov 2025)
SELECT 
    TICKET_TYPE,
    PRIORITY,
    COUNT(*) AS count,
    AVG(RESOLUTION_TIME_HOURS) AS avg_resolution_hours
FROM IT_SUPPORT_TICKETS
WHERE BUSINESS_UNIT = 'Healthcare'
  AND CREATED_DATE >= '2025-05-04'  -- Last 6 months from Nov 4
GROUP BY TICKET_TYPE, PRIORITY
ORDER BY count DESC;

SELECT 'Recent IT support tickets added successfully!' AS status;

