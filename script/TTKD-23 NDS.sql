--create database TTKD_23_NDS
go
use TTKD_23_NDS
go
-------------------------------------------------status----------------------------------------------------------------
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[statusNDS]') AND type in (N'U'))
DROP TABLE [dbo].[statusNDS]
GO
CREATE TABLE [dbo].[statusNDS] (
  [statusID] int NOT NULL,
  [statusName] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [CreatedDate] datetime NULL,
  [UpdatedDate] datetime NULL
)
ON [PRIMARY]
GO

INSERT INTO [dbo].[statusNDS] ([statusID], [statusName],[CreatedDate],[UpdatedDate])
VALUES 
  (1, N'activity',GETDATE(),GETDATE())
GO
INSERT INTO [dbo].[statusNDS] ([statusID], [statusName],[CreatedDate],[UpdatedDate])
VALUES 
  (0, N'non-activity',GETDATE(),GETDATE())
GO

-------------------------------------------------source NDS----------------------------------------------------------------
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sourceNDS]') AND type in (N'U'))
DROP TABLE [dbo].[sourceNDS]
GO
CREATE TABLE [dbo].[sourceNDS] (
  [sourceID] int NOT NULL,
  [sourceName] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [CreatedDate] datetime NULL,
  [UpdatedDate] datetime NULL
)
ON [PRIMARY]
GO

INSERT INTO [dbo].[sourceNDS] ([sourceID], [sourceName])
VALUES 
  (1, N'accidents')
GO
INSERT INTO [dbo].[sourceNDS] ([sourceID], [sourceName])
VALUES 
  (2, N'postcodes')
GO
INSERT INTO [dbo].[sourceNDS] ([sourceID], [sourceName])
VALUES 
  (3, N'vehicles')
GO
INSERT INTO [dbo].[sourceNDS] ([sourceID], [sourceName])
VALUES 
  (4, N'casualtes')
GO
INSERT INTO [dbo].[sourceNDS] ([sourceID], [sourceName])
VALUES 
  (5, N'PCD_OA')
GO

----------------------------------------------------------------drop if exist-----------------------------------------------
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accidents_NDS]') AND type in (N'U'))
DROP TABLE [dbo].[Accidents_NDS]
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Casualties_NDS]') AND type in (N'U'))
DROP TABLE [dbo].[Casualties_NDS]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PCD_OA_NDS]') AND type in (N'U'))
DROP TABLE [dbo].[PCD_OA_NDS]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Postcodes_NDS]') AND type in (N'U'))
DROP TABLE [dbo].[Postcodes_NDS]

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vehicles_NDS]') AND type in (N'U'))
DROP TABLE [dbo].[Vehicles_NDS]

--------------------------------------------------------------------create table-----------------------------------------------

CREATE TABLE [dbo].[Accidents_NDS](
[Accident_ID] [int] IDENTITY(1, 1) NOT NULL,
 [Accident_Index] [char](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [Location_Easting_OSGR] [int]  NULL,
 [Location_Northing_OSGR] [int] NULL,
 [Longitude] [int] NULL,
 [Latitude] [char](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [Accident_Severity] [int]  NULL,
 [Number_of_Vehicles] [int] NULL,
 [Number_of_Casualties] [int] NULL,
 [Date] [date] NULL,
 [Day_of_Week] [int] NULL,
 [Time] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [Local_Authority_District] [int] NULL,
 [Local_Authority_Highway] [char](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [Road_Type] [int] NULL,
 [Speed_limit] [int] NULL,
 [Built_up_Road_Type] [int] NULL,
 [Light_Conditions] [int] NULL,
 [Weather_Conditions] [int] NULL,
 [Road_Surface_Conditions] [int] NULL,
 [Special_Conditions_at_Site] [int] NULL,
 [Urban_or_Rural_Area] [int] NULL,
 [LSOA_of_Accident_Location] [char](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [status] int NULL,
 [sourceID] int NULL,
 [CreatedDate] datetime NULL,
 [UpdatedDate] datetime NULL
) 
ON [PRIMARY]
go

CREATE TABLE [dbo].[Casualties_NDS](
 [Casualties_ID] [int] IDENTITY(1, 1) NOT NULL,
 [Accident_Index] [char](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [Vehicle_Reference] [int] NULL,
 [Casualty_Reference] [int] NULL,
 [Casualty_Class] [int] NULL,
 [Sex_of_Casualty] [int] NULL,
 [Age_of_Casualty] [int] NULL,
 [Age_Band_of_Casualty] [int] NULL,
 [Casualty_Severity] [int] NULL,
 [Casualty_Type] [int] NULL,
 [Casualty_Home_Area_Type] [int] NULL,
 [status] int NULL,
 [sourceID] int NULL,
 [CreatedDate] datetime NULL,
 [UpdatedDate] datetime NULL
)
ON [PRIMARY]
go

CREATE TABLE [dbo].[PCD_OA_NDS](
 [PCD_OA_ID] [int] IDENTITY(1, 1) NOT NULL,
 [pcd7] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [pcd8] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [pcds] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [dointr] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [doterm] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [usertype]  [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [oa11cd] [char](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [lsoa11cd] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [msoa11cd] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [ladcd] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [status] int NULL,
 [sourceID] int NULL,
 [CreatedDate] datetime NULL,
 [UpdatedDate] datetime NULL
) 
ON [PRIMARY]
go

CREATE TABLE [dbo].[Postcodes_NDS](
 [Postcodes_ID] [int] IDENTITY(1, 1) NOT NULL,
 [postcode] [char](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [easting] [int] NULL,
 [northing] [int] NULL,
 [latitude] [char](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [longitude] [char](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [city] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [county] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [country_code] [char](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [country_name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [iso3166-2] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [region_code] [char](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [region_name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [status] int NULL,
 [sourceID] int NULL,
 [CreatedDate] datetime NULL,
 [UpdatedDate] datetime NULL
)
ON [PRIMARY]
go

CREATE TABLE [dbo].[Vehicles_NDS](
 [Vehicles_ID] [int] IDENTITY(1, 1) NOT NULL,
 [Accident_Index] [char](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [Vehicle_Reference] [int] NULL,
 [Vehicle_Type] [int] NULL,
 [Vehicle_Manoeuvre] [int] NULL,
 [Hit_Object_in_Carriageway] [int] NULL,
 [1st_Point_of_Impact] [int] NULL,
 [Was_Vehicle_Left_Hand_Drive?] [int] NULL,
 [Sex_of_Driver] [int] NULL,
 [Age_of_Driver] [int] NULL,
 [Age_Band_of_Driver] [int] NULL,
 --[Engine_Capacity_(CC)] [int] NULL,
 [Journey_Purpose] [int] NULL,
 [Propulsion_Code] [int] NULL,
 --[Age_of_Vehicle] [int] NULL,
 [Driver_IMD_Decile] [int] NULL,
 [status] int NULL,
 [sourceID] int NULL,
 [CreatedDate] datetime NULL,
 [UpdatedDate] datetime NULL
)
ON [PRIMARY]
go

