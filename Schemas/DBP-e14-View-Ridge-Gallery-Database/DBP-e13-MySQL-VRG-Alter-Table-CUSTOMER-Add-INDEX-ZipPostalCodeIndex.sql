/* *** SQL-ALTER-TABLE-CH10C-01 *** */

ALTER TABLE CUSTOMER
	ADD INDEX ZipPostalCodeIndex
		USING BTREE(ZipPostalCode);