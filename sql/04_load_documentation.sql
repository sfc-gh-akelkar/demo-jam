-- =====================================================
-- Snowflake Intelligence Demo Jam - Load Documentation
-- =====================================================
-- Purpose: Load engineering runbooks and documentation
-- =====================================================

USE DATABASE DEMO_JAM;
USE SCHEMA ENGINEERING_OPS;
USE WAREHOUSE APP_WH;

-- =====================================================
-- Load Engineering Documentation (Unstructured Data)
-- =====================================================

-- Runbook: Database Connection Pool Management
INSERT INTO ENGINEERING_DOCS 
SELECT
'DOC-RB-001',
'Runbook',
'Database Connection Pool Management and Troubleshooting',
'# Database Connection Pool Management

## Overview
This runbook covers best practices for managing database connection pools across all backend services. Connection pool exhaustion is one of our most common incident types.

## Connection Pool Sizing Guidelines

### Recommended Configuration
- **Default Pool Size**: Start with 20 connections per application instance
- **Maximum Pool Size**: Set to 50 connections with monitoring
- **Connection Timeout**: 30 seconds
- **Idle Connection Timeout**: 10 minutes
- **Connection Validation**: Enable connection testing on checkout

### Calculating Optimal Pool Size
Formula: connections = ((core_count * 2) + effective_spindle_count)
For most of our cloud instances: Start with 20, monitor, and adjust based on metrics.

## Common Issues and Resolutions

### Issue 1: Connection Pool Exhaustion
**Symptoms:**
- Application logs showing "Connection pool exhausted" errors
- Database connection count at maximum
- API response times increasing dramatically
- Health check endpoints timing out

**Immediate Mitigation:**
1. Increase connection pool size temporarily (double current size)
2. Restart application instances in rolling fashion
3. Identify and kill long-running queries in database
4. Check for connection leaks in recent deployments

**Root Cause Investigation:**
- Review slow query logs for queries taking >5 seconds
- Check for missing connection.close() in try/catch blocks
- Look for abandoned transactions holding connections
- Verify connection timeout settings are appropriate

**Permanent Fix:**
- Add connection pooling metrics and alerts
- Implement connection leak detection
- Set aggressive connection timeouts for user-facing APIs
- Consider implementing connection pool per-endpoint

### Issue 2: Database Timeout During Peak Load
**Symptoms:**
- Intermittent timeouts during known traffic spikes
- Connection pool size reached but not exceeded
- Database CPU utilization normal

**Resolution:**
- Connection pool size adequate but queries too slow
- Add read replicas for read-heavy workloads
- Implement query result caching
- Consider connection pool warm-up during scale-out

## Monitoring and Alerts

### Key Metrics to Monitor
1. Active connection count
2. Idle connection count  
3. Connection wait time
4. Connection acquisition time
5. Connection pool utilization percentage

### Alert Thresholds
- **Warning**: Pool utilization >70% for 5 minutes
- **Critical**: Pool utilization >90% for 2 minutes
- **Critical**: Connection wait time >5 seconds

## Emergency Procedures

### During Active Incident
1. **Immediate Action** (< 5 minutes):
   - Scale up connection pool size by 50%
   - Restart application pods in rolling fashion (25% at a time)
   - Monitor connection metrics every 30 seconds

2. **Short-term Mitigation** (< 15 minutes):
   - Identify top 10 slowest queries in last hour
   - Check for blocking queries or locks
   - Review recent deployments for connection leak patterns

3. **Recovery Verification** (< 30 minutes):
   - Confirm API response times back to normal
   - Verify connection pool utilization below 60%
   - Check error rates returned to baseline

## Post-Incident Review Checklist
- [ ] Document connection pool size before and after
- [ ] Identify root cause (slow queries, leak, traffic spike, etc.)
- [ ] Update connection pool sizing if incident was capacity-related
- [ ] Add specific monitoring if new pattern discovered
- [ ] Update this runbook if new mitigation steps identified

