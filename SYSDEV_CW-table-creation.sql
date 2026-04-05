CREATE TABLE Zip
(
    ZipCode VARCHAR(128),
    Country VARCHAR(128),
    Region VARCHAR(128),
    City VARCHAR(128),
    PRIMARY KEY(ZipCode)
);
CREATE TABLE CustomerAddress
(
    CustomerAddressID INT NOT NULL PRIMARY KEY,
    CustomerAddressStreet VARCHAR(128),
    CustomerAddressStreetNum INT(128),
    CustomerAddressZip VARCHAR(128),
    FOREIGN KEY (CustomerAddressZip) REFERENCES Zip(ZipCode)
);

CREATE TABLE DeliveryAddress
(
    DeliveryAddressID INT NOT NULL PRIMARY KEY,
    DeliveryAddressStreet VARCHAR(128),
    DeliveryAddressStreetNum INT(128),
    DeliveryAddressZip VARCHAR(128),
    FOREIGN KEY (DeliveryAddressZip) REFERENCES Zip(ZipCode)
);

CREATE TABLE SupplierAddress
(
    SupplierAddressID INT NOT NULL PRIMARY KEY,
    SupplierAddressStreet VARCHAR(128),
    SupplierAddressStreetNum INT(128),
    SupplierAddressZip VARCHAR(128),
    FOREIGN KEY (SupplierAddressZip) REFERENCES Zip(ZipCode)
);

CREATE TABLE Customer
(
    CustomerID INT NOT NULL PRIMARY KEY,
    CustomerFirstName VARCHAR(128),
    CustomerSecondName VARCHAR(128),
    CustomerLastName VARCHAR(128),
    CustomerPhone INT(128),
    CustomerAddressIDCode INT,
    FOREIGN KEY (CustomerAddressIDCode) REFERENCES CustomerAddress(CustomerAddressID)
);

CREATE TABLE Supplier
(
    SupplierID INT NOT NULL PRIMARY KEY,
    SupplierName VARCHAR(128),
    SupplierPhone INT(128),
    SupplierAddressIDCode INT,
    FOREIGN KEY (SupplierAddressIDCode) REFERENCES SupplierAddress(SupplierAddressID)
);

CREATE TABLE Item
(
    ItemID INT NOT NULL PRIMARY KEY,
    ItemName VARCHAR(128),
    ItemSupplierID INT(128),
    ItemCategory VARCHAR(128),
    ItemLeft INT(128),
    ItemCost INT(128),
    CONSTRAINT SupplierID FOREIGN KEY (ItemSupplierID)
    REFERENCES Supplier(SupplierID)
);

CREATE TABLE DeliveryService
(
    DeliveryServiceID INT NOT NULL PRIMARY KEY,
    DeliveryServiceName VARCHAR(128),
    DeliveryServicePhone INT(128),
    DeliveryAddressIDCode INT,
    FOREIGN KEY (DeliveryAddressIDCode) REFERENCES DeliveryAddress(DeliveryAddressID)
);

CREATE TABLE Sale
(
    SaleID INT NOT NULL PRIMARY KEY,
    SaleCustomerID INT,
    SaleDeliveryServiceID INT,
    FOREIGN KEY (SaleCustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (SaleDeliveryServiceID) REFERENCES DeliveryService(DeliveryServiceID)
);

CREATE TABLE Receipt
(
    ReceiptSaleID INT,
    ReceiptItemID INT,
    ReceiptItemCount INT(128),
    FOREIGN KEY (ReceiptSaleID) REFERENCES Sale(SaleID),
    FOREIGN KEY (ReceiptItemID) REFERENCES Item(ItemID)
);
