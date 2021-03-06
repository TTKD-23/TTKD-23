CREATE DATABASE [TTKD_23_DDS]
GO
USE [TTKD_23_DDS]
GO
/****** Object:  Table [dbo].[Dim_Accident]    Script Date: 2021/12/25 22:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Accident](
	[Accident_ID] [int] NOT NULL,
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
	[Session_in_Day] [int] NULL,
	[Local_Authority_District] [int] NULL,
	[Road_Type] [int] NULL,
	[Speed_limit] [int] NULL,
	[Built_up_Road_Type] [int] NULL,
	[Light_Condition] [int] NULL,
	[Weather_Condition] [int] NULL,
	[Road_Surface_Condition] [int] NULL,
	[Special_Condition_at_Site] [int] NULL,
	[Carriageway_Hazard] [int] NULL,
	[Urban_or_Rural_Area] [int] NULL,
	[Geography_ID] [int] NULL,
	[StatusID] [int] NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Dim_Accident] PRIMARY KEY CLUSTERED 
(
	[Accident_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Age]    Script Date: 2021/12/25 22:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Age](
	[Age_ID] [int] IDENTITY(1,1) NOT NULL,
	[Age] [int] NULL,
	[Age_Group_ID] [int] NULL,
	[Age_Group_Name] [nchar](50) NULL,
	[Age_Band_ID] [int] NULL,
	[Age_Band_Name] [nchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Dim_Age2] PRIMARY KEY CLUSTERED 
(
	[Age_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Built_up_Road_Type]    Script Date: 2021/12/25 22:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Built_up_Road_Type](
	[Built_up_Road_Type_ID] [int] NOT NULL,
	[BuildUpRoadTypeCode] [int] NULL,
	[BuildUpRoadTypeName] [nchar](50) NULL,
 CONSTRAINT [PK_Dim_Build_up_Road_Type] PRIMARY KEY CLUSTERED 
(
	[Built_up_Road_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIm_Carriageway_Hazard]    Script Date: 2021/12/25 22:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIm_Carriageway_Hazard](
	[Carriageway_Hazard_ID] [int] NOT NULL,
	[CarriagewayHazardCode] [int] NULL,
	[CarriagewayHazardName] [nchar](50) NULL,
 CONSTRAINT [PK_DIm_Carriageway_Hazard] PRIMARY KEY CLUSTERED 
(
	[Carriageway_Hazard_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Casualty]    Script Date: 2021/12/25 22:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Casualty](
	[Casualty_ID] [int] NOT NULL,
	[Accident_Index] [char](50) NOT NULL,
	[Vehicle_Reference] [int] NULL,
	[Casualty_Reference] [int] NULL,
	[Casualty_Class] [int] NULL,
	[Sex_of_Casualty] [int] NULL,
	[Age_of_Casualty] [int] NOT NULL,
	[Age_Group] [int] NULL,
	[Age_Band_of_Casualty] [int] NULL,
	[Casualty_Severity] [int] NULL,
	[Casualty_Type] [int] NULL,
	[StatusID] [int] NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[Vehicle_ID] [int] NULL,
	[Accident_ID] [int] NULL,
 CONSTRAINT [PK_Dim_Casualty] PRIMARY KEY CLUSTERED 
(
	[Casualty_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Casualty_Class]    Script Date: 2021/12/25 22:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Casualty_Class](
	[Casualty_Class_ID] [int] NOT NULL,
	[CasualtyClassCode] [int] NULL,
	[CasualtyClassName] [nchar](50) NULL,
 CONSTRAINT [PK_Dim_Casualty_Class] PRIMARY KEY CLUSTERED 
(
	[Casualty_Class_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Casualty_Type]    Script Date: 2021/12/25 22:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Casualty_Type](
	[Casualty_Type_ID] [int] NOT NULL,
	[CasualtyTypeCode] [int] NULL,
	[CasualtyTypeName] [nchar](50) NULL,
 CONSTRAINT [PK_Dim_Casualty_Type] PRIMARY KEY CLUSTERED 
(
	[Casualty_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Date]    Script Date: 2021/12/25 22:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Date](
	[Date_ID] [int] IDENTITY(1,1) NOT NULL,
	[FullDate] [date] NOT NULL,
	[DayNumberOfWeek] [int] NOT NULL,
	[DayNameOfWeek] [nvarchar](50) NOT NULL,
	[DayNumberOfMonth] [int] NOT NULL,
	[MonthName] [nvarchar](50) NOT NULL,
	[MonthNumberOfYear] [int] NOT NULL,
	[CalendarQuarter] [int] NOT NULL,
	[CalendarYear] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Dim_Date2] PRIMARY KEY CLUSTERED 
(
	[Date_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Geography]    Script Date: 2021/12/25 22:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Geography](
	[Geography_ID] [int] IDENTITY(1,1) NOT NULL,
	[postcode] [char](50) NOT NULL,
	[easting] [int] NULL,
	[northing] [int] NULL,
	[latitude] [char](50) NULL,
	[longitude] [char](50) NULL,
	[city] [varchar](50) NULL,
	[county] [varchar](50) NULL,
	[country_code] [char](50) NULL,
	[country_name] [varchar](50) NULL,
	[region_code] [char](50) NULL,
	[region_name] [varchar](50) NULL,
	[StatusID] [int] NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Dim_Geography1] PRIMARY KEY CLUSTERED 
(
	[Geography_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Journey_Purpose]    Script Date: 2021/12/25 22:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Journey_Purpose](
	[Journey_Purpose_ID] [int] NOT NULL,
	[JourneyPurposeCode] [int] NULL,
	[JourneyPurposeName] [nchar](50) NULL,
 CONSTRAINT [PK_Dim_Jouney_Purpose] PRIMARY KEY CLUSTERED 
(
	[Journey_Purpose_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Light_Condition]    Script Date: 2021/12/25 22:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Light_Condition](
	[Light_Condition_ID] [int] NOT NULL,
	[LightConditionCode] [int] NULL,
	[LightConditionName] [nchar](50) NULL,
 CONSTRAINT [PK_Dim_Light_Condition] PRIMARY KEY CLUSTERED 
(
	[Light_Condition_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Local_Authority_District]    Script Date: 2021/12/25 22:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Local_Authority_District](
	[Local_Authority_District_ID] [int] NOT NULL,
	[LocalAuthorityDistrictCode] [int] NULL,
	[LocalAuthorityDistrictName] [nchar](50) NULL,
 CONSTRAINT [PK_Dim_Local_Authority_District] PRIMARY KEY CLUSTERED 
(
	[Local_Authority_District_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Road_Surface_Condition]    Script Date: 2021/12/25 22:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Road_Surface_Condition](
	[Road_Surface_Condition_ID] [int] NOT NULL,
	[RoadSurfaceConditionCode] [int] NULL,
	[RoadSurfaceConditionName] [nchar](50) NULL,
 CONSTRAINT [PK_Dim_Road_Surface_Condition] PRIMARY KEY CLUSTERED 
(
	[Road_Surface_Condition_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Road_Type]    Script Date: 2021/12/25 22:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Road_Type](
	[Road_Type_ID] [int] NOT NULL,
	[RoadTypeCode] [int] NULL,
	[RoadTypeName] [nchar](100) NULL,
 CONSTRAINT [PK_Dim_Road_Type] PRIMARY KEY CLUSTERED 
(
	[Road_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Severity]    Script Date: 2021/12/25 22:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Severity](
	[Severity_ID] [int] NOT NULL,
	[SeverityCode] [int] NULL,
	[SeverityName] [nchar](100) NULL,
 CONSTRAINT [PK_Dim_Sevetiry] PRIMARY KEY CLUSTERED 
(
	[Severity_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Sex_of_Person]    Script Date: 2021/12/25 22:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Sex_of_Person](
	[Sex_of_Person_ID] [int] NOT NULL,
	[SexOfPersonCode] [int] NULL,
	[SexOfPersonName] [nchar](50) NULL,
 CONSTRAINT [PK_Dim_Sex_of_Person] PRIMARY KEY CLUSTERED 
(
	[Sex_of_Person_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Special_Condition_at_Site]    Script Date: 2021/12/25 22:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Special_Condition_at_Site](
	[Special_Condition_at_Site_ID] [int] NOT NULL,
	[SpecialConditiontAtSiteCode] [int] NULL,
	[SpecialConditiontAtSiteName] [nchar](50) NULL,
 CONSTRAINT [PK_Dim_Special_Condition_at_Site] PRIMARY KEY CLUSTERED 
(
	[Special_Condition_at_Site_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Time]    Script Date: 2021/12/25 22:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Time](
	[Time_ID] [int] IDENTITY(1,1) NOT NULL,
	[Time_in_Day] [nchar](50) NULL,
	[Session_ID] [int] NULL,
	[Session_Name] [nchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Dim_Time2] PRIMARY KEY CLUSTERED 
(
	[Time_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Urban_Rural]    Script Date: 2021/12/25 22:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Urban_Rural](
	[Urban_Rural_ID] [int] NOT NULL,
	[UrbanRuralCode] [int] NULL,
	[UrbanRuralName] [nchar](100) NULL,
 CONSTRAINT [PK_Dim_Urban_Rural] PRIMARY KEY CLUSTERED 
(
	[Urban_Rural_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Vehicle]    Script Date: 2021/12/25 22:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Vehicle](
	[Vehicle_ID] [int] NOT NULL,
	[Accident_Index] [char](50) NOT NULL,
	[Vehicle_Reference] [int] NULL,
	[Vehicle_Type] [int] NULL,
	[Sex_of_Driver] [int] NULL,
	[Age_of_Driver] [int] NULL,
	[Age_Group] [int] NULL,
	[Age_Band_of_Driver] [int] NULL,
	[Journey_Purpose] [int] NULL,
	[Accident_ID] [int] NULL,
	[StatusID] [int] NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Dim_Vehicle] PRIMARY KEY CLUSTERED 
(
	[Vehicle_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Vehicle_Type]    Script Date: 2021/12/25 22:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Vehicle_Type](
	[Vehicle_Type_ID] [int] NOT NULL,
	[VehicleTypeCode] [int] NULL,
	[VehicleTypeName] [nchar](50) NULL,
 CONSTRAINT [PK_Dim_Vehicle_Type] PRIMARY KEY CLUSTERED 
(
	[Vehicle_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Weather_Condition]    Script Date: 2021/12/25 22:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Weather_Condition](
	[Weather_Condition_ID] [int] NOT NULL,
	[WeatherConditionCode] [int] NULL,
	[WeatherConditionName] [nchar](50) NULL,
 CONSTRAINT [PK_Dim_Weather_Condition] PRIMARY KEY CLUSTERED 
(
	[Weather_Condition_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_Accident]    Script Date: 2021/12/25 22:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Accident](
	[Fact_Accident_ID] [int] IDENTITY(1,1) NOT NULL,
	[Accident_ID] [int] NOT NULL,
	[Vehicle_ID] [int] NULL,
	[Time_ID] [int] NULL,
	[Date_ID] [int] NULL,
	[Geography_ID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Fact_Accident_Count1] PRIMARY KEY CLUSTERED 
(
	[Fact_Accident_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_Casualty]    Script Date: 2021/12/25 22:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Casualty](
	[Fact_Casualty_ID] [int] IDENTITY(1,1) NOT NULL,
	[Casualty_ID] [int] NOT NULL,
	[Vehicle_ID] [int] NULL,
	[Accident_ID] [int] NULL,
	[Age_ID] [int] NULL,
	[Date_ID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Fact_Casualty2] PRIMARY KEY CLUSTERED 
(
	[Fact_Casualty_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_Variance]    Script Date: 2021/12/25 22:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Variance](
	[Fact_Variance_ID] [int] NOT NULL,
	[Accident_ID] [int] NULL,
	[Count_in_Last_Year] [int] NULL,
	[Count_in_This_Year] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Fact_Variance] PRIMARY KEY CLUSTERED 
(
	[Fact_Variance_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Dim_Accident]  WITH CHECK ADD  CONSTRAINT [FK_Accident_DDS_Built_up_Road_Type] FOREIGN KEY([Built_up_Road_Type])
REFERENCES [dbo].[Dim_Built_up_Road_Type] ([Built_up_Road_Type_ID])
GO
ALTER TABLE [dbo].[Dim_Accident] CHECK CONSTRAINT [FK_Accident_DDS_Built_up_Road_Type]
GO
ALTER TABLE [dbo].[Dim_Accident]  WITH CHECK ADD  CONSTRAINT [FK_Accident_DDS_Carriageway_Hazard] FOREIGN KEY([Carriageway_Hazard])
REFERENCES [dbo].[DIm_Carriageway_Hazard] ([Carriageway_Hazard_ID])
GO
ALTER TABLE [dbo].[Dim_Accident] CHECK CONSTRAINT [FK_Accident_DDS_Carriageway_Hazard]
GO
ALTER TABLE [dbo].[Dim_Accident]  WITH CHECK ADD  CONSTRAINT [FK_Accident_DDS_Light_Condition] FOREIGN KEY([Light_Condition])
REFERENCES [dbo].[Dim_Light_Condition] ([Light_Condition_ID])
GO
ALTER TABLE [dbo].[Dim_Accident] CHECK CONSTRAINT [FK_Accident_DDS_Light_Condition]
GO
ALTER TABLE [dbo].[Dim_Accident]  WITH CHECK ADD  CONSTRAINT [FK_Accident_DDS_Local_Authority_District] FOREIGN KEY([Local_Authority_District])
REFERENCES [dbo].[Dim_Local_Authority_District] ([Local_Authority_District_ID])
GO
ALTER TABLE [dbo].[Dim_Accident] CHECK CONSTRAINT [FK_Accident_DDS_Local_Authority_District]
GO
ALTER TABLE [dbo].[Dim_Accident]  WITH CHECK ADD  CONSTRAINT [FK_Accident_DDS_Road_Surface_Condition] FOREIGN KEY([Road_Surface_Condition])
REFERENCES [dbo].[Dim_Road_Surface_Condition] ([Road_Surface_Condition_ID])
GO
ALTER TABLE [dbo].[Dim_Accident] CHECK CONSTRAINT [FK_Accident_DDS_Road_Surface_Condition]
GO
ALTER TABLE [dbo].[Dim_Accident]  WITH CHECK ADD  CONSTRAINT [FK_Accident_DDS_Road_Type] FOREIGN KEY([Road_Type])
REFERENCES [dbo].[Dim_Road_Type] ([Road_Type_ID])
GO
ALTER TABLE [dbo].[Dim_Accident] CHECK CONSTRAINT [FK_Accident_DDS_Road_Type]
GO
ALTER TABLE [dbo].[Dim_Accident]  WITH CHECK ADD  CONSTRAINT [FK_Accident_DDS_Severity] FOREIGN KEY([Accident_Severity])
REFERENCES [dbo].[Dim_Severity] ([Severity_ID])
GO
ALTER TABLE [dbo].[Dim_Accident] CHECK CONSTRAINT [FK_Accident_DDS_Severity]
GO
ALTER TABLE [dbo].[Dim_Accident]  WITH CHECK ADD  CONSTRAINT [FK_Accident_DDS_Urban_or_Rural_Area] FOREIGN KEY([Urban_or_Rural_Area])
REFERENCES [dbo].[Dim_Urban_Rural] ([Urban_Rural_ID])
GO
ALTER TABLE [dbo].[Dim_Accident] CHECK CONSTRAINT [FK_Accident_DDS_Urban_or_Rural_Area]
GO
ALTER TABLE [dbo].[Dim_Accident]  WITH CHECK ADD  CONSTRAINT [FK_Accident_DDS_Weather_Condition] FOREIGN KEY([Weather_Condition])
REFERENCES [dbo].[Dim_Weather_Condition] ([Weather_Condition_ID])
GO
ALTER TABLE [dbo].[Dim_Accident] CHECK CONSTRAINT [FK_Accident_DDS_Weather_Condition]
GO
ALTER TABLE [dbo].[Dim_Accident]  WITH CHECK ADD  CONSTRAINT [FK_Accidentv_Special_Condition_at_Site] FOREIGN KEY([Special_Condition_at_Site])
REFERENCES [dbo].[Dim_Special_Condition_at_Site] ([Special_Condition_at_Site_ID])
GO
ALTER TABLE [dbo].[Dim_Accident] CHECK CONSTRAINT [FK_Accidentv_Special_Condition_at_Site]
GO
ALTER TABLE [dbo].[Dim_Casualty]  WITH CHECK ADD  CONSTRAINT [FK_Casualty_DDS_Accident] FOREIGN KEY([Accident_ID])
REFERENCES [dbo].[Dim_Accident] ([Accident_ID])
GO
ALTER TABLE [dbo].[Dim_Casualty] CHECK CONSTRAINT [FK_Casualty_DDS_Accident]
GO
ALTER TABLE [dbo].[Dim_Casualty]  WITH CHECK ADD  CONSTRAINT [FK_Casualty_DDS_Casualty_Class] FOREIGN KEY([Casualty_Class])
REFERENCES [dbo].[Dim_Casualty_Class] ([Casualty_Class_ID])
GO
ALTER TABLE [dbo].[Dim_Casualty] CHECK CONSTRAINT [FK_Casualty_DDS_Casualty_Class]
GO
ALTER TABLE [dbo].[Dim_Casualty]  WITH CHECK ADD  CONSTRAINT [FK_Casualty_DDS_Casualty_Severity] FOREIGN KEY([Casualty_Severity])
REFERENCES [dbo].[Dim_Severity] ([Severity_ID])
GO
ALTER TABLE [dbo].[Dim_Casualty] CHECK CONSTRAINT [FK_Casualty_DDS_Casualty_Severity]
GO
ALTER TABLE [dbo].[Dim_Casualty]  WITH CHECK ADD  CONSTRAINT [FK_Casualty_DDS_Casualty_Type] FOREIGN KEY([Casualty_Type])
REFERENCES [dbo].[Dim_Casualty_Type] ([Casualty_Type_ID])
GO
ALTER TABLE [dbo].[Dim_Casualty] CHECK CONSTRAINT [FK_Casualty_DDS_Casualty_Type]
GO
ALTER TABLE [dbo].[Dim_Casualty]  WITH CHECK ADD  CONSTRAINT [FK_Casualty_DDS_Sex_of_Casualty] FOREIGN KEY([Sex_of_Casualty])
REFERENCES [dbo].[Dim_Sex_of_Person] ([Sex_of_Person_ID])
GO
ALTER TABLE [dbo].[Dim_Casualty] CHECK CONSTRAINT [FK_Casualty_DDS_Sex_of_Casualty]
GO
ALTER TABLE [dbo].[Dim_Casualty]  WITH CHECK ADD  CONSTRAINT [FK_Casualty_DDS_Vehicle] FOREIGN KEY([Vehicle_ID])
REFERENCES [dbo].[Dim_Vehicle] ([Vehicle_ID])
GO
ALTER TABLE [dbo].[Dim_Casualty] CHECK CONSTRAINT [FK_Casualty_DDS_Vehicle]
GO
ALTER TABLE [dbo].[Dim_Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_DDS_Accident] FOREIGN KEY([Accident_ID])
REFERENCES [dbo].[Dim_Accident] ([Accident_ID])
GO
ALTER TABLE [dbo].[Dim_Vehicle] CHECK CONSTRAINT [FK_Vehicle_DDS_Accident]
GO
ALTER TABLE [dbo].[Dim_Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_DDS_Journey_Purpose] FOREIGN KEY([Journey_Purpose])
REFERENCES [dbo].[Dim_Journey_Purpose] ([Journey_Purpose_ID])
GO
ALTER TABLE [dbo].[Dim_Vehicle] CHECK CONSTRAINT [FK_Vehicle_DDS_Journey_Purpose]
GO
ALTER TABLE [dbo].[Dim_Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_DDS_Sex_of_Driver] FOREIGN KEY([Sex_of_Driver])
REFERENCES [dbo].[Dim_Sex_of_Person] ([Sex_of_Person_ID])
GO
ALTER TABLE [dbo].[Dim_Vehicle] CHECK CONSTRAINT [FK_Vehicle_DDS_Sex_of_Driver]
GO
ALTER TABLE [dbo].[Dim_Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_DDS_Vehicle_Type] FOREIGN KEY([Vehicle_Type])
REFERENCES [dbo].[Dim_Vehicle_Type] ([Vehicle_Type_ID])
GO
ALTER TABLE [dbo].[Dim_Vehicle] CHECK CONSTRAINT [FK_Vehicle_DDS_Vehicle_Type]
GO
ALTER TABLE [dbo].[Fact_Accident]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Accident_Accident] FOREIGN KEY([Accident_ID])
REFERENCES [dbo].[Dim_Accident] ([Accident_ID])
GO
ALTER TABLE [dbo].[Fact_Accident] CHECK CONSTRAINT [FK_Fact_Accident_Accident]
GO
ALTER TABLE [dbo].[Fact_Accident]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Accident_Date] FOREIGN KEY([Date_ID])
REFERENCES [dbo].[Dim_Date] ([Date_ID])
GO
ALTER TABLE [dbo].[Fact_Accident] CHECK CONSTRAINT [FK_Fact_Accident_Date]
GO
ALTER TABLE [dbo].[Fact_Accident]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Accident_Geography] FOREIGN KEY([Geography_ID])
REFERENCES [dbo].[Dim_Geography] ([Geography_ID])
GO
ALTER TABLE [dbo].[Fact_Accident] CHECK CONSTRAINT [FK_Fact_Accident_Geography]
GO
ALTER TABLE [dbo].[Fact_Accident]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Accident_Time] FOREIGN KEY([Time_ID])
REFERENCES [dbo].[Dim_Time] ([Time_ID])
GO
ALTER TABLE [dbo].[Fact_Accident] CHECK CONSTRAINT [FK_Fact_Accident_Time]
GO
ALTER TABLE [dbo].[Fact_Accident]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Accident_Vehicle] FOREIGN KEY([Vehicle_ID])
REFERENCES [dbo].[Dim_Vehicle] ([Vehicle_ID])
GO
ALTER TABLE [dbo].[Fact_Accident] CHECK CONSTRAINT [FK_Fact_Accident_Vehicle]
GO
ALTER TABLE [dbo].[Fact_Casualty]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Casualty_Accident] FOREIGN KEY([Accident_ID])
REFERENCES [dbo].[Dim_Accident] ([Accident_ID])
GO
ALTER TABLE [dbo].[Fact_Casualty] CHECK CONSTRAINT [FK_Fact_Casualty_Accident]
GO
ALTER TABLE [dbo].[Fact_Casualty]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Casualty_Age] FOREIGN KEY([Age_ID])
REFERENCES [dbo].[Dim_Age] ([Age_ID])
GO
ALTER TABLE [dbo].[Fact_Casualty] CHECK CONSTRAINT [FK_Fact_Casualty_Age]
GO
ALTER TABLE [dbo].[Fact_Casualty]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Casualty_Casualty] FOREIGN KEY([Casualty_ID])
REFERENCES [dbo].[Dim_Casualty] ([Casualty_ID])
GO
ALTER TABLE [dbo].[Fact_Casualty] CHECK CONSTRAINT [FK_Fact_Casualty_Casualty]
GO
ALTER TABLE [dbo].[Fact_Casualty]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Casualty_Date] FOREIGN KEY([Date_ID])
REFERENCES [dbo].[Dim_Date] ([Date_ID])
GO
ALTER TABLE [dbo].[Fact_Casualty] CHECK CONSTRAINT [FK_Fact_Casualty_Date]
GO
ALTER TABLE [dbo].[Fact_Casualty]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Casualty_Vehicle] FOREIGN KEY([Vehicle_ID])
REFERENCES [dbo].[Dim_Vehicle] ([Vehicle_ID])
GO
ALTER TABLE [dbo].[Fact_Casualty] CHECK CONSTRAINT [FK_Fact_Casualty_Vehicle]
