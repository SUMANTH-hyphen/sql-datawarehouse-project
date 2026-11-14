
-- Check if the tables exisits
DROP TABLE IF EXISTS bronze.crm_cust_info;
DROP TABLE IF EXISTS bronze.crm_prd_info;
DROP TABLE IF EXISTS bronze.crm_sales_details;
DROP TABLE IF EXISTS bronze.erp_cust_az12;
DROP TABLE IF EXISTS bronze.erp_loc_a101;
DROP TABLE IF EXISTS bronze.erp_px_cat_g1v2;


-- Create tables in bronze layer of related both source systems 
CREATE TABLE bronze.crm_cust_info (
	cst_id INT,
    cst_key NVARCHAR(50),
    cst_firstname NVARCHAR(50),
    cst_lastname NVARCHAR(50),
    cst_marital_status NVARCHAR(50),
    cst_gndr NVARCHAR(50),
    cst_create_date DATE
);

CREATE TABLE bronze.crm_prd_info (
	prd_id INT,
    prd_key NVARCHAR(50),
    prd_nm NVARCHAR(50),
    prd_cost INT,
    prd_line NVARCHAR(50),
    prd_start_dt DATE,
    prd_end_dt DATE
);

CREATE TABLE bronze.crm_sales_details (
	sls_ord_num INT,
    sls_prd_key NVARCHAR(50),
    sls_cust_id NVARCHAR(50),
    sls_order_dt DATE,
    sls_ship_dt DATE,
    sls_due_dt DATE,
    sls_sales NVARCHAR(50),
    sls_quantity INT,
    sls_price NVARCHAR(50)
);

CREATE TABLE bronze.erp_cust_az12 (
	CID NVARCHAR(50),
    BDATE DATE,
    GEN NVARCHAR(50)
);

CREATE TABLE bronze.erp_loc_a101 (
	CID NVARCHAR(50),
    CNTRY NVARCHAR(50)
);

CREATE TABLE bronze.erp_px_cat_g1v2 (
	ID NVARCHAR(50),
    CAT NVARCHAR(50),
    SUBCAT NVARCHAR(50),
    MAINTENANCE NVARCHAR(50)
);


-- Load data into bronze layer
LOAD DATA LOCAL INFILE 'C:\Users\2362501\Downloads\sql-data-warehouse-project-main\01_datasets\source_crm\cust_info.csv'
INTO TABLE bronze.crm_cust_info
FIELDS terminated by ','
ENCLOSED by '"'
LINES terminated by '\n'
IGNORE 1 ROWS;