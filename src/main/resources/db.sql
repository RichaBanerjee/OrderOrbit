-- CREATE QUERIES

ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
CREATE USER order_orbit_user IDENTIFIED BY root;

GRANT CREATE SESSION TO order_orbit_user;
GRANT CREATE TABLE TO order_orbit_user;
GRANT CREATE VIEW TO order_orbit_user;
GRANT CREATE ANY TRIGGER TO order_orbit_user;
GRANT CREATE ANY PROCEDURE TO order_orbit_user;
GRANT CREATE SEQUENCE TO order_orbit_user;
GRANT CREATE SYNONYM TO order_orbit_user;
GRANT ALL PRIVILEGES TO order_orbit_user;
GRANT CONNECT TO order_orbit_user;
GRANT RESOURCE TO order_orbit_user;
GRANT DBA TO order_orbit_user;

--CUSTOMER TABLE

CREATE TABLE Customer (
    CUSTOMER_ID INT GENERATED ALWAYS AS IDENTITY START WITH 100000 PRIMARY KEY,
    CUSTOMER_NAME VARCHAR2(50) NOT NULL,
    CUSTOMER_PHONE VARCHAR2(13) NOT NULL UNIQUE,
    CUSTOMER_EMAIL VARCHAR2(50)NOT NULL UNIQUE,
    CUSTOMER_PASSWORD VARCHAR2(20) NOT NULL
);

--EMPLOYEE TABLE

CREATE TABLE Employee (
    EMPLOYEE_ID INT GENERATED ALWAYS AS IDENTITY START WITH 100 PRIMARY KEY,
    EMPLOYEE_NAME VARCHAR2(50) NOT NULL,
    EMPLOYEE_EMAIL VARCHAR2(50)NOT NULL UNIQUE,
    EMPLOYEE_PASSWORD VARCHAR2(20)NOT NULL,
    EMPLOYEE_ROLE VARCHAR2(20)NOT NULL,
    REPORTS_TO INT,
    FOREIGN KEY (REPORTS_TO) REFERENCES Employee(EMPLOYEE_ID)
);

--CATEGORY TABLE

CREATE TABLE Category (
    CATEGORY_ID INT GENERATED ALWAYS AS IDENTITY START WITH 1 PRIMARY KEY,
    CATEGORY_NAME VARCHAR2(20)NOT NULL UNIQUE,
    CATEGORY_DESCRIPTION VARCHAR2(255)
);

--MENUITEM TABLE

CREATE TABLE MenuItem (
    ITEM_ID INT GENERATED ALWAYS AS IDENTITY START WITH 1000 PRIMARY KEY,
    ITEM_NAME VARCHAR2(30) NOT NULL UNIQUE,
    CATEGORY_ID INT NOT NULL,
    ITEM_PRICE DECIMAL(10, 2) NOT NULL CHECK (ITEM_PRICE > 0),
    ITEM_IMAGE VARCHAR2(500),
    AVAILABILITY VARCHAR2(20) DEFAULT 'Is Available' NOT NULL,
    FOREIGN KEY (CATEGORY_ID) REFERENCES Category(CATEGORY_ID)
);

--ORDERS TABLE

CREATE TABLE Orders (
    ORDER_ID INT GENERATED ALWAYS AS IDENTITY START WITH 2000 PRIMARY KEY,
    CUSTOMER_ID INT NOT NULL,
    ORDER_DATE DATE  DEFAULT SYSDATE NOT NULL,
    IS_PICKED VARCHAR2(3)DEFAULT 'No' NOT NULL ,
    ORDER_STATUS VARCHAR2(20)DEFAULT 'Order Placed' NOT NULL,
    TOTAL_AMOUNT DECIMAL(10, 2)NOT NULL CHECK (TOTAL_AMOUNT > 0),
    FOREIGN KEY (CUSTOMER_ID) REFERENCES Customer(CUSTOMER_ID)
);

--ORDERS_DETAILS TABLE

CREATE TABLE Order_Details (
    ORDER_ID INT NOT NULL,
    ITEM_ID INT NOT NULL,
    QUANTITY INT DEFAULT 1 NOT NULL,
    SUBTOTAL DECIMAL(10, 2)NOT NULL CHECK (SUBTOTAL > 0),
    PRIMARY KEY (ORDER_ID, ITEM_ID),
    FOREIGN KEY (ORDER_ID) REFERENCES Orders(ORDER_ID),
    FOREIGN KEY (ITEM_ID) REFERENCES MenuItem(ITEM_ID)
);
commit;