## Related Documentation
- Database Performance Tuning Guide
- Application Deployment Checklist
- Capacity Planning Guidelines

## Contact Information
- On-Call: Platform Team (#platform-oncall)
- Subject Matter Expert: Database Team (#database-team)
- Escalation: VP Engineering

Last Updated: 2025-10-15',
'Platform Team',
CURRENT_TIMESTAMP(),
CURRENT_TIMESTAMP(),
ARRAY_CONSTRUCT('database', 'connection-pool', 'troubleshooting', 'performance'),
PARSE_JSON('{"category": "infrastructure", "criticality": "high", "review_frequency": "quarterly"}')
);

-- Runbook: Service Deployment and Rollback
INSERT INTO ENGINEERING_DOCS 
SELECT
'DOC-RB-002',
'Runbook',
'Service Deployment and Emergency Rollback Procedures',
'# Service Deployment and Rollback Procedures

## Pre-Deployment Checklist

### Code Review Requirements
- [ ] At least 2 approvals from team members
- [ ] All CI/CD tests passing
- [ ] Security scan completed with no critical issues
- [ ] Database migration plan reviewed (if applicable)

### Deployment Prerequisites
- [ ] Staging environment tested successfully
- [ ] Load testing completed for high-traffic services
- [ ] Rollback plan documented and reviewed
- [ ] On-call engineer notified and available
- [ ] Customer-facing teams notified of deployment window

## Deployment Process

### 1. Blue-Green Deployment (Preferred)
Our default deployment strategy for all customer-facing services.

**Steps:**
1. Deploy new version to "green" environment
2. Run smoke tests on green environment
3. Gradually shift traffic: 5% → 25% → 50% → 100%
4. Monitor error rates and latency at each stage
5. Wait 15 minutes at 100% before considering deployment complete

**Monitoring During Deployment:**
- Error rate increase >0.5% → pause rollout
- P95 latency increase >20% → pause rollout
- Any critical errors → immediate rollback

### 2. Rolling Deployment
Used for internal services and background workers.

**Steps:**
1. Deploy to 25% of instances
2. Monitor for 10 minutes
3. Deploy to next 25% if healthy
4. Continue until all instances updated

## Emergency Rollback Procedures

### When to Rollback
Initiate immediate rollback if:
- Error rate increases >1% above baseline
- Critical functionality broken
- Data corruption detected
- Security vulnerability introduced
- P95 latency increases >50%

### Rollback Steps

#### For Blue-Green Deployments (< 5 minutes)
1. In deployment tool, click "Rollback to Previous Version"
2. Traffic will automatically shift back to blue environment
3. Verify metrics returning to normal
4. Investigate root cause before attempting redeploy

#### For Rolling Deployments (< 10 minutes)
1. Stop deployment pipeline immediately
2. Deploy previous version to all instances
3. Restart instances in parallel (if safe) or rolling (if cautious)
4. Verify all instances healthy before resuming normal operations

#### For Database Migrations (< 30 minutes)
**CRITICAL: Database rollbacks are complex**
1. Stop application deployments immediately
2. Assess if data was written with new schema
3. If yes: Run backward migration script (if available)
4. If no: Safe to rollback application code only
5. Engage database team for assistance

## Post-Deployment Verification

### Immediate Checks (< 5 minutes)
- [ ] Health check endpoints returning 200
- [ ] Error rate within normal range
- [ ] Key user flows functioning (login, purchase, etc.)
- [ ] Dependent services operating normally

### Extended Monitoring (< 1 hour)
- [ ] Background jobs processing successfully
- [ ] Database query performance stable
- [ ] Memory and CPU utilization normal
- [ ] No unusual log patterns

## Common Deployment Issues

### Issue: Service Won''t Start After Deployment
**Symptoms:** Pods crashing, health checks failing
**Common Causes:**
- Missing environment variable
- Database migration not applied
- Incompatible dependency version
- Configuration error

**Resolution:**
1. Check application logs for startup errors
2. Verify environment variables match staging
3. Confirm database migration status
4. Rollback if issue not resolved in 10 minutes

### Issue: Performance Degradation After Deployment
**Symptoms:** Slow response times, increased latency
**Common Causes:**
- Inefficient new code path
- Missing database index for new query
- Increased logging overhead
- Connection pool misconfiguration

**Resolution:**
1. Compare query performance before/after deployment
2. Check for new N+1 query patterns
3. Review database query plans for new queries
4. Consider immediate rollback if business impact significant

## Deployment Schedule and Policies

### Allowed Deployment Windows
- **Standard Changes**: Monday-Thursday, 10 AM - 4 PM local time
- **Emergency Hotfixes**: Anytime with VP Engineering approval
- **Database Migrations**: Tuesday-Wednesday only, with 48hr notice

### Deployment Freeze Periods
- Black Friday through Cyber Monday
- Week of December 20-31
- During major product launches (announced via #engineering channel)

Last Updated: 2025-10-20',
'DevOps Team',
CURRENT_TIMESTAMP(),
CURRENT_TIMESTAMP(),
ARRAY_CONSTRUCT('deployment', 'rollback', 'devops', 'cicd'),
PARSE_JSON('{"category": "operations", "criticality": "high", "review_frequency": "monthly"}')
);

-- Postmortem: Authentication Service Connection Pool Incident
INSERT INTO ENGINEERING_DOCS 
SELECT
'DOC-PM-001',
'Postmortem',
'Postmortem: Authentication Service Connection Pool Exhaustion - January 5, 2025',
'# Incident Postmortem: Authentication Service Connection Pool Exhaustion

## Incident Summary
- **Date:** January 5, 2025
- **Duration:** 82 minutes (14:23 - 15:45 UTC)
- **Severity:** Critical (P1)
- **Affected Users:** ~12,500 users
- **Services Impacted:** Authentication Service, Login flows, API authentication

## Impact
- Users unable to log in to platform
- API requests receiving 503 errors
- Mobile app showing "Service Unavailable" errors
- Authenticated sessions remained valid (existing users not logged out)
- Revenue impact: Estimated $45,000 in lost transactions

## Timeline (All times UTC)

**14:23** - PagerDuty alert: Authentication service health check failing
**14:25** - On-call engineer confirms 100% error rate for login endpoint
**14:27** - Incident declared, war room established
**14:30** - Initial investigation shows database connection pool at 100% utilization
**14:35** - Identified long-running queries holding connections (avg 45 seconds per query)
**14:40** - Decision made to increase connection pool size from 20 to 50
**14:45** - Configuration change deployed, pods restarting
**14:52** - 50% of pods healthy, error rate dropping to 45%
**15:05** - All pods healthy, error rate at 12%
**15:15** - Identified root cause: missing index on users table for new query pattern
**15:25** - Database index created, query times dropped to <100ms
**15:30** - Error rate back to normal baseline
**15:45** - Incident resolved, monitoring continues

## Root Cause
A new feature released earlier that morning introduced a user profile lookup query that was missing a database index. Under normal load, this query took ~200ms. During peak afternoon traffic, the query took 30-45 seconds due to table locks and lack of index.

These slow queries held database connections open for extended periods, exhausting the connection pool (configured at 20 connections per pod, 10 pods = 200 total connections). Once exhausted, new requests could not acquire connections and failed immediately.

## Contributing Factors
1. **Insufficient load testing**: New feature tested in staging with limited data set (10K users vs 2M in production)
2. **Missing query analysis**: Database query plan not reviewed during code review
3. **Inadequate monitoring**: No alerting on connection pool utilization percentage
4. **Connection pool sizing**: Default 20 connections insufficient for peak traffic patterns

## What Went Well
1. Fast incident detection (< 2 minutes from issue start)
2. Clear communication in war room, no confusion about ownership
3. Incremental mitigation approach (pool size increase while investigating root cause)
4. Good runbook documentation for connection pool issues
5. Post-fix verification thorough before closing incident

## What Went Wrong
1. Load testing process did not catch performance issue
2. No automated query performance testing in CI/CD pipeline
3. Connection pool metrics not included in deployment dashboard
4. Rollback not considered as option (focus immediately on fixing forward)

## Action Items

### Immediate (Completed)
- [x] Increase connection pool size to 50 (with monitoring)
- [x] Create index on users table for new query pattern
- [x] Add connection pool utilization to monitoring dashboard
- [x] Document incident in postmortem database

### Short-term (Due: January 15, 2025)
- [ ] Implement automated query performance testing in CI/CD (@database-team)
- [ ] Add connection pool alerting at 70% and 90% thresholds (@platform-team)
- [ ] Review and update load testing procedures (@qa-team)
- [ ] Add "query plan review" to code review checklist (@eng-leads)

### Long-term (Due: February 28, 2025)
- [ ] Implement automatic connection leak detection (@platform-team)
- [ ] Build query performance regression testing framework (@database-team)
- [ ] Create pre-deployment database query analysis tool (@tools-team)
- [ ] Implement circuit breaker pattern for database connections (@platform-team)

## Lessons Learned
1. **Load testing must use production-scale data**: Staging environment had only 0.5% of production data volume, missing performance issues
2. **Query plan review is critical**: Simple code review caught functional issues but not performance
3. **Monitoring gaps can delay diagnosis**: Connection pool metrics would have shown problem immediately
4. **Connection pools need active management**: Default settings rarely optimal for production traffic

## Related Incidents
- Similar connection pool exhaustion on Order Management System (February 8, 2025)
- Payment Gateway database timeout incident (March 19, 2025)
- These incidents led to platform-wide connection pool sizing review

Last Updated: 2025-01-10',
'Platform Team',
CURRENT_TIMESTAMP(),
CURRENT_TIMESTAMP(),
ARRAY_CONSTRUCT('postmortem', 'database', 'connection-pool', 'authentication', 'incident'),
PARSE_JSON('{"incident_id": "INC-2025-001", "severity": "critical", "lessons_learned": true}')
);

