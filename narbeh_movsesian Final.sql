USE [master]
GO
/****** Object:  Database [s16guest22]    Script Date: 5/5/2016 5:25:08 PM ******/
CREATE DATABASE [s16guest22]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N's16guest22', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.CSDB440\MSSQL\DATA\s16guest22.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N's16guest22_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.CSDB440\MSSQL\DATA\s16guest22_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [s16guest22] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [s16guest22].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [s16guest22] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [s16guest22] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [s16guest22] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [s16guest22] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [s16guest22] SET ARITHABORT OFF 
GO
ALTER DATABASE [s16guest22] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [s16guest22] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [s16guest22] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [s16guest22] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [s16guest22] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [s16guest22] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [s16guest22] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [s16guest22] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [s16guest22] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [s16guest22] SET  ENABLE_BROKER 
GO
ALTER DATABASE [s16guest22] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [s16guest22] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [s16guest22] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [s16guest22] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [s16guest22] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [s16guest22] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [s16guest22] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [s16guest22] SET RECOVERY FULL 
GO
ALTER DATABASE [s16guest22] SET  MULTI_USER 
GO
ALTER DATABASE [s16guest22] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [s16guest22] SET DB_CHAINING OFF 
GO
ALTER DATABASE [s16guest22] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [s16guest22] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N's16guest22', N'ON'
GO
USE [s16guest22]
GO
/****** Object:  User [s16guest22]    Script Date: 5/5/2016 5:25:09 PM ******/
CREATE USER [s16guest22] FOR LOGIN [s16guest22] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [s16guest22]
GO
/****** Object:  Table [dbo].[addresses]    Script Date: 5/5/2016 5:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[addresses](
	[address_id] [int] NOT NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[zipcode] [varchar](5) NULL,
	[country] [varchar](50) NULL,
	[street_address] [varchar](100) NULL,
 CONSTRAINT [address_id] PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[branches]    Script Date: 5/5/2016 5:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[branches](
	[branch_id] [int] NOT NULL,
	[location] [varchar](50) NULL,
	[name] [varchar](10) NULL,
 CONSTRAINT [branch_id] PRIMARY KEY CLUSTERED 
(
	[branch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[companies]    Script Date: 5/5/2016 5:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[companies](
	[company_id] [int] NOT NULL,
	[name] [varchar](30) NULL,
	[address_id] [int] NULL,
 CONSTRAINT [company_id] PRIMARY KEY CLUSTERED 
(
	[company_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customers]    Script Date: 5/5/2016 5:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customers](
	[customer_id] [int] NOT NULL,
	[phone_id] [int] NULL,
	[company_id] [int] NULL,
	[email] [varchar](254) NULL,
	[first_name] [varchar](50) NULL,
	[last_name] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[download_logs]    Script Date: 5/5/2016 5:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[download_logs](
	[download_date] [datetime2](0) NULL,
	[customer_id] [int] NULL,
	[download_id] [int] NULL,
 CONSTRAINT [unique_dl] UNIQUE NONCLUSTERED 
(
	[download_date] ASC,
	[customer_id] ASC,
	[download_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[downloads]    Script Date: 5/5/2016 5:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[downloads](
	[download_id] [int] NOT NULL,
	[release_id] [int] NULL,
	[location] [varchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[features]    Script Date: 5/5/2016 5:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[features](
	[feature_id] [int] NOT NULL,
	[feature_description] [varchar](50) NOT NULL,
 CONSTRAINT [feature_id] PRIMARY KEY CLUSTERED 
(
	[feature_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[iterations]    Script Date: 5/5/2016 5:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[iterations](
	[iteration_id] [int] NOT NULL,
	[label] [varchar](20) NULL,
	[product_id] [int] NULL,
	[commit_sha] [varchar](40) NULL,
	[bug_or_feature] [varchar](8) NULL,
 CONSTRAINT [iteration_id] PRIMARY KEY CLUSTERED 
(
	[iteration_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[phones]    Script Date: 5/5/2016 5:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[phones](
	[phone_id] [int] NOT NULL,
	[phone_type] [varchar](6) NULL,
	[phone_number] [varchar](15) NULL,
 CONSTRAINT [phone_id] PRIMARY KEY CLUSTERED 
(
	[phone_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[products]    Script Date: 5/5/2016 5:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[products](
	[product_id] [int] NOT NULL,
	[description] [varchar](200) NULL,
	[name] [varchar](15) NULL,
	[platform] [varchar](15) NULL,
 CONSTRAINT [product_id] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [_copy_1] UNIQUE NONCLUSTERED 
(
	[description] DESC,
	[name] ASC,
	[platform] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[releases]    Script Date: 5/5/2016 5:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[releases](
	[release_id] [int] NOT NULL,
	[version_id] [int] NULL,
	[iteration_id] [int] NULL,
	[branch_id] [int] NULL,
	[notes] [varchar](200) NULL,
	[release_date] [datetime2](0) NULL,
	[release_type] [varchar](50) NULL,
 CONSTRAINT [release_id] PRIMARY KEY CLUSTERED 
(
	[release_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[version_feature]    Script Date: 5/5/2016 5:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[version_feature](
	[version_id] [int] NULL,
	[feature_id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[versions]    Script Date: 5/5/2016 5:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[versions](
	[version_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[version_number] [varchar](50) NULL,
 CONSTRAINT [version_id] PRIMARY KEY CLUSTERED 
(
	[version_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[companies]  WITH CHECK ADD  CONSTRAINT [fk_company_address] FOREIGN KEY([address_id])
REFERENCES [dbo].[addresses] ([address_id])
GO
ALTER TABLE [dbo].[companies] CHECK CONSTRAINT [fk_company_address]
GO
ALTER TABLE [dbo].[downloads]  WITH CHECK ADD  CONSTRAINT [fk_download_release] FOREIGN KEY([release_id])
REFERENCES [dbo].[releases] ([release_id])
GO
ALTER TABLE [dbo].[downloads] CHECK CONSTRAINT [fk_download_release]
GO
ALTER TABLE [dbo].[releases]  WITH CHECK ADD  CONSTRAINT [fk_release_branch] FOREIGN KEY([branch_id])
REFERENCES [dbo].[branches] ([branch_id])
GO
ALTER TABLE [dbo].[releases] CHECK CONSTRAINT [fk_release_branch]
GO
ALTER TABLE [dbo].[releases]  WITH CHECK ADD  CONSTRAINT [fk_release_iteration] FOREIGN KEY([iteration_id])
REFERENCES [dbo].[iterations] ([iteration_id])
GO
ALTER TABLE [dbo].[releases] CHECK CONSTRAINT [fk_release_iteration]
GO
ALTER TABLE [dbo].[releases]  WITH CHECK ADD  CONSTRAINT [fk_release_version] FOREIGN KEY([version_id])
REFERENCES [dbo].[versions] ([version_id])
GO
ALTER TABLE [dbo].[releases] CHECK CONSTRAINT [fk_release_version]
GO
ALTER TABLE [dbo].[version_feature]  WITH CHECK ADD  CONSTRAINT [fk_version_feature_feature] FOREIGN KEY([feature_id])
REFERENCES [dbo].[features] ([feature_id])
GO
ALTER TABLE [dbo].[version_feature] CHECK CONSTRAINT [fk_version_feature_feature]
GO
ALTER TABLE [dbo].[version_feature]  WITH CHECK ADD  CONSTRAINT [fk_version_feature_version] FOREIGN KEY([version_id])
REFERENCES [dbo].[versions] ([version_id])
GO
ALTER TABLE [dbo].[version_feature] CHECK CONSTRAINT [fk_version_feature_version]
GO
/****** Object:  StoredProcedure [dbo].[downloads_per_product_versions]    Script Date: 5/5/2016 5:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[downloads_per_product_versions]  AS -- Returns Product, version, month, count
SELECT
	
	Versions.version_number 
	AS 'version',
	products.name,
	COUNT(*) AS 'count'
FROM
	download_logs
INNER JOIN downloads ON download_logs.download_id = downloads.download_id
INNER JOIN releases ON downloads.release_id = releases.release_id
INNER JOIN versions ON releases.version_id = versions.version_id
INNER JOIN products ON versions.product_id = products.product_id
GROUP BY
	versions.version_number,
	products.name
GO
/****** Object:  StoredProcedure [dbo].[insert_download]    Script Date: 5/5/2016 5:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insert_download]  @download_date datetime,
 @customer_id INT,
 @download_id INT AS -- Checks if Customer exists with given ID and Download exists with download ID
IF NOT EXISTS(
	SELECT
		*
	FROM
		[dbo].[customers]
	WHERE
		customer_id = @customer_id
)
OR NOT EXISTS(
	SELECT
		*
	FROM
		[dbo].[downloads]
	WHERE
		download_id = @download_id
)
BEGIN
	RAISERROR(
		'No customer exists with that ID',
		16,
		1
	) ; RETURN ;
END
ELSE
	INSERT INTO download_logs(
		[download_date],
		[customer_id],
		[download_id]
	)
VALUES
	(
		@download_date,
		@customer_id,
		@download_id
	)
GO
/****** Object:  StoredProcedure [dbo].[monthly_downloads]    Script Date: 5/5/2016 5:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[monthly_downloads]  AS SELECT
	CAST(
		MONTH(download_logs.download_date) AS VARCHAR(2)
	) + '-' + CAST(
		YEAR(download_logs.download_date) AS VARCHAR(4)
	) AS "Month-Year",
	-- Take the major and minor number and combine into X.XX format
	Versions.version_number 
	AS 'version',
	products.name AS 'product',
	COUNT(*) AS 'total download count'
FROM
	download_logs
INNER JOIN downloads ON download_logs.download_id = downloads.download_id
INNER JOIN releases ON downloads.release_id = releases.release_id
INNER JOIN versions ON releases.version_id = versions.version_id
INNER JOIN products ON versions.product_id = products.product_id
GROUP BY
	versions.version_number,
	products.name,
	CAST(
		MONTH(download_logs.download_date) AS VARCHAR(2)
	) + '-' + CAST(
		YEAR(download_logs.Download_date) AS VARCHAR(4)
	)
GO
/****** Object:  StoredProcedure [dbo].[new_feature_count]    Script Date: 5/5/2016 5:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[new_feature_count] 
	@product_id varchar(15),
	@version_number varchar(15)
AS

	IF NOT EXISTS(SELECT * FROM versions WHERE version_number = @version_number AND product_id = @product_id)
	BEGIN
		RAISERROR(
		'No versions exists for that product with that number',
		16,
		1
	) ; RETURN ;
	END

	DECLARE @feature_count INT;
	-- Need to do intersection if we have more than one version
	IF @version_number >= 1
	BEGIN
		SET @feature_count = (SELECT DISTINCT COUNT (*) FROM (SELECT DISTINCT 
			version_feature.feature_id
		FROM products
		INNER JOIN versions ON versions.product_id = products.product_id
		INNER JOIN version_feature ON version_feature.version_id = versions.version_id
		WHERE products.product_id = @product_id AND versions.product_id = 1 AND version_number <= @version_number

		INTERSECT

		SELECT DISTINCT 
			version_feature.feature_id
		FROM products
		INNER JOIN versions ON versions.product_id = products.product_id
		INNER JOIN version_feature ON version_feature.version_id = versions.version_id
		WHERE products.product_id = @product_id AND versions.product_id = 1 AND version_number <  @version_number) I)
	END
	ELSE
	BEGIN

		SET @feature_count = (SELECT COUNT(DISTINCT 
			version_feature.feature_id )
		FROM products
		INNER JOIN versions ON versions.product_id = products.product_id
		INNER JOIN version_feature ON version_feature.version_id = versions.version_id
		WHERE products.product_id = @product_id AND versions.product_id = 1 AND version_number <= @version_number)
	END
	
	IF @feature_count > 0
	BEGIN
		PRINT(CAST(@feature_count AS VARCHAR(50)) + ' features in the version ' + CAST(@version_number AS VARCHAR(5)) + ' release.')		
	END
	ELSE
		PRINT('It is a bug-fix release. There are no new features')
GO
/****** Object:  StoredProcedure [dbo].[test_select_proc]    Script Date: 5/5/2016 5:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[test_select_proc]  @var1 VARCHAR(20) AS SELECT
	*
FROM
	[dbo].[customers]
WHERE
	first_name = @var1 ;
GO
/****** Object:  StoredProcedure [dbo].[update_version_number]    Script Date: 5/5/2016 5:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[update_version_number]  @product_id INT,
 @version_number VARCHAR(10) AS
DECLARE @new_v_id VARCHAR(10),
 @new_version_number VARCHAR(10)
IF NOT EXISTS(
	SELECT
		*
	FROM
		[dbo].[versions]
	WHERE
		product_id = @product_id
)
BEGIN
	RAISERROR(
		'That product is not in the table, cannot increment version',
		16,
		1
	) ; RETURN ;
END
IF NOT EXISTS(
	SELECT
		*
	FROM
		[dbo].[versions]
	WHERE
		product_id = @product_id
	AND version_number = @version_number
)
BEGIN
	RAISERROR(
		'That version is not in the table, cannot increment version',
		16,
		1
	) ; RETURN ;
END
ELSE
	-- Get the max id in the table, and add one to it for new id
	SELECT
		@new_v_id = MAX(version_id) + 1
	FROM
		[dbo].[versions]
	GROUP BY
		version_id ; -- Get the max minor version number for the Product/Major number pair
		SELECT
			@new_version_number = MAX(version_number) + 1
		FROM
			[dbo].[versions]
		GROUP BY
			product_id,
			version_number ; -- Insert the new row with the updated version into the version table
			INSERT INTO [dbo].[Version](
				[version_id],
				[product_id],
				[version_number]
			)
		VALUES
			(
				@new_v_id,
				@product_id,
				@version_number,
				@new_version_number
			) ;
GO
USE [master]
GO
ALTER DATABASE [s16guest22] SET  READ_WRITE 
GO
