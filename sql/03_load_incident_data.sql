-- =====================================================
-- Snowflake Intelligence Demo Jam - Load Incident Data
-- =====================================================
-- Purpose: Load realistic incident data for demo
-- =====================================================

USE DATABASE DEMO_JAM;
USE SCHEMA ENGINEERING_OPS;
USE WAREHOUSE DEMO_JAM_WH;

-- =====================================================
-- Load Services Catalog (Reference Data)
-- =====================================================

INSERT INTO SERVICES (SERVICE_ID, SERVICE_NAME, SERVICE_TYPE, TEAM_OWNER, CRITICALITY, TECH_STACK) VALUES
('SVC-001', 'Authentication Service', 'Backend API', 'Platform Team', 'Critical', 'Node.js, PostgreSQL, Redis'),
('SVC-002', 'Payment Gateway', 'Backend API', 'Payments Team', 'Critical', 'Java Spring Boot, PostgreSQL'),
('SVC-003', 'User Profile Service', 'Backend API', 'User Experience Team', 'High', 'Python FastAPI, PostgreSQL'),
('SVC-004', 'Notification Engine', 'Background Worker', 'Platform Team', 'High', 'Python Celery, RabbitMQ, Redis'),
('SVC-005', 'Product Catalog API', 'Backend API', 'Catalog Team', 'Critical', 'Go, MongoDB'),
('SVC-006', 'Search Service', 'Backend API', 'Search Team', 'High', 'Elasticsearch, Python'),
('SVC-007', 'Analytics Pipeline', 'Data Pipeline', 'Data Team', 'Medium', 'Apache Spark, Airflow'),
('SVC-008', 'Media Upload Service', 'Backend API', 'Media Team', 'High', 'Node.js, S3, PostgreSQL'),
('SVC-009', 'Order Management System', 'Backend API', 'Commerce Team', 'Critical', 'Java Spring Boot, PostgreSQL'),
('SVC-010', 'Recommendation Engine', 'ML Service', 'ML Team', 'Medium', 'Python, TensorFlow, Redis');

-- =====================================================
-- Load Incident Data (Last 12 months)
-- =====================================================

-- Q1 2025 Incidents
INSERT INTO INCIDENTS VALUES
('INC-2025-001', 'Database Connection Pool Exhausted', 'Critical', 'Resolved', 'Authentication Service', 
 '2025-01-05 14:23:00', '2025-01-05 15:45:00', 82, 12500, 'Database Configuration',
 'Auth service experienced connection pool exhaustion during peak traffic. All available connections were held by long-running queries. Mitigation: Increased pool size and added connection timeout.', 
 '2025-01-05', 2025, 1, 1, 1),

('INC-2025-002', 'Memory Leak in Background Worker', 'High', 'Resolved', 'Notification Engine',
 '2025-01-12 09:15:00', '2025-01-12 11:30:00', 135, 0, 'Application Bug',
 'Notification workers gradually consuming memory until OOM crash. Root cause: Unreleased database cursors in batch processing loop. Fixed by implementing proper cursor cleanup.',
 '2025-01-12', 2025, 1, 1, 2),

('INC-2025-003', 'API Gateway Timeout', 'Critical', 'Resolved', 'Payment Gateway',
 '2025-01-18 16:45:00', '2025-01-18 17:12:00', 27, 8900, 'External Dependency',
 'Payment processing timeouts due to third-party payment provider degradation. Implemented circuit breaker pattern and fallback mechanism.',
 '2025-01-18', 2025, 1, 1, 3),

('INC-2025-004', 'Database Query Performance Degradation', 'High', 'Resolved', 'Product Catalog API',
 '2025-01-24 11:20:00', '2025-01-24 14:35:00', 195, 5600, 'Database Performance',
 'Slow queries on product search due to missing index on newly added filter columns. Added composite index and ran ANALYZE to update query planner statistics.',
 '2025-01-24', 2025, 1, 1, 4),

('INC-2025-005', 'Redis Cache Cluster Failover', 'Medium', 'Resolved', 'User Profile Service',
 '2025-02-02 08:30:00', '2025-02-02 09:15:00', 45, 2300, 'Infrastructure',
 'Redis primary node failure triggered automatic failover. Brief cache unavailability during election. Application handled gracefully with database fallback.',
 '2025-02-02', 2025, 1, 2, 5),

('INC-2025-006', 'Database Connection Pool Exhausted', 'Critical', 'Resolved', 'Order Management System',
 '2025-02-08 13:45:00', '2025-02-08 15:20:00', 95, 15200, 'Database Configuration',
 'Order service connection pool saturated during flash sale event. Long-running transactions holding connections. Increased pool size and implemented transaction timeout.',
 '2025-02-08', 2025, 1, 2, 6),

('INC-2025-007', 'Disk Space Exhaustion', 'Critical', 'Resolved', 'Analytics Pipeline',
 '2025-02-14 03:15:00', '2025-02-14 05:45:00', 150, 0, 'Infrastructure',
 'Log files filled disk on analytics worker nodes. Pipeline jobs failing. Implemented log rotation policy and increased disk monitoring alerts.',
 '2025-02-14', 2025, 1, 2, 7),

