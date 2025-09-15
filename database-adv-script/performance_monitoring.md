# Database Performance Monitoring and Refinement

## Objective
The goal was to monitor query performance, identify bottlenecks, and refine the database schema to improve efficiency for frequently used queries.

---

## Step 1: Queries Monitored
We monitored queries that are frequently used in the Airbnb database:

1. **Retrieve all bookings for a specific user**
```sql
EXPLAIN ANALYZE
SELECT b.id, b.start_date, b.end_date, p.name AS property_name
FROM Bookings b
JOIN Properties p ON b.property_id = p.id
WHERE b.user_id = 101;
