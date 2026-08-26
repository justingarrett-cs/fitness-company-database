# Fitness Company Database System

A relational database system designed to manage the operations of a fitness company, including fitness centers, rooms, customers, trainers, and fitness sessions.

## Project Overview

This project demonstrates the design and implementation of a relational database using Oracle SQL. The database organizes information about fitness centers, rooms, customers, trainers, and fitness sessions while maintaining relationships between the different entities.

The project began with an ER model that was converted into a relational schema and implemented using primary keys, foreign keys, and database constraints.

## Technologies Used

- Oracle SQL
- Oracle FreeSQL
- Relational Database Design
- ER Modeling
- SQL

## Database Structure

The database includes the following main tables:

- `CENTER`
- `ROOM`
- `PERSON`
- `CUSTOMER`
- `TRAINER`
- `FITNESS_SESSION`
- `GROUP_SESSION`
- `INDIVIDUAL_SESSION`
- `PARTICIPATES`
- `SUPERVISES`

These tables represent the relationships between fitness centers, rooms, people, trainers, customers, and fitness sessions.

## SQL Features Demonstrated

The project includes examples of:

- Table creation using DDL
- Primary and foreign keys
- Database constraints
- Data insertion
- SELECT queries
- JOIN operations
- Aggregate functions
- GROUP BY and HAVING
- Nested queries
- Correlated queries
- EXISTS and NOT EXISTS
- ANY and ALL
- UNION and INTERSECT
- Database views
- Window functions
- Audit logging using triggers

## Database Views

The project uses database views to simplify access to commonly requested information, including:

- Trainer session information
- Session participation and attendance
- Customer session history

## Audit Logging

An audit logging system was implemented using a database trigger. The trigger records changes made to customer data, including INSERT, UPDATE, and DELETE operations.

## What I Learned

This project strengthened my understanding of relational database design and SQL. I gained experience converting an ER model into a relational schema, implementing table relationships, writing advanced SQL queries, creating reusable views, and using triggers to automate database operations.

It also helped me understand how relational databases can be used to organize, retrieve, and analyze information for a real-world business system.