('INC-2025-008', 'SSL Certificate Expiration', 'Critical', 'Resolved', 'Media Upload Service',
 '2025-02-20 00:05:00', '2025-02-20 01:30:00', 85, 18700, 'Configuration',
 'SSL certificate expired causing all HTTPS requests to fail. Emergency renewal and deployment. Implemented automated certificate renewal with 30-day advance alerts.',
 '2025-02-20', 2025, 1, 2, 8),

('INC-2025-009', 'Memory Leak in Background Worker', 'High', 'Resolved', 'Analytics Pipeline',
 '2025-02-26 10:20:00', '2025-02-26 13:45:00', 205, 0, 'Application Bug',
 'Spark jobs accumulating memory over time leading to OOM errors. Root cause: Caching broadcast variables without cleanup. Implemented explicit cache invalidation.',
 '2025-02-26', 2025, 1, 2, 9),

('INC-2025-010', 'Database Replication Lag', 'High', 'Resolved', 'User Profile Service',
 '2025-03-05 15:30:00', '2025-03-05 17:15:00', 105, 4200, 'Database Performance',
 'Read replica lagging behind primary by 15+ minutes causing stale data reads. Heavy write workload overwhelming replication. Scaled replica instance size.',
 '2025-03-05', 2025, 1, 3, 10),

-- Q2 2025 Incidents
('INC-2025-011', 'API Rate Limit Exceeded', 'Medium', 'Resolved', 'Search Service',
 '2025-03-12 12:40:00', '2025-03-12 13:25:00', 45, 3100, 'Capacity',
 'Elasticsearch cluster hitting rate limits due to unexpected query spike. Increased cluster capacity and implemented query result caching.',
 '2025-03-12', 2025, 1, 3, 11),

('INC-2025-012', 'Database Connection Pool Exhausted', 'Critical', 'Resolved', 'Payment Gateway',
 '2025-03-19 10:15:00', '2025-03-19 11:35:00', 80, 9800, 'Database Configuration',
 'Payment transactions timing out due to connection pool saturation. Peak shopping hours overwhelming default pool size. Increased max connections and added connection monitoring.',
 '2025-03-19', 2025, 1, 3, 12),

('INC-2025-013', 'Network Connectivity Issues', 'Critical', 'Resolved', 'Product Catalog API',
 '2025-03-25 16:20:00', '2025-03-25 17:55:00', 95, 22000, 'Network',
 'Intermittent packet loss in availability zone causing request timeouts. AWS networking issue. Temporarily shifted traffic to other AZs.',
 '2025-03-25', 2025, 1, 3, 13),

('INC-2025-014', 'Kafka Consumer Lag', 'High', 'Resolved', 'Notification Engine',
 '2025-04-03 08:45:00', '2025-04-03 11:20:00', 155, 0, 'Capacity',
 'Notification consumers falling behind Kafka topic offset. Message processing slower than production rate. Scaled consumer group and optimized message processing.',
 '2025-04-03', 2025, 2, 4, 14),

('INC-2025-015', 'Database Query Performance Degradation', 'High', 'Resolved', 'Order Management System',
 '2025-04-10 14:30:00', '2025-04-10 16:45:00', 135, 8500, 'Database Performance',
 'Order history queries taking 30+ seconds. Table statistics outdated after large data migration. Ran VACUUM ANALYZE and rebuilt query plan cache.',
 '2025-04-10', 2025, 2, 4, 15),

('INC-2025-016', 'Authentication Token Validation Failure', 'Critical', 'Resolved', 'Authentication Service',
 '2025-04-17 11:00:00', '2025-04-17 11:45:00', 45, 28000, 'Application Bug',
 'JWT signature validation failing intermittently. Root cause: Key rotation implementation bug causing old keys to be purged prematurely. Hotfix deployed.',
 '2025-04-17', 2025, 2, 4, 16),

('INC-2025-017', 'CDN Cache Poisoning', 'High', 'Resolved', 'Media Upload Service',
 '2025-04-24 09:30:00', '2025-04-24 12:15:00', 165, 12300, 'Configuration',
 'Incorrect cache headers causing CDN to cache error responses. Users receiving 500 errors. Purged CDN cache and fixed cache-control headers.',
 '2025-04-24', 2025, 2, 4, 17),

('INC-2025-018', 'Database Connection Pool Exhausted', 'Critical', 'Resolved', 'User Profile Service',
 '2025-05-02 13:20:00', '2025-05-02 14:30:00', 70, 7200, 'Database Configuration',
 'Profile updates timing out during product launch campaign. Connection pool size insufficient for spike in concurrent users. Increased pool and added auto-scaling.',
 '2025-05-02', 2025, 2, 5, 18),

