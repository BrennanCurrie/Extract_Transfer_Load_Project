-- Database: crowdfunding_db

-- DROP DATABASE IF EXISTS crowdfunding_db;









	
-- create the category table
CREATE TABLE category (
    category_id TEXT PRIMARY KEY,
    category TEXT
);

COPY category FROM 'C:/Users/Mathew/Desktop/Crowdfunding_ETL/Resources/category.csv' DELIMITER ',' CSV HEADER;

-- create the contacts table
CREATE TABLE contacts (
    contact_id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT
);
-- import data into contacts table
COPY contacts FROM 'C:/Users/Mathew/Desktop/Crowdfunding_ETL/Resources/contacts.csv' DELIMITER ',' CSV HEADER;

-- create the subcategory table
CREATE TABLE subcategory (
    subcategory_id TEXT PRIMARY KEY,
    subcategory TEXT
);
-- import data into subcategory table
COPY subcategory FROM 'C:/Users/Mathew/Desktop/Crowdfunding_ETL/Resources/subcategory.csv' DELIMITER ',' CSV HEADER;


-- create the campaign table
CREATE TABLE campaign (
    cf_id INTEGER,
	PRIMARY KEY(cf_id),
	contact_id INTEGER,
    FOREIGN KEY (contact_id) REFERENCES contacts(contact_id),
    company_name TEXT,
    description TEXT,
    goal FLOAT,
    pledged FLOAT,
    outcome TEXT,
    backers_count INTEGER,
    country TEXT,
    currency TEXT,
    launch_date DATE,
    end_date DATE,
    staff_pick BOOLEAN,
    spotlight BOOLEAN,
	category_id TEXT,
    FOREIGN KEY (category_id) REFERENCES category(category_id),
	subcategory_id TEXT,
    FOREIGN KEY (subcategory_id) REFERENCES subcategory(subcategory_id)
    
);

-- import data into campaign table
COPY campaign FROM 'C:/Users/Mathew/Desktop/Crowdfunding_ETL/Resources/campaign.csv' DELIMITER ',' CSV HEADER;







-- Verify data in the category table
SELECT * FROM category;

-- Verify data in the contacts table
SELECT * FROM contacts;

-- Verify data in the subcategory table
SELECT * FROM subcategory;

-- Verify data in the campaign table
SELECT * FROM campaign;


