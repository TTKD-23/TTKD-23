SELECT [Accident_Index]
      ,[Location_Easting_OSGR]
      ,[Location_Northing_OSGR]
      ,[Longitude]
      ,[Latitude]
      ,[Accident_Severity]
      ,[Number_of_Vehicles]
      ,[Number_of_Casualties]
      ,[Date]
      ,[Day_of_Week]
      ,[Time]
      ,[Local_Authority_(District)]
      ,[Local_Authority_(Highway)]
      ,[Road_Type]
      ,[Speed_limit]
      ,[Light_Conditions]
      ,[Weather_Conditions]
      ,[Road_Surface_Conditions]
      ,[Special_Conditions_at_Site]
      ,[Urban_or_Rural_Area]
      ,[LSOA_of_Accident_Location]
	  ,(select [code] from [TTKD_23_NDS].[dbo].[getPeriodOfDayFromTime](a.[Time])) as Period_of_Day
FROM dbo.Accidents_Stage AS a

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
CREATE VIEW Format_Vehicles_Stage AS
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
CREATE VIEW Format_Casualties_Stage AS
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
CREATE VIEW Format_PCD_OA_Stage AS
SELECT TOP (1000) [pcd7]
      ,[pcd8]
      ,[pcds]
      ,[dointr]
      ,[doterm]
      ,[usertype]
      ,[oa11cd]
      ,[lsoa11cd]
      ,[msoa11cd]
      ,[ladcd]
	  ,SUBSTRING(pcd7, 0, 5) as postcode
FROM [TTKD_23_Stage].[dbo].[PCD_OA_Stage]

SELECT distinct y.Accident_Index, y.postcode, y.Range
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
ORDER BY y.Accident_Index
