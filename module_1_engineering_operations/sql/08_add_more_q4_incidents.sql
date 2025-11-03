-- =====================================================
-- Add More Q4 2025 Incidents for Demo
-- =====================================================
-- Run this to add more Q4 incidents for realistic demo data

USE DATABASE DEMO_JAM;
USE SCHEMA ENGINEERING_OPS;
USE WAREHOUSE APP_WH;

-- Add Q4 2025 incidents (November)
INSERT INTO INCIDENTS VALUES
('INC-2025-046', 'Database Connection Pool Exhausted', 'Critical', 'Resolved', 'Authentication Service',
 '2025-11-02 09:30:00', '2025-11-02 10:45:00', 75, 8900, 'Database Configuration',
 'Black Friday prep caused connection pool saturation. Increased pool size and added auto-scaling for holiday traffic.',
 '2025-11-02', 2025, 4, 11, 44),

('INC-2025-047', 'API Gateway Timeout', 'High', 'Resolved', 'Payment Gateway',
 '2025-11-05 14:20:00', '2025-11-05 15:30:00', 70, 6200, 'External Dependency',
 'Third-party payment processor experiencing latency. Implemented retry logic and circuit breaker.',
 '2025-11-05', 2025, 4, 11, 45),

('INC-2025-048', 'Memory Leak in Background Worker', 'High', 'Resolved', 'Notification Engine',
 '2025-11-08 11:15:00', '2025-11-08 13:45:00', 150, 0, 'Application Bug',
 'Email notification workers accumulating memory. Fixed resource cleanup in batch processing loop.',
 '2025-11-08', 2025, 4, 11, 45),

('INC-2025-049', 'Database Query Performance Degradation', 'High', 'Resolved', 'Search Service',
 '2025-11-12 08:45:00', '2025-11-12 10:20:00', 95, 4500, 'Database Performance',
 'Search queries timing out due to missing index on new feature columns. Added composite index.',
 '2025-11-12', 2025, 4, 11, 46),

('INC-2025-050', 'Database Connection Pool Exhausted', 'Critical', 'Resolved', 'Order Management System',
 '2025-11-15 16:00:00', '2025-11-15 17:15:00', 75, 12000, 'Database Configuration',
 'Holiday shopping surge overwhelmed connection pool. Scaled pool and added connection monitoring.',
 '2025-11-15', 2025, 4, 11, 46),

('INC-2025-051', 'SSL Certificate Expiration', 'Critical', 'Resolved', 'Product Catalog API',
 '2025-11-18 00:10:00', '2025-11-18 01:25:00', 75, 15000, 'Configuration',
 'SSL cert expired for catalog service. Emergency renewal. Enhanced certificate monitoring.',
 '2025-11-18', 2025, 4, 11, 47),

('INC-2025-052', 'API Gateway Timeout', 'High', 'Resolved', 'User Profile Service',
 '2025-11-20 12:30:00', '2025-11-20 13:45:00', 75, 5800, 'Application Performance',
 'Profile API slow due to N+1 query issue. Implemented eager loading and caching.',
 '2025-11-20', 2025, 4, 11, 47),

('INC-2025-053', 'Database Connection Pool Exhausted', 'Critical', 'Resolved', 'Payment Gateway',
 '2025-11-22 10:15:00', '2025-11-22 11:20:00', 65, 9500, 'Database Configuration',
 'Black Friday traffic spike caused pool exhaustion. Emergency scaling and optimization applied.',
 '2025-11-22', 2025, 4, 11, 47),

('INC-2025-054', 'Deployment Rollback Required', 'Critical', 'Resolved', 'Search Service',
 '2025-11-25 14:00:00', '2025-11-25 14:40:00', 40, 7200, 'Deployment',
 'New search algorithm introduced relevance issues. Emergency rollback performed.',
 '2025-11-25', 2025, 4, 11, 48),

('INC-2025-055', 'Database Query Performance Degradation', 'High', 'Resolved', 'Analytics Pipeline',
 '2025-11-28 09:00:00', '2025-11-28 11:30:00', 150, 0, 'Database Performance',
 'Year-end analytics jobs causing database contention. Optimized queries and added scheduling.',
 '2025-11-28', 2025, 4, 11, 48);

-- Verify the update
SELECT 
    QUARTER,
    COUNT(*) AS incident_count,
    COUNT(DISTINCT INCIDENT_TYPE) AS unique_types
FROM INCIDENTS
WHERE YEAR = 2025
GROUP BY QUARTER
ORDER BY QUARTER;

SELECT 'Added 10 more Q4 2025 incidents. Total incidents now: ' || COUNT(*) AS status
FROM INCIDENTS;

