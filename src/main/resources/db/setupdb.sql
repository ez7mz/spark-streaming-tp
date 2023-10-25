-- Create the Customers table
CREATE TABLE Customers (
                           customerID INT PRIMARY KEY,
                           CustomerName VARCHAR(255) NOT NULL,
                           ContactName VARCHAR(255),
                           Address VARCHAR(255),
                           City VARCHAR(255),
                           PostalCode VARCHAR(10),
                           Country VARCHAR(255)
);

-- Create the Categories table
CREATE TABLE Categories (
                            categoryID INT PRIMARY KEY,
                            CategoryName VARCHAR(255) NOT NULL,
                            Description TEXT
);

-- Create the Employees table
CREATE TABLE Employees (
                           employeeID INT PRIMARY KEY,
                           LastName VARCHAR(255) NOT NULL,
                           FirstName VARCHAR(255) NOT NULL,
                           BirthDate DATE
);

-- Create the Shippers table
CREATE TABLE Shippers (
                          shipperID INT PRIMARY KEY,
                          ShipperName VARCHAR(255) NOT NULL,
                          Phone VARCHAR(20)
);

-- Create the Supplier table
CREATE TABLE Supplier (
                          supplierID INT PRIMARY KEY,
                          SupplierName VARCHAR(255) NOT NULL,
                          ContactName VARCHAR(255),
                          Address VARCHAR(255),
                          City VARCHAR(255),
                          PostalCode VARCHAR(10),
                          Country VARCHAR(255),
                          Phone VARCHAR(20)
);

-- Start foreign key constraints from here
-- Create the Orders table
CREATE TABLE Orders (
                        orderID INT PRIMARY KEY,
                        CustomerID INT,
                        EmployeeID INT,
                        OrderDate DATE,
                        ShipperID INT,
                        FOREIGN KEY (CustomerID) REFERENCES Customers(customerID),
                        FOREIGN KEY (EmployeeID) REFERENCES Employees(employeeID),
                        FOREIGN KEY (ShipperID) REFERENCES Shippers(shipperID)
);

-- Create the Product table
CREATE TABLE Product (
                         productID INT PRIMARY KEY,
                         ProductName VARCHAR(255) NOT NULL,
                         SupplierID INT,
                         CategoryID INT,
                         Price DECIMAL(10, 2),
                         FOREIGN KEY (SupplierID) REFERENCES Supplier(supplierID),
                         FOREIGN KEY (CategoryID) REFERENCES Categories(categoryID)
);

-- Create the OrderDetails table
CREATE TABLE OrderDetails (
                              orderDetailID INT PRIMARY KEY,
                              OrderID INT,
                              ProductID INT,
                              Quantity INT,
                              FOREIGN KEY (OrderID) REFERENCES Orders(orderID),
                              FOREIGN KEY (ProductID) REFERENCES Product(productID)
);
