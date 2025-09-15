# Partitioning Performance Report

## Objective
The `Bookings` table was large, and queries filtering by `start_date` were slow. Partitioning was implemented to improve query performance by dividing the table into smaller, more manageable pieces.

## Implementation
- The table was partitioned by `RANGE` on the `start_date` column.
- Partitions were created for `2024` and `2025`.
- Queries filtering by `start_date` used **partition pruning**, meaning the database only scanned relevant partitions.

## Performance Testing
Using `EXPLAIN ANALYZE`:
- Before partitioning: Queries on date ranges scanned the entire `Bookings` table, resulting in sequential scans and high execution time.
- After partitioning: Queries only scanned the relevant partition (`Bookings_2024` or `Bookings_2025`), reducing execution time significantly.

### Example
- Query on bookings from Jan–Mar 2025 only scanned the `Bookings_2025` partition.
- Query on bookings from Jun–Dec 2024 only scanned the `Bookings_2024` partition.

## Observed Improvements
- **Reduced execution time** for date range queries (due to partition pruning).
- **Lower I/O cost**, as fewer rows were scanned.
- Improved scalability when working with large datasets spanning multiple years.

## Recommendation
- Continue adding new partitions yearly (e.g., `Bookings_2026`).
- Combine partitioning with indexes on foreign key columns (`user_id`, `property_id`) for further optimization.
