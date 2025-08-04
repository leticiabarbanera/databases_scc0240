# Final Project - Databases (SCC0240)

This repository contains the SQL scripts developed by the group for the final project of the course **SCC0240 - Databases**.  
Group members: Letícia Barbanera, Julia Pravato, Murilo Lirani, and Marcos Baltazar.

## Repository Structure
- `README.md`: File with setup and execution instructions for the project.
- `tabelass.sql`: creates all database tables.
- `banco_inicial.sql`: inserts synthetic data into all tables.
- `consultas.sql`: Exercise 6: 7 SQL queries.
- `indexes.sql`: Exercise 7: creation of 3 indexes.
- `views.sql`: Exercise 8: creation of 3 views.

## How to Run the Project
Requirements: PostgreSQL 13

```bash
1. Clone the repository
git clone https://github.com/leticiabarbanera/bancos_de_dados_scc0240.git
cd bancos_de_dados_scc0240

2. Create a database in PostgreSQL
Access the PostgreSQL terminal and run:
CREATE DATABASE trabalho_final;

3. Connect to the created database
In the terminal:
psql -U postgres -d trabalho_final

Or use pgAdmin to connect to the `trabalho_final` database.

4. Run the scripts in the following order:
\i create_tables.sql
\i insert_data.sql
\i views.sql
\i queries.sql

Make sure you are in the correct directory where the `.sql` files are saved.
