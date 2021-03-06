CREATE DATABASE [TTKD_23_METADATA]
GO
USE [TTKD_23_METADATA]

CREATE TABLE [dbo].[Data_Flow](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [varchar](50) NULL,
	[LSET] [datetime] NULL,
	[CET] [datetime] NULL,
 CONSTRAINT [PK_Data_Flow] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DDS]    Script Date: 2021/12/25 21:57:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DDS](
	[ID] [int] NULL,
	[TableName] [nchar](50) NULL,
	[LSET] [datetime] NULL,
	[CET] [datetime] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Data_Flow] ON 

INSERT [dbo].[Data_Flow] ([ID], [TableName], [LSET], [CET]) VALUES (1, N'accidents', CAST(N'2001-12-19T17:33:37.730' AS DateTime), CAST(N'2021-12-20T22:13:55.787' AS DateTime))
INSERT [dbo].[Data_Flow] ([ID], [TableName], [LSET], [CET]) VALUES (2, N'postcodes', CAST(N'2001-12-19T17:31:44.467' AS DateTime), CAST(N'2021-11-24T22:39:16.877' AS DateTime))
INSERT [dbo].[Data_Flow] ([ID], [TableName], [LSET], [CET]) VALUES (3, N'vehicles', CAST(N'2001-12-19T17:37:36.770' AS DateTime), CAST(N'2021-11-24T22:39:16.877' AS DateTime))
INSERT [dbo].[Data_Flow] ([ID], [TableName], [LSET], [CET]) VALUES (4, N'casualtes', CAST(N'2001-12-19T17:40:25.920' AS DateTime), CAST(N'2021-11-24T22:39:16.877' AS DateTime))
INSERT [dbo].[Data_Flow] ([ID], [TableName], [LSET], [CET]) VALUES (5, N'PCD_OA', CAST(N'2021-12-02T23:03:22.833' AS DateTime), CAST(N'2021-11-24T22:39:16.880' AS DateTime))
SET IDENTITY_INSERT [dbo].[Data_Flow] OFF
GO
INSERT [dbo].[DDS] ([ID], [TableName], [LSET], [CET]) VALUES (1, N'Accidents', CAST(N'2001-12-21T14:11:12.997' AS DateTime), CAST(N'2021-12-21T14:07:29.460' AS DateTime))
INSERT [dbo].[DDS] ([ID], [TableName], [LSET], [CET]) VALUES (2, N'Vehicles', NULL, NULL)
INSERT [dbo].[DDS] ([ID], [TableName], [LSET], [CET]) VALUES (3, N'Casualties', NULL, NULL)
INSERT [dbo].[DDS] ([ID], [TableName], [LSET], [CET]) VALUES (4, N'Geography', CAST(N'2021-12-21T21:58:47.617' AS DateTime), CAST(N'2021-12-21T21:58:46.937' AS DateTime))
INSERT [dbo].[DDS] ([ID], [TableName], [LSET], [CET]) VALUES (5, N'Age', CAST(N'2001-12-21T14:11:12.990' AS DateTime), CAST(N'2021-12-21T21:58:47.630' AS DateTime))
INSERT [dbo].[DDS] ([ID], [TableName], [LSET], [CET]) VALUES (6, N'DateTime', NULL, NULL)
