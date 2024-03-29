USE [master]
GO
/****** Object:  Database [Motorento]    Script Date: 29-Oct-21 1:48:58 PM ******/
CREATE DATABASE [Motorento]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Motorento', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Motorento.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Motorento_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Motorento_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Motorento] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Motorento].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Motorento] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Motorento] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Motorento] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Motorento] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Motorento] SET ARITHABORT OFF 
GO
ALTER DATABASE [Motorento] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Motorento] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Motorento] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Motorento] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Motorento] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Motorento] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Motorento] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Motorento] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Motorento] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Motorento] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Motorento] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Motorento] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Motorento] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Motorento] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Motorento] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Motorento] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Motorento] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Motorento] SET RECOVERY FULL 
GO
ALTER DATABASE [Motorento] SET  MULTI_USER 
GO
ALTER DATABASE [Motorento] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Motorento] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Motorento] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Motorento] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Motorento] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Motorento] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Motorento', N'ON'
GO
ALTER DATABASE [Motorento] SET QUERY_STORE = OFF
GO
USE [Motorento]
GO
/****** Object:  Table [dbo].[Branches]    Script Date: 29-Oct-21 1:48:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branches](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[latitude] [decimal](8, 6) NOT NULL,
	[longitude] [decimal](9, 6) NOT NULL,
	[branchName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Branches] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 29-Oct-21 1:48:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[modelId] [int] NOT NULL,
	[mileage] [numeric](10, 2) NOT NULL,
	[pic] [nvarchar](max) NULL,
	[inWorkingOrder] [bit] NOT NULL,
	[licensePlateNumber] [nvarchar](9) NOT NULL,
	[branch] [int] NOT NULL,
 CONSTRAINT [PK_Cars] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Models]    Script Date: 29-Oct-21 1:48:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Models](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[manufacturer] [nvarchar](50) NOT NULL,
	[modelName] [nvarchar](50) NOT NULL,
	[dailyPrice] [numeric](19, 4) NOT NULL,
	[delayPricePerDay] [numeric](19, 4) NOT NULL,
	[manufactureYear] [date] NOT NULL,
	[gear] [bit] NOT NULL,
 CONSTRAINT [PK_Models] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 29-Oct-21 1:48:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[startDate] [date] NOT NULL,
	[endDate] [date] NOT NULL,
	[dateReturned] [date] NULL,
	[userName] [nvarchar](50) NOT NULL,
	[carId] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 29-Oct-21 1:48:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userName] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[role] [nvarchar](10) NOT NULL,
	[firstName] [nvarchar](50) NOT NULL,
	[lastName] [nvarchar](50) NOT NULL,
	[birthDate] [date] NULL,
	[sex] [bit] NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[pic] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Branches] ON 

INSERT [dbo].[Branches] ([id], [address], [latitude], [longitude], [branchName]) VALUES (1, N'Lipa Karpel 9 Givat Shmuel', CAST(32.076936 AS Decimal(8, 6)), CAST(34.849057 AS Decimal(9, 6)), N'Givat Shmuel')
INSERT [dbo].[Branches] ([id], [address], [latitude], [longitude], [branchName]) VALUES (2, N'Haarad 5 Tel Aviv', CAST(32.111019 AS Decimal(8, 6)), CAST(34.841125 AS Decimal(9, 6)), N'Tel Aviv')
INSERT [dbo].[Branches] ([id], [address], [latitude], [longitude], [branchName]) VALUES (3, N'Hashura 11 Ramat Gan', CAST(32.081303 AS Decimal(8, 6)), CAST(34.823237 AS Decimal(9, 6)), N'Ramat Gan')
SET IDENTITY_INSERT [dbo].[Branches] OFF
GO
SET IDENTITY_INSERT [dbo].[Cars] ON 

INSERT [dbo].[Cars] ([id], [modelId], [mileage], [pic], [inWorkingOrder], [licensePlateNumber], [branch]) VALUES (1, 1, CAST(1000.00 AS Numeric(10, 2)), N'https://upload.wikimedia.org/wikipedia/commons/1/19/Brazilian_Honda_Civic_touring_2017_%28cropped%29.jpg', 1, N'123456789', 1)
INSERT [dbo].[Cars] ([id], [modelId], [mileage], [pic], [inWorkingOrder], [licensePlateNumber], [branch]) VALUES (2, 2, CAST(1200.00 AS Numeric(10, 2)), N'https://www.suzuki.co.il/files/76bdce58c4f0e8809891b4e45dcaeda6/styles/model_by_color/public/field/image/0003_1.png', 1, N'987654321', 2)
INSERT [dbo].[Cars] ([id], [modelId], [mileage], [pic], [inWorkingOrder], [licensePlateNumber], [branch]) VALUES (3, 3, CAST(2400.00 AS Numeric(10, 2)), N'https://www.mitsubishi-israel.co.il/wp-content/uploads/%D7%AA%D7%9E%D7%95%D7%A0%D7%94-%D7%A8%D7%90%D7%A9%D7%99%D7%AA-%D7%90%D7%90%D7%95%D7%98%D7%9C%D7%A0%D7%93%D7%A85.png', 1, N'132465798', 3)
INSERT [dbo].[Cars] ([id], [modelId], [mileage], [pic], [inWorkingOrder], [licensePlateNumber], [branch]) VALUES (4, 4, CAST(200.00 AS Numeric(10, 2)), N'https://upload.wikimedia.org/wikipedia/commons/9/9c/2017_Renault_Megane_Dynamique_S_NAV_DC_1.5_Front.jpg', 1, N'111222333', 1)
INSERT [dbo].[Cars] ([id], [modelId], [mileage], [pic], [inWorkingOrder], [licensePlateNumber], [branch]) VALUES (5, 5, CAST(2300.00 AS Numeric(10, 2)), N'https://upload.wikimedia.org/wikipedia/commons/e/ea/2018_Hyundai_i30_%28PD_MY18%29_Active_5-door_hatchback_%282018-08-06%29_01.jpg', 1, N'333222111', 2)
INSERT [dbo].[Cars] ([id], [modelId], [mileage], [pic], [inWorkingOrder], [licensePlateNumber], [branch]) VALUES (6, 4, CAST(1600.00 AS Numeric(10, 2)), N'https://www.cars-data.com/pictures/thumbs/350px/hyundai/hyundai-i30_4667_1.jpg', 0, N'464646464', 1)
SET IDENTITY_INSERT [dbo].[Cars] OFF
GO
SET IDENTITY_INSERT [dbo].[Models] ON 

INSERT [dbo].[Models] ([id], [manufacturer], [modelName], [dailyPrice], [delayPricePerDay], [manufactureYear], [gear]) VALUES (1, N'Honda', N'Civic', CAST(500.0000 AS Numeric(19, 4)), CAST(2000.0000 AS Numeric(19, 4)), CAST(N'1998-01-01' AS Date), 1)
INSERT [dbo].[Models] ([id], [manufacturer], [modelName], [dailyPrice], [delayPricePerDay], [manufactureYear], [gear]) VALUES (2, N'Suzuki', N'Swift', CAST(400.0000 AS Numeric(19, 4)), CAST(1500.0000 AS Numeric(19, 4)), CAST(N'1999-01-01' AS Date), 0)
INSERT [dbo].[Models] ([id], [manufacturer], [modelName], [dailyPrice], [delayPricePerDay], [manufactureYear], [gear]) VALUES (3, N'Mitsubishi', N'Outlander', CAST(700.0000 AS Numeric(19, 4)), CAST(4300.0000 AS Numeric(19, 4)), CAST(N'2012-01-01' AS Date), 1)
INSERT [dbo].[Models] ([id], [manufacturer], [modelName], [dailyPrice], [delayPricePerDay], [manufactureYear], [gear]) VALUES (4, N'Renault', N'Megane', CAST(400.0000 AS Numeric(19, 4)), CAST(1900.0000 AS Numeric(19, 4)), CAST(N'2001-01-01' AS Date), 0)
INSERT [dbo].[Models] ([id], [manufacturer], [modelName], [dailyPrice], [delayPricePerDay], [manufactureYear], [gear]) VALUES (5, N'Hyundai', N'i30', CAST(600.0000 AS Numeric(19, 4)), CAST(3200.0000 AS Numeric(19, 4)), CAST(N'2014-01-01' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Models] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [startDate], [endDate], [dateReturned], [userName], [carId]) VALUES (1, CAST(N'2021-04-01' AS Date), CAST(N'2021-04-08' AS Date), CAST(N'2021-04-08' AS Date), N'BobBuilder', 1)
INSERT [dbo].[Orders] ([id], [startDate], [endDate], [dateReturned], [userName], [carId]) VALUES (2, CAST(N'2021-04-02' AS Date), CAST(N'2021-04-09' AS Date), CAST(N'2021-04-09' AS Date), N'HeyJude', 2)
INSERT [dbo].[Orders] ([id], [startDate], [endDate], [dateReturned], [userName], [carId]) VALUES (3, CAST(N'2021-05-03' AS Date), CAST(N'2021-05-07' AS Date), CAST(N'2021-05-06' AS Date), N'SammyFireman', 3)
INSERT [dbo].[Orders] ([id], [startDate], [endDate], [dateReturned], [userName], [carId]) VALUES (4, CAST(N'2021-05-04' AS Date), CAST(N'2021-05-06' AS Date), CAST(N'2021-05-05' AS Date), N'ShulaGula', 4)
INSERT [dbo].[Orders] ([id], [startDate], [endDate], [dateReturned], [userName], [carId]) VALUES (5, CAST(N'2021-06-01' AS Date), CAST(N'2021-06-02' AS Date), CAST(N'2021-06-05' AS Date), N'Whoever', 5)
INSERT [dbo].[Orders] ([id], [startDate], [endDate], [dateReturned], [userName], [carId]) VALUES (6, CAST(N'2021-06-06' AS Date), CAST(N'2021-06-07' AS Date), CAST(N'2021-06-08' AS Date), N'BobBuilder', 1)
INSERT [dbo].[Orders] ([id], [startDate], [endDate], [dateReturned], [userName], [carId]) VALUES (7, CAST(N'2021-07-07' AS Date), CAST(N'2021-07-09' AS Date), CAST(N'2021-07-11' AS Date), N'HeyJude', 2)
INSERT [dbo].[Orders] ([id], [startDate], [endDate], [dateReturned], [userName], [carId]) VALUES (8, CAST(N'2021-09-09' AS Date), CAST(N'2021-09-11' AS Date), CAST(N'2021-09-12' AS Date), N'ShulaGula', 1)
INSERT [dbo].[Orders] ([id], [startDate], [endDate], [dateReturned], [userName], [carId]) VALUES (9, CAST(N'2021-10-29' AS Date), CAST(N'2021-12-01' AS Date), NULL, N'BobBuilder', 1)
INSERT [dbo].[Orders] ([id], [startDate], [endDate], [dateReturned], [userName], [carId]) VALUES (10, CAST(N'2021-10-29' AS Date), CAST(N'2021-12-02' AS Date), NULL, N'HeyJude', 2)
INSERT [dbo].[Orders] ([id], [startDate], [endDate], [dateReturned], [userName], [carId]) VALUES (11, CAST(N'2021-10-29' AS Date), CAST(N'2021-12-03' AS Date), NULL, N'SammyFireman', 3)
INSERT [dbo].[Orders] ([id], [startDate], [endDate], [dateReturned], [userName], [carId]) VALUES (12, CAST(N'2021-10-29' AS Date), CAST(N'2021-12-04' AS Date), NULL, N'Whoever', 5)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[Users] ([userName], [password], [role], [firstName], [lastName], [birthDate], [sex], [email], [pic]) VALUES (N'BobBuilder', N'yeswecan', N'user', N'Bob', N'Banai', CAST(N'1970-02-03' AS Date), 1, N'bobbyb@gmail.com', N'https://upload.wikimedia.org/wikipedia/commons/f/f9/B.o.B._performing.jpg')
INSERT [dbo].[Users] ([userName], [password], [role], [firstName], [lastName], [birthDate], [sex], [email], [pic]) VALUES (N'Dominator', N'TheWorldIsMine', N'admin', N'Elon', N'Musk', CAST(N'1971-06-28' AS Date), 1, N'elonmusk@gmail.com', N'https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Elon_Musk_Royal_Society_%28crop1%29.jpg/220px-Elon_Musk_Royal_Society_%28crop1%29.jpg')
INSERT [dbo].[Users] ([userName], [password], [role], [firstName], [lastName], [birthDate], [sex], [email], [pic]) VALUES (N'HeyJude', N'judajuda', N'user', N'Judy', N'Lotz', CAST(N'1994-03-27' AS Date), 0, N'judajuda@gmail.com', N'https://media1.popsugar-assets.com/files/thumbor/aE3EHrt_FvLGy30jPKfZPWg__qM/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2018/08/17/651/n/1922283/99dde2155b76ddb9115023.04123404_/i/World-Highest-Paid-Actress-2018.jpg')
INSERT [dbo].[Users] ([userName], [password], [role], [firstName], [lastName], [birthDate], [sex], [email], [pic]) VALUES (N'Misha123', N'babushka', N'employee', N'Misha', N'Polak', CAST(N'1980-05-01' AS Date), 1, N'misha123@gmail.com', N'https://akm-img-a-in.tosshub.com/indiatoday/images/story/201403/oscar_storysize-650_030614020242.jpg')
INSERT [dbo].[Users] ([userName], [password], [role], [firstName], [lastName], [birthDate], [sex], [email], [pic]) VALUES (N'ruthacat', N'meowmeow', N'employee', N'Ruth', N'Newman', CAST(N'1990-09-21' AS Date), 0, N'ruthacat@gmail.com', N'https://static.timesofisrael.com/www/uploads/2020/06/AP_20041340169253-e1593065007512.jpg')
INSERT [dbo].[Users] ([userName], [password], [role], [firstName], [lastName], [birthDate], [sex], [email], [pic]) VALUES (N'SammyFireman', N'nowecant', N'user', N'Sam', N'Cabai', CAST(N'1991-10-12' AS Date), 1, N'sammyc@gmail.com', N'https://yt3.ggpht.com/ytc/AKedOLSnG_TpoixeuFvCEcnaymWICr118O-lpOvd-F33RA=s900-c-k-c0x00ffffff-no-rj')
INSERT [dbo].[Users] ([userName], [password], [role], [firstName], [lastName], [birthDate], [sex], [email], [pic]) VALUES (N'ShulaGula', N'sunflowerz', N'user', N'Shula', N'Meshulam', CAST(N'1995-02-24' AS Date), 0, N'shuliguli@gmail.com', N'https://i.kym-cdn.com/entries/icons/original/000/037/359/cover1.jpg')
INSERT [dbo].[Users] ([userName], [password], [role], [firstName], [lastName], [birthDate], [sex], [email], [pic]) VALUES (N'Whoever', N'whatever', N'user', N'Timmy', N'Hawkins', CAST(N'1992-06-13' AS Date), 1, N'igjm2585@gmail.com', N'https://static.wikia.nocookie.net/the-muse-list/images/1/1d/Togashi_Yuuta.png/revision/latest/top-crop/width/360/height/450?cb=20200627232549')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Cars__599406EE904F62E2]    Script Date: 29-Oct-21 1:48:58 PM ******/
ALTER TABLE [dbo].[Cars] ADD UNIQUE NONCLUSTERED 
(
	[licensePlateNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__AB6E6164C1673CF2]    Script Date: 29-Oct-21 1:48:58 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD FOREIGN KEY([branch])
REFERENCES [dbo].[Branches] ([id])
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD FOREIGN KEY([modelId])
REFERENCES [dbo].[Models] ([id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([carId])
REFERENCES [dbo].[Cars] ([id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([userName])
REFERENCES [dbo].[Users] ([userName])
GO
USE [master]
GO
ALTER DATABASE [Motorento] SET  READ_WRITE 
GO
