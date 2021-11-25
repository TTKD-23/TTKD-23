CREATE DATABASE [TTKD_23_Stage]
USE [TTKD_23_Stage]
GO
/****** Object:  Table [dbo].[Vehicles_Stage]    Script Date: 11/24/2021 11:00:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicles_Stage](
	[Accident_Index] [char](50) NOT NULL,
	[Vehicle_Reference] [int] NULL,
	[Vehicle_Type] [int] NULL,
	[Vehicle_Manoeuvre] [int] NULL,
	[Hit_Object_in_Carriageway] [int] NULL,
	[1st_Point_of_Impact] [int] NULL,
	[Was_Vehicle_Left_Hand_Drive?] [int] NULL,
	[Sex_of_Driver] [int] NULL,
	[Age_of_Driver] [int] NULL,
	[Age_Band_of_Driver] [int] NULL,
	[Journey_Purpose] [int] NULL,
	[Propulsion_Code] [int] NULL,
	[Driver_IMD_Decile] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Format_Vehicles_Stage]    Script Date: 11/24/2021 11:00:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Format_Vehicles_Stage] AS
SELECT distinct [Accident_Index]
    ,[Vehicle_Reference]
    ,[Vehicle_Type]
    ,[Vehicle_Manoeuvre]
    ,[Hit_Object_in_Carriageway]
    ,[1st_Point_of_Impact]
    ,[Was_Vehicle_Left_Hand_Drive?]
    ,[Sex_of_Driver]
    ,[Age_of_Driver]
    ,[Age_Band_of_Driver]
    ,[Journey_Purpose]
    ,[Propulsion_Code]
    ,[Driver_IMD_Decile]
	,(select [code] from [TTKD_23_NDS].[dbo].[getAgeFromAge](v.[Age_of_Driver])) as Age
FROM [TTKD_23_Stage].[dbo].[Vehicles_Stage] as v
GO
/****** Object:  Table [dbo].[Casualties_Stage]    Script Date: 11/24/2021 11:00:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Casualties_Stage](
	[Accident_Index] [char](50) NOT NULL,
	[Vehicle_Reference] [int] NULL,
	[Casualty_Reference] [int] NULL,
	[Casualty_Class] [int] NULL,
	[Sex_of_Casualty] [int] NULL,
	[Age_of_Casualty] [int] NULL,
	[Age_Band_of_Casualty] [int] NULL,
	[Casualty_Severity] [int] NULL,
	[Casualty_Type] [int] NULL,
	[Casualty_Home_Area_Type] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Format_Casualties_Stage]    Script Date: 11/24/2021 11:00:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Format_Casualties_Stage] AS
SELECT distinct [Accident_Index]
    ,[Vehicle_Reference]
    ,[Casualty_Reference]
    ,[Casualty_Class]
    ,[Sex_of_Casualty]
    ,[Age_of_Casualty]
    ,[Age_Band_of_Casualty]
    ,[Casualty_Severity]
    ,[Casualty_Type]
    ,[Casualty_Home_Area_Type]
	,(select [code] from [TTKD_23_NDS].[dbo].[getAgeFromAge](c.[Age_of_Casualty])) as Age
FROM [TTKD_23_Stage].[dbo].[Casualties_Stage] as c
GO
/****** Object:  Table [dbo].[PCD_OA_Stage]    Script Date: 11/24/2021 11:00:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCD_OA_Stage](
	[pcd7] [varchar](50) NULL,
	[pcd8] [varchar](50) NULL,
	[pcds] [varchar](50) NULL,
	[dointr] [varchar](50) NULL,
	[doterm] [varchar](50) NULL,
	[usertype] [varchar](50) NULL,
	[oa11cd] [char](50) NULL,
	[lsoa11cd] [varchar](50) NULL,
	[msoa11cd] [varchar](50) NULL,
	[ladcd] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Format_PCD_OA_Stage]    Script Date: 11/24/2021 11:00:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Format_PCD_OA_Stage]
AS
SELECT DISTINCT lsoa11cd, SUBSTRING(pcd7, 0, 5) AS postcode
FROM         dbo.PCD_OA_Stage
GO
/****** Object:  Table [dbo].[Accidents_Stage]    Script Date: 11/24/2021 11:00:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accidents_Stage](
	[Accident_Index] [char](50) NOT NULL,
	[Location_Easting_OSGR] [int] NULL,
	[Location_Northing_OSGR] [int] NULL,
	[Longitude] [int] NULL,
	[Latitude] [char](50) NULL,
	[Accident_Severity] [int] NULL,
	[Number_of_Vehicles] [int] NULL,
	[Number_of_Casualties] [int] NULL,
	[Date] [date] NULL,
	[Day_of_Week] [int] NULL,
	[Time] [varchar](50) NULL,
	[Local_Authority_(District)] [int] NULL,
	[Local_Authority_(Highway)] [char](50) NULL,
	[Road_Type] [int] NULL,
	[Speed_limit] [int] NULL,
	[Light_Conditions] [int] NULL,
	[Weather_Conditions] [int] NULL,
	[Road_Surface_Conditions] [int] NULL,
	[Special_Conditions_at_Site] [int] NULL,
	[Urban_or_Rural_Area] [int] NULL,
	[LSOA_of_Accident_Location] [char](50) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Format_Accidents_Stage]    Script Date: 11/24/2021 11:00:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Format_Accidents_Stage]
AS
SELECT    Accident_Index, Location_Easting_OSGR, Location_Northing_OSGR, Longitude, Latitude, Accident_Severity, Number_of_Vehicles, Number_of_Casualties, Date, Day_of_Week, Time, [Local_Authority_(District)], 
                      [Local_Authority_(Highway)], Road_Type, Speed_limit, Light_Conditions, Weather_Conditions, Road_Surface_Conditions, Special_Conditions_at_Site, Urban_or_Rural_Area, LSOA_of_Accident_Location,
                          (SELECT    code
                            FROM         TTKD_23_NDS.dbo.getPeriodOfDayFromTime(a.Time) AS getPeriodOfDayFromTime_1) AS Period_of_Day
FROM         dbo.Accidents_Stage AS a
GO
/****** Object:  Table [dbo].[Postcodes_Stage]    Script Date: 11/24/2021 11:00:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Postcodes_Stage](
	[postcode] [char](50) NOT NULL,
	[easting] [int] NULL,
	[northing] [int] NULL,
	[latitude] [char](50) NULL,
	[longitude] [char](50) NULL,
	[city] [varchar](50) NULL,
	[county] [varchar](50) NULL,
	[country_code] [char](50) NULL,
	[country_name] [varchar](50) NULL,
	[iso3166-2] [varchar](50) NULL,
	[region_code] [char](50) NULL,
	[region_name] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Mapping_Accident_Postcode_Stage]    Script Date: 11/24/2021 11:00:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Mapping_Accident_Postcode_Stage] AS
SELECT distinct y.Accident_Index, y.postcode
FROM (
SELECT x.Accident_Index, x.postcode, x.Range,
		ROW_NUMBER() OVER(PARTITION BY x.Accident_Index ORDER BY x.[Range] ASC) AS row_num
		FROM 
			(SELECT p.postcode, a.Accident_Index,
				ABS((CAST(p.latitude AS FLOAT(2)) - CAST(a.Latitude AS FLOAT(7))) -
				(CAST(p.easting AS INT) - CAST(a.Location_Easting_OSGR AS INT)) -
				(CAST(p.northing AS INT) - CAST(a.Location_Northing_OSGR AS INT))) AS [Range]
			FROM Accidents_Stage AS a 
				join Format_PCD_OA_Stage AS pcd ON a.LSOA_of_Accident_Location = pcd.lsoa11cd 
				join Postcodes_Stage AS p ON p.postcode = pcd.postcode) x) y
WHERE y.row_num = 1
GO
