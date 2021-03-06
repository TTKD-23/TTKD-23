CREATE DATABASE [TTKD_23_NDS]
GO
USE [TTKD_23_NDS]
GO
/****** Object:  UserDefinedFunction [dbo].[getAgeGroupFromAge]    Script Date: 2021/12/25 21:59:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getAgeGroupFromAge]
 (
	@Age AS INT
 )
RETURNS @ReturnTable TABLE 
            ([Age_Group_ID] int PRIMARY KEY NOT NULL, 
            [code] int NULL, 
            [label] nchar(100) NULL, 
            [start_age] int NULL, 
            [end_age] int NULL)
AS
BEGIN
	DECLARE @Code int
	SET @Code = (select top(1) [code] from [TTKD_23_NDS].[dbo].[Age_Group_NDS] as a where @Age >= a.[start_age] and @Age <= a.[end_age])
	INSERT INTO @ReturnTable 
		select top(1) a.[Age_Group_ID], a.[code], a.[label], a.[start_age], a.[end_age] from [TTKD_23_NDS].[dbo].[Age_Group_NDS] as a where a.[code] = @Code
	RETURN;
END
GO
/****** Object:  UserDefinedFunction [dbo].[getSessionInDayFromTime]    Script Date: 2021/12/25 21:59:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getSessionInDayFromTime]
 (
	@Time AS TIME
 )
RETURNS @ReturnTable TABLE 
            ([Session_in_Day_ID] int PRIMARY KEY NOT NULL, 
            [code] int NULL, 
            [label] nchar(100) NULL, 
            [start_time] time(7) NULL, 
            [end_time] time(7) NULL)
AS
BEGIN
	DECLARE @Code int
	SET @Code = (select top(1) [code] from [TTKD_23_NDS].[dbo].[Session_in_Day_NDS] as p where @Time >= p.[start_time] and @Time <= p.[end_time])
	IF @Code IS NULL
		BEGIN
			SET @Code = 4
		END
	INSERT INTO @ReturnTable 
		select top(1) p.[Session_in_Day_ID], p.[code], p.[label], p.[start_time], p.[end_time] from [TTKD_23_NDS].[dbo].[Session_in_Day_NDS] as p where p.[code] = @Code
	RETURN;
END
GO
/****** Object:  Table [dbo].[Accidents_NDS]    Script Date: 2021/12/25 21:59:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accidents_NDS](
	[Accident_ID] [int] IDENTITY(1,1) NOT NULL,
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
	[Local_Authority_Highway] [char](50) NULL,
	[Road_Type] [int] NULL,
	[Speed_limit] [int] NULL,
	[Built_up_Road_Type] [int] NULL,
	[Light_Condition] [int] NULL,
	[Weather_Condition] [int] NULL,
	[Road_Surface_Condition] [int] NULL,
	[Special_Condition_at_Site] [int] NULL,
	[Urban_or_Rural_Area] [int] NULL,
	[LSOA_of_Accident_Location] [char](50) NULL,
	[Geography_ID] [int] NULL,
	[StatusID] [int] NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[Carriageway_Hazard] [int] NULL,
 CONSTRAINT [PK_Accidents_NDS] PRIMARY KEY CLUSTERED 
(
	[Accident_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Age_Band_NDS]    Script Date: 2021/12/25 21:59:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Age_Band_NDS](
	[Age_Band_ID] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NULL,
	[label] [nchar](100) NULL,
 CONSTRAINT [PK_Age_Band_NDS] PRIMARY KEY CLUSTERED 
(
	[Age_Band_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Age_Group_NDS]    Script Date: 2021/12/25 21:59:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Age_Group_NDS](
	[Age_Group_ID] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NULL,
	[label] [nchar](100) NULL,
	[start_age] [int] NULL,
	[end_age] [int] NULL,
 CONSTRAINT [PK_Age_Group_NDS] PRIMARY KEY CLUSTERED 
(
	[Age_Group_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Built_up_Road_Type_NDS]    Script Date: 2021/12/25 21:59:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Built_up_Road_Type_NDS](
	[Built_up_Road_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NULL,
	[label] [nchar](100) NULL,
 CONSTRAINT [PK_Built_up_Road_Type_NDS] PRIMARY KEY CLUSTERED 
(
	[Built_up_Road_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carriageway_Hazard_NDS]    Script Date: 2021/12/25 21:59:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carriageway_Hazard_NDS](
	[Carriageway_Hazard_ID] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NULL,
	[label] [nchar](50) NULL,
 CONSTRAINT [PK_Carriageway_Hazard_NDS] PRIMARY KEY CLUSTERED 
(
	[Carriageway_Hazard_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Casualties_NDS]    Script Date: 2021/12/25 21:59:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Casualties_NDS](
	[Casualty_ID] [int] IDENTITY(1,1) NOT NULL,
	[Accident_Index] [char](50) NOT NULL,
	[Vehicle_Reference] [int] NULL,
	[Casualty_Reference] [int] NULL,
	[Casualty_Class] [int] NULL,
	[Sex_of_Casualty] [int] NULL,
	[Age_of_Casualty] [int] NULL,
	[Age_Group] [int] NULL,
	[Age_Band_of_Casualty] [int] NULL,
	[Casualty_Severity] [int] NULL,
	[Casualty_Type] [int] NULL,
	[Casualty_Home_Area_Type] [int] NULL,
	[StatusID] [int] NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[Vehicle_ID] [int] NULL,
	[Accident_ID] [int] NULL,
 CONSTRAINT [PK_Casualties_NDS] PRIMARY KEY CLUSTERED 
(
	[Casualty_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Casualty_Class_NDS]    Script Date: 2021/12/25 21:59:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Casualty_Class_NDS](
	[Casualty_Class_ID] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NULL,
	[label] [nchar](50) NULL,
 CONSTRAINT [PK_Casualty_Class_NDS] PRIMARY KEY CLUSTERED 
(
	[Casualty_Class_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Casualty_Type_NDS]    Script Date: 2021/12/25 21:59:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Casualty_Type_NDS](
	[Casualty_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NULL,
	[label] [nchar](100) NULL,
 CONSTRAINT [PK_Casualty_Type_NDS] PRIMARY KEY CLUSTERED 
(
	[Casualty_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Day_of_week_NDS]    Script Date: 2021/12/25 21:59:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Day_of_week_NDS](
	[Day_of_week_ID] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NULL,
	[label] [nchar](100) NULL,
 CONSTRAINT [PK_Day_of_week_NDS] PRIMARY KEY CLUSTERED 
(
	[Day_of_week_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Geography_NDS]    Script Date: 2021/12/25 21:59:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Geography_NDS](
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
	[iso3166-2] [varchar](50) NULL,
	[region_code] [char](50) NULL,
	[region_name] [varchar](50) NULL,
	[StatusID] [int] NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Geography_NDS] PRIMARY KEY CLUSTERED 
(
	[Geography_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Journey_Purpose_NDS]    Script Date: 2021/12/25 21:59:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Journey_Purpose_NDS](
	[Journey_Purpose_ID] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NULL,
	[label] [nchar](100) NULL,
 CONSTRAINT [PK_Journey_Purpose_NDS] PRIMARY KEY CLUSTERED 
(
	[Journey_Purpose_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Light_Condition_NDS]    Script Date: 2021/12/25 21:59:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Light_Condition_NDS](
	[Light_Condition_ID] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NULL,
	[label] [nchar](50) NULL,
 CONSTRAINT [PK_Light_Condition_NDS] PRIMARY KEY CLUSTERED 
(
	[Light_Condition_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Local_Authority_District_NDS]    Script Date: 2021/12/25 21:59:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Local_Authority_District_NDS](
	[Local_Authority_District_ID] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NULL,
	[label] [nchar](100) NULL,
 CONSTRAINT [PK_Local_Authority_District_NDS] PRIMARY KEY CLUSTERED 
(
	[Local_Authority_District_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Road_Surface_Condition_NDS]    Script Date: 2021/12/25 21:59:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Road_Surface_Condition_NDS](
	[Road_Surface_Condition_ID] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NOT NULL,
	[label] [nchar](50) NULL,
 CONSTRAINT [PK_Road_Surface_Condition_NDS] PRIMARY KEY CLUSTERED 
(
	[Road_Surface_Condition_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Road_Type_NDS]    Script Date: 2021/12/25 21:59:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Road_Type_NDS](
	[Road_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NULL,
	[label] [nchar](100) NULL,
 CONSTRAINT [PK_Road_Type_NDS] PRIMARY KEY CLUSTERED 
(
	[Road_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session_in_Day_NDS]    Script Date: 2021/12/25 21:59:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session_in_Day_NDS](
	[Session_in_Day_ID] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NULL,
	[label] [nchar](100) NULL,
	[start_time] [time](7) NULL,
	[end_time] [time](7) NULL,
 CONSTRAINT [PK_Session_in_Day_NDS] PRIMARY KEY CLUSTERED 
(
	[Session_in_Day_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Severity_NDS]    Script Date: 2021/12/25 21:59:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Severity_NDS](
	[Severity_ID] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NULL,
	[label] [nchar](100) NULL,
 CONSTRAINT [PK_Severity_NDS] PRIMARY KEY CLUSTERED 
(
	[Severity_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sex_of_Person_NDS]    Script Date: 2021/12/25 21:59:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sex_of_Person_NDS](
	[Sex_of_Person_ID] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NULL,
	[label] [nchar](100) NULL,
 CONSTRAINT [PK_Sex_of_Person_NDS] PRIMARY KEY CLUSTERED 
(
	[Sex_of_Person_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Source_NDS]    Script Date: 2021/12/25 21:59:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Source_NDS](
	[Source_ID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Source_NDS] PRIMARY KEY CLUSTERED 
(
	[Source_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Special_Condition_at_Site_NDS]    Script Date: 2021/12/25 21:59:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Special_Condition_at_Site_NDS](
	[Special_Condition_at_Site_ID] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NULL,
	[label] [nchar](50) NULL,
 CONSTRAINT [PK_Special_Conditions_at_Site_NDS] PRIMARY KEY CLUSTERED 
(
	[Special_Condition_at_Site_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status_NDS]    Script Date: 2021/12/25 21:59:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status_NDS](
	[Status_ID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Status_NDS] PRIMARY KEY CLUSTERED 
(
	[Status_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urban_Rural_NDS]    Script Date: 2021/12/25 21:59:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urban_Rural_NDS](
	[Urban_Rural_ID] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NULL,
	[label] [nchar](100) NULL,
 CONSTRAINT [PK_Urban_Rural_NDS] PRIMARY KEY CLUSTERED 
(
	[Urban_Rural_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicle_Type_NDS]    Script Date: 2021/12/25 21:59:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle_Type_NDS](
	[Vehicle_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NULL,
	[label] [nchar](100) NULL,
 CONSTRAINT [PK_Vehicle_Type_NDS] PRIMARY KEY CLUSTERED 
(
	[Vehicle_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicles_NDS]    Script Date: 2021/12/25 21:59:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicles_NDS](
	[Vehicle_ID] [int] IDENTITY(1,1) NOT NULL,
	[Accident_Index] [char](50) NOT NULL,
	[Vehicle_Reference] [int] NULL,
	[Vehicle_Type] [int] NULL,
	[Vehicle_Manoeuvre] [int] NULL,
	[Hit_Object_in_Carriageway] [int] NULL,
	[1st_Point_of_Impact] [int] NULL,
	[Was_Vehicle_Left_Hand_Drive?] [int] NULL,
	[Sex_of_Driver] [int] NULL,
	[Age_of_Driver] [int] NULL,
	[Age_Group] [int] NULL,
	[Age_Band_of_Driver] [int] NULL,
	[Journey_Purpose] [int] NULL,
	[Propulsion_Code] [int] NULL,
	[Driver_IMD_Decile] [int] NULL,
	[Accident_ID] [int] NULL,
	[StatusID] [int] NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Vehicles_NDS] PRIMARY KEY CLUSTERED 
(
	[Vehicle_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Weather_Condition_NDS]    Script Date: 2021/12/25 21:59:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Weather_Condition_NDS](
	[Weather_Condition_ID] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NULL,
	[label] [nchar](50) NULL,
 CONSTRAINT [PK_Weather_Condition_NDS] PRIMARY KEY CLUSTERED 
(
	[Weather_Condition_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accidents_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Accidents_NDS_Accident_Severity] FOREIGN KEY([Accident_Severity])
REFERENCES [dbo].[Severity_NDS] ([Severity_ID])
GO
ALTER TABLE [dbo].[Accidents_NDS] CHECK CONSTRAINT [FK_Accidents_NDS_Accident_Severity]
GO
ALTER TABLE [dbo].[Accidents_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Accidents_NDS_Built_up_Road_Type] FOREIGN KEY([Built_up_Road_Type])
REFERENCES [dbo].[Built_up_Road_Type_NDS] ([Built_up_Road_Type_ID])
GO
ALTER TABLE [dbo].[Accidents_NDS] CHECK CONSTRAINT [FK_Accidents_NDS_Built_up_Road_Type]
GO
ALTER TABLE [dbo].[Accidents_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Accidents_NDS_Carriageway_Hazard] FOREIGN KEY([Carriageway_Hazard])
REFERENCES [dbo].[Carriageway_Hazard_NDS] ([Carriageway_Hazard_ID])
GO
ALTER TABLE [dbo].[Accidents_NDS] CHECK CONSTRAINT [FK_Accidents_NDS_Carriageway_Hazard]
GO
ALTER TABLE [dbo].[Accidents_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Accidents_NDS_Day_of_week] FOREIGN KEY([Day_of_Week])
REFERENCES [dbo].[Day_of_week_NDS] ([Day_of_week_ID])
GO
ALTER TABLE [dbo].[Accidents_NDS] CHECK CONSTRAINT [FK_Accidents_NDS_Day_of_week]
GO
ALTER TABLE [dbo].[Accidents_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Accidents_NDS_Geography] FOREIGN KEY([Geography_ID])
REFERENCES [dbo].[Geography_NDS] ([Geography_ID])
GO
ALTER TABLE [dbo].[Accidents_NDS] CHECK CONSTRAINT [FK_Accidents_NDS_Geography]
GO
ALTER TABLE [dbo].[Accidents_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Accidents_NDS_Light_Condition] FOREIGN KEY([Light_Condition])
REFERENCES [dbo].[Light_Condition_NDS] ([Light_Condition_ID])
GO
ALTER TABLE [dbo].[Accidents_NDS] CHECK CONSTRAINT [FK_Accidents_NDS_Light_Condition]
GO
ALTER TABLE [dbo].[Accidents_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Accidents_NDS_Local_Authority_District] FOREIGN KEY([Local_Authority_District])
REFERENCES [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID])
GO
ALTER TABLE [dbo].[Accidents_NDS] CHECK CONSTRAINT [FK_Accidents_NDS_Local_Authority_District]
GO
ALTER TABLE [dbo].[Accidents_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Accidents_NDS_Road_Surface_Condition] FOREIGN KEY([Road_Surface_Condition])
REFERENCES [dbo].[Road_Surface_Condition_NDS] ([Road_Surface_Condition_ID])
GO
ALTER TABLE [dbo].[Accidents_NDS] CHECK CONSTRAINT [FK_Accidents_NDS_Road_Surface_Condition]
GO
ALTER TABLE [dbo].[Accidents_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Accidents_NDS_Road_Type] FOREIGN KEY([Road_Type])
REFERENCES [dbo].[Road_Type_NDS] ([Road_Type_ID])
GO
ALTER TABLE [dbo].[Accidents_NDS] CHECK CONSTRAINT [FK_Accidents_NDS_Road_Type]
GO
ALTER TABLE [dbo].[Accidents_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Accidents_NDS_Session_in_day] FOREIGN KEY([Session_in_Day])
REFERENCES [dbo].[Session_in_Day_NDS] ([Session_in_Day_ID])
GO
ALTER TABLE [dbo].[Accidents_NDS] CHECK CONSTRAINT [FK_Accidents_NDS_Session_in_day]
GO
ALTER TABLE [dbo].[Accidents_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Accidents_NDS_Source_ID] FOREIGN KEY([SourceID])
REFERENCES [dbo].[Source_NDS] ([Source_ID])
GO
ALTER TABLE [dbo].[Accidents_NDS] CHECK CONSTRAINT [FK_Accidents_NDS_Source_ID]
GO
ALTER TABLE [dbo].[Accidents_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Accidents_NDS_Special_Condition_at_Site] FOREIGN KEY([Special_Condition_at_Site])
REFERENCES [dbo].[Special_Condition_at_Site_NDS] ([Special_Condition_at_Site_ID])
GO
ALTER TABLE [dbo].[Accidents_NDS] CHECK CONSTRAINT [FK_Accidents_NDS_Special_Condition_at_Site]
GO
ALTER TABLE [dbo].[Accidents_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Accidents_NDS_Status_ID] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status_NDS] ([Status_ID])
GO
ALTER TABLE [dbo].[Accidents_NDS] CHECK CONSTRAINT [FK_Accidents_NDS_Status_ID]
GO
ALTER TABLE [dbo].[Accidents_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Accidents_NDS_Urban_or_Rural_Area] FOREIGN KEY([Urban_or_Rural_Area])
REFERENCES [dbo].[Urban_Rural_NDS] ([Urban_Rural_ID])
GO
ALTER TABLE [dbo].[Accidents_NDS] CHECK CONSTRAINT [FK_Accidents_NDS_Urban_or_Rural_Area]
GO
ALTER TABLE [dbo].[Accidents_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Accidents_NDS_Weather_Condition] FOREIGN KEY([Weather_Condition])
REFERENCES [dbo].[Weather_Condition_NDS] ([Weather_Condition_ID])
GO
ALTER TABLE [dbo].[Accidents_NDS] CHECK CONSTRAINT [FK_Accidents_NDS_Weather_Condition]
GO
ALTER TABLE [dbo].[Casualties_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Casualties_NDS_Accident] FOREIGN KEY([Accident_ID])
REFERENCES [dbo].[Accidents_NDS] ([Accident_ID])
GO
ALTER TABLE [dbo].[Casualties_NDS] CHECK CONSTRAINT [FK_Casualties_NDS_Accident]
GO
ALTER TABLE [dbo].[Casualties_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Casualties_NDS_Age_Band_of_Casualty] FOREIGN KEY([Age_Band_of_Casualty])
REFERENCES [dbo].[Age_Band_NDS] ([Age_Band_ID])
GO
ALTER TABLE [dbo].[Casualties_NDS] CHECK CONSTRAINT [FK_Casualties_NDS_Age_Band_of_Casualty]
GO
ALTER TABLE [dbo].[Casualties_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Casualties_NDS_Age_Group] FOREIGN KEY([Age_Group])
REFERENCES [dbo].[Age_Group_NDS] ([Age_Group_ID])
GO
ALTER TABLE [dbo].[Casualties_NDS] CHECK CONSTRAINT [FK_Casualties_NDS_Age_Group]
GO
ALTER TABLE [dbo].[Casualties_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Casualties_NDS_Casualty_Class] FOREIGN KEY([Casualty_Class])
REFERENCES [dbo].[Casualty_Class_NDS] ([Casualty_Class_ID])
GO
ALTER TABLE [dbo].[Casualties_NDS] CHECK CONSTRAINT [FK_Casualties_NDS_Casualty_Class]
GO
ALTER TABLE [dbo].[Casualties_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Casualties_NDS_Casualty_Severity] FOREIGN KEY([Casualty_Severity])
REFERENCES [dbo].[Severity_NDS] ([Severity_ID])
GO
ALTER TABLE [dbo].[Casualties_NDS] CHECK CONSTRAINT [FK_Casualties_NDS_Casualty_Severity]
GO
ALTER TABLE [dbo].[Casualties_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Casualties_NDS_Casualty_Type] FOREIGN KEY([Casualty_Type])
REFERENCES [dbo].[Casualty_Type_NDS] ([Casualty_Type_ID])
GO
ALTER TABLE [dbo].[Casualties_NDS] CHECK CONSTRAINT [FK_Casualties_NDS_Casualty_Type]
GO
ALTER TABLE [dbo].[Casualties_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Casualties_NDS_Sex_of_Casualty] FOREIGN KEY([Sex_of_Casualty])
REFERENCES [dbo].[Sex_of_Person_NDS] ([Sex_of_Person_ID])
GO
ALTER TABLE [dbo].[Casualties_NDS] CHECK CONSTRAINT [FK_Casualties_NDS_Sex_of_Casualty]
GO
ALTER TABLE [dbo].[Casualties_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Casualties_NDS_Source_ID] FOREIGN KEY([SourceID])
REFERENCES [dbo].[Source_NDS] ([Source_ID])
GO
ALTER TABLE [dbo].[Casualties_NDS] CHECK CONSTRAINT [FK_Casualties_NDS_Source_ID]
GO
ALTER TABLE [dbo].[Casualties_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Casualties_NDS_Status_ID] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status_NDS] ([Status_ID])
GO
ALTER TABLE [dbo].[Casualties_NDS] CHECK CONSTRAINT [FK_Casualties_NDS_Status_ID]
GO
ALTER TABLE [dbo].[Casualties_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Casualties_NDS_Vehicle] FOREIGN KEY([Vehicle_ID])
REFERENCES [dbo].[Vehicles_NDS] ([Vehicle_ID])
GO
ALTER TABLE [dbo].[Casualties_NDS] CHECK CONSTRAINT [FK_Casualties_NDS_Vehicle]
GO
ALTER TABLE [dbo].[Geography_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Geography_NDS_Source_ID] FOREIGN KEY([SourceID])
REFERENCES [dbo].[Source_NDS] ([Source_ID])
GO
ALTER TABLE [dbo].[Geography_NDS] CHECK CONSTRAINT [FK_Geography_NDS_Source_ID]
GO
ALTER TABLE [dbo].[Geography_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Geography_NDS_Status_ID] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status_NDS] ([Status_ID])
GO
ALTER TABLE [dbo].[Geography_NDS] CHECK CONSTRAINT [FK_Geography_NDS_Status_ID]
GO
ALTER TABLE [dbo].[Vehicles_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Vehicles_NDS_Accident] FOREIGN KEY([Accident_ID])
REFERENCES [dbo].[Accidents_NDS] ([Accident_ID])
GO
ALTER TABLE [dbo].[Vehicles_NDS] CHECK CONSTRAINT [FK_Vehicles_NDS_Accident]
GO
ALTER TABLE [dbo].[Vehicles_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Vehicles_NDS_Age_Band_of_Driver] FOREIGN KEY([Age_Band_of_Driver])
REFERENCES [dbo].[Age_Band_NDS] ([Age_Band_ID])
GO
ALTER TABLE [dbo].[Vehicles_NDS] CHECK CONSTRAINT [FK_Vehicles_NDS_Age_Band_of_Driver]
GO
ALTER TABLE [dbo].[Vehicles_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Vehicles_NDS_Age_Group] FOREIGN KEY([Age_Group])
REFERENCES [dbo].[Age_Group_NDS] ([Age_Group_ID])
GO
ALTER TABLE [dbo].[Vehicles_NDS] CHECK CONSTRAINT [FK_Vehicles_NDS_Age_Group]
GO
ALTER TABLE [dbo].[Vehicles_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Vehicles_NDS_Journey_Purpose] FOREIGN KEY([Journey_Purpose])
REFERENCES [dbo].[Journey_Purpose_NDS] ([Journey_Purpose_ID])
GO
ALTER TABLE [dbo].[Vehicles_NDS] CHECK CONSTRAINT [FK_Vehicles_NDS_Journey_Purpose]
GO
ALTER TABLE [dbo].[Vehicles_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Vehicles_NDS_Sex_of_Driver] FOREIGN KEY([Sex_of_Driver])
REFERENCES [dbo].[Sex_of_Person_NDS] ([Sex_of_Person_ID])
GO
ALTER TABLE [dbo].[Vehicles_NDS] CHECK CONSTRAINT [FK_Vehicles_NDS_Sex_of_Driver]
GO
ALTER TABLE [dbo].[Vehicles_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Vehicles_NDS_Source_ID] FOREIGN KEY([SourceID])
REFERENCES [dbo].[Source_NDS] ([Source_ID])
GO
ALTER TABLE [dbo].[Vehicles_NDS] CHECK CONSTRAINT [FK_Vehicles_NDS_Source_ID]
GO
ALTER TABLE [dbo].[Vehicles_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Vehicles_NDS_Status_ID] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status_NDS] ([Status_ID])
GO
ALTER TABLE [dbo].[Vehicles_NDS] CHECK CONSTRAINT [FK_Vehicles_NDS_Status_ID]
GO
ALTER TABLE [dbo].[Vehicles_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Vehicles_NDS_Vehicle_Type] FOREIGN KEY([Vehicle_Type])
REFERENCES [dbo].[Vehicle_Type_NDS] ([Vehicle_Type_ID])
GO
ALTER TABLE [dbo].[Vehicles_NDS] CHECK CONSTRAINT [FK_Vehicles_NDS_Vehicle_Type]
GO
USE [TTKD_23_NDS]
GO
INSERT [dbo].[Source_NDS] ([Source_ID], [Name], [CreatedDate], [UpdatedDate]) VALUES (1, N'accidents', NULL, NULL)
INSERT [dbo].[Source_NDS] ([Source_ID], [Name], [CreatedDate], [UpdatedDate]) VALUES (2, N'postcodes', NULL, NULL)
INSERT [dbo].[Source_NDS] ([Source_ID], [Name], [CreatedDate], [UpdatedDate]) VALUES (3, N'vehicles', NULL, NULL)
INSERT [dbo].[Source_NDS] ([Source_ID], [Name], [CreatedDate], [UpdatedDate]) VALUES (4, N'casualtes', NULL, NULL)
INSERT [dbo].[Source_NDS] ([Source_ID], [Name], [CreatedDate], [UpdatedDate]) VALUES (5, N'PCD_OA', NULL, NULL)
GO
INSERT [dbo].[Status_NDS] ([Status_ID], [Name], [CreatedDate], [UpdatedDate]) VALUES (1, N'Active', NULL, NULL)
INSERT [dbo].[Status_NDS] ([Status_ID], [Name], [CreatedDate], [UpdatedDate]) VALUES (2, N'Non-Active', NULL, NULL)
GO

