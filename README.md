## Introduction:
This project aims to utilize dbt for the transformation phase of the ELT process. Here, DBT models are being developed, tested ,and deployed to snowflake data warehouse.
## Objectives:
1. To create a POC by transforming raw data into clean, well-structured data models
2. To modularise models built within DBT for reusability and optimized performance.

## Installations:
#### Signup on DBT and Snowflake
1. Create a dbt-Snowflake connector
2. Input your target schema and data warehouse connection strings.
3. Create a developer project
4. Start developing
5. You can use DBT core (CLI) or DBT Cloud for development and Deployment

## Usage:

##### Important DBT Commands
###### dbt init
Usage: Initializes a new dbt project.
Purpose: Sets up the directory structure and creates necessary files for starting a new dbt project.

###### dbt run
Usage: Executes all models defined in the project or a subset if specified.
Purpose: Runs the data transformations in the warehouse, building views or tables according to the project setup.
e.g. dbt run --select model_name  or dbt run --select model_name+   (to run all models and their dependencies)


###### dbt test
Usage: Runs tests on data models.
Purpose: Ensures data quality by running custom tests or built-in tests (e.g., checking for null values or unique constraints).
e.g. dbt test --select model_name (to test a specific model)

###### dbt compile
Usage: Compiles the dbt models into raw SQL files without running them.
Purpose: Useful for debugging or checking the generated SQL code.

###### dbt debug
Usage: Tests the dbt configuration and connection to the data warehouse.
Purpose: Diagnoses issues with the dbt setup or connection.

###### dbt docs generate
Usage: Generates documentation for the project.
Purpose: Creates a browsable HTML site with details about the data models, tests, and data lineage.

###### dbt docs serve
Usage: Serves the generated documentation locally on a web server.
Purpose: Opens the documentation site in a web browser for easy navigation and exploration.

###### dbt seed
Usage: Loads CSV files defined in the data directory into the warehouse as tables.
Purpose: Allows loading static data or reference tables to use in transformations.

###### dbt deps
Usage: Installs the dependencies for the dbt project.
Purpose: Ensures all packages specified in packages.yml are downloaded and available for use.

###### dbt source freshness
Usage: Checks the freshness of data sources.
Purpose: Validates that the source tables have been updated recently, helping ensure data timeliness.

###### dbt build
Usage: Runs models, tests, snapshots, and seeds in the correct order.
Purpose: A comprehensive command that combines the dbt run, dbt test, dbt snapshot, and dbt seed commands into a single command

