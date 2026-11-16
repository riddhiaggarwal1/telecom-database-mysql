CREATE DATABASE telecom;
USE telecom;

-- Create Service Plans Table
CREATE TABLE ServicePlans (
    PlanID INT AUTO_INCREMENT PRIMARY KEY,
    PlanName VARCHAR(100),
    MonthlyFee DECIMAL(10, 2)
);

-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(255),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    PlanID INT, 
    FOREIGN KEY (PlanID) REFERENCES ServicePlans(PlanID)
);

-- Create Call Detail Records Table
CREATE TABLE CallDetailRecords (
    CallID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    CallDate DATE,
    Duration INT, -- Duration in minutes
    Cost DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create SMS Usage Table
CREATE TABLE SMSUsage (
    SMSID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    SMSDate DATE,
    MessageCount INT,
    Cost DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create Data Usage Table
CREATE TABLE DataUsage (
    DataID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    DataDate DATE,
    DataUsed INT, -- Data usage in MB
    Cost DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create Billing Information Table
CREATE TABLE BillingInformation (
    BillID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    Amount DECIMAL(10, 2),
    BillDate DATE,
    PaymentStatus VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create Network Elements Table
CREATE TABLE NetworkElements (
    NetworkID INT AUTO_INCREMENT PRIMARY KEY,
    ElementName VARCHAR(100),
    Status VARCHAR(50)
);

CREATE TABLE CustomerSupportInteractions (
    SupportID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    NetworkID INT,  -- Reference to NetworkElements
    InteractionDate DATE,
    Issue VARCHAR(255),
    Resolution VARCHAR(255),
    FOREIGN KEY (CustomerID) 
    REFERENCES Customers(CustomerID),
    FOREIGN KEY (NetworkID)
    REFERENCES NetworkElements(NetworkID)
);

-- Insert Data into ServicePlans Table
INSERT INTO ServicePlans (PlanName, MonthlyFee) VALUES
('Basic Plan', 19.99),
('Premium Plan', 39.99),
('Standard Plan', 29.99),
('Unlimited Plan', 49.99),
('Family Plan', 59.99),
('Business Plan', 79.99),
('Economy Plan', 15.99),
('Lite Plan', 9.99),
('Student Plan', 25.99),
('Silver Plan', 35.99),
('Gold Plan', 45.99),
('Platinum Plan', 65.99),
('International Plan', 55.99),
('Essential Plan', 24.99),
('Corporate Plan', 99.99),
('Travel Plan', 19.49),
('Frequent User Plan', 39.49),
('VIP Plan', 99.49),
('Newcomer Plan', 17.99),
('Standard Plus Plan', 30.49);

-- insert into customers
INSERT INTO Customers (Name, Address, Email, Phone, PlanID) VALUES
('John Doe', '123 Main St, Springfield', 'john.doe@example.com', '555-1234', 1),
('Jane Smith', '456 Oak St, Springfield', 'jane.smith@example.com', '555-5678', 2),
('Alice Johnson', '789 Pine St, Shelbyville', 'alice.johnson@example.com', '555-2345', 3),
('Bob Brown', '321 Maple St, Capital City', 'bob.brown@example.com', '555-3456', 4),
('Charlie Davis', '654 Birch St, Shelbyville', 'charlie.davis@example.com', '555-4567', 5),
('David Wilson', '123 Oak St, Springfield', 'david.wilson@example.com', '555-5670', 6),
('Eve Martinez', '987 Cedar St, Shelbyville', 'eve.martinez@example.com', '555-6789', 7),
('Frank Moore', '456 Birch St, Capital City', 'frank.moore@example.com', '555-7890', 8),
('Grace Lee', '789 Maple St, Springfield', 'grace.lee@example.com', '555-8901', 9),
('Hank White', '123 Pine St, Capital City', 'hank.white@example.com', '555-9012', 10),
('Ivy Harris', '654 Cedar St, Shelbyville', 'ivy.harris@example.com', '555-1236', 11),
('Jack Clark', '987 Oak St, Springfield', 'jack.clark@example.com', '555-2346', 12),
('Kelly Lewis', '321 Pine St, Capital City', 'kelly.lewis@example.com', '555-3457', 13),
('Liam Walker', '456 Cedar St, Springfield', 'liam.walker@example.com', '555-4568', 14),
('Mia Young', '789 Oak St, Shelbyville', 'mia.young@example.com', '555-5679', 15),
('Noah Allen', '123 Cedar St, Capital City', 'noah.allen@example.com', '555-6780', 16),
('Olivia King', '654 Pine St, Springfield', 'olivia.king@example.com', '555-7891', 17),
('Paul Scott', '987 Birch St, Shelbyville', 'paul.scott@example.com', '555-8902', 18),
('Quinn Adams', '321 Oak St, Capital City', 'quinn.adams@example.com', '555-9013', 19),
('Rita Nelson', '456 Pine St, Springfield', 'rita.nelson@example.com', '555-1237', 20),
('Sam Carter', '789 Cedar St, Capital City', 'sam.carter@example.com', '555-2347', 1);

-- Insert data into CallDetailRecords Table with valid CustomerID values
INSERT INTO CallDetailRecords (CustomerID, CallDate, Duration, Cost) VALUES
(1, '2025-06-01', 10, 2.00),
(2, '2025-06-01', 15, 3.00),
(3, '2025-06-01', 20, 4.00),
(4, '2025-06-01', 30, 6.00),
(5, '2025-06-01', 5, 1.00),
(6, '2025-06-01', 25, 5.00),
(7, '2025-06-01', 10, 2.00),
(8, '2025-06-01', 20, 4.00),
(9, '2025-06-01', 15, 3.00),
(10, '2025-06-01', 30, 6.00),
(11, '2025-06-01', 50, 10.00),
(12, '2025-06-01', 5, 1.00),
(13, '2025-06-01', 35, 7.00),
(14, '2025-06-01', 40, 8.00),
(15, '2025-06-01', 25, 5.00),
(16, '2025-06-01', 60, 12.00),
(17, '2025-06-01', 45, 9.00),
(18, '2025-06-01', 30, 6.00),
(19, '2025-06-01', 40, 8.00),
(20, '2025-06-01', 20, 4.00);

-- Insert Data into SMSUsage Table
INSERT INTO SMSUsage (CustomerID, SMSDate, MessageCount, Cost) VALUES
(1, '2025-06-01', 50, 1.50),
(2, '2025-06-01', 30, 1.00),
(3, '2025-06-01', 60, 1.80),
(4, '2025-06-01', 45, 1.35),
(5, '2025-06-01', 20, 0.60),
(6, '2025-06-01', 100, 3.00),
(7, '2025-06-01', 70, 2.10),
(8, '2025-06-01', 80, 2.40),
(9, '2025-06-01', 90, 2.70),
(10, '2025-06-01', 120, 3.60),
(11, '2025-06-01', 50, 1.50),
(12, '2025-06-01', 60, 1.80),
(13, '2025-06-01', 40, 1.20),
(14, '2025-06-01', 30, 0.90),
(15, '2025-06-01', 50, 1.50),
(16, '2025-06-01', 60, 1.80),
(17, '2025-06-01', 45, 1.35),
(18, '2025-06-01', 100, 3.00),
(19, '2025-06-01', 70, 2.10),
(20, '2025-06-01', 80, 2.40);

-- Insert Data into DataUsage Table
INSERT INTO DataUsage (CustomerID, DataDate, DataUsed, Cost) VALUES
(1, '2025-06-01', 500, 5.00),
(2, '2025-06-01', 1000, 10.00),
(3, '2025-06-01', 1500, 15.00),
(4, '2025-06-01', 200, 2.00),
(5, '2025-06-01', 400, 4.00),
(6, '2025-06-01', 800, 8.00),
(7, '2025-06-01', 1200, 12.00),
(8, '2025-06-01', 600, 6.00),
(9, '2025-06-01', 1500, 15.00),
(10, '2025-06-01', 1000, 10.00),
(11, '2025-06-01', 1200, 12.00),
(12, '2025-06-01', 700, 7.00),
(13, '2025-06-01', 900, 9.00),
(14, '2025-06-01', 500, 5.00),
(15, '2025-06-01', 1300, 13.00),
(16, '2025-06-01', 1500, 15.00),
(17, '2025-06-01', 800, 8.00),
(18, '2025-06-01', 400, 4.00),
(19, '2025-06-01', 1000, 10.00),
(20, '2025-06-01', 500, 5.00);

-- Insert Data into BillingInformation Table
INSERT INTO BillingInformation (CustomerID, Amount, BillDate, PaymentStatus) 
VALUES (1, 8.50, '2025-06-01', 'Paid'),
(2, 14.00, '2025-06-01', 'Unpaid'),
(3, 18.00, '2025-06-01', 'Paid'),
(4, 8.50, '2025-06-01', 'Paid'),
(5, 10.00, '2025-06-01', 'Unpaid'),
(6, 16.50, '2025-06-01', 'Paid'),
(7, 13.50, '2025-06-01', 'Paid'),
(8, 12.00, '2025-06-01', 'Unpaid'),
(9, 15.00, '2025-06-01', 'Paid'),
(10, 20.00, '2025-06-01', 'Unpaid'),
(11, 10.00, '2025-06-01', 'Paid'),
(12, 14.00, '2025-06-01', 'Unpaid'),
(13, 12.50, '2025-06-01', 'Paid'),
(14, 9.00, '2025-06-01', 'Paid'),
(15, 11.00, '2025-06-01', 'Paid'),
(16, 18.00, '2025-06-01', 'Unpaid'),
(17, 15.00, '2025-06-01', 'Paid'),
(18, 10.50, '2025-06-01', 'Paid'),
(19, 13.00, '2025-06-01', 'Unpaid'),
(20, 8.00, '2025-06-01', 'Paid');

-- Insert Data into NetworkElements Table
INSERT INTO NetworkElements (ElementName, Status) VALUES
('Cell Tower 1', 'Operational'),
('Cell Tower 2', 'Down'),
('Cell Tower 3', 'Operational'),
('Cell Tower 4', 'Operational'),
('Cell Tower 5', 'Down'),
('Cell Tower 6', 'Operational'),
('Cell Tower 7', 'Down'),
('Cell Tower 8', 'Operational'),
('Cell Tower 9', 'Operational'),
('Cell Tower 10', 'Down'),
('Cell Tower 11', 'Operational'),
('Cell Tower 12', 'Operational'),
('Cell Tower 13', 'Down'),
('Cell Tower 14', 'Operational'),
('Cell Tower 15', 'Operational'),
('Cell Tower 16', 'Down'),
('Cell Tower 17', 'Operational'),
('Cell Tower 18', 'Operational'),
('Cell Tower 19', 'Down'),
('Cell Tower 20', 'Operational');

-- Insert Data into CustomerSupportInteractions Table
INSERT INTO CustomerSupportInteractions 
(CustomerID, InteractionDate, Issue, Resolution) VALUES 
(1, '2025-06-01', 'Slow data speed', 'Issue resolved'),
(2, '2025-06-01', 'Dropped calls', 'Escalated for further investigation'),
(3, '2025-06-01', 'No signal', 'Sent technician to resolve issue'),
(4, '2025-06-01', 'Billing error', 'Refund processed'),
(5, '2025-06-01', 'Data overage', 'Customer notified of limit'),
(6, '2025-06-01', 'Network congestion', 'Tech team monitoring'),
(7, '2025-06-01', 'Faulty sim card', 'Replacement sent'),
(8, '2025-06-01', 'Call dropped', 'Escalated to network team'),
(9, '2025-06-01', 'No service', 'Issue resolved'),
(10, '2025-06-01', 'Slow internet', 'Network upgrade planned'),
(11, '2025-06-01', 'Account suspension', 'Cleared for reactivation'),
(12, '2025-06-01', 'Signal quality', 'Signal booster installed'),
(13, '2025-06-01', 'Overcharged', 'Billing correction issued'),
(14, '2025-06-01', 'Network speed', 'Scheduled maintenance'),
(15, '2025-06-01', 'Service outage', 'Restored after repair'),
(16, '2025-06-01', 'Coverage issues', 'Investigating tower performance'),
(17, '2025-06-01', 'Data loss', 'Customer informed of data usage'),
(18, '2025-06-01', 'Roaming issue', 'Enabled roaming service'),
(19, '2025-06-01', 'Incorrect plan charge', 'Refund processed'),
(20, '2025-06-01', 'Suspended account', 'Issue resolved by support');

-- 1. Retrieve customer information
SELECT * FROM Customers;

-- 2. Get all customers on the Premium Plan
SELECT Customers.Name, ServicePlans.PlanName
FROM Customers
JOIN ServicePlans ON Customers.PlanID = ServicePlans.PlanID
WHERE ServicePlans.PlanName = 'Premium Plan';

-- 3. Get monthly bill details for a customer.
SELECT BillingInformation.Amount, BillingInformation.PaymentStatus
FROM BillingInformation
WHERE BillingInformation.CustomerID = 1 AND BillingInformation.BillDate = '2025-06-01';


-- 4. Calculate total call costs for each customer
SELECT CustomerID, SUM(Cost) AS TotalCallCost
FROM CallDetailRecords
GROUP BY CustomerID;


-- 5. Find customers who have exceeded 1000 MB of data usage in a month
SELECT Customers.Name, SUM(DataUsage.DataUsed) AS TotalDataUsed
FROM DataUsage
JOIN Customers ON DataUsage.CustomerID = Customers.CustomerID
GROUP BY Customers.CustomerID
HAVING TotalDataUsed > 1000;

-- 6. Identify high-value customers based on usage (e.g., total cost from calls, SMS, and data)
SELECT Customers.Name,
    (SUM(CallDetailRecords.Cost) + SUM(SMSUsage.Cost) + SUM(DataUsage.Cost)) AS TotalUsageCost
FROM Customers
JOIN CallDetailRecords ON Customers.CustomerID = CallDetailRecords.CustomerID
JOIN SMSUsage ON Customers.CustomerID = SMSUsage.CustomerID
JOIN DataUsage ON Customers.CustomerID = DataUsage.CustomerID
GROUP BY Customers.CustomerID
ORDER BY TotalUsageCost DESC;

-- 7. Get All Active Customers (With Plans)
SELECT 
    Customers.CustomerID,
    Customers.Name,
    ServicePlans.PlanName,
    ServicePlans.MonthlyFee
FROM
    Customers
        JOIN
    ServicePlans ON Customers.PlanID = ServicePlans.PlanID;

-- 8. Get All Customers Who Have Not Paid Their Bills
SELECT Customers.CustomerID, Customers.Name, BillingInformation.Amount, BillingInformation.BillDate
FROM Customers
JOIN BillingInformation ON Customers.CustomerID = BillingInformation.CustomerID
WHERE BillingInformation.PaymentStatus = 'Unpaid';

-- 9. Get Total Monthly Usage (Calls + SMS + Data) for a Customer
SELECT Customers.Name,
       SUM(CallDetailRecords.Cost + SMSUsage.Cost + DataUsage.Cost) AS TotalMonthlyUsage
FROM Customers
LEFT JOIN CallDetailRecords ON Customers.CustomerID = CallDetailRecords.CustomerID
LEFT JOIN SMSUsage ON Customers.CustomerID = SMSUsage.CustomerID
LEFT JOIN DataUsage ON Customers.CustomerID = DataUsage.CustomerID
WHERE MONTH(CallDetailRecords.CallDate) = 6  -- For June, you can change to other months
  AND YEAR(CallDetailRecords.CallDate) = 2025
GROUP BY Customers.CustomerID;

-- 10. Get Customers Who Have Exceeded Their Data Limit
SELECT Customers.Name, SUM(DataUsage.DataUsed) AS TotalDataUsed
FROM Customers
JOIN DataUsage ON Customers.CustomerID = DataUsage.CustomerID
GROUP BY Customers.CustomerID
HAVING TotalDataUsed > 1000;


 