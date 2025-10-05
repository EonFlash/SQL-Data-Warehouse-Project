/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold'.
	
WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    PRINT('========================================================');
    PRINT('Database already exists!!.........Dropping the database.');
    PRINT('========================================================');
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
    PRINT('========================================================');
    PRINT('Database Dropped!!');
    PRINT('========================================================');
END;
GO

PRINT('========================================================');
PRINT('Creating New Database...');
PRINT('========================================================');

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

PRINT('========================================================');
PRINT('Created...');
PRINT('========================================================');

PRINT('========================================================');
PRINT('Creating bronze, silver and gold schemas');
PRINT('========================================================');

USE DataWarehouse;
GO


-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
