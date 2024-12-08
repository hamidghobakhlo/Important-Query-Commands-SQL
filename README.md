# SQL Server Commands Overview

SQL Server is a powerful relational database management system (RDBMS) designed to handle vast amounts of structured data efficiently. This guide covers essential commands and techniques commonly used in database design, data manipulation, and system management.

## 1. Basic Commands

- **SELECT**: Used to query and retrieve specific data from one or more tables. It’s the most fundamental SQL operation.
- **INSERT**: Allows you to add new records to a table. Useful for populating data initially or adding individual rows.
- **UPDATE**: Modifies existing records in a table, enabling changes to the data without deleting or recreating it.
- **DELETE**: Removes specific rows from a table, often used in data cleanup or for purging irrelevant information.

## 2. Table Management

- **CREATE TABLE**: Defines the structure of a table, specifying columns and their data types. This step is the foundation of database design.
- **ALTER TABLE**: Modifies the structure of an already existing table, such as adding new columns or changing constraints.
- **DROP TABLE**: Deletes a table entirely, removing its structure and data permanently.

## 3. Constraints

Constraints enforce rules on data in tables, ensuring consistency and reliability:

- **PRIMARY KEY**: Ensures each record is uniquely identifiable.
- **FOREIGN KEY**: Links one table to another, maintaining data integrity between related records.
- **UNIQUE**: Guarantees that all values in a column are distinct.
- **CHECK**: Restricts column values based on a defined condition.

## 4. Advanced Queries

Advanced querying techniques enhance the ability to interact with and manipulate data:

- **JOIN**: Combines rows from two or more tables based on related columns.
- **GROUP BY**: Aggregates data to produce summaries, such as totals or averages, based on grouping criteria.
- **HAVING**: Filters aggregated data, complementing the GROUP BY clause.
- **DISTINCT**: Ensures only unique results are returned, eliminating duplicates.
- **ORDER BY**: Sorts the result set in ascending or descending order.

## 5. Subqueries

Subqueries are nested queries used within another query to compute intermediate results:

- **Inline Subquery**: Executes within the main query, returning a single value or a list of values.
- **EXISTS**: Tests for the presence of rows in a subquery, useful for filtering based on the existence of related data.

## 6. Index Management

Indexes improve query performance by allowing the database engine to locate data faster:

- **CREATE INDEX**: Adds an index to a column or combination of columns.
- **DROP INDEX**: Removes an index when it is no longer needed or has become inefficient.

## 7. Views

Views are virtual tables based on the result of a query:

- **CREATE VIEW**: Encapsulates complex queries for easier reuse and abstraction.
- **DROP VIEW**: Removes a view from the database.

## 8. Stored Procedures

Stored procedures encapsulate SQL logic into reusable blocks of code:

- **CREATE PROCEDURE**: Defines a procedure with specific inputs and outputs.
- **EXEC**: Executes a stored procedure, simplifying complex or repetitive tasks.

## 9. Transactions

Transactions ensure that a sequence of operations is performed as a single unit:

- **BEGIN TRANSACTION**: Marks the start of a transaction.
- **ROLLBACK**: Reverts the changes if an error occurs.
- **COMMIT**: Finalizes the transaction, making the changes permanent.

## 10. Triggers

Triggers are automated actions executed in response to specific database events:

- **CREATE TRIGGER**: Defines the trigger and specifies the event (e.g., INSERT, UPDATE, DELETE) that will invoke it.

## 11. Functions

Functions encapsulate logic and return a value:

- **Scalar Functions**: Return a single value, often used for calculations or data transformations.
- **Usage**: Functions can be integrated directly into queries for dynamic calculations.

## 12. Security

Database security ensures only authorized users can access or modify data:

- **GRANT**: Provides specific permissions to a user or role.
- **REVOKE**: Removes previously granted permissions, limiting access.

## Purpose of This Document

This document is designed to help database administrators (DBAs), developers, and learners quickly grasp essential SQL Server commands. By understanding these commands, users can:

- Manage and manipulate data effectively.
- Design robust and reliable database systems.
- Optimize performance for large-scale applications.
- Ensure security and data integrity in their systems.
