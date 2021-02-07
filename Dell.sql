CREATE TABLE Customer
             (Customer_ID          NUMERIC(11,0)     NOT NULL,
	            Customer_Name        VARCHAR(25)     NOT NULL,
	            Customer_Address     VARCHAR(30) ,
              Customer_City        VARCHAR(20) ,
              Customer_State       CHAR(2) ,
              Postal_Code          VARCHAR(10) ,
              Phone_Number         VARCHAR(10),
              Customer_Country     VARCHAR(20),
CONSTRAINT Customer_PK PRIMARY KEY (Customer_ID));

CREATE TABLE Order
             (Order_ID             NUMERIC(11,0)    NOT NULL,
	            Customer_ID          NUMERIC(11,0)    NOT NULL,
              Order_Date           TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
              Order_Status         VARCHAR(15)
              Comments             VARCHAR(50)
CONSTRAINT Order_PK PRIMARY KEY (Order_ID) ,
CONSTRAINT Order_FK1 FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID));

CREATE TABLE Order_details
	         (  Order_ID             NUMERIC(11,0)   NOT NULL,
              Customer_ID          NUMERIC(11,0)   NOT NULL,
              Ordered_Quantity     NUMERIC(11,0)   NOT NULL,
              Ordered_Price        DECIMAL(6,2),
              orderDetailNumber    SMALLINT(6),
CONSTRAINT Order_details_FK1 FOREIGN KEY (Order_ID) REFERENCES Order(Order_ID),
CONSTRAINT Order_details_FK2 FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID));

CREATE TABLE DELL_Factory
            (Factory_ID  NUMERIC(11,0)   NOT NULL,
             Order_ID    NUMERIC(11,0)   NOT NULL,
             Product_ID  NUMERIC(11,0)   NOT NULL,
             Customer_ID NUMERIC(11,0)   NOT NULL,
             Factory_Name VARCHAR(25),
             Factory_Address VARCHAR(30),
             Factory_City VARCHAR(20),
             Factory_State CHAR(2),
             Factory_Zipcode VARCHAR(10),
             Factory_Fax     VARCHAR(10),
             Factory_Phone   VARCHAR(10),
             Factory_TaxID   VARCHAR(50),
CONSTRAINT DELL_Factory_PK PRIMARY KEY (Factory_ID)
CONSTRAINT DELL_Factory_FK1 FOREIGN KEY (Order_ID) REFERENCES Order(Order_ID),
CONSTRAINT DELL_Factory_FK2 FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
CONSTRAINT DELL_Factory_FK3 FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID));


CREATE TABLE Product
             (Product_ID           NUMERIC(11,0) NOT NULL,
              Product_Line_ID      NUMERIC(11,0) NOT NULL,
              Factory_ID           NUMERIC(11,0) NOT NULL,
              Product_Description  VARCHAR(50) ,
              Product_Finish       VARCHAR(20) ,
              Standard_Price       DECIMAL(6,2) ,
CONSTRAINT Product_PK PRIMARY KEY (Product_ID) ,
CONSTRAINT Product_FK1 FOREIGN KEY (Product_Line_ID) REFERENCES Product_Line(Product_Line_ID),
CONSTRAINT Product_FK2 FOREIGN KEY (Factory_ID) REFERENCES DELL_Factory(Factory_ID));


CREATE TABLE Product_Line
             (Product_Line_ID       NUMERIC(11,0)    NOT NULL,
              Product_Line_Name     VARCHAR(50) ,
              Product_Line_Description VARCHAR(50),
CONSTRAINT Product_Line_PK PRIMARY KEY (Product_Line_ID));

CREATE TABLE Shipper
             (Shipper_ID            NUMERIC(11,0)    NOT NULL,
              Factory_ID            NUMERIC(11,0)    NOT NULL,
              Product_ID            NUMERIC(11,0)    NOT NULL,
              Customer_ID           NUMERIC(11,0)    NOT NULL,
              Order_ID              NUMERIC(11,0)    NOT NULL,
              Shipper_Name          VARCHAR(25) ,
              Shipper_Address       VARCHAR(30) ,
              Shipper_City          VARCHAR(20) ,
              Shipper_State         CHAR(2) ,
              Shipper_Zipcode       VARCHAR(50) ,
              Shipper_Fax           VARCHAR(10) ,
              Shipper_Phone         VARCHAR(10) ,
              Shipper_Contact       VARCHAR(50) ,
CONSTRAINT Shipper_PK PRIMARY KEY (Shipper_ID),
CONSTRAINT Shipper_FK1 FOREIGN KEY (Factory_ID) REFERENCES DELL_Factory(Factory_ID),
CONSTRAINT Shipper_FK2 FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
CONSTRAINT Shipper_FK3 FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
CONSTRAINT Shipper_FK4 FOREIGN KEY (Order_ID) REFERENCES Order(Order_ID));

CREATE Table Payemnt
             (Check_ID             NUMERIC(11,0)    NOT NULL,
              Customer_ID          NUMERIC(11,0)    NOT NULL,
              Payment_data         TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
              amount               DECIMAL(6,2) ,
CONSTRAINT Payemnt_PK PRIMARY KEY (Check_ID),
CONSTRAINT Payemnt_FK1 FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID));