--INSERT QUERIES

----CUSTOMER TABLE
--
--INSERT INTO Customer (CUSTOMER_NAME, CUSTOMER_PHONE, CUSTOMER_EMAIL, CUSTOMER_PASSWORD) 
--VALUES ('Aarav Patel', '1234567890', 'aarav@example.com', 'password123');
--
--INSERT INTO Customer (CUSTOMER_NAME, CUSTOMER_PHONE, CUSTOMER_EMAIL, CUSTOMER_PASSWORD) 
--VALUES ('Nisha Sharma', '0987654321', 'nisha@example.com', 'newpass456');
--
--INSERT INTO Customer (CUSTOMER_NAME, CUSTOMER_PHONE, CUSTOMER_EMAIL, CUSTOMER_PASSWORD) 
--VALUES ('Aditya Gupta', '5555555555', 'aditya@example.com', 'test123');
--
--INSERT INTO Customer (CUSTOMER_NAME, CUSTOMER_PHONE, CUSTOMER_EMAIL, CUSTOMER_PASSWORD) 
--VALUES ('Meera Khanna', '7778889999', 'meera@example.com', 'password789');
--
--INSERT INTO Customer (CUSTOMER_NAME, CUSTOMER_PHONE, CUSTOMER_EMAIL, CUSTOMER_PASSWORD) 
--VALUES ('Arjun Singh', '4443332222', 'arjun@example.com', 'test456');
--
--
----EMPLOYEE TABLE
--
--INSERT INTO Employee (EMPLOYEE_NAME, EMPLOYEE_EMAIL, EMPLOYEE_PASSWORD, EMPLOYEE_ROLE, REPORTS_TO) 
--VALUES ('Richa Banerjee', 'richa2882002@gmail.com', 'richa123', 'Manager', NULL);
--
--INSERT INTO Employee (EMPLOYEE_NAME, EMPLOYEE_EMAIL, EMPLOYEE_PASSWORD, EMPLOYEE_ROLE, REPORTS_TO) 
--VALUES ('Cashier One', 'cashier1@example.com', 'cashierpass', 'Cashier', 100);
--
--INSERT INTO Employee (EMPLOYEE_NAME, EMPLOYEE_EMAIL, EMPLOYEE_PASSWORD, EMPLOYEE_ROLE, REPORTS_TO) 
--VALUES ('Chef One', 'chef1@example.com', 'chefpass', 'Chef', 100);
--
--INSERT INTO Employee (EMPLOYEE_NAME, EMPLOYEE_EMAIL, EMPLOYEE_PASSWORD, EMPLOYEE_ROLE, REPORTS_TO) 
--VALUES ('Waiter One', 'waiter1@example.com', 'waiterpass', 'Waiter', 100);
--
--INSERT INTO Employee (EMPLOYEE_NAME, EMPLOYEE_EMAIL, EMPLOYEE_PASSWORD, EMPLOYEE_ROLE, REPORTS_TO) 
--VALUES ('Chef Two', 'chef2@example.com', 'chefpass2', 'Chef', 100);
--
----CATEGORY TABLE
--
--INSERT INTO Category (CATEGORY_NAME, CATEGORY_DESCRIPTION) 
--VALUES ('Appetizers', 'Starters or appetizers to whet your appetite.');
--
--INSERT INTO Category (CATEGORY_NAME, CATEGORY_DESCRIPTION) 
--VALUES ('Main Course', 'Delicious main dishes to satisfy your hunger.');
--
--INSERT INTO Category (CATEGORY_NAME, CATEGORY_DESCRIPTION) 
--VALUES ('Desserts', 'Sweet treats to end your meal on a high note.');
--
----MENUITEM TABLE
--
--INSERT INTO MenuItem (ITEM_NAME, CATEGORY_ID, ITEM_PRICE,ITEM_IMAGE, AVAILABILITY) 
--VALUES ('Caesar Salad', 1, 8.99,'/C/C/C/C/', 'Is Available');
--
--INSERT INTO MenuItem (ITEM_NAME, CATEGORY_ID, ITEM_PRICE,ITEM_IMAGE, AVAILABILITY) 
--VALUES ('Margherita Pizza', 2, 12.99,'/C/C/C/C/', 'Is Available');
--
--INSERT INTO MenuItem (ITEM_NAME, CATEGORY_ID, ITEM_PRICE,ITEM_IMAGE, AVAILABILITY) 
--VALUES ('Chocolate Brownie', 3, 5.99,'/C/C/C/C/', 'Is Available');
--
--INSERT INTO MenuItem (ITEM_NAME, CATEGORY_ID, ITEM_PRICE,ITEM_IMAGE, AVAILABILITY) 
--VALUES ('Veg Spring Rolls', 1, 10.99,'/C/C/C/C/', 'Is Available');
--
--INSERT INTO MenuItem (ITEM_NAME, CATEGORY_ID, ITEM_PRICE,ITEM_IMAGE, AVAILABILITY) 
--VALUES ('Spaghetti Bolognese', 2, 14.99,'/C/C/C/C/', 'Is Available');
--
----INSERT INTO MenuItem (ITEM_NAME, CATEGORY_ID, ITEM_PRICE,ITEM_IMAGE, AVAILABILITY) 
----VALUES ('Spaghetti', 2, 14.99,'/C/C/C/C/', 'Is Available');
--commit;
----ORDERS TABLE
--
--INSERT INTO Orders (CUSTOMER_ID, ORDER_DATE, IS_PICKED, ORDER_STATUS, TOTAL_AMOUNT) 
--VALUES (100002, TO_DATE('2024-03-04', 'YYYY-MM-DD'), 'No', 'Order Placed', 32.97);
--
--INSERT INTO Orders (CUSTOMER_ID, ORDER_DATE, IS_PICKED, ORDER_STATUS, TOTAL_AMOUNT) 
--VALUES (100003, TO_DATE('2024-03-04', 'YYYY-MM-DD'), 'No', 'Order Placed', 32.97);
--
--INSERT INTO Orders (CUSTOMER_ID, ORDER_DATE, IS_PICKED, ORDER_STATUS, TOTAL_AMOUNT) 
--VALUES (100001, TO_DATE('2024-03-04', 'YYYY-MM-DD'), 'No', 'Order Placed', 25.98);
--
--INSERT INTO Orders (CUSTOMER_ID, ORDER_DATE, IS_PICKED, ORDER_STATUS, TOTAL_AMOUNT) 
--VALUES (100002, TO_DATE('2024-03-04', 'YYYY-MM-DD'), 'No', 'Order Placed', 8.99);
--
--
----ORDERS_DETAILS TABLE
--
--INSERT INTO Order_Details (ORDER_ID, ITEM_ID, QUANTITY, SUBTOTAL) 
--VALUES (2000, 1000, 2, 17.98);
--
--INSERT INTO Order_Details (ORDER_ID, ITEM_ID, QUANTITY, SUBTOTAL) 
--VALUES (2001, 1000, 1, 8.99);
--
--INSERT INTO Order_Details (ORDER_ID, ITEM_ID, QUANTITY, SUBTOTAL) 
--VALUES (2002, 1002, 1, 5.99);
--
--INSERT INTO Order_Details (ORDER_ID, ITEM_ID, QUANTITY, SUBTOTAL) 
--VALUES (2001, 1001, 1, 12.99);
--
--INSERT INTO Order_Details (ORDER_ID, ITEM_ID, QUANTITY, SUBTOTAL) 
--VALUES (2000, 1003, 1, 10.99);
--
--
---- DML
--
--UPDATE Order_Details 
--SET SUBTOTAL = QUANTITY * (SELECT ITEM_PRICE FROM MenuItem WHERE ITEM_ID = Order_Details.ITEM_ID)
--WHERE ORDER_ID = 2000 AND ITEM_ID = 1000;
--
--UPDATE Order_Details 
--SET SUBTOTAL = QUANTITY * (SELECT ITEM_PRICE FROM MenuItem WHERE ITEM_ID = Order_Details.ITEM_ID)
--WHERE ORDER_ID = 2001 AND ITEM_ID = 1003;
--
--UPDATE Order_Details 
--SET SUBTOTAL = QUANTITY * (SELECT ITEM_PRICE FROM MenuItem WHERE ITEM_ID = Order_Details.ITEM_ID)
--WHERE ORDER_ID = 2002 AND ITEM_ID = 1002;
--
--UPDATE Order_Details 
--SET SUBTOTAL = QUANTITY * (SELECT ITEM_PRICE FROM MenuItem WHERE ITEM_ID = Order_Details.ITEM_ID)
--WHERE ORDER_ID = 2001 AND ITEM_ID = 1000;
--
--UPDATE Order_Details 
--SET SUBTOTAL = QUANTITY * (SELECT ITEM_PRICE FROM MenuItem WHERE ITEM_ID = Order_Details.ITEM_ID)
--WHERE ORDER_ID = 2001 AND ITEM_ID = 1001;

