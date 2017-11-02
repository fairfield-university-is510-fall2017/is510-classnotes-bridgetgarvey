/******************************************************************************/
/*														                      */
/*	Kroenke and Auer - Database Processing (14th Edition) Chapter 02	    */
/*																	          */
/*	Cape Codd Outdoor Sports SQL Queries for Chapter 02 Review Questions	  */
/*																		      */
/*	These are the MySQL 5.6 code solutions								      */
/*																		      */
/******************************************************************************/

/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.17								*/

SELECT 		SKU, SKU_Description
FROM 		INVENTORY;

-- For DISTINCT SKU and SKU_Desription (not required by question)

SELECT 		DISTINCT SKU, SKU_Description
FROM 		INVENTORY;


/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.18								*/

SELECT 		SKU_Description, SKU
FROM 		INVENTORY;

-- For DISTINCT SKU and SKU_Desription (not required by question)

SELECT 		DISTINCT SKU_Description, SKU
FROM 		INVENTORY;


/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.19								*/

SELECT 		WarehouseID
FROM 		INVENTORY;

/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.20								*/

SELECT 		DISTINCT WarehouseID
FROM 		INVENTORY;

/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.21								*/

SELECT 		WarehouseID, SKU, SKU_Description, QuantityOnHand, QuantityOnOrder
FROM 		INVENTORY;

/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.22								*/

SELECT 		*
FROM 		INVENTORY;

/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.23								*/

SELECT 		*
FROM 		INVENTORY
WHERE		QuantityOnHand > 0;

/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.24								*/

SELECT 		SKU, SKU_Description
FROM 		INVENTORY
WHERE		QuantityOnHand = 0;

/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.25								*/

SELECT 		SKU, SKU_Description, WarehouseID
FROM 		INVENTORY
WHERE		QuantityOnHand = 0
ORDER BY	WarehouseID;

/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.26								*/

SELECT 		SKU, SKU_Description, WarehouseID
FROM 		INVENTORY
WHERE		QuantityOnHand > 0
ORDER BY	WarehouseID DESC, SKU;

/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.27								*/

SELECT 		SKU, SKU_Description, WarehouseID
FROM 		INVENTORY
WHERE		QuantityOnHand = 0
    AND		QuantityOnOrder > 0
ORDER BY	WarehouseID DESC, SKU;

/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.28								*/

SELECT 		SKU, SKU_Description, WarehouseID
FROM 		INVENTORY
WHERE		QuantityOnHand = 0
    OR		QuantityOnOrder = 0
ORDER BY	WarehouseID DESC, SKU;

/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.29								*/

SELECT 		SKU, SKU_Description, WarehouseID, QuantityOnHand
FROM 		INVENTORY
WHERE		QuantityOnHand > 1
    AND		QuantityOnhand < 10;

/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.30								*/

SELECT 		SKU, SKU_Description, WarehouseID, QuantityOnHand
FROM 		INVENTORY
WHERE		QuantityOnHand BETWEEN 2 AND 9;

/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.31								*/

SELECT 		DISTINCT SKU, SKU_Description
FROM 		INVENTORY
WHERE		SKU_Description LIKE 'Half-dome%';

/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.32								*/

SELECT 		DISTINCT SKU, SKU_Description
FROM 		INVENTORY
WHERE		SKU_Description LIKE '%Climb%';


/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.33								*/

SELECT 		DISTINCT SKU, SKU_Description
FROM 		INVENTORY
WHERE		SKU_Description LIKE '__d%';

/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.34								*/

SELECT 		COUNT(QuantityOnHand) AS NumberOfRows,
			SUM(QuantityOnHand) AS TotalQuantityOnHand,
			AVG(QuantityOnHand) AS AverageQuantityOnHand,
			MAX(QuantityOnHand) AS MaximumQuantityOnHand,
			MIN(QuantityOnHand) AS MinimumQuantityOnHand
FROM 		INVENTORY;

/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.35								*/

-- Written answer, not an SQL query.

/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.36								*/

SELECT 		WarehouseID, SUM(QuantityOnHand) AS TotalItemsOnHand
FROM 		INVENTORY
GROUP BY	WarehouseID
ORDER BY	TotalItemsOnHand DESC;


/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.37								*/

SELECT 		WarehouseID, SUM(QuantityOnHand) AS TotalItemsOnHandLT3
FROM 		INVENTORY
WHERE		QuantityOnHand < 3
GROUP BY	WarehouseID
ORDER BY	TotalItemsOnHandLT3 DESC;

/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.38								*/

SELECT 		WarehouseID, SUM(QuantityOnHand) AS TotalItemsOnHandLT3
FROM 		INVENTORY
WHERE		QuantityOnHand < 3
GROUP BY	WarehouseID
HAVING		count(*) < 2
ORDER BY	TotalItemsOnHandLT3 DESC;

/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.39								*/

-- Written answer, not an SQL query.

/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.40								*/

SELECT 		SKU, SKU_Description, WAREHOUSE.WarehouseID, WarehouseCity, WarehouseState
FROM 		INVENTORY, WAREHOUSE
WHERE		INVENTORY.WarehouseID=WAREHOUSE.WarehouseID
	AND		(WarehouseCity = 'Atlanta'
			 OR	WarehouseCity = 'Bangor'	
			 OR	WarehouseCity = 'Chicago');

/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.41								*/

SELECT 		SKU, SKU_Description, WAREHOUSE.WarehouseID, WarehouseCity, WarehouseState
FROM 		INVENTORY, WAREHOUSE
WHERE		INVENTORY.WarehouseID=WAREHOUSE.WarehouseID
	AND		WarehouseCity IN ('Atlanta', 'Bangor' ,'Chicago');

