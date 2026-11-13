# Relational Database Design for a Telecom Provider

MySQL database for a fictional telecom company, designed as part of my MSc Data Analytics (BSBI, Berlin).

## What's inside
- `telecom_db.sql`: creates the full schema and runs the analysis queries

## What I did
- Designed the ERD and normalised schema: customers, service plans, call / SMS / data usage, billing and support tickets
- Used primary and foreign keys to keep the data consistent
- Wrote basic and complex SQL queries (joins, aggregations, grouping) to answer business questions such as usage and revenue per plan
- Discussed CAP-theorem trade-offs for scaling the system

## How to run
Open `telecom_db.sql` in MySQL Workbench (or any MySQL client) and run it. It creates a database called `telecom`.

**Tools:** MySQL, SQL, data modelling