-- DQL QUERIES
SELECT * FROM CUSTOMER;
SELECT * FROM EMPLOYEE;
SELECT * FROM CATEGORY;
SELECT * FROM MENUITEM;
SELECT * FROM ORDERS;
SELECT * FROM ORDER_DETAILS;



-- DROP QUERIES
--DROP TABLE CUSTOMER CASCADE CONSTRAINTS;
--DROP TABLE EMPLOYEE CASCADE CONSTRAINTS;
--DROP TABLE CATEGORY CASCADE CONSTRAINTS;
--DROP TABLE MENUITEM CASCADE CONSTRAINTS;
--DROP TABLE ORDERS CASCADE CONSTRAINTS;
--DROP TABLE ORDER_DETAILS CASCADE CONSTRAINTS;

-- TRUNCATE QUERIES
--TRUNCATE TABLE CUSTOMER CASCADE;
--TRUNCATE TABLE EMPLOYEE CASCADE;
--TRUNCATE TABLE CATEGORY CASCADE;
--TRUNCATE TABLE MENUITEM CASCADE;
--TRUNCATE TABLE ORDERS CASCADE;
--TRUNCATE TABLE ORDER_DETAILS CASCADE;


-- PACKAGE -> FUNCTIONS
CREATE OR REPLACE PACKAGE OrderManagementPackage AS

    -- Function to calculate the subtotal for an order detail
    FUNCTION CalculateSubtotal(
        p_item_id IN INT,
        p_quantity IN INT
    ) RETURN DECIMAL;

    -- Function to calculate the total amount for an order
    FUNCTION CalculateOrderTotal(
        p_order_id IN INT
    ) RETURN DECIMAL;

    -- Procedure to update the total amount for an order
    PROCEDURE UpdateOrderTotal(
        p_order_id IN INT
    );