-- Architecture Doc: Database Connection Pooling
INSERT INTO ENGINEERING_DOCS 
SELECT
'DOC-ARCH-001',
'Architecture',
'Database Connection Pooling Architecture and Best Practices',
'# Database Connection Pooling Architecture

## System Overview
This document describes our database connection pooling architecture across all backend services, including configuration standards, monitoring approach, and operational best practices.

## Architecture Principles

### 1. Connection Pool Per Service
Each microservice maintains its own connection pool to its primary database. We do not use a shared connection proxy to avoid single points of failure.

**Rationale:**
- Fault isolation: One service cannot exhaust connections for others
- Independent scaling: Each service scales its pool based on its needs
- Simplified debugging: Connection metrics tied directly to service

### 2. Dynamic Pool Sizing
Connection pools should be sized based on service traffic patterns and database capacity.

**Standard Configuration:**
```
Initial Pool Size: 10 connections
Max Pool Size: 50 connections  
Min Idle Connections: 5 connections
Connection Timeout: 30 seconds
Idle Timeout: 10 minutes
Validation Query: SELECT 1
Test On Borrow: true
```

### 3. Connection Lifecycle Management

**Connection Acquisition:**
1. Application requests connection from pool
2. Pool checks for available idle connection
3. If available: validate and return
4. If none available and below max: create new connection
5. If at max capacity: wait up to timeout period
6. If timeout exceeded: throw exception

