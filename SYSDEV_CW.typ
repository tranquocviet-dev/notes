#let _ = ```typ
exec typst c "$0" --root "$(readlink -f "$0" | xargs dirname)/../" --input file-37=/Captures/2026-04-03_1626.png --input file-36=/Captures/2026-04-02_2312.png --input file-35=/Captures/2026-04-02_2244.png --input file-34=/Captures/2026-04-02_2239.png --input file-33=/Captures/2026-04-02_0830.png --input file-32=/Captures/2026-04-04_1516_1.png --input file-31=/Captures/2026-04-04_1516.png --input file-30=/Captures/2026-04-04_1515_4.png --input file-29=/Captures/2026-04-04_1515_3.png --input file-28=/Captures/2026-04-04_1515_2.png --input file-27=/Captures/2026-04-04_1515_1.png --input file-26=/Captures/2026-04-04_1515.png --input file-25=/Captures/2026-04-04_1514_2.png --input file-24=/Captures/2026-04-04_1514_1.png --input file-23=/Captures/2026-04-04_1514.png --input file-22=/Captures/2026-04-04_1513_3.png --input file-21=/Captures/2026-04-04_1513_2.png --input file-20=/Captures/2026-04-04_1513_1.png --input file-19=/Captures/2026-04-04_1513.png --input file-18=/Captures/2026-04-04_1512_1.png --input file-17=/Captures/2026-04-04_1512.png --input file-16=/Captures/2026-04-04_1511.png --input file-15=/Captures/2026-04-04_1510_1.png --input file-14=/Captures/2026-04-04_1510.png --input file-13=/Captures/2026-04-04_1509.png --input file-12=/Captures/2026-04-03_1659_1.png --input file-11=/Captures/2026-04-03_1659.png --input file-10=/Captures/2026-04-03_1655.png --input file-9=/Captures/2026-04-03_1652.png --input file-8=/Captures/2026-04-03_1651_1.png --input file-7=/Captures/2026-04-03_1648.png --input file-6=/Captures/2026-04-03_1651.png --input file-5=/Captures/2026-04-03_1650.png --input file-4=/Captures/2026-04-03_1649.png --input file-3=/Captures/2026-04-03_1650_1.png --input file-2=/Captures/2026-04-03_1637.png --input file-1=/Documents/drawio/SQL_CW2.png --input file-0=/Documents/drawio/SQL_CW2.png
⁠```
#set document(title: "Coursework Submission for System Development Class", author: "viet")
#set text(lang: "en")
#outline()
#set heading(numbering: "1.")
#show figure: set align(left)
#heading(level: 1)[Part 1: Design and implementation of database system] #label("orgfaad555")
#heading(level: 2)[Requirement a:] #label("org90decb1")
#heading(level: 3)[Consulting with the client] #label("org5f41181")
#list(list.item[V: Hello, Ms Harbour. Please tell me what do you want from the system you want us to design.])#list(list.item[H: Greetings. I desire a system that emulates the feeling of buying from a market, like the old days.])#list(list.item[V: Can you be more specific? I don\u{27}t think I quite follow.])#list(list.item[H: So, they should be able to simply visit the website, choose the item from a list of items from different manufacturers and delivery services, and simply be able to buy them. And the system will have to store the data of all parties like the requirement I gave you before.])#list(list.item[V: So, A simple system that requires no log in, integrating the manufacturer and delivery service name inside of the item properties, with delivery, customer and supplier having addresses.])#list(list.item[H: Yes, and moreover, the client can buy multiple items of the same type and multiple types, all in one order.])#list(list.item[V: I see. Is that all?])#list(list.item[H: I\u{27}m quite sure it is. Thank you.])#list(list.item[V: Thank you as well. I will get to work now.])
#heading(level: 3)[Requirement Identification:] #label("org04e864d")
#heading(level: 4, outlined: false, numbering: none)[Functional:] #label("org331528f")
#list(list.item[A system able to process and store the transaction of items and batch item purchase, then send the information of its client, including phone, name and address, to the Delivery service])#list(list.item[Allows the customer to pick the supplier through Supplier\u{2d}based item sorting (there can be multiple items of the same supplier or one item of different suppliers). The system would allow the Supplier to update the stock of items available.])#list(list.item[Allows the system to store operable address and shipping information of the parties involved in simple and consistent format while seperating different audiences.])
#heading(level: 4, outlined: false, numbering: none)[Non functional:] #label("org0e7ad48")
#list(list.item[Fast, simple, easy to manage.])#list(list.item[Allows partial user anonymity, making the buying experience simpler and less time consuming.])
#heading(level: 3)[Identification] #label("org9258255")
#list(list.item[Firstly, the three human entities are created first: Customer, Supplier and Delivery, each containing Name, Phone and Address properties.])#list(list.item[Afterwards, a Item Entity is created, containing Name, Description, Count (remaining), Cost and Manufacturer properties. The Item receives a Foreign Key of SupplierID in order to differentiate products that has multiple suppliers, and since a Supplier can have many different items, the relationship between Supplier and Item is One to Many.])#list(list.item[Finally, the Sale Entity is created in order to Manage sales, with links to the Item, Customer and Delivery entities in order to manage the different parts of the Sale. One Delivery service can have multiple Sales, but one Sale can not have multiple Delivery Service, same with Item and Customer, so the relationship between the three of them and Sale is One to Many. Moreover, the Sale entity has a Item Count property, indicating how many items of the kind has been brought.])
#heading(level: 2)[Requirement b:] #label("orgd2ac283")
With the Identification of Entities done in the first requirement, the following is the initial ERD:
#figure([#image(sys.inputs.file-0)]) #label("org6cbfb16")
#heading(level: 2)[Requirement c:] #label("orge55ce21")
#list(list.item[0NF to 1NF: Atomize properties:
#list(list.item[Example 1: Name property of Customer Table as one unit \u{2d}\u{3e} Seperated into 3 different properties: First Name, Second Name, Last Name, Address for Customer, Supplier and Delivery have to be atomized])#list(list.item[Example 2: Item Foreign Key of Sale Table \u{2d}\u{3e} Seperated into A different table: Receipt Table containing ItemID, SaleID Forein Keys and Item Count Property to allow the user to buy multiple different items in one sale.])#list(list.item[End result:
#list(list.item[Customer:
#list(list.item[CustomerID (INT Primary Key)])#list(list.item[CustomerFirstName (VARCHAR)])#list(list.item[CustomerSecondName (VARCHAR)])#list(list.item[CustomerLastName (VARCHAR)])#list(list.item[CustomerPhone (INT)])#list(list.item[CustomerAddress (VARCHAR)])#list(list.item[CustomerStreet (VARCHAR)])#list(list.item[CustomerZip (VARCHAR)])#list(list.item[CustomerCountry (VARCHAR)])#list(list.item[CustomerRegion (VARCHAR)])#list(list.item[CustomerCity (VARCHAR)])])#list(list.item[Delivery:
#list(list.item[DeliveryID (INT Primary Key)])#list(list.item[DeliveryName (VARCHAR)])#list(list.item[DeliveryFirstName (VARCHAR)])#list(list.item[DeliverySecondName (VARCHAR)])#list(list.item[DeliveryLastName (VARCHAR)])#list(list.item[DeliveryPhone (INT)])#list(list.item[DeliveryAddress (VARCHAR)])#list(list.item[DeliveryStreet (VARCHAR)])#list(list.item[DeliveryZip (VARCHAR)])#list(list.item[DeliveryCountry (VARCHAR)])#list(list.item[DeliveryRegion (VARCHAR)])#list(list.item[DeliveryCity (VARCHAR)])])#list(list.item[Supplier:
#list(list.item[SupplierID (INT Primary Key)])#list(list.item[SupplierName (VARCHAR)])#list(list.item[SupplierFirstName (VARCHAR)])#list(list.item[SupplierSecondName (VARCHAR)])#list(list.item[SupplierLastName (VARCHAR)])#list(list.item[SupplierPhone (INT)])#list(list.item[SupplierAddress (VARCHAR)])#list(list.item[SupplierStreet (VARCHAR)])#list(list.item[SupplierZip (VARCHAR)])#list(list.item[SupplierCountry (VARCHAR)])#list(list.item[SupplierRegion (VARCHAR)])#list(list.item[SupplierCity (VARCHAR)])])#list(list.item[Sale:
#list(list.item[SaleID (INT Primary Key)])#list(list.item[SaleDeliveryID (INT Foreign Key)])#list(list.item[SaleCustomerID (INT Foreign Key)])])#list(list.item[Receipt:
#list(list.item[ReceiptSaleID (INT Foreign Key)])#list(list.item[ReceiptItemID (INT Foreign Key)])#list(list.item[ReceiptItemCount (INT)])])])])#list(list.item[1NF to 2NF: Non\u{2d}Key attribute must depend on every part of the primary Key
#list(list.item[All values of the tables abide by the Normalization, namely the Receipt Table using compost Primary Key structure (two or more foreign keys to identify a table)])])#list(list.item[2NF to 3NF: Non\u{2d}key attributes not depending on eachother
#list(list.item[Addresses of three aforementioned tables are dependent on eachother and is not compact])#list(list.item[Solution: Seperating Addresses into individual Address tables for 3 entities, pointing to a seperate Zip Code table, the Zip table containing values that can be determined from the zip code, and addresses contain the rest
#list(list.item[Zip:
#list(list.item[ZipCode (VARCHAR Primary Key)])#list(list.item[Country (VARCHAR)])#list(list.item[Region (VARCHAR)])#list(list.item[City (VARCHAR)])])#list(list.item[CustomerAddress:
#list(list.item[CustomerAddressID (INT Primary Key)])#list(list.item[CustomerAddressStreet (INT Primary Key)])#list(list.item[CustomerAddressStreetNum (INT Primary Key)])#list(list.item[CustomerAddressZip (VARCHAR Foreign Key)])])#list(list.item[DeliveryAddress:
#list(list.item[DeliveryAddressID (INT Primary Key)])#list(list.item[DeliveryAddressStreet (INT Primary Key)])#list(list.item[DeliveryAddressStreetNum (INT Primary Key)])#list(list.item[DeliveryAddressZip (VARCHAR Foreign Key)])])#list(list.item[SupplierAddress:
#list(list.item[SupplierAddressID (INT Primary Key)])#list(list.item[SupplierAddressStreet (INT Primary Key)])#list(list.item[SupplierAddressStreetNum (INT Primary Key)])#list(list.item[SupplierAddressZip (VARCHAR Foreign Key)])])#list(list.item[Customer:
#list(list.item[CustomerID (INT Primary Key)])#list(list.item[CustomerFirstName (VARCHAR)])#list(list.item[CustomerSecondName (VARCHAR)])#list(list.item[CustomerLastName (VARCHAR)])#list(list.item[CustomerPhone (INT)])#list(list.item[CustomerAddressIDCode (INT Foreign Key)])])#list(list.item[Delivery:
#list(list.item[DeliveryID (INT Primary Key)])#list(list.item[DeliveryName (VARCHAR)])#list(list.item[DeliveryFirstName (VARCHAR)])#list(list.item[DeliverySecondName (VARCHAR)])#list(list.item[DeliveryLastName (VARCHAR)])#list(list.item[DeliveryPhone (INT)])#list(list.item[DeliveryAddressIDCode (INT Foreign Key)])])#list(list.item[Supplier:
#list(list.item[SupplierID (INT Primary Key)])#list(list.item[SupplierName (VARCHAR)])#list(list.item[SupplierFirstName (VARCHAR)])#list(list.item[SupplierSecondName (VARCHAR)])#list(list.item[SupplierLastName (VARCHAR)])#list(list.item[SupplierPhone (INT)])#list(list.item[SupplierAddressIDCode (INT Foreign Key)])])])])
#figure([#image(sys.inputs.file-1)]) #label("orgdea614a")
#heading(level: 2)[Requirement d:] #label("org19b8d23")
#figure([#image(sys.inputs.file-2)]) #label("org7268ca5")
#heading(level: 3)[Source code for the table:] #label("org7f03b3b")
#figure([#raw(block: true, lang: "sql", "CREATE TABLE Zip
(
    ZipCode VARCHAR(128) NOT NULL PRIMARY KEY,
    Country VARCHAR(128),
    Region VARCHAR(128),
    City VARCHAR(128)1
);")]) #label("org33aa667")
#figure([#image(sys.inputs.file-3)]) #label("orgfc7d4fa")
#figure([#raw(block: true, lang: "sql", "CREATE TABLE CustomerAddress
(
    CustomerAddressID INT NOT NULL PRIMARY KEY,
    CustomerAddressStreet VARCHAR(128),
    CustomerAddressStreetNum INT(128),
    CustomerAddressZip VARCHAR(128),
    FOREIGN KEY (CustomerAddressZip) REFERENCES Zip(ZipCode)
);")]) #label("org864ecf0")
#figure([#image(sys.inputs.file-4)]) #label("orgac315f5")
#figure([#raw(block: true, lang: "sql", "CREATE TABLE DeliveryAddress
(
    DeliveryAddressID INT NOT NULL PRIMARY KEY,
    DeliveryAddressStreet VARCHAR(128),
    DeliveryAddressStreetNum INT(128),
    DeliveryAddressZip VARCHAR(128),
    FOREIGN KEY (DeliveryAddressZip) REFERENCES Zip(ZipCode)
);")]) #label("org94762e8")
#figure([#image(sys.inputs.file-5)]) #label("orga84bdd0")
#figure([#raw(block: true, lang: "sql", "CREATE TABLE SupplierAddress
(
    SupplierAddressID INT NOT NULL PRIMARY KEY,
    SupplierAddressStreet VARCHAR(128),
    SupplierAddressStreetNum INT(128),
    SupplierAddressZip VARCHAR(128),
    FOREIGN KEY (SupplierAddressZip) REFERENCES Zip(ZipCode)
);")]) #label("orgfa3f98c")
#figure([#image(sys.inputs.file-6)]) #label("org0b05958")
#figure([#raw(block: true, lang: "sql", "CREATE TABLE Customer
(
    CustomerID INT NOT NULL PRIMARY KEY,
    CustomerFirstName VARCHAR(128),
    CustomerSecondName VARCHAR(128),
    CustomerLastName VARCHAR(128),
    CustomerPhone INT(128),
    CustomerAddressIDCode INT,
    FOREIGN KEY (CustomerAddressIDCode) REFERENCES CustomerAddress(CustomerAddressID)
);")]) #label("org57bf958")
#figure([#image(sys.inputs.file-7)]) #label("orgf8986fe")
#figure([#raw(block: true, lang: "sql", "CREATE TABLE Supplier
(
    SupplierID INT NOT NULL PRIMARY KEY,
    SupplierName VARCHAR(128),
    SupplierPhone INT(128),
    SupplierAddressIDCode INT,
    FOREIGN KEY (SupplierAddressIDCode) REFERENCES SupplierAddress(SupplierAddressID)
);")]) #label("org4290964")
#figure([#image(sys.inputs.file-8)]) #label("org50237ae")
#figure([#raw(block: true, lang: "sql", "CREATE TABLE Item
(
    ItemID INT NOT NULL PRIMARY KEY,
    ItemName VARCHAR(128),
    ItemSupplierID INT(128),
    ItemCategory VARCHAR(128),
    ItemLeft INT(128),
    ItemCost INT(128),
    CONSTRAINT SupplierID FOREIGN KEY (ItemSupplierID)
    REFERENCES Supplier(SupplierID)
);")]) #label("orgbcb9021")
#figure([#image(sys.inputs.file-9)]) #label("org7c3a4e2")
#figure([#raw(block: true, lang: "sql", "CREATE TABLE DeliveryService
(
    DeliveryServiceID INT NOT NULL PRIMARY KEY,
    DeliveryServiceName VARCHAR(128),
    DeliveryServicePhone INT(128),
    DeliveryAddressIDCode INT,
    FOREIGN KEY (DeliveryAddressIDCode) REFERENCES DeliveryAddress(DeliveryAddressID)
);")]) #label("orgf9806a7")
#figure([#image(sys.inputs.file-10)]) #label("org764001c")
#figure([#raw(block: true, lang: "sql", "CREATE TABLE Sale
(
    SaleID INT NOT NULL PRIMARY KEY,
    SaleCustomerID INT,
    SaleDeliveryServiceID INT,
    FOREIGN KEY (SaleCustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (SaleDeliveryServiceID) REFERENCES DeliveryService(DeliveryServiceID)
);")]) #label("orgb151040")
#figure([#image(sys.inputs.file-11)]) #label("orgc2a0187")
#figure([#raw(block: true, lang: "sql", "CREATE TABLE Receipt
(
    ReceiptSaleID INT,
    ReceiptItemID INT,
    ReceiptItemCount INT(128),
    FOREIGN KEY (ReceiptSaleID) REFERENCES Sale(SaleID),
    FOREIGN KEY (ReceiptItemID) REFERENCES Item(ItemID)
);")]) #label("org3f32a7d")
#figure([#image(sys.inputs.file-12)]) #label("orgd344c58")
#heading(level: 2)[Requirement e:] #label("org2050e84")
#figure([#raw(block: true, lang: "sql", "INSERT INTO Zip (ZipCode, Country, Region, City) VALUES
('10001', 'United States', 'New York', 'New York'),
('90210', 'United States', 'California', 'Beverly Hills'),
('60601', 'United States', 'Illinois', 'Chicago'),
('33101', 'United States', 'Florida', 'Miami'),
('75201', 'United States', 'Texas', 'Dallas'),
('94102', 'United States', 'California', 'San Francisco'),
('02108', 'United States', 'Massachusetts', 'Boston'),
('80202', 'United States', 'Colorado', 'Denver'),
('98101', 'United States', 'Washington', 'Seattle'),
('30301', 'United States', 'Georgia', 'Atlanta'),
('2000', 'Australia', 'New South Wales', 'Sydney'),
('3000', 'Australia', 'Victoria', 'Melbourne'),
('4000', 'Australia', 'Queensland', 'Brisbane'),
('5000', 'Australia', 'South Australia', 'Adelaide'),
('6000', 'Australia', 'Western Australia', 'Perth'),
('85001', 'United States', 'Arizona', 'Phoenix'),
('19102', 'United States', 'Pennsylvania', 'Philadelphia'),
('43201', 'United States', 'Ohio', 'Columbus'),
('48201', 'United States', 'Michigan', 'Detroit'),
('20001', 'United States', 'District of Columbia', 'Washington'),
('70001', 'United States', 'Louisiana', 'Metairie'),
('89101', 'United States', 'Nevada', 'Las Vegas'),
('97201', 'United States', 'Oregon', 'Portland'),
('37201', 'United States', 'Tennessee', 'Nashville'),
('55401', 'United States', 'Minnesota', 'Minneapolis'),
('2600', 'Australia', 'ACT', 'Canberra'),
('7000', 'Australia', 'Tasmania', 'Hobart'),
('0800', 'Australia', 'Northern Territory', 'Darwin'),
('64101', 'United States', 'Missouri', 'Kansas City'),
('46201', 'United States', 'Indiana', 'Indianapolis');")]) #label("org27ad861")
#figure([#raw(block: true, lang: "sql", "INSERT INTO CustomerAddress (CustomerAddressID, CustomerAddressStreet, CustomerAddressStreetNum, CustomerAddressZip) VALUES
(482930, 'Rodeo Drive', 421, '90210'),
(102938, 'Canon Drive', 712, '90210'),
(556473, 'Lomitas Avenue', 1105, '90210'),
(827364, 'Alpine Drive', 804, '90210'),
(192837, 'Bedford Drive', 516, '90210'),
(475869, 'Camden Drive', 625, '90210'),
(334455, 'Elevado Avenue', 902, '90210'),
(998877, 'Foothill Road', 1240, '90210'),
(221133, 'Linden Drive', 709, '90210'),
(665544, 'Maple Drive', 815, '90210'),
(774411, 'Palm Drive', 503, '90210'),
(123546, 'Rexford Drive', 618, '90210'),
(889900, 'Sierra Drive', 722, '90210'),
(445566, 'Walden Drive', 935, '90210'),
(112233, 'Carmelita Avenue', 1010, '90210'),
(990011, 'Beverly Drive', 455, '90210'),
(332211, 'Crescent Drive', 312, '90210'),
(554433, 'Dayton Way', 9440, '90210'),
(778899, 'Brighton Way', 9520, '90210'),
(667788, 'Alta Drive', 801, '90210'),
(223344, 'Arden Drive', 606, '90210'),
(446688, 'Hillcrest Road', 1175, '90210'),
(101020, 'Mountain Drive', 1005, '90210'),
(302010, 'Sunset Boulevard', 9641, '90210'),
(506070, 'Benedict Canyon Drive', 2500, '90210'),
(807060, 'Tower Road', 1120, '90210'),
(905040, 'Coldwater Canyon Drive', 1405, '90210'),
(204060, 'Lexington Road', 812, '90210'),
(705030, 'Greenway Drive', 901, '90210'),
(105090, 'Oxford Way', 1215, '90210');
(582914, 'Via Dante', 14, '20121');")]) #label("orge39249c")
#figure([#raw(block: true, lang: "sql", "INSERT INTO DeliveryAddress (DeliveryAddressID, DeliveryAddressStreet, DeliveryAddressStreetNum, DeliveryAddressZip) VALUES
(293847, 'Loma Vista Drive', 1125, '90210'),
(847561, 'Doheny Road', 501, '90210'),
(102948, 'Bowmont Drive', 2410, '90210'),
(667382, 'Deep Canyon Drive', 1805, '90210'),
(550493, 'Wallace Ridge', 1300, '90210'),
(384756, 'Carla Ridge', 1185, '90210'),
(928374, 'Schuyler Road', 912, '90210'),
(475610, 'Robert Lane', 1004, '90210'),
(119283, 'Trousdale Estates', 425, '90210'),
(663322, 'Chalette Drive', 510, '90210'),
(774859, 'Arkell Drive', 1401, '90210'),
(203948, 'Lania Lane', 1210, '90210'),
(884756, 'Summit Drive', 1100, '90210'),
(449302, 'Pickfair Way', 1143, '90210'),
(556677, 'Angelo Drive', 1280, '90210'),
(123847, 'Brooktree Road', 605, '90210'),
(904857, 'Heather Road', 955, '90210'),
(334411, 'Dutton Drive', 814, '90210'),
(775599, 'Hidden Valley Road', 2505, '90210'),
(662288, 'Franklin Canyon Drive', 1900, '90210'),
(229944, 'Kimridge Road', 1420, '90210'),
(441188, 'Claridge Drive', 1015, '90210'),
(109020, 'San Ysidro Drive', 1602, '90210'),
(308010, 'Tower Grove Drive', 1220, '90210'),
(502070, 'Waring Avenue', 445, '90210'),
(801060, 'Gregory Way', 315, '90210'),
(902040, 'Charleville Boulevard', 9420, '90210'),
(203060, 'Lasky Drive', 105, '90210'),
(701030, 'Spalding Drive', 222, '90210'),
(107090, 'Oakhurst Drive', 418, '90210');")]) #label("org846a920")
#figure([#raw(block: true, lang: "sql", "INSERT INTO SupplierAddress (SupplierAddressID, SupplierAddressStreet, SupplierAddressStreetNum, SupplierAddressZip) VALUES
(314256, 'Carla Lane', 1018, '90210'),
(827319, 'Bundy Drive', 1540, '90210'),
(665102, 'Ambassador Avenue', 1001, '90210'),
(449281, 'Shadow Hill Way', 1225, '90210'),
(510293, 'Wallace Ridge', 1350, '90210'),
(883746, 'Dona Marina Drive', 3105, '90210'),
(192830, 'Deep Canyon Drive', 2112, '90210'),
(774123, 'Coldwater Canyon Drive', 1845, '90210'),
(556201, 'Kimridge Road', 1390, '90210'),
(304928, 'Bowmont Drive', 2555, '90210'),
(495817, 'Lania Lane', 1288, '90210'),
(202134, 'San Ysidro Drive', 1701, '90210'),
(993847, 'Tower Grove Drive', 1140, '90210'),
(440011, 'Heather Road', 9210, '90210'),
(667123, 'Hidden Valley Road', 2480, '90210'),
(129485, 'Cielo Drive', 10050, '90210'),
(338271, 'Benedict Canyon Drive', 2615, '90210'),
(772109, 'Hutton Drive', 1905, '90210'),
(884102, 'Beverly Estate Drive', 1201, '90210'),
(559182, 'Loma Vista Drive', 1195, '90210'),
(443322, 'Doheny Road', 412, '90210'),
(221199, 'Sierra Drive', 802, '90210'),
(664433, 'Palm Drive', 615, '90210'),
(779900, 'Maple Drive', 710, '90210'),
(102030, 'Linden Drive', 505, '90210'),
(405060, 'Roxbury Drive', 915, '90210'),
(809010, 'Bedford Drive', 601, '90210'),
(204080, 'Peck Drive', 335, '90210'),
(706050, 'Canon Drive', 422, '90210'),
(901020, 'Beverly Drive', 210, '90210');")]) #label("org25cd261")
#figure([#raw(block: true, lang: "sql", "INSERT INTO Supplier (SupplierID, SupplierName, SupplierPhone, SupplierAddressIDCode) VALUES
(482910, 'Apex Logistics Solutions', 31550192, 556201),
(102938, 'Golden Gate Wholesale', 21358821, 556201),
(556473, 'Summit Manufacturing', 32355732, 556201),
(827364, 'Pacific Rim Imports', 41555012, 556201),
(192837, 'Blue Horizon Textiles', 81852345, 556201),
(475869, 'Beverly Hills Tech Corp', 31557766, 556201),
(334455, 'Emerald City Trading', 20655122, 556201),
(998877, 'Starlight Distribution', 71558899, 556201),
(221133, 'Precision Parts Inc', 61955344, 556201),
(665544, 'Coastal Supply Co', 80555577, 556201),
(774411, 'NextGen Electronics', 40850011, 556201),
(123546, 'Global Reach Freight', 51052233, 556201),
(889900, 'Mainland Materials', 91655455, 556201),
(112233, 'North Star Industrial', 61257788, 556201),
(990011, 'Desert Springs Water', 60255500, 556201),
(332211, 'Empire State Sourcing', 21251100, 556201),
(554433, 'Windy City Hardware', 31252299, 556201),
(778899, 'Lone Star Steel', 51255388, 556201),
(667788, 'Peach State Produce', 45554477, 556201),
(223344, 'Evergreen Forestry', 55555566, 556201),
(446688, 'Bayou Beverage Group', 55556655, 556201),
(101020, 'Silver State Mining', 75557744, 556201),
(302010, 'Cascade Equipment', 25558833, 556201),
(506070, 'Sunshine State Citrus', 55559922, 556201),
(807060, 'Rocky Mountain Gear', 35551010, 556201),
(905040, 'Gateway City Freight', 45552020, 556201),
(204060, 'Liberty Bell Fabrics', 55553030, 556201),
(705030, 'Old Dominion Paper', 45554040, 556201),
(105090, 'Great Lakes Glass', 35555050, 556201),
(339922, 'Canyon Rim Partners', 15556060, 556201);")]) #label("org8dd824b")

#figure([#raw(block: true, lang: "sql", "INSERT INTO DeliveryService (DeliveryServiceID, DeliveryServiceName, DeliveryServicePhone, DeliveryAddressIDCode) VALUES
(219485, 'SwiftStream Logistics', 31051029, 123847),
(774821, 'Velox Parcel Services', 21359930, 123847),
(550192, 'HyperLink Couriers', 32355582, 123847),
(837261, 'DirectRoute Freight', 41555721, 123847),
(192038, 'Blue Dart Deliveries', 81853344, 123847),
(476102, '90210 Express Mail', 31055510, 123847),
(339485, 'City-to-City Haulage', 20651212, 123847),
(991122, 'NextDay Global Trans', 71454433, 123847),
(228374, 'Point-B Logistics', 61955509, 123847),
(661029, 'Pacific West Cargo', 80555561, 123847),
(775533, 'RapidResponse Dispatch', 40552020, 123847),
(120394, 'Gold Star Trucking', 51055531, 123847),
(884712, 'MileHigh Courier Co', 91655242, 123847),
(119933, 'Interstate Expeditors', 61255353, 123847),
(998811, 'Red Zone Transport', 60255564, 123847),
(331100, 'IronClad Shipping', 21255575, 123847),
(552288, 'Windy City Couriers', 31255686, 123847),
(773399, 'Lone Star Logistics', 51255797, 123847),
(664477, 'Southern Cross Freight', 40550808, 123847),
(225544, 'Northwest Cargo Link', 50351919, 123847),
(447766, 'Bayou Rapid Transit', 50455030, 123847),
(108822, 'Silver State Express', 70254141, 123847),
(301144, 'Peak Performance Mail', 25355252, 123847),
(509977, 'Sunshine State Deliver', 30556363, 123847),
(802266, 'Alpine Logistics Group', 30557474, 123847),
(904433, 'Midwest Haulage Co', 31455585, 123847),
(206655, 'Liberty Bell Logistics', 21559696, 123847),
(708844, 'Commonwealth Cargo', 80455507, 123847),
(103366, 'Great Lakes Dispatch', 31351818, 123847),
(337711, 'Canyon View Couriers', 80152929, 123847);")]) #label("orgd73c8eb")

#figure([#raw(block: true, lang: "sql", "INSERT INTO Customer (CustomerID, CustomerFirstName, CustomerSecondName, CustomerLastName, CustomerPhone, CustomerAddressIDCode) VALUES
(829401, 'Giovanni', 'Battista', 'Moretti', 390555301, 582914),
(789234, 'Barry', 'The', 'Bot', 720137410, 582914),
(104928, 'Antonio', 'Pasquale', 'Esposito', 390555302, 582914),
(556102, 'Vincenzo', 'Domenico', 'Ricci', 390255303, 582914),
(339481, 'Salvatore', 'Angelo', 'Marino', 390255304, 582914),
(771122, 'Stefano', 'Roberto', 'Greco', 390255305, 582914),
(228375, 'Giuseppe', 'Franco', 'Bruno', 390255306, 582914),
(661030, 'Claudio', 'Massimo', 'Gallo', 390255307, 582914),
(775534, 'Daniele', 'Enrico', 'Conti', 390255508, 582914),
(120395, 'Fabrizio', 'Paolo', 'De Luca', 390255309, 582914),
(884713, 'Gianluca', 'Sandro', 'Mancini', 390255310, 582914),
(119934, 'Carmine', 'Renato', 'Costa', 390255311, 582914),
(998812, 'Pasquale', 'Gino', 'Giordano', 39025512, 582914),
(331101, 'Giorgio', 'Filippo', 'Rizzo', 390255513, 582914),
(552289, 'Raffaele', 'Umberto', 'Lombardi', 392555314, 582914),
(773398, 'Pietro', 'Rosario', 'Barbieri', 390555315, 582914),
(664476, 'Emilio', 'Cesare', 'Fontana', 390255316, 582914),
(225545, 'Augusto', 'Tullio', 'Santoro', 392555317, 582914),
(447767, 'Mauro', 'Silvio', 'Mariani', 390555318, 582914),
(108823, 'Flavio', 'Valerio', 'Rinaldi', 390255319, 582914),
(301145, 'Giacomo', 'Ettore', 'Caruso', 390255320, 582914),
(509978, 'Luciano', 'Nico', 'Ferraro', 390255321, 582914),
(802267, 'Enzo', 'Ottavio', 'Valli', 390255522, 582914),
(904434, 'Paolo', 'Santi', 'Guerra', 390255323, 582914),
(206656, 'Renzo', 'Ivano', 'Pellegrini', 302555324, 582914),
(708845, 'Aldo', 'Nino', 'Sanna', 390255525, 582914),
(103367, 'Bruno', 'Alfonso', 'Farina', 302555326, 582914),
(337712, 'Carlo', 'Arturo', 'Ferrero', 902555327, 582914),
(441122, 'Dario', 'Duccio', 'Serra', 390255328, 582914),
(558899, 'Fausto', 'Lio', 'Vitale', 390255329, 582914),
(663300, 'Igor', 'Zeno', 'Messina', 390555330, 582914);")]) #label("org852b192")

#figure([#raw(block: true, lang: "sql", "INSERT INTO Item (ItemID, ItemName, ItemSupplierID, ItemCategory, ItemLeft, ItemCost) VALUES
(592831, 'Silk Egyptian Sheets', 112233, 'Bedding', 142, 450),
(102948, 'Smart Espresso Machine', 112233, 'Appliances', 45, 1200),
(884729, 'Teak Outdoor Lounge', 112233, 'Furniture', 12, 3400),
(334102, 'Crystal Stemware Set', 112233, 'Kitchenware', 89, 250),
(771029, 'Noise-Cancelling Headphones', 112233, 'Electronics', 230, 350),
(550192, 'Cashmere Throw Blanket', 112233, 'Home Decor', 67, 180),
(219384, 'Professional Chef Knife', 112233, 'Kitchenware', 156, 125),
(667102, 'Velvet Occasional Chair', 112233, 'Furniture', 8, 890),
(440293, 'Smart Home Hub', 112233, 'Electronics', 412, 199),
(119283, 'Aromatic Soy Candle', 112233, 'Home Decor', 850, 45),
(903847, 'Electric Stand Mixer', 112233, 'Appliances', 34, 550),
(482716, 'Goose Down Duvet', 112233, 'Bedding', 22, 600),
(773322, 'Ergonomic Office Chair', 112233, 'Furniture', 56, 1100),
(120394, 'Bluetooth Surround Bar', 112233, 'Electronics', 115, 800),
(884712, 'Cast Iron Dutch Oven', 112233, 'Kitchenware', 94, 280),
(556611, 'Organic Cotton Towels', 112233, 'Bath', 540, 75),
(339485, 'Dimmable Floor Lamp', 112233, 'Lighting', 43, 320),
(991122, 'Porcelain Dinnerware Set', 112233, 'Kitchenware', 31, 450),
(228374, 'Stainless Steel Air Fryer', 112233, 'Appliances', 128, 220),
(661029, 'Memory Foam Mattress', 112233, 'Bedding', 14, 2500),
(775533, 'Smart Door Lock', 112233, 'Electronics', 204, 299),
(120395, 'Hand-Woven Area Rug', 112233, 'Home Decor', 9, 4200),
(884713, 'Copper Cookware Set', 112233, 'Kitchenware', 18, 1500),
(119934, 'Air Purifying System', 112233, 'Appliances', 65, 450),
(998811, 'Abstract Oil Painting', 112233, 'Home Decor', 5, 4800),
(331100, 'Adjustable Standing Desk', 112233, 'Furniture', 27, 1350),
(552288, 'Cordless Stick Vacuum', 112233, 'Appliances', 82, 700),
(773399, 'Smart Garden Planter', 112233, 'Garden', 150, 160),
(664477, 'Crystal Chandelier', 112233, 'Lighting', 3, 4950),
(225544, 'Wine Cellar Cooling Unit', 112233, 'Appliances', 7, 3200);")]) #label("orgfd0b4ac")

#figure([#raw(block: true, lang: "sql", "INSERT INTO Sale (SaleID, SaleCustomerID, SaleDeliveryServiceID) VALUES
(192837, 108823, 331100),
(475869, 108823, 331100),
(334455, 108823, 331100),
(998877, 108823, 331100),
(221133, 108823, 331100),
(665544, 108823, 331100),
(774411, 108823, 331100),
(123546, 108823, 331100),
(889900, 108823, 331100),
(112233, 108823, 331100),
(990011, 108823, 331100),
(332211, 108823, 331100),
(554433, 108823, 331100),
(778899, 108823, 331100),
(667788, 108823, 331100),
(223344, 108823, 331100),
(446688, 108823, 331100),
(101020, 108823, 331100),
(302010, 108823, 331100),
(506070, 108823, 331100),
(807060, 108823, 331100),
(905040, 108823, 331100),
(204060, 108823, 331100),
(705030, 108823, 331100),
(105090, 108823, 331100),
(339922, 108823, 331100),
(415263, 108823, 331100),
(987654, 108823, 331100),
(123456, 108823, 331100),
(654321, 108823, 331100);")]) #label("org3137542")

#figure([#raw(block: true, lang: "sql", "INSERT INTO Receipt (ReceiptSaleID, ReceiptItemID, ReceiptItemCount) VALUES
(665544, 592831, 2),
(665544, 102948, 1),
(665544, 884729, 4),
(665544, 334102, 5),
(665544, 771029, 2),
(665544, 550192, 3),
(665544, 219384, 1),
(665544, 667102, 1),
(665544, 440293, 5),
(665544, 119283, 4),
(665544, 903847, 1),
(665544, 482716, 2),
(665544, 773322, 3),
(665544, 120394, 1),
(665544, 884712, 5),
(665544, 556611, 4),
(665544, 339485, 2),
(665544, 991122, 3),
(665544, 228374, 1),
(665544, 661029, 2),
(665544, 775533, 5),
(665544, 120395, 1),
(665544, 884713, 2),
(665544, 119934, 1),
(665544, 998811, 1),
(665544, 331100, 3),
(665544, 552288, 1),
(665544, 773399, 4),
(665544, 664477, 1),
(665544, 225544, 1);")]) #label("org008182a")
#heading(level: 3)[Screenshots:] #label("orgd751976")
#figure([#image(sys.inputs.file-13)]) #label("orgcfa1817")
#figure([#image(sys.inputs.file-14)]) #label("orgcfa1817")
#figure([#image(sys.inputs.file-15)]) #label("orgcfa1817")
#figure([#image(sys.inputs.file-16)]) #label("orgcfa1817")
#figure([#image(sys.inputs.file-17)]) #label("orgcfa1817")
#figure([#image(sys.inputs.file-18)]) #label("orgcfa1817")
#figure([#image(sys.inputs.file-19)]) #label("orgcfa1817")
#figure([#image(sys.inputs.file-20)]) #label("orgcfa1817")
#figure([#image(sys.inputs.file-21)]) #label("orgcfa1817")
#figure([#image(sys.inputs.file-22)]) #label("orgcfa1817")
#figure([#image(sys.inputs.file-23)]) #label("orgcfa1817")
#figure([#image(sys.inputs.file-24)]) #label("orgcfa1817")
#figure([#image(sys.inputs.file-25)]) #label("orgcfa1817")
#figure([#image(sys.inputs.file-26)]) #label("orgcfa1817")
#figure([#image(sys.inputs.file-27)]) #label("orgcfa1817")
#figure([#image(sys.inputs.file-28)]) #label("orgcfa1817")
#figure([#image(sys.inputs.file-29)]) #label("orgcfa1817")
#figure([#image(sys.inputs.file-30)]) #label("orgcfa1817")
#figure([#image(sys.inputs.file-31)]) #label("orgcfa1817")
#figure([#image(sys.inputs.file-32)]) #label("orgcfa1817")
#heading(level: 1)[Part 2: Data Manipulation] #label("org581a421")
#heading(level: 2)[Requirement f:] #label("org6ea5afb")
#figure([#raw(block: true, lang: "sql", "SELECT CustomerAddress.CustomerAddressID, CustomerAddress.CustomerAddressStreet, CustomerAddress.CustomerAddressStreetNum, CustomerAddress.CustomerAddressZip, CustomerFirstName, CustomerSecondName, CustomerLastName, CustomerPhone, Zip.Country, Zip.Region, Zip.City, CustomerAddressIDCode
FROM Customer
INNER JOIN CustomerAddress ON CustomerAddress.CustomerAddressID = Customer.CustomerAddressIDCode
INNER JOIN Zip ON Zip.ZipCode = CustomerAddress.CustomerAddressZip;")]) #label("orgd8236f5")
#figure([#image(sys.inputs.file-33)]) #label("orgdc25d68")
#heading(level: 2)[Requirement g:] #label("org152d0ff")
#figure([#raw(block: true, lang: "sql", "SELECT DISTINCT Country
FROM Zip;")]) #label("orgc607565")
#figure([#image(sys.inputs.file-34)]) #label("orga86ae4b")
#heading(level: 2)[Requirement h:] #label("orgc1ec242")
#figure([#raw(block: true, lang: "sql", "SELECT CustomerFirstName, CustomerSecondName, CustomerLastName, CustomerID
FROM Customer
WHERE CustomerLastName LIKE '%ot%'")]) #label("org51b00db")
#figure([#image(sys.inputs.file-35)]) #label("org39a0f90")
#heading(level: 2)[Requirement i:] #label("org703998e")
#figure([#raw(block: true, lang: "sql", "SELECT CustomerFirstName, CustomerSecondName, CustomerLastName, Sale.SaleID, Zip.Country, Sale.SaleCustomerID, CustomerAddress.CustomerAddressID, CustomerAddress.CustomerAddressZip, Zip.ZipCode, Sale.SaleCustomerID, CustomerAddressIDCode
FROM Customer
INNER JOIN CustomerAddress ON CustomerAddress.CustomerAddressID = Customer.CustomerAddressIDCode
INNER JOIN Zip ON Zip.ZipCode = CustomerAddress.CustomerAddressZip
INNER JOIN Sale ON Sale.SaleCustomerID = Customer.CustomerID
WHERE Zip.Country LIKE 'Italy'")]) #label("orgb5de68d")
#figure([#image(sys.inputs.file-36)]) #label("org3dfa0cd")
#heading(level: 2)[Requirement j:] #label("org48cb310")
#figure([#raw(block: true, lang: "sql", "SELECT ItemID, ItemName, ItemCost,
        CASE
                WHEN ItemCost > 100 AND ItemCost < 200 THEN ItemCost*0.9
        END AS ItemCostAfterDiscount
FROM Item
WHERE ItemCost > 100 AND ItemCost < 200")]) #label("org5b6f2c2")
#figure([#image(sys.inputs.file-37)]) #label("orga0cad80")
#heading(level: 1)[AI Decleration] #label("orgf71910e")
I have used AI while undertaking my assignment in the following ways:
#list(list.item[To develop research questions on the topic – YES\u{2f} #text(weight: "bold", [NO])])#list(list.item[To create an outline of the topic – YES\u{2f} #text(weight: "bold", [NO])])#list(list.item[To explain concepts – YES\u{2f} #text(weight: "bold", [NO])])#list(list.item[To support my use of language – YES\u{2f} #text(weight: "bold", [NO])])#list(list.item[To summarise the following articles\u{2f}resources: #text(weight: "bold", [NONE])])#list(list.item[In other ways, as described below:
#list(list.item[To create dummy data for me to fill into tables for the Part 1\u{27}s 5th question, using Gemini AI.])])
