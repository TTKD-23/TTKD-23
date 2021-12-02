CREATE DATABASE [TTKD_23_NDS]
USE [TTKD_23_NDS]
GO
/****** Object:  UserDefinedFunction [dbo].[getAgeFromAge]    Script Date: 12/2/2021 10:51:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getAgeFromAge]
 (
	@Age AS INT
 )
RETURNS @ReturnTable TABLE 
            ([Age_ID] int PRIMARY KEY NOT NULL, 
            [code] int NULL, 
            [label] nchar(100) NULL, 
            [start_age] int NULL, 
            [end_age] int NULL)
AS
BEGIN
	DECLARE @Code int
	SET @Code = (select top(1) [code] from [TTKD_23_NDS].[dbo].[Age_NDS] as a where @Age >= a.[start_age] and @Age <= a.[end_age])
	INSERT INTO @ReturnTable 
		select top(1) a.[Age_ID], a.[code], a.[label], a.[start_age], a.[end_age] from [TTKD_23_NDS].[dbo].[Age_NDS] as a where a.[code] = @Code
	RETURN;
END
GO
/****** Object:  UserDefinedFunction [dbo].[getPeriodOfDayFromTime]    Script Date: 12/2/2021 10:51:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getPeriodOfDayFromTime]
 (
	@Time AS TIME
 )
RETURNS @ReturnTable TABLE 
            ([Period_of_Day_ID] int PRIMARY KEY NOT NULL, 
            [code] int NULL, 
            [label] nchar(100) NULL, 
            [start_time] time(7) NULL, 
            [end_time] time(7) NULL)
AS
BEGIN
	DECLARE @Code int
	SET @Code = (select top(1) [code] from [TTKD_23_NDS].[dbo].[Period_of_Day_NDS] as p where @Time >= p.[start_time] and @Time <= p.[end_time])
	IF @Code IS NULL
		BEGIN
			SET @Code = 4
		END
	INSERT INTO @ReturnTable 
		select top(1) p.[Period_of_Day_ID], p.[code], p.[label], p.[start_time], p.[end_time] from [TTKD_23_NDS].[dbo].[Period_of_Day_NDS] as p where p.[code] = @Code
	RETURN;
END
GO
/****** Object:  Table [dbo].[Accidents_NDS]    Script Date: 12/2/2021 10:51:15 PM ******/
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
	[Local_Authority_District] [int] NULL,
	[Local_Authority_Highway] [char](50) NULL,
	[Road_Type] [int] NULL,
	[Speed_limit] [int] NULL,
	[Built_up_Road_Type] [int] NULL,
	[Light_Conditions] [int] NULL,
	[Weather_Conditions] [int] NULL,
	[Road_Surface_Conditions] [int] NULL,
	[Special_Conditions_at_Site] [int] NULL,
	[Urban_or_Rural_Area] [int] NULL,
	[LSOA_of_Accident_Location] [char](50) NULL,
	[StatusID] [int] NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[Geography_ID] [int] NULL,
	[Period_of_Day_ID] [int] NULL,
 CONSTRAINT [PK_Accidents_NDS] PRIMARY KEY CLUSTERED 