**Connection Return:**
1. Application finishes using connection
2. Connection returned to pool (not closed)
3. Connection marked as idle
4. If idle timeout exceeded: connection closed and removed from pool

## Implementation Patterns

### Pattern 1: Try-With-Resources (Java)
```java
try (Connection conn = dataSource.getConnection()) {
    // Use connection
    PreparedStatement stmt = conn.prepareStatement(sql);
    ResultSet rs = stmt.executeQuery();
    // Process results
} // Connection automatically returned to pool
```

### Pattern 2: Context Managers (Python)
```python
with connection_pool.get_connection() as conn:
    cursor = conn.cursor()
    cursor.execute(query)
    results = cursor.fetchall()
    # Connection returned automatically
```

### Pattern 3: Defer/Finally (Go)
```go
conn, err := pool.Acquire(ctx)
if err != nil {
    return err
}
defer conn.Release() // Ensures return to pool

// Use connection
rows, err := conn.Query(ctx, query)
```

## Common Anti-Patterns to Avoid

### Anti-Pattern 1: Not Closing Connections
```java
// BAD - Connection leak
Connection conn = dataSource.getConnection();
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(sql);
return processResults(rs); // Connection never returned!
```

### Anti-Pattern 2: Holding Connections Across Async Operations
```python
# BAD - Holding connection while waiting for external API
conn = pool.get_connection()
cursor = conn.cursor()
cursor.execute("SELECT * FROM users WHERE id = ?", (user_id,))
user_data = cursor.fetchone()

# External API call while holding connection
external_data = requests.get(f"https://api.example.com/data/{user_id}").json()

cursor.execute("UPDATE users SET data = ? WHERE id = ?", (external_data, user_id))
conn.close()
```