END OrderManagementPackage;
/
CREATE OR REPLACE PACKAGE BODY OrderManagementPackage AS

    -- Function to calculate the subtotal for an order detail
    FUNCTION CalculateSubtotal(
        p_item_id IN INT,
        p_quantity IN INT
    ) RETURN DECIMAL IS
        v_item_price DECIMAL(10, 2);
    BEGIN
        SELECT ITEM_PRICE INTO v_item_price FROM MenuItem WHERE ITEM_ID = p_item_id;
        RETURN v_item_price * p_quantity;
    END CalculateSubtotal;

    -- Function to calculate the total amount for an order
    FUNCTION CalculateOrderTotal(
        p_order_id IN INT
    ) RETURN DECIMAL IS
        v_total DECIMAL(10, 2) := 0;
    BEGIN
        SELECT SUM(SUBTOTAL) INTO v_total FROM Order_Details WHERE ORDER_ID = p_order_id;
        RETURN v_total;
    END CalculateOrderTotal;

    -- Procedure to update the total amount for an order
    PROCEDURE UpdateOrderTotal(
        p_order_id IN INT
    ) IS
        v_total_amount DECIMAL(10, 2);
    BEGIN
        v_total_amount := CalculateOrderTotal(p_order_id);
        UPDATE Orders SET TOTAL_AMOUNT = v_total_amount WHERE ORDER_ID = p_order_id;
    END UpdateOrderTotal;

END OrderManagementPackage;
/


-- Calling CalculateSubtotal function
SELECT OrderManagementPackage.CalculateSubtotal(1000, 2) AS subtotal FROM DUAL;

-- Calling CalculateOrderTotal function
SELECT OrderManagementPackage.CalculateOrderTotal(2000) AS total_amount FROM DUAL;

/
BEGIN
    OrderManagementPackage.UpdateOrderTotal(2000);
END;
/

--Trigger to update total amount before inserting an order detail:
CREATE OR REPLACE TRIGGER Before_Insert_Order_Detail
BEFORE INSERT ON Order_Details
FOR EACH ROW
BEGIN
    :NEW.SUBTOTAL := OrderManagementPackage.CalculateSubtotal(:NEW.ITEM_ID, :NEW.QUANTITY);
END;
/
--Trigger to update total amount after updating an order detail:
CREATE OR REPLACE TRIGGER After_Update_Order_Detail
AFTER UPDATE ON Order_Details
FOR EACH ROW
BEGIN
    IF :NEW.ITEM_ID <> :OLD.ITEM_ID OR :NEW.QUANTITY <> :OLD.QUANTITY THEN
        OrderManagementPackage.UpdateOrderTotal(:NEW.ORDER_ID);
    END IF;