(
	[Accident_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Age_Band_NDS]    Script Date: 12/2/2021 10:51:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Age_Band_NDS](
	[Age_Band_ID] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NULL,
	[label] [nchar](100) NULL,
 CONSTRAINT [PK_Age_Band_NDS1] PRIMARY KEY CLUSTERED 
(
	[Age_Band_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Age_NDS]    Script Date: 12/2/2021 10:51:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Age_NDS](
	[Age_ID] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NULL,
	[label] [nchar](100) NULL,
	[start_age] [int] NULL,
	[end_age] [int] NULL,
 CONSTRAINT [PK_Age_NDS] PRIMARY KEY CLUSTERED 
(
	[Age_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Built_up_Road_Type_NDS]    Script Date: 12/2/2021 10:51:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Built_up_Road_Type_NDS](
	[Built_up_Road_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NULL,
	[label] [nchar](100) NULL,
 CONSTRAINT [PK_Built_up_Road_NDS] PRIMARY KEY CLUSTERED 
(
	[Built_up_Road_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Casualties_NDS]    Script Date: 12/2/2021 10:51:15 PM ******/
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
	[Age_Band_of_Casualty] [int] NULL,
	[Casualty_Severity] [int] NULL,
	[Casualty_Type] [int] NULL,
	[Casualty_Home_Area_Type] [int] NULL,
	[StatusID] [int] NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[Age_ID] [int] NULL,
	[Vehicle_ID] [int] NULL,
	[Accident_ID] [int] NULL,
 CONSTRAINT [PK_Casualties_NDS] PRIMARY KEY CLUSTERED 
(
	[Casualty_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Casualty_Type_NDS]    Script Date: 12/2/2021 10:51:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Casualty_Type_NDS](
	[Casualty_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NULL,
	[label] [nchar](100) NULL,
 CONSTRAINT [PK_Casualty_Type_NDS1] PRIMARY KEY CLUSTERED 
(
	[Casualty_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Day_of_week_NDS]    Script Date: 12/2/2021 10:51:15 PM ******/
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
/****** Object:  Table [dbo].[Geography_NDS]    Script Date: 12/2/2021 10:51:15 PM ******/
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
 CONSTRAINT [PK_Postcodes_NDS] PRIMARY KEY CLUSTERED 
(
	[Geography_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Journey_Purpose_NDS]    Script Date: 12/2/2021 10:51:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Journey_Purpose_NDS](
	[Journey_Purpose_ID] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NULL,
	[label] [nchar](100) NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Journey_Purpose_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Local_Authority_District_NDS]    Script Date: 12/2/2021 10:51:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Local_Authority_District_NDS](
	[Local_Authority_District_ID] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NULL,
	[label] [nchar](100) NULL,
 CONSTRAINT [PK_Local_Authority_District_NDS2] PRIMARY KEY CLUSTERED 
(
	[Local_Authority_District_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCD_OA_NDS]    Script Date: 12/2/2021 10:51:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCD_OA_NDS](
	[PCD_OA_ID] [int] IDENTITY(1,1) NOT NULL,
	[pcd7] [varchar](50) NULL,
	[pcd8] [varchar](50) NULL,
	[pcds] [varchar](50) NULL,
	[dointr] [varchar](50) NULL,
	[doterm] [varchar](50) NULL,
	[usertype] [varchar](50) NULL,
	[oa11cd] [char](50) NULL,
	[lsoa11cd] [varchar](50) NULL,
	[msoa11cd] [varchar](50) NULL,
	[ladcd] [varchar](50) NULL,
	[StatusID] [int] NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_PCD_OA_NDS] PRIMARY KEY CLUSTERED 
(
	[PCD_OA_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Period_of_Day_NDS]    Script Date: 12/2/2021 10:51:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Period_of_Day_NDS](
	[Period_of_Day_ID] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NULL,
	[label] [nchar](100) NULL,
	[start_time] [time](7) NULL,
	[end_time] [time](7) NULL,
 CONSTRAINT [PK_Period_of_Day_NDS1] PRIMARY KEY CLUSTERED 
(
	[Period_of_Day_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Road_Type_NDS]    Script Date: 12/2/2021 10:51:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Road_Type_NDS](
	[Road_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NULL,
	[label] [nchar](100) NULL,
 CONSTRAINT [PK_Road_Type_NDS1] PRIMARY KEY CLUSTERED 
(
	[Road_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Severity_NDS]    Script Date: 12/2/2021 10:51:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Severity_NDS](
	[Severity_ID] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NULL,
	[label] [nchar](100) NULL,
 CONSTRAINT [PK_Severity_NDS1] PRIMARY KEY CLUSTERED 
(
	[Severity_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sex_of_Person_NDS]    Script Date: 12/2/2021 10:51:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sex_of_Person_NDS](
	[Sex_of_Person_ID] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NULL,
	[label] [nchar](100) NULL,
 CONSTRAINT [PK_Sex_of_Person_NDS2] PRIMARY KEY CLUSTERED 
(
	[Sex_of_Person_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Source_NDS]    Script Date: 12/2/2021 10:51:15 PM ******/
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
/****** Object:  Table [dbo].[Status_NDS]    Script Date: 12/2/2021 10:51:15 PM ******/
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
/****** Object:  Table [dbo].[Urban_Rural_NDS]    Script Date: 12/2/2021 10:51:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urban_Rural_NDS](
	[Urban_Rural_ID] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NULL,
	[label] [nchar](100) NULL,
 CONSTRAINT [PK_Urban_Rural_NDS2] PRIMARY KEY CLUSTERED 
(
	[Urban_Rural_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicle_Type_NDS]    Script Date: 12/2/2021 10:51:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle_Type_NDS](
	[Vehicle_Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NULL,
	[label] [nchar](100) NULL,
 CONSTRAINT [PK_Vehicle_Type_NDS2] PRIMARY KEY CLUSTERED 
(
	[Vehicle_Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicles_NDS]    Script Date: 12/2/2021 10:51:15 PM ******/
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
	[Age_Band_of_Driver] [int] NULL,
	[Journey_Purpose] [int] NULL,
	[Propulsion_Code] [int] NULL,
	[Driver_IMD_Decile] [int] NULL,
	[StatusID] [int] NULL,
	[SourceID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[Age_ID] [int] NULL,
	[Accident_ID] [int] NULL,
 CONSTRAINT [PK_Vehicles_NDS] PRIMARY KEY CLUSTERED 
(
	[Vehicle_ID] ASC
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
ALTER TABLE [dbo].[Accidents_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Accidents_NDS_Local_Authority_District] FOREIGN KEY([Local_Authority_District])
REFERENCES [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID])
GO
ALTER TABLE [dbo].[Accidents_NDS] CHECK CONSTRAINT [FK_Accidents_NDS_Local_Authority_District]
GO
ALTER TABLE [dbo].[Accidents_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Accidents_NDS_Period_of_day] FOREIGN KEY([Period_of_Day_ID])
REFERENCES [dbo].[Period_of_Day_NDS] ([Period_of_Day_ID])
GO
ALTER TABLE [dbo].[Accidents_NDS] CHECK CONSTRAINT [FK_Accidents_NDS_Period_of_day]
GO
ALTER TABLE [dbo].[Accidents_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Accidents_NDS_Road_Type] FOREIGN KEY([Road_Type])
REFERENCES [dbo].[Road_Type_NDS] ([Road_Type_ID])
GO
ALTER TABLE [dbo].[Accidents_NDS] CHECK CONSTRAINT [FK_Accidents_NDS_Road_Type]
GO
ALTER TABLE [dbo].[Accidents_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Accidents_NDS_Source_ID] FOREIGN KEY([SourceID])
REFERENCES [dbo].[Source_NDS] ([Source_ID])
GO
ALTER TABLE [dbo].[Accidents_NDS] CHECK CONSTRAINT [FK_Accidents_NDS_Source_ID]
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
ALTER TABLE [dbo].[Casualties_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Casualties_NDS_Accident] FOREIGN KEY([Accident_ID])
REFERENCES [dbo].[Accidents_NDS] ([Accident_ID])
GO
ALTER TABLE [dbo].[Casualties_NDS] CHECK CONSTRAINT [FK_Casualties_NDS_Accident]
GO
ALTER TABLE [dbo].[Casualties_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Casualties_NDS_Age] FOREIGN KEY([Age_ID])
REFERENCES [dbo].[Age_NDS] ([Age_ID])
GO
ALTER TABLE [dbo].[Casualties_NDS] CHECK CONSTRAINT [FK_Casualties_NDS_Age]
GO
ALTER TABLE [dbo].[Casualties_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Casualties_NDS_Age_Band_of_Casualty] FOREIGN KEY([Age_Band_of_Casualty])
REFERENCES [dbo].[Age_Band_NDS] ([Age_Band_ID])
GO
ALTER TABLE [dbo].[Casualties_NDS] CHECK CONSTRAINT [FK_Casualties_NDS_Age_Band_of_Casualty]
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
ALTER TABLE [dbo].[PCD_OA_NDS]  WITH CHECK ADD  CONSTRAINT [FK_PCD_OA_NDS_NDS_Source_ID] FOREIGN KEY([SourceID])
REFERENCES [dbo].[Source_NDS] ([Source_ID])
GO
ALTER TABLE [dbo].[PCD_OA_NDS] CHECK CONSTRAINT [FK_PCD_OA_NDS_NDS_Source_ID]
GO
ALTER TABLE [dbo].[PCD_OA_NDS]  WITH CHECK ADD  CONSTRAINT [FK_PCD_OA_NDS_NDS_Status_ID] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status_NDS] ([Status_ID])
GO
ALTER TABLE [dbo].[PCD_OA_NDS] CHECK CONSTRAINT [FK_PCD_OA_NDS_NDS_Status_ID]
GO
ALTER TABLE [dbo].[Vehicles_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Vehicles_NDS_Accident] FOREIGN KEY([Accident_ID])
REFERENCES [dbo].[Accidents_NDS] ([Accident_ID])
GO
ALTER TABLE [dbo].[Vehicles_NDS] CHECK CONSTRAINT [FK_Vehicles_NDS_Accident]
GO
ALTER TABLE [dbo].[Vehicles_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Vehicles_NDS_Age] FOREIGN KEY([Age_ID])
REFERENCES [dbo].[Age_NDS] ([Age_ID])
GO
ALTER TABLE [dbo].[Vehicles_NDS] CHECK CONSTRAINT [FK_Vehicles_NDS_Age]
GO
ALTER TABLE [dbo].[Vehicles_NDS]  WITH CHECK ADD  CONSTRAINT [FK_Vehicles_NDS_Age_Band_of_Driver] FOREIGN KEY([Age_Band_of_Driver])
REFERENCES [dbo].[Age_Band_NDS] ([Age_Band_ID])
GO
ALTER TABLE [dbo].[Vehicles_NDS] CHECK CONSTRAINT [FK_Vehicles_NDS_Age_Band_of_Driver]
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
GOs
SET IDENTITY_INSERT [dbo].[Age_Band_NDS] ON 

INSERT [dbo].[Age_Band_NDS] ([Age_Band_ID], [code], [label]) VALUES (1, 1, N'0 - 5                                                                                               ')
INSERT [dbo].[Age_Band_NDS] ([Age_Band_ID], [code], [label]) VALUES (2, 2, N'6 - 10                                                                                              ')
INSERT [dbo].[Age_Band_NDS] ([Age_Band_ID], [code], [label]) VALUES (3, 3, N'11 - 15                                                                                             ')
INSERT [dbo].[Age_Band_NDS] ([Age_Band_ID], [code], [label]) VALUES (4, 4, N'16 - 20                                                                                             ')
INSERT [dbo].[Age_Band_NDS] ([Age_Band_ID], [code], [label]) VALUES (5, 5, N'21 - 25                                                                                             ')
INSERT [dbo].[Age_Band_NDS] ([Age_Band_ID], [code], [label]) VALUES (6, 6, N'26 - 35                                                                                             ')
INSERT [dbo].[Age_Band_NDS] ([Age_Band_ID], [code], [label]) VALUES (7, 7, N'36 - 45                                                                                             ')
INSERT [dbo].[Age_Band_NDS] ([Age_Band_ID], [code], [label]) VALUES (8, 8, N'46 - 55                                                                                             ')
INSERT [dbo].[Age_Band_NDS] ([Age_Band_ID], [code], [label]) VALUES (9, 9, N'56 - 65                                                                                             ')
INSERT [dbo].[Age_Band_NDS] ([Age_Band_ID], [code], [label]) VALUES (10, 10, N'66 - 75                                                                                             ')
INSERT [dbo].[Age_Band_NDS] ([Age_Band_ID], [code], [label]) VALUES (11, 11, N'Over 75                                                                                             ')
INSERT [dbo].[Age_Band_NDS] ([Age_Band_ID], [code], [label]) VALUES (12, -1, N'Data missing or out of range                                                                        ')
SET IDENTITY_INSERT [dbo].[Age_Band_NDS] OFF
GO
SET IDENTITY_INSERT [dbo].[Age_NDS] ON 

INSERT [dbo].[Age_NDS] ([Age_ID], [code], [label], [start_age], [end_age]) VALUES (1, 1, N'Children                                                                                            ', 0, 15)
INSERT [dbo].[Age_NDS] ([Age_ID], [code], [label], [start_age], [end_age]) VALUES (2, 2, N'Young Adult                                                                                         ', 0, 17)
INSERT [dbo].[Age_NDS] ([Age_ID], [code], [label], [start_age], [end_age]) VALUES (3, 3, N'Adult                                                                                               ', 18, 59)
INSERT [dbo].[Age_NDS] ([Age_ID], [code], [label], [start_age], [end_age]) VALUES (4, 4, N'60 and over                                                                                         ', 60, 1000)
SET IDENTITY_INSERT [dbo].[Age_NDS] OFF
GO
SET IDENTITY_INSERT [dbo].[Built_up_Road_Type_NDS] ON 

INSERT [dbo].[Built_up_Road_Type_NDS] ([Built_up_Road_Type_ID], [code], [label]) VALUES (1, 1, N'Build-up road                                                                                       ')
INSERT [dbo].[Built_up_Road_Type_NDS] ([Built_up_Road_Type_ID], [code], [label]) VALUES (2, 2, N'Non Build-up road                                                                                   ')
SET IDENTITY_INSERT [dbo].[Built_up_Road_Type_NDS] OFF
GO
SET IDENTITY_INSERT [dbo].[Casualty_Type_NDS] ON 

INSERT [dbo].[Casualty_Type_NDS] ([Casualty_Type_ID], [code], [label]) VALUES (1, 0, N'Pedestrian                                                                                          ')
INSERT [dbo].[Casualty_Type_NDS] ([Casualty_Type_ID], [code], [label]) VALUES (2, 1, N'Cyclist                                                                                             ')
INSERT [dbo].[Casualty_Type_NDS] ([Casualty_Type_ID], [code], [label]) VALUES (3, 2, N'Motorcycle 50cc and under rider or passenger                                                        ')
INSERT [dbo].[Casualty_Type_NDS] ([Casualty_Type_ID], [code], [label]) VALUES (4, 3, N'Motorcycle 125cc and under rider or passenger                                                       ')
INSERT [dbo].[Casualty_Type_NDS] ([Casualty_Type_ID], [code], [label]) VALUES (5, 4, N'Motorcycle over 125cc and up to 500cc rider or  passenger                                           ')
INSERT [dbo].[Casualty_Type_NDS] ([Casualty_Type_ID], [code], [label]) VALUES (6, 5, N'Motorcycle over 500cc rider or passenger                                                            ')
INSERT [dbo].[Casualty_Type_NDS] ([Casualty_Type_ID], [code], [label]) VALUES (7, 8, N'Taxi/Private hire car occupant                                                                      ')
INSERT [dbo].[Casualty_Type_NDS] ([Casualty_Type_ID], [code], [label]) VALUES (8, 9, N'Car occupant                                                                                        ')
INSERT [dbo].[Casualty_Type_NDS] ([Casualty_Type_ID], [code], [label]) VALUES (9, 10, N'Minibus (8 - 16 passenger seats) occupant                                                           ')
INSERT [dbo].[Casualty_Type_NDS] ([Casualty_Type_ID], [code], [label]) VALUES (10, 11, N'Bus or coach occupant (17 or more pass seats)                                                       ')
INSERT [dbo].[Casualty_Type_NDS] ([Casualty_Type_ID], [code], [label]) VALUES (11, 16, N'Horse rider                                                                                         ')
INSERT [dbo].[Casualty_Type_NDS] ([Casualty_Type_ID], [code], [label]) VALUES (12, 17, N'Agricultural vehicle occupant                                                                       ')
INSERT [dbo].[Casualty_Type_NDS] ([Casualty_Type_ID], [code], [label]) VALUES (13, 18, N'Tram occupant                                                                                       ')
INSERT [dbo].[Casualty_Type_NDS] ([Casualty_Type_ID], [code], [label]) VALUES (14, 19, N'Van / Goods vehicle (3.5 tonnes mgw or under) occupant                                              ')
INSERT [dbo].[Casualty_Type_NDS] ([Casualty_Type_ID], [code], [label]) VALUES (15, 20, N'Goods vehicle (over 3.5t. and under 7.5t.) occupant                                                 ')
INSERT [dbo].[Casualty_Type_NDS] ([Casualty_Type_ID], [code], [label]) VALUES (16, 21, N'Goods vehicle (7.5 tonnes mgw and over) occupant                                                    ')
INSERT [dbo].[Casualty_Type_NDS] ([Casualty_Type_ID], [code], [label]) VALUES (17, 22, N'Mobility scooter rider                                                                              ')
INSERT [dbo].[Casualty_Type_NDS] ([Casualty_Type_ID], [code], [label]) VALUES (18, 23, N'Electric motorcycle rider or passenger                                                              ')
INSERT [dbo].[Casualty_Type_NDS] ([Casualty_Type_ID], [code], [label]) VALUES (19, 90, N'Other vehicle occupant                                                                              ')
INSERT [dbo].[Casualty_Type_NDS] ([Casualty_Type_ID], [code], [label]) VALUES (20, 97, N'Motorcycle - unknown cc rider or passenger                                                          ')
INSERT [dbo].[Casualty_Type_NDS] ([Casualty_Type_ID], [code], [label]) VALUES (21, 98, N'Goods vehicle (unknown weight) occupant                                                             ')
SET IDENTITY_INSERT [dbo].[Casualty_Type_NDS] OFF
GO
SET IDENTITY_INSERT [dbo].[Day_of_week_NDS] ON 

INSERT [dbo].[Day_of_week_NDS] ([Day_of_week_ID], [code], [label]) VALUES (1, 1, N'Monday                                                                                              ')
INSERT [dbo].[Day_of_week_NDS] ([Day_of_week_ID], [code], [label]) VALUES (2, 2, N'Tuesday                                                                                             ')
INSERT [dbo].[Day_of_week_NDS] ([Day_of_week_ID], [code], [label]) VALUES (3, 3, N'Webnesday                                                                                           ')
INSERT [dbo].[Day_of_week_NDS] ([Day_of_week_ID], [code], [label]) VALUES (4, 4, N'Thursday                                                                                            ')
INSERT [dbo].[Day_of_week_NDS] ([Day_of_week_ID], [code], [label]) VALUES (5, 5, N'Friday                                                                                              ')
INSERT [dbo].[Day_of_week_NDS] ([Day_of_week_ID], [code], [label]) VALUES (6, 6, N'Saturday                                                                                            ')
INSERT [dbo].[Day_of_week_NDS] ([Day_of_week_ID], [code], [label]) VALUES (7, 7, N'Sunday                                                                                              ')
SET IDENTITY_INSERT [dbo].[Day_of_week_NDS] OFF
GO
SET IDENTITY_INSERT [dbo].[Journey_Purpose_NDS] ON 

INSERT [dbo].[Journey_Purpose_NDS] ([Journey_Purpose_ID], [code], [label]) VALUES (1, 1, N'Journey as part of work                                                                             ')
INSERT [dbo].[Journey_Purpose_NDS] ([Journey_Purpose_ID], [code], [label]) VALUES (2, 2, N'Commuting to/from work                                                                              ')
INSERT [dbo].[Journey_Purpose_NDS] ([Journey_Purpose_ID], [code], [label]) VALUES (3, 3, N'Taking pupil to/from school                                                                         ')
INSERT [dbo].[Journey_Purpose_NDS] ([Journey_Purpose_ID], [code], [label]) VALUES (4, 4, N'Pupil riding to/from school                                                                         ')
INSERT [dbo].[Journey_Purpose_NDS] ([Journey_Purpose_ID], [code], [label]) VALUES (5, 5, N'Other                                                                                               ')
INSERT [dbo].[Journey_Purpose_NDS] ([Journey_Purpose_ID], [code], [label]) VALUES (6, 6, N'Not known                                                                                           ')
INSERT [dbo].[Journey_Purpose_NDS] ([Journey_Purpose_ID], [code], [label]) VALUES (7, 15, N'Other/Not known (2005-10)                                                                           ')
INSERT [dbo].[Journey_Purpose_NDS] ([Journey_Purpose_ID], [code], [label]) VALUES (8, -1, N'Data missing or out of range                                                                        ')
SET IDENTITY_INSERT [dbo].[Journey_Purpose_NDS] OFF
GO
SET IDENTITY_INSERT [dbo].[Local_Authority_District_NDS] ON 

INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (1, 1, N'Westminster                                                                                         ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (2, 2, N'Camden                                                                                              ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (3, 3, N'Islington                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (4, 4, N'Hackney                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (5, 5, N'Tower Hamlets                                                                                       ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (6, 6, N'Greenwich                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (7, 7, N'Lewisham                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (8, 8, N'Southwark                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (9, 9, N'Lambeth                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (10, 10, N'Wandsworth                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (11, 11, N'Hammersmith and Fulham                                                                              ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (12, 12, N'Kensington and Chelsea                                                                              ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (13, 13, N'Waltham Forest                                                                                      ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (14, 14, N'Redbridge                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (15, 15, N'Havering                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (16, 16, N'Barking and Dagenham                                                                                ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (17, 17, N'Newham                                                                                              ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (18, 18, N'Bexley                                                                                              ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (19, 19, N'Bromley                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (20, 20, N'Croydon                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (21, 21, N'Sutton                                                                                              ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (22, 22, N'Merton                                                                                              ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (23, 23, N'Kingston upon Thames                                                                                ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (24, 24, N'Richmond upon Thames                                                                                ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (25, 25, N'Hounslow                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (26, 26, N'Hillingdon                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (27, 27, N'Ealing                                                                                              ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (28, 28, N'Brent                                                                                               ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (29, 29, N'Harrow                                                                                              ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (30, 30, N'Barnet                                                                                              ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (31, 31, N'Haringey                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (32, 32, N'Enfield                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (33, 33, N'Hertsmere                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (34, 38, N'Epsom and Ewell                                                                                     ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (35, 40, N'Spelthorne                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (36, 57, N'London Airport (Heathrow)                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (37, 60, N'Allerdale                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (38, 61, N'Barrow-in-Furness                                                                                   ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (39, 62, N'Carlisle                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (40, 63, N'Copeland                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (41, 64, N'Eden                                                                                                ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (42, 65, N'South Lakeland                                                                                      ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (43, 70, N'Blackburn with Darwen                                                                               ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (44, 71, N'Blackpool                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (45, 72, N'Burnley                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (46, 73, N'Chorley                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (47, 74, N'Fylde                                                                                               ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (48, 75, N'Hyndburn                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (49, 76, N'Lancaster                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (50, 77, N'Pendle                                                                                              ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (51, 79, N'Preston                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (52, 80, N'Ribble Valley                                                                                       ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (53, 82, N'Rossendale                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (54, 83, N'South Ribble                                                                                        ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (55, 84, N'West Lancashire                                                                                     ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (56, 85, N'Wyre                                                                                                ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (57, 90, N'Knowsley                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (58, 91, N'Liverpool                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (59, 92, N'St. Helens                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (60, 93, N'Sefton                                                                                              ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (61, 95, N'Wirral                                                                                              ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (62, 100, N'Bolton                                                                                              ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (63, 101, N'Bury                                                                                                ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (64, 102, N'Manchester                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (65, 104, N'Oldham                                                                                              ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (66, 106, N'Rochdale                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (67, 107, N'Salford                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (68, 109, N'Stockport                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (69, 110, N'Tameside                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (70, 112, N'Trafford                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (71, 114, N'Wigan                                                                                               ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (72, 120, N'Chester                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (73, 121, N'Congleton                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (74, 122, N'Crewe and Nantwich                                                                                  ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (75, 123, N'Ellesmere Port and Neston                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (76, 124, N'Halton                                                                                              ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (77, 126, N'Macclesfield                                                                                        ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (78, 127, N'Vale Royal                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (79, 128, N'Warrington                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (80, 129, N'Cheshire East                                                                                       ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (81, 130, N'Cheshire West and Chester                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (82, 139, N'Northumberland                                                                                      ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (83, 140, N'Alnwick                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (84, 141, N'Berwick-upon-Tweed                                                                                  ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (85, 142, N'Blyth Valley                                                                                        ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (86, 143, N'Castle Morpeth                                                                                      ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (87, 144, N'Tynedale                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (88, 145, N'Wansbeck                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (89, 146, N'Gateshead                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (90, 147, N'Newcastle upon Tyne                                                                                 ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (91, 148, N'North Tyneside                                                                                      ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (92, 149, N'South Tyneside                                                                                      ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (93, 150, N'Sunderland                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (94, 160, N'Chester-le-Street                                                                                   ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (95, 161, N'Darlington                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (96, 162, N'Derwentside                                                                                         ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (97, 163, N'Durham                                                                                              ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (98, 164, N'Easington                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (99, 165, N'Sedgefield                                                                                          ')
GO
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (100, 166, N'Teesdale                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (101, 168, N'Wear Valley                                                                                         ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (102, 169, N'County Durham                                                                                       ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (103, 180, N'Craven                                                                                              ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (104, 181, N'Hambleton                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (105, 182, N'Harrogate                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (106, 184, N'Richmondshire                                                                                       ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (107, 185, N'Ryedale                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (108, 186, N'Scarborough                                                                                         ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (109, 187, N'Selby                                                                                               ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (110, 189, N'York                                                                                                ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (111, 200, N'Bradford                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (112, 202, N'Calderdale                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (113, 203, N'Kirklees                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (114, 204, N'Leeds                                                                                               ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (115, 206, N'Wakefield                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (116, 210, N'Barnsley                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (117, 211, N'Doncaster                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (118, 213, N'Rotherham                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (119, 215, N'Sheffield                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (120, 228, N'Kingston upon Hull, City of                                                                         ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (121, 231, N'East Riding of Yorkshire                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (122, 232, N'North Lincolnshire                                                                                  ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (123, 233, N'North East Lincolnshire                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (124, 240, N'Hartlepool                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (125, 241, N'Redcar and Cleveland                                                                                ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (126, 243, N'Middlesbrough                                                                                       ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (127, 245, N'Stockton-on-Tees                                                                                    ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (128, 250, N'Cannock Chase                                                                                       ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (129, 251, N'East Staffordshire                                                                                  ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (130, 252, N'Lichfield                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (131, 253, N'Newcastle-under-Lyme                                                                                ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (132, 254, N'South Staffordshire                                                                                 ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (133, 255, N'Stafford                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (134, 256, N'Staffordshire Moorlands                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (135, 257, N'Stoke-on-Trent                                                                                      ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (136, 258, N'Tamworth                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (137, 270, N'Bromsgrove                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (138, 273, N'Malvern Hills                                                                                       ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (139, 274, N'Redditch                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (140, 276, N'Worcester                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (141, 277, N'Wychavon                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (142, 278, N'Wyre Forest                                                                                         ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (143, 279, N'Bridgnorth                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (144, 280, N'North Shropshire                                                                                    ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (145, 281, N'Oswestry                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (146, 282, N'Shrewsbury and Atcham                                                                               ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (147, 283, N'South Shropshire                                                                                    ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (148, 284, N'Telford and Wrekin                                                                                  ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (149, 285, N'Herefordshire, County of                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (150, 286, N'Shropshire                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (151, 290, N'North Warwickshire                                                                                  ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (152, 291, N'Nuneaton and Bedworth                                                                               ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (153, 292, N'Rugby                                                                                               ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (154, 293, N'Stratford-upon-Avon                                                                                 ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (155, 294, N'Warwick                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (156, 300, N'Birmingham                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (157, 302, N'Coventry                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (158, 303, N'Dudley                                                                                              ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (159, 305, N'Sandwell                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (160, 306, N'Solihull                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (161, 307, N'Walsall                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (162, 309, N'Wolverhampton                                                                                       ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (163, 320, N'Amber Valley                                                                                        ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (164, 321, N'Bolsover                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (165, 322, N'Chesterfield                                                                                        ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (166, 323, N'Derby                                                                                               ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (167, 324, N'Erewash                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (168, 325, N'High Peak                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (169, 327, N'North East Derbyshire                                                                               ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (170, 328, N'South Derbyshire                                                                                    ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (171, 329, N'Derbyshire Dales                                                                                    ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (172, 340, N'Ashfield                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (173, 341, N'Bassetlaw                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (174, 342, N'Broxtowe                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (175, 343, N'Gedling                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (176, 344, N'Mansfield                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (177, 345, N'Newark and Sherwood                                                                                 ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (178, 346, N'Nottingham                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (179, 347, N'Rushcliffe                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (180, 350, N'Boston                                                                                              ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (181, 351, N'East Lindsey                                                                                        ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (182, 352, N'Lincoln                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (183, 353, N'North Kesteven                                                                                      ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (184, 354, N'South Holland                                                                                       ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (185, 355, N'South Kesteven                                                                                      ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (186, 356, N'West Lindsey                                                                                        ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (187, 360, N'Blaby                                                                                               ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (188, 361, N'Hinckley and Bosworth                                                                               ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (189, 362, N'Charnwood                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (190, 363, N'Harborough                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (191, 364, N'Leicester                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (192, 365, N'Melton                                                                                              ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (193, 366, N'North West Leicestershire                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (194, 367, N'Oadby and Wigston                                                                                   ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (195, 368, N'Rutland                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (196, 380, N'Corby                                                                                               ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (197, 381, N'Daventry                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (198, 382, N'East Northamptonshire                                                                               ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (199, 383, N'Kettering                                                                                           ')
GO
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (200, 384, N'Northampton                                                                                         ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (201, 385, N'South Northamptonshire                                                                              ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (202, 386, N'Wellingborough                                                                                      ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (203, 390, N'Cambridge                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (204, 391, N'East Cambridgeshire                                                                                 ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (205, 392, N'Fenland                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (206, 393, N'Huntingdonshire                                                                                     ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (207, 394, N'Peterborough                                                                                        ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (208, 395, N'South Cambridgeshire                                                                                ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (209, 400, N'Breckland                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (210, 401, N'Broadland                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (211, 402, N'Great Yarmouth                                                                                      ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (212, 404, N'Norwich                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (213, 405, N'North Norfolk                                                                                       ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (214, 406, N'South Norfolk                                                                                       ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (215, 407, N'King''s Lynn and West Norfolk                                                                        ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (216, 410, N'Babergh                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (217, 411, N'Forest Heath                                                                                        ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (218, 412, N'Ipswich                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (219, 413, N'Mid Suffolk                                                                                         ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (220, 414, N'St. Edmundsbury                                                                                     ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (221, 415, N'Suffolk Coastal                                                                                     ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (222, 416, N'Waveney                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (223, 420, N'Bedford                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (224, 421, N'Luton                                                                                               ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (225, 422, N'Mid Bedfordshire                                                                                    ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (226, 423, N'South Bedfordshire                                                                                  ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (227, 424, N'Central Bedfordshire                                                                                ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (228, 430, N'Broxbourne                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (229, 431, N'Dacorum                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (230, 432, N'East Hertfordshire                                                                                  ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (231, 433, N'North Hertfordshire                                                                                 ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (232, 434, N'St. Albans                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (233, 435, N'Stevenage                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (234, 436, N'Three Rivers                                                                                        ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (235, 437, N'Watford                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (236, 438, N'Welwyn Hatfield                                                                                     ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (237, 450, N'Basildon                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (238, 451, N'Braintree                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (239, 452, N'Brentwood                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (240, 453, N'Castle Point                                                                                        ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (241, 454, N'Chelmsford                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (242, 455, N'Colchester                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (243, 456, N'Epping Forest                                                                                       ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (244, 457, N'Harlow                                                                                              ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (245, 458, N'Maldon                                                                                              ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (246, 459, N'Rochford                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (247, 460, N'Southend-on-Sea                                                                                     ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (248, 461, N'Tendring                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (249, 462, N'Thurrock                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (250, 463, N'Uttlesford                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (251, 470, N'Bracknell Forest                                                                                    ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (252, 471, N'West Berkshire                                                                                      ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (253, 472, N'Reading                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (254, 473, N'Slough                                                                                              ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (255, 474, N'Windsor and Maidenhead                                                                              ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (256, 475, N'Wokingham                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (257, 476, N'Aylesbury Vale                                                                                      ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (258, 477, N'South Bucks                                                                                         ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (259, 478, N'Chiltern                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (260, 479, N'Milton Keynes                                                                                       ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (261, 480, N'Wycombe                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (262, 481, N'Cherwell                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (263, 482, N'Oxford                                                                                              ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (264, 483, N'Vale of White Horse                                                                                 ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (265, 484, N'South Oxfordshire                                                                                   ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (266, 485, N'West Oxfordshire                                                                                    ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (267, 490, N'Basingstoke and Deane                                                                               ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (268, 491, N'Eastleigh                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (269, 492, N'Fareham                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (270, 493, N'Gosport                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (271, 494, N'Hart                                                                                                ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (272, 495, N'Havant                                                                                              ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (273, 496, N'New Forest                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (274, 497, N'East Hampshire                                                                                      ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (275, 498, N'Portsmouth                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (276, 499, N'Rushmoor                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (277, 500, N'Southampton                                                                                         ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (278, 501, N'Test Valley                                                                                         ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (279, 502, N'Winchester                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (280, 505, N'Isle of Wight                                                                                       ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (281, 510, N'Elmbridge                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (282, 511, N'Guildford                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (283, 512, N'Mole Valley                                                                                         ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (284, 513, N'Reigate and Banstead                                                                                ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (285, 514, N'Runnymede                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (286, 515, N'Surrey Heath                                                                                        ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (287, 516, N'Tandridge                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (288, 517, N'Waverley                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (289, 518, N'Woking                                                                                              ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (290, 530, N'Ashford                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (291, 531, N'Canterbury                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (292, 532, N'Dartford                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (293, 533, N'Dover                                                                                               ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (294, 535, N'Gravesham                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (295, 536, N'Maidstone                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (296, 538, N'Sevenoaks                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (297, 539, N'Shepway                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (298, 540, N'Swale                                                                                               ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (299, 541, N'Thanet                                                                                              ')
GO
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (300, 542, N'Tonbridge and Malling                                                                               ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (301, 543, N'Tunbridge Wells                                                                                     ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (302, 544, N'Medway                                                                                              ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (303, 551, N'Eastbourne                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (304, 552, N'Hastings                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (305, 554, N'Lewes                                                                                               ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (306, 555, N'Rother                                                                                              ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (307, 556, N'Wealden                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (308, 557, N'Adur                                                                                                ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (309, 558, N'Arun                                                                                                ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (310, 559, N'Chichester                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (311, 560, N'Crawley                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (312, 562, N'Horsham                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (313, 563, N'Mid Sussex                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (314, 564, N'Worthing                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (315, 565, N'Brighton and Hove                                                                                   ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (316, 570, N'City of London                                                                                      ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (317, 580, N'East Devon                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (318, 581, N'Exeter                                                                                              ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (319, 582, N'North Devon                                                                                         ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (320, 583, N'Plymouth                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (321, 584, N'South Hams                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (322, 585, N'Teignbridge                                                                                         ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (323, 586, N'Mid Devon                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (324, 587, N'Torbay                                                                                              ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (325, 588, N'Torridge                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (326, 589, N'West Devon                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (327, 590, N'Caradon                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (328, 591, N'Carrick                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (329, 592, N'Kerrier                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (330, 593, N'North Cornwall                                                                                      ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (331, 594, N'Penwith                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (332, 595, N'Restormel                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (333, 596, N'Cornwall                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (334, 601, N'Bristol, City of                                                                                    ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (335, 605, N'North Somerset                                                                                      ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (336, 606, N'Mendip                                                                                              ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (337, 607, N'Sedgemoor                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (338, 608, N'Taunton Deane                                                                                       ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (339, 609, N'West Somerset                                                                                       ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (340, 610, N'South Somerset                                                                                      ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (341, 611, N'Bath and North East Somerset                                                                        ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (342, 612, N'South Gloucestershire                                                                               ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (343, 620, N'Cheltenham                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (344, 621, N'Cotswold                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (345, 622, N'Forest of Dean                                                                                      ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (346, 623, N'Gloucester                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (347, 624, N'Stroud                                                                                              ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (348, 625, N'Tewkesbury                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (349, 630, N'Kennet                                                                                              ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (350, 631, N'North Wiltshire                                                                                     ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (351, 632, N'Salisbury                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (352, 633, N'Swindon                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (353, 634, N'West Wiltshire                                                                                      ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (354, 635, N'Wiltshire                                                                                           ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (355, 640, N'Bournemouth                                                                                         ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (356, 641, N'Christchurch                                                                                        ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (357, 642, N'North Dorset                                                                                        ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (358, 643, N'Poole                                                                                               ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (359, 644, N'Purbeck                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (360, 645, N'West Dorset                                                                                         ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (361, 646, N'Weymouth and Portland                                                                               ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (362, 647, N'East Dorset                                                                                         ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (363, 720, N'Isle of Anglesey                                                                                    ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (364, 721, N'Conwy                                                                                               ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (365, 722, N'Gwynedd                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (366, 723, N'Denbighshire                                                                                        ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (367, 724, N'Flintshire                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (368, 725, N'Wrexham                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (369, 730, N'Blaenau Gwent                                                                                       ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (370, 731, N'Caerphilly                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (371, 732, N'Monmouthshire                                                                                       ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (372, 733, N'Newport                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (373, 734, N'Torfaen                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (374, 740, N'Bridgend                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (375, 741, N'Cardiff                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (376, 742, N'Merthyr Tydfil                                                                                      ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (377, 743, N'Neath Port Talbot                                                                                   ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (378, 744, N'Rhondda, Cynon, Taff                                                                                ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (379, 745, N'Swansea                                                                                             ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (380, 746, N'The Vale of Glamorgan                                                                               ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (381, 750, N'Ceredigion                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (382, 751, N'Carmarthenshire                                                                                     ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (383, 752, N'Pembrokeshire                                                                                       ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (384, 753, N'Powys                                                                                               ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (385, 910, N'Aberdeen City                                                                                       ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (386, 911, N'Aberdeenshire                                                                                       ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (387, 912, N'Angus                                                                                               ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (388, 913, N'Argyll and Bute                                                                                     ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (389, 914, N'Scottish Borders                                                                                    ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (390, 915, N'Clackmannanshire                                                                                    ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (391, 916, N'West Dunbartonshire                                                                                 ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (392, 917, N'Dumfries and Galloway                                                                               ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (393, 918, N'Dundee City                                                                                         ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (394, 919, N'East Ayrshire                                                                                       ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (395, 920, N'East Dunbartonshire                                                                                 ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (396, 921, N'East Lothian                                                                                        ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (397, 922, N'East Renfrewshire                                                                                   ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (398, 923, N'Edinburgh, City of                                                                                  ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (399, 924, N'Falkirk                                                                                             ')
GO
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (400, 925, N'Fife                                                                                                ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (401, 926, N'Glasgow City                                                                                        ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (402, 927, N'Highland                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (403, 928, N'Inverclyde                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (404, 929, N'Midlothian                                                                                          ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (405, 930, N'Moray                                                                                               ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (406, 931, N'North Ayrshire                                                                                      ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (407, 932, N'North Lanarkshire                                                                                   ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (408, 933, N'Orkney Islands                                                                                      ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (409, 934, N'Perth and Kinross                                                                                   ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (410, 935, N'Renfrewshire                                                                                        ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (411, 936, N'Shetland Islands                                                                                    ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (412, 937, N'South Ayrshire                                                                                      ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (413, 938, N'South Lanarkshire                                                                                   ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (414, 939, N'Stirling                                                                                            ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (415, 940, N'West Lothian                                                                                        ')
INSERT [dbo].[Local_Authority_District_NDS] ([Local_Authority_District_ID], [code], [label]) VALUES (416, 941, N'Western Isles                                                                                       ')
SET IDENTITY_INSERT [dbo].[Local_Authority_District_NDS] OFF
GO
SET IDENTITY_INSERT [dbo].[Period_of_Day_NDS] ON 

INSERT [dbo].[Period_of_Day_NDS] ([Period_of_Day_ID], [code], [label], [start_time], [end_time]) VALUES (1, 1, N'Morning: 5am-12pm                                                                                   ', CAST(N'05:00:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[Period_of_Day_NDS] ([Period_of_Day_ID], [code], [label], [start_time], [end_time]) VALUES (2, 2, N'Afternoon: 12pm-5pm                                                                                 ', CAST(N'12:00:00' AS Time), CAST(N'17:00:00' AS Time))
INSERT [dbo].[Period_of_Day_NDS] ([Period_of_Day_ID], [code], [label], [start_time], [end_time]) VALUES (3, 3, N'Evening: 5pm-9pm                                                                                    ', CAST(N'17:00:00' AS Time), CAST(N'21:00:00' AS Time))
INSERT [dbo].[Period_of_Day_NDS] ([Period_of_Day_ID], [code], [label], [start_time], [end_time]) VALUES (4, 4, N'Night: 9pm-5am                                                                                      ', CAST(N'21:00:00' AS Time), CAST(N'05:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[Period_of_Day_NDS] OFF
GO
SET IDENTITY_INSERT [dbo].[Road_Type_NDS] ON 

INSERT [dbo].[Road_Type_NDS] ([Road_Type_ID], [code], [label]) VALUES (1, 1, N'Roundabout                                                                                          ')
INSERT [dbo].[Road_Type_NDS] ([Road_Type_ID], [code], [label]) VALUES (2, 2, N'One way street                                                                                      ')
INSERT [dbo].[Road_Type_NDS] ([Road_Type_ID], [code], [label]) VALUES (3, 3, N'Dual carriageway                                                                                    ')
INSERT [dbo].[Road_Type_NDS] ([Road_Type_ID], [code], [label]) VALUES (4, 6, N'Single carriageway                                                                                  ')
INSERT [dbo].[Road_Type_NDS] ([Road_Type_ID], [code], [label]) VALUES (5, 7, N'Slip road                                                                                           ')
INSERT [dbo].[Road_Type_NDS] ([Road_Type_ID], [code], [label]) VALUES (6, 9, N'Unknown                                                                                             ')
INSERT [dbo].[Road_Type_NDS] ([Road_Type_ID], [code], [label]) VALUES (7, 12, N'One way street/Slip road                                                                            ')
INSERT [dbo].[Road_Type_NDS] ([Road_Type_ID], [code], [label]) VALUES (8, -1, N'Data missing or out of range                                                                        ')
SET IDENTITY_INSERT [dbo].[Road_Type_NDS] OFF
GO
SET IDENTITY_INSERT [dbo].[Severity_NDS] ON 

INSERT [dbo].[Severity_NDS] ([Severity_ID], [code], [label]) VALUES (1, 1, N'Fatal                                                                                               ')
INSERT [dbo].[Severity_NDS] ([Severity_ID], [code], [label]) VALUES (2, 2, N'Serious                                                                                             ')
INSERT [dbo].[Severity_NDS] ([Severity_ID], [code], [label]) VALUES (3, 3, N'Slight                                                                                              ')
SET IDENTITY_INSERT [dbo].[Severity_NDS] OFF
GO
SET IDENTITY_INSERT [dbo].[Sex_of_Person_NDS] ON 

INSERT [dbo].[Sex_of_Person_NDS] ([Sex_of_Person_ID], [code], [label]) VALUES (1, 1, N'Male                                                                                                ')
INSERT [dbo].[Sex_of_Person_NDS] ([Sex_of_Person_ID], [code], [label]) VALUES (2, 2, N'Female                                                                                              ')
INSERT [dbo].[Sex_of_Person_NDS] ([Sex_of_Person_ID], [code], [label]) VALUES (3, 3, N'Not known                                                                                           ')
INSERT [dbo].[Sex_of_Person_NDS] ([Sex_of_Person_ID], [code], [label]) VALUES (4, -1, N'Data missing or out of range                                                                        ')
SET IDENTITY_INSERT [dbo].[Sex_of_Person_NDS] OFF
GO
INSERT [dbo].[Source_NDS] ([Source_ID], [Name], [CreatedDate], [UpdatedDate]) VALUES (1, N'accidents', NULL, NULL)
INSERT [dbo].[Source_NDS] ([Source_ID], [Name], [CreatedDate], [UpdatedDate]) VALUES (2, N'postcodes', NULL, NULL)
INSERT [dbo].[Source_NDS] ([Source_ID], [Name], [CreatedDate], [UpdatedDate]) VALUES (3, N'vehicles', NULL, NULL)
INSERT [dbo].[Source_NDS] ([Source_ID], [Name], [CreatedDate], [UpdatedDate]) VALUES (4, N'casualtes', NULL, NULL)
INSERT [dbo].[Source_NDS] ([Source_ID], [Name], [CreatedDate], [UpdatedDate]) VALUES (5, N'PCD_OA', NULL, NULL)
GO
INSERT [dbo].[Status_NDS] ([Status_ID], [Name], [CreatedDate], [UpdatedDate]) VALUES (0, N'non-activity', CAST(N'2021-11-20T19:22:40.317' AS DateTime), CAST(N'2021-11-20T19:22:40.317' AS DateTime))
INSERT [dbo].[Status_NDS] ([Status_ID], [Name], [CreatedDate], [UpdatedDate]) VALUES (1, N'activity', CAST(N'2021-11-20T19:22:40.313' AS DateTime), CAST(N'2021-11-20T19:22:40.313' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Urban_Rural_NDS] ON 

INSERT [dbo].[Urban_Rural_NDS] ([Urban_Rural_ID], [code], [label]) VALUES (1, 1, N'Urban                                                                                               ')
INSERT [dbo].[Urban_Rural_NDS] ([Urban_Rural_ID], [code], [label]) VALUES (2, 2, N'Rural                                                                                               ')
INSERT [dbo].[Urban_Rural_NDS] ([Urban_Rural_ID], [code], [label]) VALUES (3, 3, N'Unallocated                                                                                         ')
SET IDENTITY_INSERT [dbo].[Urban_Rural_NDS] OFF
GO
SET IDENTITY_INSERT [dbo].[Vehicle_Type_NDS] ON 

INSERT [dbo].[Vehicle_Type_NDS] ([Vehicle_Type_ID], [code], [label]) VALUES (1, 1, N'Pedal cycle                                                                                         ')
INSERT [dbo].[Vehicle_Type_NDS] ([Vehicle_Type_ID], [code], [label]) VALUES (2, 2, N'Motorcycle 50cc and under                                                                           ')
INSERT [dbo].[Vehicle_Type_NDS] ([Vehicle_Type_ID], [code], [label]) VALUES (3, 3, N'Motorcycle 125cc and under                                                                          ')
INSERT [dbo].[Vehicle_Type_NDS] ([Vehicle_Type_ID], [code], [label]) VALUES (4, 4, N'Motorcycle over 125cc and up to 500cc                                                               ')
INSERT [dbo].[Vehicle_Type_NDS] ([Vehicle_Type_ID], [code], [label]) VALUES (5, 5, N'Motorcycle over 500cc                                                                               ')
INSERT [dbo].[Vehicle_Type_NDS] ([Vehicle_Type_ID], [code], [label]) VALUES (6, 8, N'Taxi/Private hire car                                                                               ')
INSERT [dbo].[Vehicle_Type_NDS] ([Vehicle_Type_ID], [code], [label]) VALUES (7, 9, N'Car                                                                                                 ')
INSERT [dbo].[Vehicle_Type_NDS] ([Vehicle_Type_ID], [code], [label]) VALUES (8, 10, N'Minibus (8 - 16 passenger seats)                                                                    ')
INSERT [dbo].[Vehicle_Type_NDS] ([Vehicle_Type_ID], [code], [label]) VALUES (9, 11, N'Bus or coach (17 or more pass seats)                                                                ')
INSERT [dbo].[Vehicle_Type_NDS] ([Vehicle_Type_ID], [code], [label]) VALUES (10, 16, N'Ridden horse                                                                                        ')
INSERT [dbo].[Vehicle_Type_NDS] ([Vehicle_Type_ID], [code], [label]) VALUES (11, 17, N'Agricultural vehicle                                                                                ')
INSERT [dbo].[Vehicle_Type_NDS] ([Vehicle_Type_ID], [code], [label]) VALUES (12, 18, N'Tram                                                                                                ')
INSERT [dbo].[Vehicle_Type_NDS] ([Vehicle_Type_ID], [code], [label]) VALUES (13, 19, N'Van / Goods 3.5 tonnes mgw or under                                                                 ')
INSERT [dbo].[Vehicle_Type_NDS] ([Vehicle_Type_ID], [code], [label]) VALUES (14, 20, N'Goods over 3.5t. and under 7.5t                                                                     ')
INSERT [dbo].[Vehicle_Type_NDS] ([Vehicle_Type_ID], [code], [label]) VALUES (15, 21, N'Goods 7.5 tonnes mgw and over                                                                       ')
INSERT [dbo].[Vehicle_Type_NDS] ([Vehicle_Type_ID], [code], [label]) VALUES (16, 22, N'Mobility scooter                                                                                    ')
INSERT [dbo].[Vehicle_Type_NDS] ([Vehicle_Type_ID], [code], [label]) VALUES (17, 23, N'Electric motorcycle                                                                                 ')
INSERT [dbo].[Vehicle_Type_NDS] ([Vehicle_Type_ID], [code], [label]) VALUES (18, 90, N'Other vehicle                                                                                       ')
INSERT [dbo].[Vehicle_Type_NDS] ([Vehicle_Type_ID], [code], [label]) VALUES (19, 97, N'Motorcycle - unknown cc                                                                             ')
INSERT [dbo].[Vehicle_Type_NDS] ([Vehicle_Type_ID], [code], [label]) VALUES (20, 98, N'Goods vehicle - unknown weight                                                                      ')
INSERT [dbo].[Vehicle_Type_NDS] ([Vehicle_Type_ID], [code], [label]) VALUES (21, -1, N'Data missing or out of range                                                                        ')
SET IDENTITY_INSERT [dbo].[Vehicle_Type_NDS] OFF
GO