**Correct Pattern:**
```python
# GOOD - Release connection before external call
conn = pool.get_connection()
cursor = conn.cursor()
cursor.execute("SELECT * FROM users WHERE id = ?", (user_id,))
user_data = cursor.fetchone()
conn.close()  # Release connection

# External API call without holding connection
external_data = requests.get(f"https://api.example.com/data/{user_id}").json()

# Acquire new connection for update
conn = pool.get_connection()
cursor = conn.cursor()
cursor.execute("UPDATE users SET data = ? WHERE id = ?", (external_data, user_id))
conn.close()
```

### Anti-Pattern 3: Creating Connection Pool Per Request
```javascript
// BAD - New pool per request
app.get("/users", async (req, res) => {
    const pool = new Pool({ /* config */ }); // Creates new pool every request!
    const client = await pool.connect();
    const result = await client.query("SELECT * FROM users");
    client.release();
    res.json(result.rows);
});
```

## Monitoring and Observability

### Key Metrics
1. **Active Connections**: Current connections in use
2. **Idle Connections**: Available connections in pool
3. **Pool Utilization**: (Active / Max) * 100
4. **Connection Wait Time**: Time waiting to acquire connection
5. **Connection Create Time**: Time to establish new connection
6. **Connection Errors**: Failed connection attempts

### Alert Thresholds
- Pool utilization >70% for 5 minutes (Warning)
- Pool utilization >90% for 2 minutes (Critical)
- Connection wait time >5 seconds (Critical)
- Connection error rate >5% (Critical)

### Dashboards
Each service should have a connection pool dashboard showing:
- Time-series graph of active vs max connections
- Connection acquisition latency (p50, p95, p99)
- Connection error rate
- Pool utilization heatmap across all instances

## Capacity Planning

### Sizing Formula
A simplified formula for connection pool sizing:
```
connections = ((core_count * 2) + effective_spindle_count)
```

For cloud databases, start with:
- Low traffic (<100 QPS): 20 connections
- Medium traffic (100-500 QPS): 50 connections  
- High traffic (>500 QPS): 100+ connections (with monitoring)

### Database Side Limits
PostgreSQL default max_connections: 100
MySQL default max_connections: 151

With 10 service instances, max 20 connections each = 200 total.
This exceeds defaults! Either:
1. Increase database max_connections
2. Reduce per-instance pool size
3. Use connection proxy (PgBouncer, ProxySQL)

## Incident Response

