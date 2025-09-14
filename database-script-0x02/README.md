# Airbnb Database Seeding

## 📌 Overview
This directory contains SQL scripts to **seed the Airbnb database** with realistic sample data for testing and development.

## 📂 Files
- `seed.sql` → Inserts users, properties, bookings, payments, reviews, and messages.

## ⚙️ How to Run

### 1. Ensure the database and schema exist
Make sure you already ran the schema script:

```bash
psql -U postgres -d airbnb_db -f ../database-script-0x/schema.sql
