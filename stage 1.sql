CREATE TABLE [dbo].[addresses]
(
  [address_id] [int]  NOT NULL,
  [city] [varchar](50)  NULL,
  [state] [varchar](2)  NULL,
  [zipcode] [varchar](5)  NULL,
  [country] [varchar](50)  NULL,
  [street_address] [varchar](100)  NULL
)
ALTER TABLE [dbo].[addresses] ADD CONSTRAINT address_id PRIMARY KEY  ([address_id])

-- Add 4 rows for addresses.
INSERT INTO addresses (address_id, city, state, zipcode, country, street_address) VALUES 
(1,'Los Angeles','CA','91601','USA','123 Privet Street'),
(2,'Glendale','CA','91208','USA','1500 N Verdugo Road'),
(3,'London',NULL,NULL,'England','348 Jinx Road'),
(4,'Northridge','CA','91325','USA','9825 Balboa Blvd');

CREATE TABLE [dbo].[branches]
(
  [branch_id] [int]  NOT NULL,
  [location] [varchar](50)  NULL,
  [name] [varchar](10)  NULL
)
ALTER TABLE [dbo].[branches] ADD CONSTRAINT branch_id PRIMARY KEY  ([branch_id])

-- Add 3 rows for branches.
INSERT INTO branches (branch_id, location, name) VALUES 
(1,'/master','master'),
(2,'/dev','dev'),
(3,'/production','production');

CREATE TABLE [dbo].[companies]
(
  [company_id] [int]  NOT NULL,
  [name] [varchar](30)  NULL,
  [address_id] [int]  NULL
)
ALTER TABLE [dbo].[companies] ADD CONSTRAINT company_id PRIMARY KEY  ([company_id])

-- Add 4 rows for companies.
INSERT INTO companies (company_id, name, address_id) VALUES 
(1,'ABC records',1),
(2,'ZYX Corp',3),
(3,'99 Store',NULL),
(4,'TCB',4);

CREATE TABLE [dbo].[customers]
(
  [customer_id] [int]  NOT NULL,
  [phone_id] [int]  NULL,
  [company_id] [int]  NULL,
  [email] [varchar](254)  NULL,
  [first_name] [varchar](50)  NULL,
  [last_name] [varchar](50)  NULL
)

-- Add 5 rows for customers.
INSERT INTO customers (customer_id, phone_id, company_id, email, first_name, last_name) VALUES 
(1,1,1,'p.smith@abc.com','Peter','Smith'),
(2,2,2,'maria@zyx.com','Maria','Bounte'),
(3,3,3,'david.sommerset@99cents.store','David','Sommerset'),
(4,4,3,'maria.bounte@99cents.store','Maria','Bounte'),
(5,5,4,'john.doe@tbc.com','John','Doe');

CREATE TABLE [dbo].[download_logs]
(
  [download_date] [datetime2](0)  NULL,
  [customer_id] [int]  NULL,
  [download_id] [int]  NULL
)

-- Add 6 rows for download_logs.
INSERT INTO download_logs (download_date, customer_id, download_id) VALUES 
('2000-03-01 00:00:00',4,2),
('2000-07-01 00:00:00',3,2),
('2015-01-01 00:00:00',1,1),
('2015-01-01 00:00:00',1,2),
('2015-01-01 00:00:00',4,1),
('2015-11-26 00:00:00',4,2);

CREATE TABLE [dbo].[downloads]
(
  [download_id] [int]  NOT NULL,
  [release_id] [int]  NULL,
  [location] [varchar](255)  NULL
)

-- Add 2 rows for downloads.
INSERT INTO downloads (download_id, release_id, location) VALUES 
(1,7,'/download/one'),
(2,5,'/downloads/two');

CREATE TABLE [dbo].[features]
(
  [feature_id] [int]  NOT NULL,
  [feature_description] [varchar](50)  NOT NULL
)
ALTER TABLE [dbo].[features] ADD CONSTRAINT feature_id PRIMARY KEY  ([feature_id])

-- Add 11 rows for features.
INSERT INTO features (feature_id, feature_description) VALUES 
(1,'address verification'),
(2,'login module'),
(3,'patient authentication'),
(4,'patient e-bill'),
(5,'patient medication form'),
(6,'patient profile'),
(7,'patient registration'),
(8,'patient release form'),
(9,'patient reporting'),
(10,'patient reporting bug fix'),
(11,'physician profile');