### Connection Pool Exhaustion Checklist
1. Immediately increase pool size by 50%
2. Rolling restart of service instances
3. Check for long-running queries (>5 seconds)
4. Review recent deployments for connection leaks
5. Check database connection count vs limit
6. Monitor for connection leak patterns

### Investigation Queries

PostgreSQL - Check connection count:
```sql
SELECT count(*), state, application_name
FROM pg_stat_activity  
WHERE datname = ''your_db''
GROUP BY state, application_name;
```

MySQL - Check connection count:
```sql
SHOW PROCESSLIST;
SELECT * FROM information_schema.processlist 
WHERE user = ''your_app_user'';
```

## Best Practices Summary
1. Always use try-with-resources or equivalent pattern
2. Never hold connections during external I/O operations
3. Set appropriate timeouts (connection and query)
4. Monitor pool utilization and set alerts
5. Size pools based on measured traffic patterns
6. Test connection pool behavior under load
7. Include connection metrics in deployment dashboards
8. Document pool configuration decisions

Last Updated: 2025-09-15',
'Platform Team',
CURRENT_TIMESTAMP(),
CURRENT_TIMESTAMP(),
ARRAY_CONSTRUCT('architecture', 'database', 'connection-pool', 'best-practices'),
PARSE_JSON('{"category": "architecture", "criticality": "high", "review_frequency": "semi-annual"}')
);

-- Runbook: Memory Leak Investigation
INSERT INTO ENGINEERING_DOCS 
SELECT
'DOC-RB-003',
'Runbook',
'Memory Leak Detection and Resolution Guide',
'# Memory Leak Detection and Resolution

## Overview
Memory leaks cause gradual memory consumption growth, eventually leading to Out-Of-Memory (OOM) errors and service crashes. This runbook covers detection, diagnosis, and resolution.

## Common Symptoms
- Memory usage steadily increasing over time
- Garbage collection frequency increasing
- Application restarts with OOM errors
- Degraded performance before crashes
- Heap dump files generated

## Quick Diagnosis Steps

### Step 1: Confirm Memory Leak (5 minutes)
Check monitoring dashboards:
- Is memory usage trending upward over hours/days?
- Does memory drop after restart but grow again?
- Is garbage collection freeing memory or just buying time?

### Step 2: Identify Affected Service (5 minutes)
- Check which service instances showing memory growth
- Verify issue across multiple instances (not single bad instance)
- Check if related to specific deployment or gradual

### Step 3: Immediate Mitigation (10 minutes)
If service stability at risk:
1. Increase memory limits temporarily (2x current)
2. Implement automatic pod restart when memory >80%
3. Scale out additional instances to handle load during restarts

## Investigation Techniques

### For Java Applications

**Generate Heap Dump:**
```bash
kubectl exec -it <pod-name> -- jmap -dump:live,format=b,file=/tmp/heap.hprof <pid>
kubectl cp <pod-name>:/tmp/heap.hprof ./heap.hprof
```

**Analyze with Eclipse MAT:**
1. Open heap dump in Memory Analyzer Tool
2. Run "Leak Suspects Report"
3. Look for objects with unexpectedly large retained heap
4. Check for collections growing unbounded

**Common Java Leak Patterns:**
- Static collections never cleared
- ThreadLocal variables not removed
- Event listeners not unregistered  
- Database cursors not closed
- Cache with no eviction policy

### For Python Applications

**Generate Memory Profile:**
```python
from memory_profiler import profile

@profile
def problematic_function():
    # Your code here
```

**Use objgraph:**
```python
import objgraph
objgraph.show_most_common_types(limit=20)
objgraph.show_growth()
```

**Common Python Leak Patterns:**
- Circular references preventing garbage collection
- Global list/dict accumulating data
- Unclosed file handles
- Database connections not explicitly closed
- Large objects in exception traceback

### For Node.js Applications

**Generate Heap Snapshot:**
```javascript
const v8 = require(''v8'');
const fs = require(''fs'');
const snapshot = v8.writeHeapSnapshot();
```

