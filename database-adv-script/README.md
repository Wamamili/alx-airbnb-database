This task focuses on mastering SQL joins by writing queries that combine multiple tables from the Airbnb schema.

## Queries Implemented

1. **INNER JOIN**
   - Retrieves all bookings with the respective users who made those bookings.

2. **LEFT JOIN**
   - Retrieves all properties and their reviews, including properties without reviews.

3. **FULL OUTER JOIN**
   - Retrieves all users and all bookings, even if:
     - A user has no booking.
     - A booking is not linked to a user.
   - Note: Since MySQL does not support `FULL OUTER JOIN` directly, a workaround using `UNION` of `LEFT JOIN` and `RIGHT JOIN` is provided.

## Files
- `joins_queries.sql`: Contains the SQL scripts for INNER JOIN, LEFT JOIN, and FULL OUTER JOIN queries.
- `README.md`: Documentation for Task 0.

## Queries Implemented

1. **Non-Correlated Subquery**
   - Retrieves all properties where the average rating is greater than 4.0.
   - The subquery calculates the average rating for each property and filters properties with an average above 4.0.

2. **Correlated Subquery**
   - Retrieves all users who have made more than 3 bookings.
   - The subquery runs once for each user, counting the number of bookings linked to that user.

## Files
- `subqueries.sql`: Contains the SQL scripts for non-correlated and correlated subqueries.
- `README.md`: Documentation for Task 1.



## Apply Aggregations and Window Functions

This task focuses on analyzing data with SQL aggregation functions and window functions.

## Queries Implemented

1. **Aggregation with GROUP BY**
   - Retrieves the total number of bookings made by each user.
   - Uses the `COUNT` function and `GROUP BY` clause.
   - Includes users with zero bookings by using a `LEFT JOIN`.

2. **Window Function with RANK**
   - Ranks properties based on the total number of bookings received.
   - Uses `RANK() OVER (ORDER BY COUNT(b.booking_id) DESC)`.
   - Provides a ranking where properties with the same number of bookings share the same rank.

## Files
- `aggregations_and_window_functions.sql`: Contains SQL scripts for aggregation and window function queries.
- `README.md`: Documentation for Task 2.

## Repository
[alx-airbnb-database](https://github.com/your-username/alx-airbnb-database)

Directory: `database-adv-script`
