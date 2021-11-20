create database TTKD_23_METADATA
go
use TTKD_23_METADATA
Go
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[Data_Flow]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
  DROP TABLE [dbo].[Data_Flow]
GO

CREATE TABLE [dbo].[Data_Flow] (
  [ID] int IDENTITY(1, 1) NOT NULL,
  [TableName] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [LSET] datetime NULL,
  [CET] datetime NULL
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[Data_Flow]
ADD CONSTRAINT [PK_Data_Flow] 
PRIMARY KEY CLUSTERED ([ID])
WITH (
  PAD_INDEX = OFF,
  IGNORE_DUP_KEY = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO

SET IDENTITY_INSERT [dbo].[Data_Flow] ON
GO

INSERT INTO [dbo].[Data_Flow] ([ID], [TableName])
VALUES 
  (1, N'accidents')
GO
INSERT INTO [dbo].[Data_Flow] ([ID], [TableName])
VALUES 
  (2, N'postcodes')
GO
INSERT INTO [dbo].[Data_Flow] ([ID], [TableName])
VALUES 
  (3, N'vehicles')
GO
INSERT INTO [dbo].[Data_Flow] ([ID], [TableName])
VALUES 
  (4, N'casualtes')
GO
INSERT INTO [dbo].[Data_Flow] ([ID], [TableName])
VALUES 
  (5, N'PCD_OA')
GO
INSERT INTO [dbo].[Data_Flow] ([ID], [TableName])
VALUES 
  (6, N'accident_severity')
GO
INSERT INTO [dbo].[Data_Flow] ([ID], [TableName])
VALUES 
  (7, N'local_authority_district')
GO
INSERT INTO [dbo].[Data_Flow] ([ID], [TableName])
VALUES 
  (8, N'sex_of_casualty')
GO
INSERT INTO [dbo].[Data_Flow] ([ID], [TableName])
VALUES 
  (9, N'casualty_type')
GO
INSERT INTO [dbo].[Data_Flow] ([ID], [TableName])
VALUES 
  (10, N'age_of_casualty')
GO
INSERT INTO [dbo].[Data_Flow] ([ID], [TableName])
VALUES 
  (11, N'vehicle type')
GO
INSERT INTO [dbo].[Data_Flow] ([ID], [TableName])
VALUES 
  (12, N'built_up_road_type')
GO
INSERT INTO [dbo].[Data_Flow] ([ID], [TableName])
VALUES 
  (13, N'journey_purpose')
GO
INSERT INTO [dbo].[Data_Flow] ([ID], [TableName])
VALUES 
  (14, N'road_type')
GO
INSERT INTO [dbo].[Data_Flow] ([ID], [TableName])
VALUES 
  (15, N'urban_rural_area')
GO