**Use Chrome DevTools:**
1. Enable inspector: `node --inspect app.js`
2. Open chrome://inspect
3. Take heap snapshots before and after suspected leak
4. Compare snapshots to find growth

**Common Node.js Leak Patterns:**
- Event emitters with too many listeners
- Closures capturing large objects
- Global variables accumulating data
- Timers and intervals not cleared
- Promises never resolving

## Resolution Patterns

### Pattern 1: Unbounded Collection Growth
**Problem:** List/array/map growing indefinitely
```java
// LEAK - Static cache never clears
private static Map<String, Data> cache = new HashMap<>();

public Data getData(String key) {
    if (!cache.containsKey(key)) {
        cache.put(key, loadData(key)); // Grows forever!
    }
    return cache.get(key);
}
```

**Solution:** Add size limits and eviction
```java
private static Map<String, Data> cache = 
    new LRUCache<>(1000); // Max 1000 entries

// Or use proper cache library
private static LoadingCache<String, Data> cache = CacheBuilder.newBuilder()
    .maximumSize(1000)
    .expireAfterAccess(10, TimeUnit.MINUTES)
    .build(key -> loadData(key));
```

### Pattern 2: Resource Not Released
**Problem:** Connections, files, cursors not closed
```python
# LEAK - Connection not closed on error
def process_data():
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM large_table")
    results = cursor.fetchall()
    process(results)  # If this raises exception, connection leaks!
    conn.close()
```

**Solution:** Use context managers
```python
def process_data():
    with get_connection() as conn:
        with conn.cursor() as cursor:
            cursor.execute("SELECT * FROM large_table")
            results = cursor.fetchall()
            process(results)
    # Connection and cursor automatically closed
```

### Pattern 3: Event Listener Accumulation
**Problem:** Listeners registered but never removed
```javascript
// LEAK - Listener added on every request
app.get(''/data'', (req, res) => {
    eventEmitter.on(''data'', (data) => {
        res.json(data);
    }); // Listener never removed!
});
```

**Solution:** Remove listeners appropriately
```javascript
app.get(''/data'', (req, res) => {
    const handler = (data) => {
        res.json(data);
        eventEmitter.removeListener(''data'', handler); // Clean up
    };
    eventEmitter.once(''data'', handler); // Or use once()
});
```

## Post-Resolution Verification

### Verify Fix (24-48 hours)
1. Deploy fix to staging environment
2. Run load test for extended period (minimum 4 hours)
3. Monitor memory usage - should remain stable
4. Deploy to production with close monitoring
5. Verify memory stable over 48 hours

### Add Monitoring
- Add memory usage trends to service dashboard
- Set alerts for memory growth rate
- Implement automatic heap dump on OOM
- Add memory metrics to deployment verification

## Prevention Strategies

1. **Code Review Checklist:**
   - Collections have size limits or eviction policies
   - Resources (connections, files) used with try-with-resources
   - Event listeners removed when no longer needed
   - No indefinite caching without TTL

2. **Automated Testing:**
   - Long-running integration tests (>1 hour)
   - Memory profiling in CI for critical paths
   - Load testing includes memory growth monitoring

3. **Runtime Monitoring:**
   - Memory usage trends by service
   - Garbage collection frequency and duration
   - Automatic heap dumps on memory pressure

Last Updated: 2025-08-20',
'Platform Team',
CURRENT_TIMESTAMP(),
CURRENT_TIMESTAMP(),
ARRAY_CONSTRUCT('memory-leak', 'troubleshooting', 'performance', 'debugging'),
PARSE_JSON('{"category": "troubleshooting", "criticality": "high", "review_frequency": "semi-annual"}')
);

-- Verify documentation loaded
SELECT 
    DOC_TYPE,
    COUNT(*) AS doc_count,
    AVG(LENGTH(CONTENT)) AS avg_content_length
FROM ENGINEERING_DOCS
GROUP BY DOC_TYPE;

SELECT 'Documentation loaded successfully!' AS status;