CREATE TABLE [dbo].[iterations]
(
  [iteration_id] [int]  NOT NULL,
  [label] [varchar](20)  NULL,
  [product_id] [int]  NULL,
  [commit_sha] [varchar](40)  NULL,
  [bug_or_feature] [varchar](8)  NULL
)
ALTER TABLE [dbo].[iterations] ADD CONSTRAINT iteration_id PRIMARY KEY  ([iteration_id])

-- Add 3 rows for iterations.
INSERT INTO iterations (iteration_id, label, product_id, commit_sha, bug_or_feature) VALUES 
(1,'production',1,'09782f6eb07365f06249d600bc74d873c8279f43',NULL),
(2,'dev',2,'3d49a793f70b70a6f440e55936e9ae13913831bf','bug'),
(3,'master',2,'f58faf1bbed63d186ba9a0338e53aa18f69c2212',NULL);

CREATE TABLE [dbo].[phones]
(
  [phone_id] [int]  NOT NULL,
  [phone_type] [varchar](6)  NULL,
  [phone_number] [varchar](15)  NULL
)
ALTER TABLE [dbo].[phones] ADD CONSTRAINT phone_id PRIMARY KEY  ([phone_id])

-- Add 4 rows for phones.
INSERT INTO phones (phone_id, phone_type, phone_number) VALUES 
(1,'work','123-485-8973'),
(2,'work','1-28-397863896'),
(3,'mobile','179-397-87968'),
(4,'mobile','178-763-98764');

CREATE TABLE [dbo].[products]
(
  [product_id] [int]  NOT NULL,
  [description] [varchar](200)  NULL,
  [name] [varchar](15)  NULL,
  [platform] [varchar](15)  NULL
)
ALTER TABLE [dbo].[products] ADD CONSTRAINT product_id PRIMARY KEY  ([product_id])

-- Add 0 rows for products.
CREATE TABLE [dbo].[releases]
(
  [release_id] [int]  NOT NULL,
  [version_id] [int]  NULL,
  [iteration_id] [int]  NULL,
  [branch_id] [int]  NULL,
  [notes] [varchar](200)  NULL,
  [release_date] [datetime2](0)  NULL,
  [release_type] [varchar](50)  NULL
)
ALTER TABLE [dbo].[releases] ADD CONSTRAINT release_id PRIMARY KEY  ([release_id])

-- Add 10 rows for releases.
INSERT INTO releases (release_id, version_id, iteration_id, branch_id, notes, release_date, release_type) VALUES 
(1,1,2,1,'Best Release','2000-01-01 00:00:00','new product release'),
(5,5,2,1,'Very good','2000-01-01 00:00:00','new product release'),
(7,2,1,1,'Best Release','2000-01-01 00:00:00','new product release'),
(9,4,1,1,'Best Release','2000-01-01 00:00:00','new product release'),
(11,1,1,1,'Best Release','2000-01-01 00:00:00','new product release'),
(13,3,1,1,'Very good release','2000-05-01 00:00:00','new features release'),
(15,5,1,1,'Ok release','2000-05-01 00:00:00','new features release'),
(17,2,2,1,'Best Release so far','2000-05-01 00:00:00','new features release'),
(19,4,2,1,'Pretty good release','2000-05-01 00:00:00','new features release'),
(21,1,2,1,'Good release for bug fix','2000-06-13 00:00:00','bug-fix release');

CREATE TABLE [dbo].[version_feature]
(
  [version_id] [int]  NULL,
  [feature_id] [int]  NULL
)

-- Add 21 rows for version_feature.
INSERT INTO version_feature (version_id, feature_id) VALUES 
(1,NULL),
(3,NULL),
(1,NULL),
(2,NULL),
(4,NULL),
(5,NULL),
(4,NULL),
(5,NULL),
(4,NULL),
(5,NULL),
(1,NULL),
(2,NULL),
(1,NULL),
(2,NULL),
(1,NULL),
(2,NULL),
(4,NULL),
(5,NULL),
(5,NULL),
(1,NULL),
(2,NULL);

CREATE TABLE [dbo].[versions]
(
  [version_id] [int]  NOT NULL,
  [product_id] [int]  NOT NULL,
  [version_number] [varchar](50)  NULL
)
ALTER TABLE [dbo].[versions] ADD CONSTRAINT version_id PRIMARY KEY  ([version_id])

-- Add 8 rows for versions.
INSERT INTO versions (version_id, product_id, version_number) VALUES 
(1,1,'1.1'),
(2,2,'1.2'),
(3,2,'2.1'),
(4,1,'2.2'),
(5,2,'2.2'),
(6,1,'2.4'),
(7,1,'3.0'),
(8,1,'3.2');

