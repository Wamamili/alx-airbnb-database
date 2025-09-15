# Query Optimization Report

## Initial Query
The initial query retrieved all details from `Bookings`, `Users`, `Properties`, and `Payments` tables with multiple joins.  
Although functionally correct, it introduced inefficiencies due to:
- Fetching unnecessary columns (e.g., user email, property location).
- Using an **INNER JOIN** for `Payments`, which excluded bookings without payments.
- Lack of indexes on join keys (`Bookings.user_id`, `Bookings.property_id`, `Payments.booking_id`).

## Performance Analysis
Using `EXPLAIN ANALYZE`:
- The initial query performed sequential scans on `Users`, `Properties`, and `Payments` tables.
- Execution time was higher due to repeated full-table scans and heavy join processing.

## Refactored Query
The optimized query:
- Selected only essential columns.
- Used a `LEFT JOIN` for `Payments` to avoid excluding bookings with no payments.
- Benefited from indexes created earlier (`idx_bookings_userid`, `idx_bookings_propertyid`, `idx_bookings_date`, `idx_users_id`, `idx_properties_id`).

## Performance Gains
After applying indexing and query refactoring:
- Execution time reduced significantly (as observed in `EXPLAIN ANALYZE` results).
- Query plan shifted from sequential scans to **index scans**.
- Reduced memory and CPU usage for large datasets.

## Recommendation
- Always review query columns to avoid over-fetching data.
- Apply selective `JOIN` types (INNER vs LEFT) based on actual business logic.
- Ensure indexes exist on foreign key relationships and high-usage columns.
