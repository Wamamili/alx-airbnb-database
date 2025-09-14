# 🏠 ALX Airbnb Database Project

## 📌 Overview
This project is part of the **ALX Software Engineering Program (DataScape Module)**.  
The objective is to **design and implement a relational database schema** for an Airbnb-like platform, ensuring it is **normalized, efficient, and production-ready**.

The database models core Airbnb features:
- User management (guests, hosts, admins)
- Property listings
- Bookings and payments
- Reviews and ratings
- Messaging system between users

---

## 🎯 Learning Objectives
By completing this project, you will:
- Understand **Entity-Relationship (ER) modeling**
- Apply **Normalization (up to 3NF)**
- Write **SQL DDL scripts** to create schema with constraints and indexing
- Write **SQL DML scripts** to seed realistic data
- Improve **documentation and collaboration** using GitHub

---

## 📂 Project Structure


---

## 🗄️ Database Design Summary

### Entities
- **Users** → Guests, Hosts, Admins  
- **Properties** → Listed by Hosts  
- **Bookings** → Made by Guests for Properties  
- **Payments** → Linked to Bookings  
- **Reviews** → Guests leave reviews for Properties  
- **Messages** → Communication between Users  

### Relationships
- One **User** can host many **Properties**  
- One **User** can make many **Bookings**  
- One **Property** can have many **Bookings**  
- One **Booking** can have many **Payments**  
- One **User** can write many **Reviews**  
- One **Property** can receive many **Reviews**  
- Users can exchange **Messages** (M:M via `messages` table)  

---

## ⚙️ Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/wamamili/alx-airbnb-database.git
cd alx-airbnb-database