/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.42								*/

SELECT 		SKU, SKU_Description, WAREHOUSE.WarehouseID, WarehouseCity, WarehouseState
FROM 		INVENTORY, WAREHOUSE
WHERE		INVENTORY.WarehouseID=WAREHOUSE.WarehouseID
	AND		WarehouseCity <> 'Atlanta'
	AND	 	WarehouseCity <> 'Bangor'	
	AND		WarehouseCity <> 'Chicago';

/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.43								*/
SELECT 		SKU, SKU_Description, WAREHOUSE.WarehouseID, WarehouseCity, WarehouseState
FROM 		INVENTORY, WAREHOUSE
WHERE		INVENTORY.WarehouseID=WAREHOUSE.WarehouseID
	AND		WarehouseCity NOT IN ('Atlanta', 'Bangor' ,'Chicago');
  
/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.44								*/

SELECT  SKU_DESCRIPTION, ' is located in ', WarehouseCity AS ItemLocation
FROM    INVENTORY, WAREHOUSE
WHERE		INVENTORY.WarehouseID=WAREHOUSE.WarehouseID;

-- Alternate with RTRIM function (not required in question)

SELECT  RTRIM(SKU_DESCRIPTION),' is located in ', 
        RTRIM(WarehouseCity) AS ItemLocation
FROM    INVENTORY, WAREHOUSE
WHERE		INVENTORY.WarehouseID=WAREHOUSE.WarehouseID;

/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.45								*/

SELECT 		SKU, SKU_Description, WarehouseID
FROM 		INVENTORY
WHERE		WarehouseID IN
			(SELECT		WarehouseID
			 FROM		WAREHOUSE
			 WHERE		Manager = 'Lucille Smith');

/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.46								*/

SELECT 		SKU, SKU_Description, WAREHOUSE.WarehouseID
FROM 		INVENTORY, WAREHOUSE
WHERE		INVENTORY.WarehouseID=WAREHOUSE.WarehouseID
	AND		Manager = 'Lucille Smith';

/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.47								*/

SELECT 		SKU, SKU_Description, WAREHOUSE.WarehouseID
FROM 		INVENTORY JOIN WAREHOUSE ON
        INVENTORY.WarehouseID=WAREHOUSE.WarehouseID
WHERE		Manager = 'Lucille Smith';

/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.48								*/

SELECT 		WarehouseID, AVG(QuantityOnHand) AS AverageQuantityOnHand
FROM 		INVENTORY
WHERE		WarehouseID IN
			(SELECT		WarehouseID
			 FROM		WAREHOUSE
			 WHERE		Manager = 'Lucille Smith')
GROUP BY	WarehouseID;

/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.49								*/

SELECT 		INVENTORY.WarehouseID, AVG(QuantityOnHand) AS AverageQuantityOnHand
FROM 		INVENTORY, WAREHOUSE
WHERE		INVENTORY.WarehouseID=WAREHOUSE.WarehouseID
	AND		Manager = 'Lucille Smith'
GROUP BY	INVENTORY.WarehouseID;

/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.50 								*/

SELECT 		INVENTORY.WarehouseID, AVG(QuantityOnHand) AS AverageQuantityOnHand
FROM 		INVENTORY JOIN WAREHOUSE ON
        INVENTORY.WarehouseID=WAREHOUSE.WarehouseID
WHERE		Manager = 'Lucille Smith'
GROUP BY	INVENTORY.WarehouseID;


/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.51								*/

SELECT 		WAREHOUSE.WarehouseID, WarehouseCity,
			WarehouseState, Manager,
			SKU, SKU_Description, QuantityOnHand
FROM 		INVENTORY JOIN WAREHOUSE 
	ON		INVENTORY.WarehouseID=WAREHOUSE.WarehouseID
WHERE		Manager = 'Lucille Smith';


/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.52								*/

SELECT 		WarehouseID,
			SUM(QuantityOnOrder) AS TotalItemsOnOrder,
			SUM(QuantityOnHand) AS TotalItemsOnHand
FROM 		INVENTORY
GROUP BY	WarehouseID, QuantityOnOrder;


/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.53								*/

-- Written answer, not an SQL query.

/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.54								*/

-- Written answer, not an SQL query.

/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.55								*/

SELECT W.*, I.SKU, I.SKU_Description, I.QuantityOnHand, 	I.QuantityOnOrder
FROM WAREHOUSE W LEFT JOIN INVENTORY I ON
  W.WarehouseID = I.WarehouseID;


/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.56							*/

SELECT SKU, SKU_Description, Department
FROM CATALOG_SKU_2013
UNION
SELECT SKU, SKU_Description, Department
FROM CATALOG_SKU_2014;

/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.57							*/

SELECT SKU, SKU_Description, Department
FROM CATALOG_SKU_2013
WHERE CatalogPage IS NOT NULL
UNION
SELECT SKU, SKU_Description, Department
FROM CATALOG_SKU_2014
WHERE CatalogPage IS NOT NULL;

/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.58							*/

/* MySQL does not support INTERSECT. */
/* The query could perhaps be rewritten using other techniques */

/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.59						*/

/* MySQL does not support INTERSECT. */
/* The query could perhaps be rewritten using other techniques */



/* DBP-e14 Chapter02 SQL-Query-Review-Question-2.60						*/

/* MySQL does not support DIFFERENCE or MINUS */
/* The query could perhaps be rewritten using other techniques */