END;
/

--Trigger to update total amount after inserting an order:
CREATE OR REPLACE TRIGGER After_Insert_Order
AFTER INSERT ON Orders
FOR EACH ROW
BEGIN
    OrderManagementPackage.UpdateOrderTotal(:NEW.ORDER_ID);
END;
/

BEGIN
    add_employeee('Shreya','afff','dsdsdf','ansfss',100);
END;


--PROCEDURES

CREATE OR REPLACE PROCEDURE add_employeee (
    p_employee_name       IN employee.employee_name%TYPE,
    p_employee_email      IN employee.employee_email%TYPE,
    p_employee_password   IN employee.employee_password%TYPE,
    p_employee_role       IN employee.employee_role%TYPE,
    p_reports_to          IN employee.reports_to%TYPE
) AS
BEGIN
    INSERT INTO employee (
        employee_name,
        employee_email,
        employee_password,
        employee_role,
        reports_to
    ) VALUES (
        p_employee_name,
        p_employee_email,
        p_employee_password,
        p_employee_role,
        p_reports_to
    );
    
EXCEPTION
    WHEN OTHERS THEN
        
        RAISE;
END add_employeee;
/


CREATE OR REPLACE PROCEDURE add_customer (
    p_customer_name       IN customer.customer_name%TYPE,
    p_customer_phone      IN customer.customer_phone%TYPE,
    p_customer_email      IN customer.customer_email%TYPE,
    p_customer_password   IN customer.customer_password%TYPE
) AS
BEGIN
    INSERT INTO customer (
        CUSTOMER_NAME,
        CUSTOMER_PHONE,
        CUSTOMER_EMAIL,
        CUSTOMER_PASSWORD
    ) VALUES (
        p_customer_name,
        p_customer_phone,
        p_customer_email,
        p_customer_password
    );
EXCEPTION
    WHEN OTHERS THEN
        RAISE;
END add_customer;
/

BEGIN
    add_customer('Vineet', '2128121817', 'vineet@example.com', 'vineet');
END;
/


commit;


--- Menu item procedure
/
CREATE OR REPLACE PROCEDURE add_menu_item (
    p_item_name         IN MenuItem.item_name%TYPE,
    p_category_id       IN MenuItem.category_id%TYPE,
    p_item_price        IN MenuItem.item_price%TYPE,
    p_item_image        IN MenuItem.item_image%TYPE,
    p_availability      IN MenuItem.availability%TYPE DEFAULT 'Available'
) AS
BEGIN
    INSERT INTO MenuItem (
        ITEM_NAME,
        CATEGORY_ID,
        ITEM_PRICE,
        ITEM_IMAGE,
        AVAILABILITY
    ) VALUES (
        p_item_name,
        p_category_id,
        p_item_price,
        p_item_image,
        p_availability
    );
EXCEPTION
    WHEN OTHERS THEN
        RAISE;
END add_menu_item;
/

BEGIN
    add_menu_item('jsj66666sj', 2, 10 , 'c/c/c//','Is Available');
END;

/
commit;



----Trigger to update total amount before inserting an order detail:
--CREATE OR REPLACE TRIGGER Before_Insert_Order_Detail
--BEFORE INSERT ON Order_Details
--FOR EACH ROW
--BEGIN
--    :NEW.SUBTOTAL := OrderManagementPackage.CalculateSubtotal(:NEW.ITEM_ID, :NEW.QUANTITY);
--END;
--/
----Trigger to update total amount after updating an order detail:
--CREATE OR REPLACE TRIGGER After_Update_Order_Detail
--AFTER UPDATE ON Order_Details
--FOR EACH ROW
--BEGIN
--    IF :NEW.ITEM_ID <> :OLD.ITEM_ID OR :NEW.QUANTITY <> :OLD.QUANTITY THEN
--        OrderManagementPackage.UpdateOrderTotal(:NEW.ORDER_ID);
--    END IF;
--END;
--/
--
----Trigger to update total amount after inserting an order:
--CREATE OR REPLACE TRIGGER After_Insert_Order
--AFTER INSERT ON Orders
--FOR EACH ROW
--BEGIN
--    OrderManagementPackage.UpdateOrderTotal(:NEW.ORDER_ID);
--END;
--/
--
--BEGIN
--    add_employeee('Shreya','afff','dsdsdf','ansfss',100);
--END;
--/
--commit;