('INC-2025-019', 'Redis Memory Exhaustion', 'High', 'Resolved', 'Recommendation Engine',
 '2025-05-08 16:45:00', '2025-05-08 18:20:00', 95, 5400, 'Capacity',
 'Redis cache hitting memory limit causing evictions and cache thrashing. Recommendation quality degraded. Increased cache instance size and implemented TTL policies.',
 '2025-05-08', 2025, 2, 5, 19),

('INC-2025-020', 'Deployment Rollback Required', 'Critical', 'Resolved', 'Payment Gateway',
 '2025-05-15 10:00:00', '2025-05-15 10:35:00', 35, 11200, 'Deployment',
 'New payment gateway version introduced critical bug in refund processing. Emergency rollback to previous version. Enhanced pre-deployment testing procedures.',
 '2025-05-15', 2025, 2, 5, 20),

-- Q3 2025 Incidents
('INC-2025-021', 'Database Deadlock', 'High', 'Resolved', 'Order Management System',
 '2025-05-22 12:30:00', '2025-05-22 14:15:00', 105, 6800, 'Database Performance',
 'Order processing jobs experiencing frequent deadlocks. Multiple transactions locking same rows in different order. Refactored transaction order and reduced lock scope.',
 '2025-05-22', 2025, 2, 5, 21),

('INC-2025-024', 'API Gateway Timeout', 'Critical', 'Resolved', 'Product Catalog API',
 '2025-06-12 15:40:00', '2025-06-12 16:25:00', 45, 13500, 'External Dependency',
 'Catalog API timeouts due to slow MongoDB queries. Database cluster experiencing high CPU. Added read replicas and optimized aggregation pipelines.',
 '2025-06-12', 2025, 2, 6, 24),

('INC-2025-027', 'Database Connection Pool Exhausted', 'Critical', 'Resolved', 'Notification Engine',
 '2025-07-03 09:15:00', '2025-07-03 10:45:00', 90, 9200, 'Database Configuration',
 'Notification batch jobs holding connections open too long. Pool exhaustion preventing new jobs from starting. Implemented connection pooling at job level.',
 '2025-07-03', 2025, 3, 7, 27),

('INC-2025-030', 'Load Balancer Health Check Failure', 'Critical', 'Resolved', 'Authentication Service',
 '2025-07-24 14:20:00', '2025-07-24 15:10:00', 50, 19000, 'Infrastructure',
 'Load balancer marking healthy instances as unhealthy. Health check endpoint timeout set too aggressively. Adjusted health check intervals and timeout thresholds.',
 '2025-07-24', 2025, 3, 7, 30),

('INC-2025-033', 'Database Query Performance Degradation', 'High', 'Resolved', 'Search Service',
 '2025-08-14 11:00:00', '2025-08-14 13:30:00', 150, 8700, 'Database Performance',
 'Search query latency increased 10x after catalog data growth. Index fragmentation and outdated statistics. Reindexed and optimized query plans.',
 '2025-08-14', 2025, 3, 8, 33),

('INC-2025-036', 'Message Queue Backup', 'High', 'Resolved', 'Notification Engine',
 '2025-09-05 08:30:00', '2025-09-05 11:15:00', 165, 0, 'Capacity',
 'RabbitMQ queue depth growing uncontrollably. Consumer processing rate insufficient for message production rate. Scaled consumers and added message batching.',
 '2025-09-05', 2025, 3, 9, 36),

-- Q4 2025 Incidents (Recent)
('INC-2025-039', 'Database Connection Pool Exhausted', 'Critical', 'Resolved', 'Order Management System',
 '2025-09-26 13:45:00', '2025-09-26 15:00:00', 75, 10500, 'Database Configuration',
 'Connection pool saturated during end-of-quarter sales push. Connections leaked by abandoned transactions. Fixed transaction scope and increased pool monitoring.',
 '2025-09-26', 2025, 3, 9, 39),

('INC-2025-042', 'API Response Time Degradation', 'High', 'Resolved', 'User Profile Service',
 '2025-10-17 10:20:00', '2025-10-17 12:35:00', 135, 7400, 'Application Performance',
 'Profile API latency increased 5x. N+1 query problem introduced in recent feature release. Implemented eager loading and response caching.',
 '2025-10-17', 2025, 4, 10, 42),

('INC-2025-045', 'Database Replication Lag', 'High', 'Resolved', 'Payment Gateway',
 '2025-10-28 16:00:00', '2025-10-28 17:30:00', 90, 5200, 'Database Performance',
 'Payment reconciliation jobs reading stale data from lagging replica. High transaction volume overwhelming replication. Upgraded replica instance class.',
 '2025-10-28', 2025, 4, 10, 44);

-- Verify data load
SELECT 
    COUNT(*) AS total_incidents,
    COUNT(DISTINCT INCIDENT_TYPE) AS unique_types,
    COUNT(DISTINCT SERVICE_NAME) AS affected_services,
    MIN(CREATED_DATE) AS earliest_incident,
    MAX(CREATED_DATE) AS latest_incident
FROM INCIDENTS;

SELECT 'Incident data loaded successfully!' AS status;

