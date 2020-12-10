USE [master]
GO
/****** Object:  Database [NhaTroDB]    Script Date: 12/10/2020 12:14:33 PM ******/
CREATE DATABASE [NhaTroDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NhaTroDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\NhaTroDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NhaTroDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\NhaTroDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [NhaTroDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NhaTroDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NhaTroDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NhaTroDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NhaTroDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NhaTroDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NhaTroDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [NhaTroDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NhaTroDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NhaTroDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NhaTroDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NhaTroDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NhaTroDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NhaTroDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NhaTroDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NhaTroDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NhaTroDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [NhaTroDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NhaTroDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NhaTroDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NhaTroDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NhaTroDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NhaTroDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [NhaTroDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NhaTroDB] SET RECOVERY FULL 
GO
ALTER DATABASE [NhaTroDB] SET  MULTI_USER 
GO
ALTER DATABASE [NhaTroDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NhaTroDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NhaTroDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NhaTroDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NhaTroDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'NhaTroDB', N'ON'
GO
ALTER DATABASE [NhaTroDB] SET QUERY_STORE = OFF
GO
USE [NhaTroDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 12/10/2020 12:14:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 12/10/2020 12:14:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[Money] [real] NULL,
	[RoleId] [int] NOT NULL,
	[Phone] [nvarchar](max) NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AreaSearchs]    Script Date: 12/10/2020 12:14:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AreaSearchs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_AreaSearchs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bills]    Script Date: 12/10/2020 12:14:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bills](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TimeChoice] [nvarchar](max) NULL,
	[NumberDatePublish] [int] NOT NULL,
	[PayMoney] [real] NOT NULL,
	[MotelId] [int] NOT NULL,
	[SevicepriceId] [int] NOT NULL,
 CONSTRAINT [PK_Bills] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuyMoneys]    Script Date: 12/10/2020 12:14:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuyMoneys](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdBuy] [nvarchar](max) NULL,
	[Method] [nvarchar](max) NULL,
	[NumberMoney] [real] NOT NULL,
	[Promote] [real] NOT NULL,
	[Receive] [real] NOT NULL,
	[Status] [bit] NOT NULL,
	[Note] [nvarchar](max) NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_BuyMoneys] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Citys]    Script Date: 12/10/2020 12:14:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Citys](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Citys] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Convesation_replys]    Script Date: 12/10/2020 12:14:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Convesation_replys](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Reply] [int] NOT NULL,
	[Time] [datetime2](7) NOT NULL,
	[Status] [nvarchar](max) NULL,
	[UserId] [int] NOT NULL,
	[ConvesationId] [int] NOT NULL,
 CONSTRAINT [PK_Convesation_replys] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Convesations]    Script Date: 12/10/2020 12:14:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Convesations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Time] [datetime2](7) NOT NULL,
	[Status] [nvarchar](max) NULL,
	[UserOneId] [int] NOT NULL,
	[UserTwoId] [int] NOT NULL,
 CONSTRAINT [PK_Convesations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Details]    Script Date: 12/10/2020 12:14:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Details](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NumberBath] [int] NOT NULL,
	[NumberLiving] [int] NOT NULL,
	[TypeofnewId] [int] NOT NULL,
	[Director] [nvarchar](max) NULL,
	[Directormain] [nvarchar](max) NULL,
	[Typelive] [nvarchar](max) NULL,
	[MotelId] [int] NOT NULL,
	[Legal] [nvarchar](max) NULL,
 CONSTRAINT [PK_Details] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Districts]    Script Date: 12/10/2020 12:14:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Districts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[ProvinceId] [int] NOT NULL,
 CONSTRAINT [PK_Districts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 12/10/2020 12:14:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[LastLogOnDate] [datetime2](7) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[Gender] [bit] NOT NULL,
	[EmployeeImage] [varbinary](max) NULL,
	[Birthday] [datetime2](7) NOT NULL,
	[Phone] [nvarchar](max) NULL,
	[AddressOne] [nvarchar](max) NULL,
	[AddressTwo] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[AccountId] [int] NOT NULL,
	[ManageEmployeeId] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 12/10/2020 12:14:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageMotel] [nvarchar](max) NULL,
	[MotelId] [int] NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Motels]    Script Date: 12/10/2020 12:14:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Motels](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdNew] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[Price] [nvarchar](max) NULL,
	[DateUpdate] [datetime2](7) NOT NULL,
	[DateDue] [datetime2](7) NOT NULL,
	[Status] [nvarchar](max) NULL,
	[Verify] [bit] NOT NULL,
	[Address] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[AreaZone] [nvarchar](max) NULL,
	[CityId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Typemotel] [nvarchar](max) NULL,
	[Typeservice] [nvarchar](max) NULL,
	[ProvinceId] [int] NOT NULL,
	[Time] [nvarchar](max) NULL,
 CONSTRAINT [PK_Motels] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 12/10/2020 12:14:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Topics] [nvarchar](max) NULL,
	[Time] [datetime2](7) NOT NULL,
	[Reply] [nvarchar](max) NULL,
	[TopicId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[ParentPostId] [int] NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PriceSearchs]    Script Date: 12/10/2020 12:14:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceSearchs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Number] [nvarchar](max) NULL,
 CONSTRAINT [PK_PriceSearchs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provinces]    Script Date: 12/10/2020 12:14:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provinces](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CityId] [int] NOT NULL,
 CONSTRAINT [PK_Provinces] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/10/2020 12:14:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Serviceprices]    Script Date: 12/10/2020 12:14:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Serviceprices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Typeofnew] [nvarchar](max) NULL,
	[Price] [real] NOT NULL,
	[Date] [int] NOT NULL,
 CONSTRAINT [PK_Serviceprices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topics]    Script Date: 12/10/2020 12:14:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topics](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Date] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Topics] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Typeofnews]    Script Date: 12/10/2020 12:14:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Typeofnews](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Typeofnews] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/10/2020 12:14:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[LastLogOnDate] [datetime2](7) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[Gender] [bit] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[UserImage] [varbinary](max) NULL,
	[AccountId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201103032647_Update foreinkey', N'3.1.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201125094205_DeleteRequire', N'3.1.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201125143715_Editforgrienkey', N'3.1.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201125144637_Editkey', N'3.1.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201127161537_ChangePhoneLocate', N'3.1.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201202173259_Newdata', N'3.1.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201203020021_Edit', N'3.1.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201205032013_newtype', N'3.1.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201205113101_NewData2', N'3.1.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201205122231_NewDataTime', N'3.1.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201205123336_fixdata', N'3.1.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201207055435_editimages', N'3.1.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201209052739_editmotel', N'3.1.9')
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([Id], [Username], [Password], [IsActive], [Money], [RoleId], [Phone]) VALUES (35, N'aaa', N'123', 1, NULL, 1, N'0968320200')
INSERT [dbo].[Accounts] ([Id], [Username], [Password], [IsActive], [Money], [RoleId], [Phone]) VALUES (36, NULL, NULL, 1, NULL, 1, NULL)
INSERT [dbo].[Accounts] ([Id], [Username], [Password], [IsActive], [Money], [RoleId], [Phone]) VALUES (38, N'aaa', N'123', 1, NULL, 4, N'0999')
INSERT [dbo].[Accounts] ([Id], [Username], [Password], [IsActive], [Money], [RoleId], [Phone]) VALUES (39, NULL, N'123', 1, NULL, 1, N'123456789')
INSERT [dbo].[Accounts] ([Id], [Username], [Password], [IsActive], [Money], [RoleId], [Phone]) VALUES (40, NULL, N'123', 1, NULL, 1, N'123456789')
SET IDENTITY_INSERT [dbo].[Accounts] OFF
SET IDENTITY_INSERT [dbo].[Citys] ON 

INSERT [dbo].[Citys] ([Id], [Name]) VALUES (1, N'TP HCM')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (2, N'Hà Nội')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (3, N'Đà Nẵng')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (4, N'Hải Phòng')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (5, N'Bình Dương')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (6, N'Đồng Nai')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (7, N'Cần Thơ')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (8, N'Long An')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (9, N'An Giang')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (10, N'Bà Rịa - Vũng Tàu')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (11, N'Bắc Giang
')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (12, N'Bắc Kạn
')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (13, N'Bạc Liêu
')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (14, N'Bắc Ninh
')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (15, N'Bến Tre
')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (16, N'Bình Định
')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (17, N'Bình Dương

')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (18, N'Bình Phước
')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (19, N'Bình Thuận
')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (20, N'Cà Mau
')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (21, N'Cao Bằng
')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (22, N'Đắk Lắk
')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (23, N'Đắk Nông
')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (24, N'Điện Biên
')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (25, N'Gia Lai
')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (26, N'Hà Giang
')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (27, N'Hà Nam
')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (28, N'Hà Tĩnh
')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (29, N'Hải Dương
')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (30, N'Hậu Giang
')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (31, N'Hòa Bình')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (32, N'Hung Yên')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (33, N'Khánh Hòa')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (34, N'Kiên Giang')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (35, N'Kon Tum')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (36, N'Lai Châu')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (37, N'Lâm Ðồng')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (38, N'Lạng Sơn')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (39, N'Lào Cai')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (40, N'Nam Ðịnh')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (41, N'Nghệ An')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (42, N'Ninh Bình')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (43, N'Ninh Thuận')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (44, N'Phú Thọ')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (45, N'Quãng Bình')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (46, N'Quãng Nam')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (47, N'Quãng Ngãi')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (48, N'Quãng Ninh')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (49, N'Quãng Trị')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (50, N'Sóc Trang')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (51, N'Son La')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (52, N'Tây Ninh')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (53, N'Thái Bình')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (54, N'Thái Nguyên')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (55, N'Thanh Hóa')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (56, N'Thừa Thiên Huế')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (57, N'Tiền Giang')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (58, N'Trà Vinh')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (59, N'Tuyên Quang')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (60, N'Vinh Long')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (61, N'Vinh Phúc')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (62, N'Yên Bái')
INSERT [dbo].[Citys] ([Id], [Name]) VALUES (63, N'Phú Yên')
SET IDENTITY_INSERT [dbo].[Citys] OFF
SET IDENTITY_INSERT [dbo].[Details] ON 

INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [Typelive], [MotelId], [Legal]) VALUES (92, 2, 2, 2, NULL, NULL, N'option1', 97, NULL)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [Typelive], [MotelId], [Legal]) VALUES (93, 2, 1, 4, NULL, NULL, N'Nhà ngõ hẻm', 98, NULL)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [Typelive], [MotelId], [Legal]) VALUES (94, 1, 1, 1, NULL, NULL, N'Nhà ngõ hẻm', 99, NULL)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [Typelive], [MotelId], [Legal]) VALUES (95, 2, 2, 3, NULL, NULL, N'Nhà ngõ hẻm', 100, NULL)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [Typelive], [MotelId], [Legal]) VALUES (96, 1, 1, 1, NULL, NULL, N'Nhà mặt phố, mặt tiền', 101, NULL)
SET IDENTITY_INSERT [dbo].[Details] OFF
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (46, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/MinhHoang%2FCapture_1607417609212?alt=media&token=bd3d1656-3c76-4ad3-bb4e-6c3bed03ffd3', 97)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (47, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/MinhHoang%2FBlack-Box-Testing-Techniques_1607417609201?alt=media&token=a335bb21-adb0-474f-9c09-effd717855e8', 97)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (48, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/MinhHoang%2FPicture1%20-%20Copy_1607417609215?alt=media&token=cac98a72-c9bc-480f-9465-a890a4857e64', 97)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (49, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/MinhHoang%2F4_1607491970402?alt=media&token=3d89dd20-14ee-46b8-ab06-9c8215a43264', 98)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (50, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Lam%20Nha%2F5_1607492145420?alt=media&token=a4278584-05d9-487b-ae94-e2290e41a344', 99)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (51, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Lam%20Nha%2F6_1607492445552?alt=media&token=1b762e8f-49cf-43e2-b60a-950e8cb31e2e', 100)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (52, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/MinhHoang%2F7_1607492548122?alt=media&token=491e693e-5779-44c5-8a39-b7dfa2d72aae', 101)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (53, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/MinhHoang%2F8_1607492548134?alt=media&token=c76ea916-6314-48ea-8aba-45c024c783a9', 101)
SET IDENTITY_INSERT [dbo].[Images] OFF
SET IDENTITY_INSERT [dbo].[Motels] ON 

INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time]) VALUES (97, NULL, N'aa', N'12 tỷ 200 triệu', CAST(N'2020-12-08T15:53:31.6860492' AS DateTime2), CAST(N'2020-12-08T15:53:31.6860332' AS DateTime2), NULL, 0, N'a', N'<html>
<head>
	<title></title>
</head>
<body>
<p>aaa</p>
</body>
</html>
', NULL, N'9', 12, 26, N'Mua', N'Tin VIP 20', 216, N'8 Tuần')
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time]) VALUES (98, NULL, N'Chính chủ cần bán nhà hẻm sang trọng 3 Tháng 2, Diện tích 4x16m.', N'12 tỷ 200 triệu', CAST(N'2020-12-09T12:32:52.2407107' AS DateTime2), CAST(N'2020-12-09T12:32:52.2378336' AS DateTime2), NULL, 0, N'Đường 3 Tháng 2, Phường 12, Quận 10, TP.HCM', N'<html>
<head>
	<title></title>
</head>
<body>
<p>- Vị tr&iacute; sang trọng, khu vực an ninh, c&aacute;ch trung t&acirc;m thương mại Vạn Hạnh Mall chỉ v&agrave;i bước ch&acirc;n, tiện &iacute;ch 300m tập hợp nhiều như Ng&acirc;n h&agrave;ng, si&ecirc;u thị, bệnh viện.<br />
<br />
- Diện t&iacute;ch 4x16m.<br />
<br />
- Nh&agrave; x&acirc;y đẹp hầm trệt, 3 lầu c&oacute; s&acirc;n thượng.<br />
<br />
- Gi&aacute; 12.2 tỷ bớt &iacute;t cho kh&aacute;ch mua b&aacute;n nhanh, tặng to&agrave;n bộ nội thất cao cấp sang trọng cho kh&aacute;ch thiện ch&iacute; nhanh lẹ trước tết.<br />
<br />
- Sổ hồng ch&iacute;nh chủ, ph&aacute;p l&yacute; r&otilde; r&agrave;ng.<br />
<br />
- Li&ecirc;n hệ 0911 709 779 Nam Thủy để được xem nh&agrave; v&agrave; tư vấn th&ocirc;ng tin chi tiết.<br />
<br />
- Bạn đặt 1% niềm tin, t&ocirc;i gửi lại 100% h&agrave;i l&ograve;ng.</p>
</body>
</html>
', NULL, N'64 m2 (4x16)', 1, 26, N'Mua', N'Tin Hot', 175, N'12 Ngày')
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time]) VALUES (99, NULL, N'Bán nhà hẻm vip giá rẻ đường 3/2, Quận 10, DT: 5x13m, 3 lầu, giá 9.8 t', N'9 tỷ 800 triệu', CAST(N'2020-12-09T12:35:46.2602756' AS DateTime2), CAST(N'2020-12-09T12:35:46.2602061' AS DateTime2), NULL, 0, N'Đường 3 Tháng 2, Phường 12, Quận 10, TP.HCM', N'<html>
<head>
	<title></title>
</head>
<body>
<p>B&aacute;n nh&agrave; hẻm vip gi&aacute; rẻ đường 3 Th&aacute;ng 2, Quận 10, cung đường thương mại.<br />
- Gi&aacute;: 9.8 tỷ.<br />
- Diện t&iacute;ch: 5 x 13m.<br />
- Kết cấu: Trệt + 3 lầu đẹp.<br />
- Ph&aacute;p l&yacute;: Sổ hồng Ch&iacute;nh Chủ.<br />
- Qu&yacute; kh&aacute;ch h&agrave;ng c&oacute; sẳn t&agrave;i ch&iacute;nh 9.8 tỷ trong tay h&atilde;y gọi ngay: 0911709779- 0908.942.900 Thu Thủy Cảm ơn qu&yacute; kh&aacute;ch h&agrave;ng đ&atilde; quan t&acirc;m.</p>
</body>
</html>
', NULL, N'65 m2 (5x13)', 11, 26, N'Mua', N'Tin Hot', 207, N'14 Ngày')
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time]) VALUES (100, NULL, N'Nhà rất đẹp khu cư xá Nguyễn Trung Trực đường 3/2 quận 10. DT: 5x16.5m', N'14 tỷ 200 triệu', CAST(N'2020-12-09T12:40:46.6891502' AS DateTime2), CAST(N'2020-12-09T12:40:46.6890603' AS DateTime2), NULL, 0, N'Đường 3 Tháng 2, Phường 12, Quận 10, TP.HCM', N'<html>
<head>
	<title></title>
</head>
<body>
<p>&quot;B&aacute;n nh&agrave; hẻm 12m c&oacute; c&acirc;y xanh 2 b&ecirc;n đường 3/2 khu cư x&aacute; Nguyễn Trung Trực, phường 12 Quận 10.<br />
<br />
- Vị tr&iacute;: Khu d&acirc;n cư Cư X&aacute; Nguyễn Trung Trực, gần si&ecirc;u thị S&agrave;i G&ograve;n, gần trường học, bệnh viện 115, bệnh viện nhi đồng 1, trung t&acirc;m thương mại Vạn Hạnh Mall,...<br />
-Khu vực cực kỳ an ninh, đường sạch sẽ tho&aacute;ng m&aacute;t, hiện đang cho c&ocirc;ng ty thu&ecirc; l&agrave;m văn ph&ograve;ng.<br />
<br />
-Đường rộng 12m c&oacute; vỉa h&egrave; c&acirc;y xanh.<br />
<br />
- Kết cấu nh&agrave; trệt 2 lầu đang cho c&ocirc;ng ty thu&ecirc; l&agrave;m văn ph&ograve;ng.<br />
<br />
-Diện t&iacute;ch đất: đẹp 5x16.5m.<br />
<br />
- Gi&aacute; b&aacute;n: 14.2 tỷ TL.<br />
<br />
Nh&agrave; đẹp như h&igrave;nh.<br />
Li&ecirc;n hệ: 0911.709.779 Ms Thủy</p>
</body>
</html>
', NULL, N' 82 m2 (5x16,5)', 19, 26, N'Mua', N'Tin Hot', 278, N'4 Tuần')
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time]) VALUES (101, NULL, N'Bán gấp nhà HXH Ba Tháng Hai Phường 14 Quận 10 52m2 giá 7.9 tỷ.', N'7 tỷ 900 triệu', CAST(N'2020-12-09T12:42:29.4832000' AS DateTime2), CAST(N'2020-12-09T12:42:29.4831202' AS DateTime2), NULL, 0, N'Đường 3 Tháng 2, Phường 14, Quận 10, TPHCM', N'<html>
<head>
	<title></title>
</head>
<body>
<p>+ Nh&agrave; cũ, thiết kế 1 trệt, 1 lầu, s&acirc;n thượng hiện tại đang c&oacute; 6 ph&ograve;ng cho người th&acirc;n thu&ecirc; gi&aacute; hữu nghị 15 triệu/th&aacute;ng: 2 ph&ograve;ng tầng trệt, 4 ph&ograve;ng lầu 1, ph&ograve;ng kh&aacute;ch để gần 20 xe m&aacute;y.<br />
+ Ngang thực tế hơn 3m, hẻm 5m, xe hơi c&oacute; thể v&agrave;o nh&agrave;, c&aacute;ch 10 bước ch&acirc;n ra hẻm nhựa xe tải phi v&egrave;o v&egrave;o. Khu vực kinh doanh cafe, tr&agrave; sữa sang trọng, nhộn nhịp, gần UBND Quận 10, cư x&aacute; Đồng Tiến, nh&agrave; thờ Đồng Tiến.<br />
+ Gần cầu vượt Ba Th&aacute;ng Hai - Nguyễn Tri Phương, tiện di chuyển c&aacute;c quận trung t&acirc;m: Quận 1, Quận 3.<br />
+ Khu d&acirc;n tr&iacute; cao, ph&ugrave; hợp để ở, đầu tư kinh hoặc cho thu&ecirc; sinh lời. Nh&agrave; đối diện ngang b&eacute; hơn đ&atilde; x&acirc;y dựng 1 trệt, 1 lửng, 3 lầu, ST.<br />
+ Sổ vu&ocirc;ng vức, ch&iacute;nh chủ, c&ocirc;ng chứng trong ng&agrave;y.<br />
+ Li&ecirc;n hệ: Mr Kh&aacute;nh.</p>
</body>
</html>
', NULL, N'52 m2 (3,5x16)', 17, 26, N'Mua', N'Tin Hot', 255, N'14 Ngày')
SET IDENTITY_INSERT [dbo].[Motels] OFF
SET IDENTITY_INSERT [dbo].[Provinces] ON 

INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (1, N'Quận 1', 1)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (2, N'Quận 2', 1)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (3, N'Quận 3', 1)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (4, N'Quận 4', 1)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (5, N'Quận 5', 1)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (6, N'Quận 6', 1)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (7, N'Quận 7', 1)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (8, N'Quận 8', 1)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (9, N'Quận 9', 1)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (10, N'Quận 10', 1)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (11, N'Quận 11', 1)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (12, N'Quận 12', 1)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (13, N'Quận Gò Vấp', 1)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (14, N'Quận Tân Bình', 1)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (15, N'Quận Tân Phú', 1)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (16, N'Quận Bình Thạnh', 1)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (17, N'Quận Phú Nhuận', 1)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (18, N'Quận Thủ Ðức', 1)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (19, N'Quận Bình Tân', 1)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (20, N'Huyện Bình Chánh', 1)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (21, N'Huyện Củ Chi', 1)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (22, N'Huyện Hóc Môn', 1)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (23, N'Huyện Nhà Bè', 1)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (84, N'Quận Ba Đình', 2)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (85, N'Quận Hoàn Kiếm', 2)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (86, N'Quận Hai Bà Trưng', 2)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (87, N'Quận Đống Đa', 2)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (88, N'Quận Tây Hồ', 2)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (89, N'Quận Cầu Giấy', 2)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (90, N'Quận Thanh Xuân', 2)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (91, N'Quận Hoàng Mai', 2)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (92, N'Quận Long Biên', 2)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (93, N'Quận Bắc Từ Liêm', 2)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (94, N'Huyện Thanh Trì', 2)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (95, N'Huyện Gia Lâm', 2)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (96, N'Huyện Đông Anh', 2)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (97, N'Huyện Sóc Sơn', 2)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (98, N'Quận Hà Đông', 2)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (99, N'Thị xã Sơn Tây', 2)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (100, N'Huyện Ba Vì', 2)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (101, N'Huyện Phúc Thọ', 2)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (102, N'Huyện Thạch Thất', 2)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (103, N'Huyện Quốc Oai', 2)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (104, N'Huyện Chương Mỹ', 2)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (105, N'Huyện Đan Phượng', 2)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (106, N'Huyện Hoài Đức', 2)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (107, N'Huyện Thanh Oai', 2)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (108, N'Huyện Mỹ Đức', 2)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (109, N'Huyện Ứng Hòa', 2)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (110, N'Huyện Thường Tín', 2)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (111, N'Huyện Phú Xuyên', 2)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (112, N'Huyện Mê Linh', 2)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (113, N'Quận Nam Từ Liêm', 2)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (114, N'Quận Hải Châu', 3)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (115, N'Quận Thanh Khê', 3)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (116, N'Quận Sơn Trà', 3)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (117, N'Quận Ngũ Hành Sơn', 3)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (118, N'Quận Liên Chiểu', 3)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (119, N'Huyện Hòa Vang', 3)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (120, N'Quận Cẩm Lệ', 3)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (121, N'Huyện Hoàng Sa', 3)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (122, N'Quận Hồng Bàng', 4)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (123, N'Quận Lê Chân', 4)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (124, N'Quận Ngô Quyền', 4)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (125, N'Quận Kiến An', 4)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (126, N'Quận Hải An', 4)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (127, N'Quận Đồ Sơn', 4)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (128, N'Huyện An Lão', 4)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (129, N'Huyện Kiến Thụy', 4)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (130, N'Huyện Thủy Nguyên', 4)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (131, N'Huyện An Dương', 4)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (132, N'Huyện Tiên Lãng', 4)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (133, N'Huyện Vĩnh Bảo', 4)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (134, N'Huyện Cát Hải', 4)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (135, N'Huyện Bạch Long Vĩ', 4)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (136, N'Quận Dương Kinh', 4)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (137, N'Th. phố Thủ Dầu Một', 5)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (138, N'Thị xã Bến Cát', 5)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (139, N'Thị xã Tân Uyên', 5)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (140, N'Thị xã Thuận An', 5)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (141, N'Thị xã Dĩ An', 5)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (142, N'Huyện Phú Giáo', 5)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (143, N'Huyện Dầu Tiếng', 5)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (144, N'Huyện Bắc Tân Uyên', 5)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (145, N'Huyện Bàu Bàng', 5)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (146, N'Huyện Phú Giáo', 5)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (147, N'Thành phố Biên Hòa', 6)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (148, N'Huyện Vĩnh Cửu', 6)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (149, N'Huyện Tân Phú', 6)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (150, N'Huyện Định Quán', 6)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (151, N'Huyện Thống Nhất', 6)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (152, N'Thị xã Long Khánh', 6)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (153, N'Huyện Xuân Lộc', 6)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (154, N'Huyện Long Thành', 6)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (155, N'Huyện Nhơn Trạch', 6)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (156, N'Huyện Trảng Bom', 6)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (157, N'Huyện Cẩm Mỹ', 6)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (158, N'Quận Ninh Kiều', 7)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (159, N'Quận Bình Thủy', 7)
GO
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (160, N'Quận Cái Răng', 7)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (161, N'Quận Ô Môn', 7)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (162, N'Huyện Phong Điền', 7)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (163, N'Huyện Cờ Đỏ', 7)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (164, N'Huyện Vĩnh Thạnh', 7)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (165, N'Quận Thốt Nốt', 7)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (166, N'Huyện Thới Lai', 7)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (167, N'Thành phố Tân An', 8)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (168, N'Huyện Vĩnh Hưng', 8)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (169, N'Huyện Mộc Hóa', 8)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (170, N'Huyện Tân Thạnh', 8)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (171, N'Huyện Thạnh Hóa', 8)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (172, N'Huyện Đức Huệ', 8)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (173, N'Huyện Đức Hòa', 8)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (174, N'Huyện Bến Lức', 8)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (175, N'Huyện Thủ Thừa', 8)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (176, N'Huyện Châu Thành', 8)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (177, N'Huyện Tân Trụ', 8)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (178, N'Huyện Cần Đước', 8)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (179, N'Huyện Cần Giuộc', 8)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (180, N'Huyện Tân Hưng', 8)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (181, N'Thị xã Kiến Tường', 8)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (182, N'Thành phố Long Xuyên', 9)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (183, N'Thành phố Châu Đốc', 9)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (184, N'Huyện An Phú', 9)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (185, N'Thị xã Tân Châu', 9)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (186, N'Huyện Phú Tân', 9)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (187, N'Huyện Tịnh Biên', 9)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (188, N'Huyện Tri Tôn', 9)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (189, N'Huyện Châu Phú', 9)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (190, N'Huyện Chợ Mới', 9)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (191, N'Huyện Châu Thành', 9)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (192, N'Huyện Thoại Sơn', 9)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (193, N'Thành phố Vũng Tàu', 10)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (194, N'Thành phố Bà Rịa', 10)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (195, N'Huyện Xuyên Mộc', 10)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (196, N'Huyện Long Điền', 10)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (197, N'Huyện Côn Đảo', 10)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (198, N'Huyện Tân Thành', 10)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (199, N'Huyện Châu Đức', 10)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (200, N'Huyện Đất Đỏ', 10)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (201, N'Thành phố Bắc Giang', 11)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (202, N'Huyện Yên Thế', 11)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (203, N'Huyện Lục Ngạn', 11)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (204, N'Huyện Sơn Động', 11)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (205, N'Huyện Lục Nam', 11)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (206, N'Huyện Tân Yên', 11)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (207, N'Huyện Hiệp Hòa', 11)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (208, N'Huyện Lạng Giang', 11)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (209, N'Huyện Việt Yên', 11)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (210, N'Huyện Yên Dũng', 11)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (211, N'Thành phố Bắc Kạn', 12)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (212, N'Huyện Chợ Đồn', 12)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (213, N'Huyện Bạch Thông', 12)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (214, N'Huyện Na Rì', 12)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (215, N'Huyện Ngân Sơn', 12)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (216, N'Huyện Ba Bể', 12)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (217, N'Huyện Chợ Mới', 12)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (218, N'Huyện Pác Nặm', 12)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (219, N'Thành phố Bạc Liêu', 13)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (220, N'Huyện Vĩnh Lợi', 13)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (221, N'Huyện Hồng Dân', 13)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (222, N'Thị xã Giá Rai', 13)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (223, N'Huyện Phước Long', 13)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (224, N'Huyện Đông Hải', 13)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (225, N'Huyện Hòa Bình', 13)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (226, N'Thành phố Bắc Ninh', 14)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (227, N'Huyện Yên Phong', 14)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (228, N'Huyện Quế Võ', 14)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (229, N'Huyện Tiên Du', 14)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (230, N'Thị xã Từ  Sơn', 14)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (231, N'Huyện Thuận Thành', 14)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (232, N'Huyện Gia Bình', 14)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (233, N'Huyện Lương Tài', 14)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (234, N'Thành phố Bến Tre', 15)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (235, N'Huyện Châu Thành', 15)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (236, N'Huyện Chợ Lách', 15)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (237, N'Huyện Mỏ Cày Bắc', 15)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (238, N'Huyện Giồng Trôm', 15)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (239, N'Huyện Bình Đại', 15)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (240, N'Huyện Ba Tri', 15)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (241, N'Huyện Thạnh Phú', 15)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (242, N'Huyện Mỏ Cày Nam', 15)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (243, N'Thành phố Quy Nhơn', 16)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (244, N'Huyện An Lão', 16)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (245, N'Huyện Hoài Ân', 16)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (246, N'Huyện Hoài Nhơn', 16)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (247, N'Huyện Phù Mỹ', 16)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (248, N'Huyện Phù Cát', 16)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (249, N'Huyện Vĩnh Thạnh', 16)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (250, N'Huyện Tây Sơn', 16)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (251, N'Huyện Vân Canh', 16)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (252, N'Thị xã An Nhơn', 16)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (253, N'Huyện Tuy Phước', 16)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (254, N'Th. phố Thủ Dầu Một', 17)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (255, N'Thị xã Bến Cát', 17)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (256, N'Thị xã Tân Uyên', 17)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (257, N'Thị xã Thuận An', 17)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (258, N'Thị xã Dĩ An', 17)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (259, N'Huyện Phú Giáo', 17)
GO
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (260, N'Huyện Dầu Tiếng', 17)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (261, N'Huyện Bắc Tân Uyên', 17)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (262, N'Huyện Bàu Bàng', 17)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (263, N'Huyện Phú Giáo', 17)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (264, N'Thị xã Đồng Xoài', 18)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (265, N'Huyện Đồng Phú', 18)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (266, N'Huyện Chơn Thành', 18)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (267, N'Thị xã Bình Long', 18)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (268, N'Huyện Lộc Ninh', 18)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (269, N'Huyện Bù Đố', 18)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (270, N'Thị xã Phước Long', 18)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (271, N'Huyện Bù Đăng', 18)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (272, N'Huyện Hớn Quản', 18)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (273, N'Huyện Bù Gia Mập', 18)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (274, N'Huyện Phú Riềng', 18)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (275, N'Thành phố Phan Thiết', 19)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (276, N'Huyện Tuy Phong', 19)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (277, N'Huyện Bắc Bình', 19)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (278, N'Huyện Hàm Thuận Bắc', 19)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (279, N'Huyện Hàm Thuận Nam', 19)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (280, N'Huyện Hàm Tân', 19)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (281, N'Huyện Đức Linh', 19)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (282, N'Huyện Tánh Linh', 19)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (283, N'Huyện đảo Phú Quý', 19)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (284, N'Thị xã La Gi', 19)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (285, N'Thành phố Cà Mau', 20)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (286, N'Huyện Thới Bình', 20)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (287, N'Huyện U Minh', 20)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (288, N'Huyện Trần Văn Thời', 20)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (289, N'Huyện Cái Nước', 20)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (290, N'Huyện Đầm Dơi', 20)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (291, N'Huyện Ngọc Hiển', 20)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (292, N'Huyện Năm Căn', 20)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (293, N'Huyện Phú Tân', 20)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (294, N'Thành phố Cao Bằng', 21)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (295, N'Huyện Bảo Lạc', 21)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (296, N'Huyện Thông Nông', 21)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (297, N'Huyện Hà Quảng', 21)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (298, N'Huyện Trà Lĩnh', 21)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (299, N'Huyện Trùng Khánh', 21)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (300, N'Huyện Nguyên Bình', 21)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (301, N'Huyện Hòa An', 21)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (302, N'Huyện Quảng Uyên', 21)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (303, N'Huyện Thạch An', 21)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (304, N'Huyện Hạ Lang', 21)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (305, N'Huyện Bảo Lâm', 21)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (306, N'Huyện Phục Hòa', 21)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (307, N'Huyện Hòa An', 21)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (308, N'Th.phố Buôn Ma Thuột', 22)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (309, N'Huyện Ea H''Leo', 22)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (310, N'Huyện Krông Buk', 22)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (311, N'Huyện Krông Năng', 22)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (312, N'Huyện Ea Súp', 22)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (313, N'Huyện Cư M''gar', 22)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (314, N'Huyện Krông Pắc', 22)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (315, N'Huyện Ea Kar', 22)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (316, N'Huyện M''Đrắk', 22)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (317, N'Huyện Krông Ana', 22)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (318, N'Huyện Krông Bông', 22)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (319, N'Huyện Lắk', 22)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (320, N'Huyện Buôn Đôn', 22)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (321, N'Huyện Cư Kuin', 22)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (322, N'Thị Xã Buôn Hồ', 22)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (323, N'Thị xã Gia Nghĩa', 23)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (324, N'Huyện Đăk R''Lấp', 23)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (325, N'Huyện Đăk Mil', 23)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (326, N'Huyện Cư Jút', 23)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (327, N'Huyện Đăk Song', 23)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (328, N'Huyện Krông Nô', 23)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (329, N'Huyện Đăk GLong', 23)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (330, N'Huyện Tuy Đức', 23)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (331, N'Thành phố Điện Biên Phủ', 24)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (332, N'Thị xã Mường Lay', 24)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (333, N'Huyện Điện Biên', 24)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (334, N'Huyện Tuần Giáo', 24)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (335, N'Huyện Mường Chà', 24)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (336, N'Huyện Tủa Chùa', 24)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (337, N'Huyện Điện Biên Đông', 24)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (338, N'Huyện Mường Nhé', 24)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (339, N'Huyện Mường ảng', 24)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (340, N'Huyện Nậm Pồ', 24)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (341, N'Thành phố Pleiku', 25)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (342, N'Huyện Chư Păh', 25)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (343, N'Huyện Mang Yang', 25)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (344, N'Huyện KBang', 25)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (345, N'Thị xã An Khê', 25)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (346, N'Huyện Kông Chro', 25)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (347, N'Huyện Đức Cơ', 25)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (348, N'Huyện Chư Prông', 25)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (349, N'Huyện Chư Sê', 25)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (350, N'Thị xã Ayun Pa', 25)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (351, N'Huyện Krông Pa', 25)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (352, N'Huyện Ia Grai', 25)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (353, N'Huyện Đak Đoa', 25)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (354, N'Huyện Ia Pa', 25)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (355, N'Huyện Đak Pơ', 25)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (356, N'Huyện Phú Thiện', 25)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (357, N'Huyện Chư Pưh', 25)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (358, N'Thành phố Hà Giang', 26)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (359, N'Huyện Đồng Văn', 26)
GO
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (360, N'Huyện Mèo Vạc', 26)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (361, N'Huyện Yên Minh', 26)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (362, N'Huyện Quản Bạ', 26)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (363, N'Huyện Vị Xuyên', 26)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (364, N'Thành phố Hà Giang', 26)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (365, N'Huyện Đồng Văn', 26)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (366, N'Huyện Mèo Vạc', 26)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (367, N'Huyện Yên Minh', 26)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (368, N'Huyện Quản Bạ', 26)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (369, N'Huyện Vị Xuyên', 26)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (370, N'Thành phố Phủ Lý', 27)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (371, N'Huyện Duy Tiên', 27)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (372, N'Huyện Kim Bảng', 27)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (373, N'Huyện Lý Nhân', 27)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (374, N'Huyện Thanh Liêm', 27)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (375, N'Huyện Bình Lục', 27)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (376, N'Thành phố Hà Tĩnh', 28)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (377, N'Thị xã Hồng Lĩnh', 28)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (378, N'Huyện Hương Sơn', 28)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (379, N'Huyện Đức Thọ', 28)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (380, N'Huyện Nghi Xuân', 28)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (381, N'Huyện Can Lộc', 28)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (382, N'Huyện Hương Khê', 28)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (383, N'Huyện Thạch Hà', 28)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (384, N'Huyện Cẩm Xuyên', 28)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (385, N'Huyện Kỳ Anh', 28)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (386, N'Huyện Vũ Quang', 28)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (387, N'Huyện Lộc Hà', 28)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (388, N'Thị xã Kỳ Anh', 28)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (389, N'Thành phố Hải Dương', 29)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (390, N'Thị xã Chí Linh', 29)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (391, N'Huyện Nam Sách', 29)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (392, N'Huyện Kinh Môn', 29)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (393, N'Huyện Gia Lộc', 29)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (394, N'Huyện Tứ Kỳ', 29)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (395, N'Huyện Thanh Miện', 29)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (396, N'Huyện Ninh Giang', 29)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (397, N'Huyện Cẩm Giàng', 29)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (398, N'Huyện Thanh Hà', 29)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (399, N'Huyện Kim Thành', 29)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (400, N'Huyện Bình Giang', 29)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (401, N'Thành phố Vị Thanh', 30)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (402, N'Huyện Vị Thủy', 30)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (403, N'Huyện Long Mỹ', 30)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (404, N'Huyện Phụng Hiệp', 30)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (405, N'Huyện Châu Thành', 30)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (406, N'Huyện Châu Thành A', 30)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (407, N'Thị xã Ngã Bảy', 30)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (408, N'Thị xã Long Mỹ', 30)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (409, N'Thành phố Hòa Bình', 31)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (410, N'Huyện Đà Bắc', 31)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (411, N'Huyện Mai Châu', 31)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (412, N'Huyện Tân Lạc', 31)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (413, N'Huyện Lạc Sơn', 31)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (414, N'Huyện Kỳ Sơn', 31)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (415, N'Huyện Lương Sơn', 31)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (416, N'Huyện Kim Bôi', 31)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (417, N'Huyện Lạc Thủy', 31)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (418, N'Huyện Yên Thủy', 31)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (419, N'Huyện Cao Phong', 31)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (420, N'Thành phố Hưng Yên', 32)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (421, N'Huyện Kim Động', 32)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (422, N'Huyện Ân Thi', 32)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (423, N'Huyện KHóai Châu', 32)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (424, N'Huyện Yên Mỹ', 32)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (425, N'Huyện Tiên Lữ', 32)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (426, N'Huyện Phù Cừ', 32)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (427, N'Huyện Mỹ Hào', 32)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (428, N'Huyện Văn Lâm', 32)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (429, N'Huyện Văn Giang', 32)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (430, N'Thành phố Nha Trang', 33)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (431, N'Huyện Vạn Ninh', 33)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (432, N'Thị xã Ninh Hòa', 33)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (433, N'Huyện Diên Khánh', 33)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (434, N'Huyện Khánh Vĩnh', 33)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (435, N'Thành phố Cam Ranh', 33)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (436, N'Huyện Khánh Sơn', 33)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (437, N'Huyện đảo Trường Sa', 33)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (438, N'Huyện Cam Lâm', 33)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (439, N'Thành phố Rạch Giá', 34)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (440, N'Thị xã Hà Tiên', 34)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (441, N'Huyện Kiên Lương', 34)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (442, N'Huyện Hòn Đất', 34)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (443, N'Huyện Tân Hiệp', 34)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (444, N'Huyện Châu Thành', 34)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (445, N'Huyện Giồng Riềng', 34)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (446, N'Huyện Gò Quao', 34)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (447, N'Huyện An Biên', 34)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (448, N'Huyện An Minh', 34)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (449, N'Huyện Vĩnh Thuận', 34)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (450, N'Huyện Phú Quốc', 34)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (451, N'Huyện Kiên Hải', 34)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (452, N'Huyện U Minh Thượng', 34)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (453, N'Huyện Giang Thành', 34)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (454, N'Thành phố Kon Tum', 35)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (455, N'Huyện ĐĂK GLEI', 35)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (456, N'Huyện Ngọc Hồi', 35)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (457, N'Huyện Đăk Tô', 35)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (458, N'Huyện Sa Thầy', 35)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (459, N'Huyện Kon Plông', 35)
GO
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (460, N'Huyện Đăk Hà', 35)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (461, N'Huyện Kon Rẫy', 35)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (462, N'Huyện Tu Mơ Rông', 35)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (463, N'Huyện IA H''DRAI', 35)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (464, N'Thành Phố Lai Châu', 36)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (465, N'Huyện Tam Đường', 36)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (466, N'Huyện Phong Thổ', 36)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (467, N'Huyện Sìn Hồ', 36)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (468, N'Huyện Mường Tè', 36)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (469, N'Huyện Than Uyên', 36)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (470, N'Huyện Tân Uyên', 36)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (471, N'Huyện Nậm Nhùn', 36)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (472, N'Thành phố Đà Lạt', 37)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (473, N'Thành phố Bảo Lộc', 37)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (474, N'Huyện Đức Trọng', 37)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (475, N'Huyện Di Linh', 37)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (476, N'Huyện Đơn Dương', 37)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (477, N'Huyện Lạc Dương', 37)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (478, N'Huyện Đạ Huoai', 37)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (479, N'Huyện Đạ Tẻh', 37)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (480, N'Huyện Cát Tiên', 37)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (481, N'Huyện Lâm Hà', 37)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (482, N'Huyện Bảo Lâm', 37)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (483, N'Huyện Đam Rông', 37)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (484, N'Thành phố Lạng Sơn', 38)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (485, N'Huyện Tràng Định', 38)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (486, N'Huyện Bình Gia', 38)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (487, N'Huyện Văn Lãng', 38)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (488, N'Huyện Bắc Sơn', 38)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (489, N'Huyện Văn Quan', 38)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (490, N'Huyện Cao Lộc', 38)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (491, N'Huyện Lộc Bình', 38)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (492, N'Huyện Chi Lăng', 38)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (493, N'Huyện Đình Lập', 38)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (494, N'Huyện Hữu Lũng', 38)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (495, N'Huyện Bảo Thắng', 39)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (496, N'Huyện Bảo Yên', 39)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (497, N'Huyện Bát Xát', 39)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (498, N'Huyện Bắc Hà', 39)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (499, N'Thành phố Lào Cai', 39)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (500, N'Huyện Mường Khương', 39)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (501, N'Huyện Sa Pa', 39)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (502, N'Huyện Si Ma Cai', 39)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (503, N'Huyện Văn Bàn', 39)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (504, N'Thành phố Nam Định', 40)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (505, N'Huyện Mỹ Lộc', 40)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (506, N'Huyện Xuân Trường', 40)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (507, N'Huyện Giao Thủy', 40)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (508, N'Huyện ý Yên', 40)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (509, N'Huyện Vụ Bản', 40)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (510, N'Huyện Nam Trực', 40)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (511, N'Huyện Trực Ninh', 40)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (512, N'Huyện Nghĩa Hưng', 40)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (513, N'Huyện Hải Hậu', 40)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (514, N'Thành phố Vinh', 41)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (515, N'Thị xã Cửa Lò', 41)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (516, N'Huyện Quỳ Châu', 41)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (517, N'Huyện Quỳ Hợp', 41)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (518, N'Huyện Nghĩa Đàn', 41)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (519, N'Huyện Quỳnh Lưu', 41)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (520, N'Huyện Kỳ Sơn', 41)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (521, N'Huyện Tương Dương', 41)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (522, N'Huyện Con Cuông', 41)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (523, N'Huyện Tân Kỳ', 41)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (524, N'Huyện Yên Thành', 41)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (525, N'Huyện Diễn Châu', 41)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (526, N'Huyện Anh Sơn', 41)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (527, N'Huyện Đô Lương', 41)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (528, N'Huyện Thanh Chương', 41)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (529, N'Huyện Nghi Lộc', 41)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (530, N'Huyện Nam Đàn', 41)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (531, N'Huyện Hưng Nguyên', 41)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (532, N'Huyện Quế Phong', 41)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (533, N'Thị Xã Thái Hòa', 41)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (534, N'Thị Xã Hoàng Mai', 41)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (535, N'Thành phố Ninh Bình', 42)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (536, N'Thành phố Tam Điệp', 42)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (537, N'Huyện Nho Quan', 42)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (538, N'Huyện Gia Viễn', 42)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (539, N'Huyện Hoa Lư', 42)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (540, N'Huyện Yên Mô', 42)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (541, N'Huyện Kim Sơn', 42)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (542, N'Huyện Yên Khánh', 42)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (543, N'Thành phố Phan Rang -Tháp Chàm', 43)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (544, N'Huyện Ninh Sơn', 43)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (545, N'Huyện Ninh Hải', 43)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (546, N'Huyện Ninh Phước', 43)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (547, N'Huyện Bác Ái', 43)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (548, N'Huyện Thuận Bắc', 43)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (549, N'Huyện Thuận Nam', 43)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (550, N'Thành phố Việt Trì', 44)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (551, N'Thị xã Phú Thọ', 44)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (552, N'Huyện Đoan Hùng', 44)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (553, N'Huyện Thanh Ba', 44)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (554, N'Huyện Hạ Hòa', 44)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (555, N'Huyện Cẩm Khê', 44)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (556, N'Huyện Yên Lập', 44)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (557, N'Huyện Thanh Sơn', 44)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (558, N'Huyện Phù Ninh', 44)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (559, N'Huyện Lâm Thao', 44)
GO
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (560, N'Huyện Tam Nông', 44)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (561, N'Huyện Thanh Thủy', 44)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (562, N'Huyện Tân Sơn', 44)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (563, N'Thành phố Đồng Hới', 45)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (564, N'Huyện Tuyên Hóa', 45)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (565, N'Huyện Minh Hóa', 45)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (566, N'Huyện Quảng Trạch', 45)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (567, N'Huyện Bố Trạch', 45)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (568, N'Huyện Quảng Ninh', 45)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (569, N'Huyện Lệ Thủy', 45)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (570, N'Thị xã Ba Đồn', 45)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (571, N'Thành phố Tam Kỳ', 46)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (572, N'Thành phố Hội An', 46)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (573, N'Huyện Duy Xuyên', 46)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (574, N'Thị xã Điện Bàn', 46)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (575, N'Huyện Đại Lộc', 46)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (576, N'Huyện Quế Sơn', 46)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (577, N'Huyện Hiệp Đức', 46)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (578, N'Huyện Thăng Bình', 46)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (579, N'Huyện Núi Thành', 46)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (580, N'Huyện Tiên Phước', 46)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (581, N'Huyện Bắc Trà My', 46)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (582, N'Huyện Đông Giang', 46)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (583, N'Huyện Nam Giang', 46)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (584, N'Huyện Phước Sơn', 46)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (585, N'Huyện Nam Trà My', 46)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (586, N'Huyện Tây Giang', 46)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (587, N'Huyện Phú Ninh', 46)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (588, N'Huyện Nông Sơn', 46)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (589, N'Huyện Bình Sơn', 47)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (590, N'Huyện Sơn Tịnh', 47)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (591, N'Thành phố Quảng Ngãi', 47)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (592, N'Huyện Tư Nghĩa', 47)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (593, N'Huyện Nghĩa Hành', 47)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (594, N'Huyện Mộ Đức', 47)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (595, N'Huyện Đức phổ', 47)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (596, N'Huyện Ba Tơ', 47)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (597, N'Huyện Minh Long', 47)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (598, N'Huyện Sơn Hà', 47)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (599, N'Huyện Sơn Tây', 47)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (600, N'Huyện Trà Bồng', 47)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (601, N'Huyện Tây Trà', 47)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (602, N'Huyện Lý Sơn', 47)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (603, N'Thành phố Hạ Long', 48)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (604, N'Thành phố Cẩm Phả', 48)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (605, N'Thành phố Uông Bí', 48)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (606, N'Thành phố Móng Cái', 48)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (607, N'Huyện Bình Liêu', 48)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (608, N'Huyện Đầm Hà', 48)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (609, N'Huyện Hải Hà', 48)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (610, N'Huyện Tiên Yên', 48)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (611, N'Huyện Ba Chẽ', 48)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (612, N'Thị xã Đông Triều', 48)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (613, N'Thị xã Quảng Yên', 48)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (614, N'Huyện Hoành Bồ', 48)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (615, N'Huyện Vân Đồn', 48)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (616, N'Huyện Cô Tô', 48)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (617, N'Thành phố Đông Hà', 49)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (618, N'Thị xã Quảng Trị', 49)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (619, N'Huyện Vĩnh Linh', 49)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (620, N'Huyện Gio Linh', 49)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (621, N'Huyện Cam Lộ', 49)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (622, N'Huyện Triệu Phong', 49)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (623, N'Huyện Hải Lăng', 49)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (624, N'Huyện Hướng Hóa', 49)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (625, N'Huyện Đakrông', 49)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (626, N'Huyện đảo Cồn Cỏ', 49)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (627, N'Thành phố Sóc Trăng', 50)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (628, N'Huyện Kế Sách', 50)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (629, N'Huyện Mỹ Tú', 50)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (630, N'Huyện Mỹ Xuyên', 50)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (631, N'Huyện Thạnh Trị', 50)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (632, N'Huyện Long Phú', 50)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (633, N'Thị xã Vĩnh Châu', 50)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (634, N'Huyện Cù Lao Dung', 50)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (635, N'Thị xã Ngã Năm', 50)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (636, N'Huyện Châu Thành', 50)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (637, N'Huyện Trần Đề', 50)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (638, N'Thành phố Sơn La', 51)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (639, N'Huyện Quỳnh Nhai', 51)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (640, N'Huyện Mường La', 51)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (641, N'Huyện Thuận Châu', 51)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (642, N'Huyện Bắc Yên', 51)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (643, N'Huyện Phù Yên', 51)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (644, N'Huyện Mai Sơn', 51)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (645, N'Huyện Yên Châu', 51)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (646, N'Huyện Sông Mã', 51)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (647, N'Huyện Mộc Châu', 51)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (648, N'Huyện Sốp Cộp', 51)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (649, N'Huyện Vân Hồ', 51)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (650, N'Thành phố Tây Ninh', 52)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (651, N'Huyện Tân Biên', 52)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (652, N'Huyện Tân Châu', 52)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (653, N'Huyện Dương Minh Châu', 52)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (654, N'Huyện Châu Thành', 52)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (655, N'Huyện Hòa Thành', 52)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (656, N'Huyện Bến Cầu', 52)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (657, N'Huyện Gò Dầu', 52)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (658, N'Huyện Trảng Bàng', 52)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (659, N'Thành phố Thái Bình', 53)
GO
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (660, N'Huyện Quỳnh Phụ', 53)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (661, N'Huyện Hưng Hà', 53)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (662, N'Huyện Đông Hưng', 53)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (663, N'Huyện Vũ Thư', 53)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (664, N'Huyện Kiến Xương', 53)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (665, N'Huyện Tiền Hải', 53)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (666, N'Huyện Thái Thụy', 53)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (667, N'Thành phố Thái Nguyên', 54)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (668, N'Thành phố Sông Công', 54)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (669, N'Huyện Định Hóa', 54)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (670, N'Huyện Phú Lương', 54)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (671, N'Huyện Võ Nhai', 54)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (672, N'Huyện Đại Từ', 54)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (673, N'Huyện Đồng Hỷ', 54)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (674, N'Huyện Phú Bình', 54)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (675, N'Thị xã Phổ Yên', 54)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (676, N'Thành phố Thanh Hóa', 55)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (677, N'Thị xã Bỉm Sơn', 55)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (678, N'Thị xã Sầm Sơn', 55)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (679, N'Huyện Quan Hóa', 55)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (680, N'Huyện Quan Sơn', 55)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (681, N'Huyện Mường Lát', 55)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (682, N'Huyện Bá Thước', 55)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (683, N'Huyện Thường Xuân', 55)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (684, N'Huyện Như Xuân', 55)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (685, N'Huyện Như Thanh', 55)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (686, N'Huyện Lang Chánh', 55)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (687, N'Huyện Ngọc Lặc', 55)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (688, N'Huyện Thạch Thành', 55)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (689, N'Huyện Cẩm Thủy', 55)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (690, N'Huyện Thọ Xuân', 55)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (691, N'Huyện Vĩnh Lộc', 55)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (692, N'Huyện Thiệu Hóa', 55)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (693, N'Huyện Triệu Sơn', 55)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (694, N'Huyện Nông Cống', 55)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (695, N'Huyện Đông Sơn', 55)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (696, N'Huyện Hà Trung', 55)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (697, N'Huyện Hoằng Hóa', 55)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (698, N'Huyện Nga Sơn', 55)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (699, N'Huyện Hậu Lộc', 55)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (700, N'Huyện Quảng Xương', 55)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (701, N'Huyện Tĩnh Gia', 55)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (702, N'Huyện Yên Định', 55)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (703, N'Thành phố Huế', 56)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (704, N'Huyện Phong Điền', 56)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (705, N'Huyện Quảng Điền', 56)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (706, N'Thị xã Hương Trà', 56)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (707, N'Huyện Phú Vang', 56)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (708, N'Thị xã Hương Thủy', 56)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (709, N'Huyện Phú Lộc', 56)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (710, N'Huyện Nam Đông', 56)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (711, N'Huyện A Lưới', 56)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (712, N'Thành phố Mỹ Tho', 57)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (713, N'Thị xã Gò Công', 57)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (714, N'Huyện Cái Bè', 57)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (715, N'Huyện Cai Lậy', 57)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (716, N'Huyện Châu Thành', 57)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (717, N'Huyện Chợ Gạo', 57)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (718, N'Huyện Gò Công Tây', 57)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (719, N'Huyện Gò Công Đông', 57)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (720, N'Huyện Tân Phước', 57)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (721, N'Huyện Tân Phú Đông', 57)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (722, N'Thị xã Cai Lậy', 57)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (723, N'Thành phố Trà Vinh', 58)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (724, N'Huyện Càng Long', 58)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (725, N'Huyện Cầu Kè', 58)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (726, N'Huyện Tiểu Cần', 58)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (727, N'Huyện Châu Thành', 58)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (728, N'Huyện Trà Cú', 58)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (729, N'Huyện Cầu Ngang', 58)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (730, N'Huyện Duyên Hải', 58)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (731, N'Thị xã Duyên Hải', 58)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (732, N'Thành phố Tuyên Quang', 59)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (733, N'Huyện Lâm Bình', 59)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (734, N'Huyện Na Hang', 59)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (735, N'Huyện Chiêm Hóa', 59)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (736, N'Huyện Hàm Yên', 59)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (737, N'Huyện Yên Sơn', 59)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (738, N'Huyện Sơn Dương', 59)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (739, N'Thành phố Vĩnh Long', 60)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (740, N'Huyện Long Hồ', 60)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (741, N'Huyện Mang Thít', 60)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (742, N'Thị xã Bình Minh', 60)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (743, N'Huyện Tam Bình', 60)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (744, N'Huyện Trà Ôn', 60)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (745, N'Huyện Vũng Liêm', 60)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (746, N'Huyện Bình Tân', 60)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (747, N'Thành phố Vĩnh Yên', 61)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (748, N'Huyện Tam Dương', 61)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (749, N'Huyện Lập Thạch', 61)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (750, N'Huyện Vĩnh Tường', 61)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (751, N'Huyện Yên Lạc', 61)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (752, N'Huyện Bình Xuyên', 61)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (753, N'Huyện Sông Lô', 61)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (754, N'Thị xã Phúc Yên', 61)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (755, N'Huyện Tam Đảo', 61)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (756, N'Thành phố Yên Bái', 62)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (757, N'Thị xã Nghĩa Lộ', 62)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (758, N'Huyện Văn Yên', 62)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (759, N'Huyện Yên Bình', 62)
GO
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (760, N'Huyện Mù Cang Chải', 62)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (761, N'Huyện Văn Chấn', 62)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (762, N'Huyện Trấn Yên', 62)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (763, N'Huyện Trạm Tấu', 62)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (764, N'Huyện Lục Yên', 62)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (765, N'Thành phố Tuy Hòa', 63)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (766, N'Huyện Đồng Xuân', 63)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (767, N'Thị Xã Sông Cầu', 63)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (768, N'Huyện Tuy An', 63)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (769, N'Huyện Sơn Hòa', 63)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (770, N'Huyện Sông Hinh', 63)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (771, N'Huyện Đông Hòa', 63)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (772, N'Huyện Phú Hòa', 63)
INSERT [dbo].[Provinces] ([Id], [Name], [CityId]) VALUES (773, N'Huyện Tây Hòa', 63)
SET IDENTITY_INSERT [dbo].[Provinces] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [RoleName]) VALUES (1, N'user')
INSERT [dbo].[Roles] ([Id], [RoleName]) VALUES (2, N'hr')
INSERT [dbo].[Roles] ([Id], [RoleName]) VALUES (3, N'marketing')
INSERT [dbo].[Roles] ([Id], [RoleName]) VALUES (4, N'admin')
INSERT [dbo].[Roles] ([Id], [RoleName]) VALUES (5, N'dev')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Typeofnews] ON 

INSERT [dbo].[Typeofnews] ([Id], [Name]) VALUES (1, N'Phòng trọ, nhà trọ')
INSERT [dbo].[Typeofnews] ([Id], [Name]) VALUES (2, N'Nhà thuê nguyên căn')
INSERT [dbo].[Typeofnews] ([Id], [Name]) VALUES (3, N'Cho thuê căn hộ')
INSERT [dbo].[Typeofnews] ([Id], [Name]) VALUES (4, N'Tìm người ở ghép')
INSERT [dbo].[Typeofnews] ([Id], [Name]) VALUES (5, N'Cho thuê mặt bằng')
SET IDENTITY_INSERT [dbo].[Typeofnews] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [CreatedDate], [LastLogOnDate], [Email], [Gender], [Title], [UserImage], [AccountId]) VALUES (26, N'Chu Minh ', N'Hoàng', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'chuminhhoang82@gmail.com', 0, NULL, NULL, 35)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [CreatedDate], [LastLogOnDate], [Email], [Gender], [Title], [UserImage], [AccountId]) VALUES (27, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'chuminhhoang882@gmail.com', 0, NULL, NULL, 36)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [CreatedDate], [LastLogOnDate], [Email], [Gender], [Title], [UserImage], [AccountId]) VALUES (28, N'chu', N'chu', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, NULL, 39)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [CreatedDate], [LastLogOnDate], [Email], [Gender], [Title], [UserImage], [AccountId]) VALUES (29, N'chu', N'chu', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, NULL, 40)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Index [IX_Accounts_RoleId]    Script Date: 12/10/2020 12:14:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Accounts_RoleId] ON [dbo].[Accounts]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bills_MotelId]    Script Date: 12/10/2020 12:14:35 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Bills_MotelId] ON [dbo].[Bills]
(
	[MotelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bills_SevicepriceId]    Script Date: 12/10/2020 12:14:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Bills_SevicepriceId] ON [dbo].[Bills]
(
	[SevicepriceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BuyMoneys_UserId]    Script Date: 12/10/2020 12:14:35 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_BuyMoneys_UserId] ON [dbo].[BuyMoneys]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Convesation_replys_ConvesationId]    Script Date: 12/10/2020 12:14:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Convesation_replys_ConvesationId] ON [dbo].[Convesation_replys]
(
	[ConvesationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Convesation_replys_UserId]    Script Date: 12/10/2020 12:14:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_Convesation_replys_UserId] ON [dbo].[Convesation_replys]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Convesations_UserOneId]    Script Date: 12/10/2020 12:14:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_Convesations_UserOneId] ON [dbo].[Convesations]
(
	[UserOneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Convesations_UserTwoId]    Script Date: 12/10/2020 12:14:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_Convesations_UserTwoId] ON [dbo].[Convesations]
(
	[UserTwoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Details_MotelId]    Script Date: 12/10/2020 12:14:36 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Details_MotelId] ON [dbo].[Details]
(
	[MotelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Details_TypeofnewId]    Script Date: 12/10/2020 12:14:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_Details_TypeofnewId] ON [dbo].[Details]
(
	[TypeofnewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Districts_ProvinceId]    Script Date: 12/10/2020 12:14:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_Districts_ProvinceId] ON [dbo].[Districts]
(
	[ProvinceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Employees_AccountId]    Script Date: 12/10/2020 12:14:36 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Employees_AccountId] ON [dbo].[Employees]
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Employees_ManageEmployeeId]    Script Date: 12/10/2020 12:14:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_Employees_ManageEmployeeId] ON [dbo].[Employees]
(
	[ManageEmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Images_MotelId]    Script Date: 12/10/2020 12:14:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_Images_MotelId] ON [dbo].[Images]
(
	[MotelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Motels_CityId]    Script Date: 12/10/2020 12:14:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_Motels_CityId] ON [dbo].[Motels]
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Motels_ProvinceId]    Script Date: 12/10/2020 12:14:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_Motels_ProvinceId] ON [dbo].[Motels]
(
	[ProvinceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Motels_UserId]    Script Date: 12/10/2020 12:14:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_Motels_UserId] ON [dbo].[Motels]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Posts_ParentPostId]    Script Date: 12/10/2020 12:14:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_Posts_ParentPostId] ON [dbo].[Posts]
(
	[ParentPostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Posts_TopicId]    Script Date: 12/10/2020 12:14:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_Posts_TopicId] ON [dbo].[Posts]
(
	[TopicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Posts_UserId]    Script Date: 12/10/2020 12:14:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_Posts_UserId] ON [dbo].[Posts]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Provinces_CityId]    Script Date: 12/10/2020 12:14:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_Provinces_CityId] ON [dbo].[Provinces]
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_AccountId]    Script Date: 12/10/2020 12:14:36 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_AccountId] ON [dbo].[Users]
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Details] ADD  DEFAULT ((0)) FOR [MotelId]
GO
ALTER TABLE [dbo].[Motels] ADD  DEFAULT ((0)) FOR [ProvinceId]
GO
ALTER TABLE [dbo].[Serviceprices] ADD  DEFAULT ((0)) FOR [Date]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Roles_RoleId]
GO
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK_Bills_Motels_MotelId] FOREIGN KEY([MotelId])
REFERENCES [dbo].[Motels] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK_Bills_Motels_MotelId]
GO
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK_Bills_Serviceprices_SevicepriceId] FOREIGN KEY([SevicepriceId])
REFERENCES [dbo].[Serviceprices] ([Id])
GO
ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK_Bills_Serviceprices_SevicepriceId]
GO
ALTER TABLE [dbo].[BuyMoneys]  WITH CHECK ADD  CONSTRAINT [FK_BuyMoneys_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BuyMoneys] CHECK CONSTRAINT [FK_BuyMoneys_Users_UserId]
GO
ALTER TABLE [dbo].[Convesation_replys]  WITH CHECK ADD  CONSTRAINT [FK_Convesation_replys_Convesations_ConvesationId] FOREIGN KEY([ConvesationId])
REFERENCES [dbo].[Convesations] ([Id])
GO
ALTER TABLE [dbo].[Convesation_replys] CHECK CONSTRAINT [FK_Convesation_replys_Convesations_ConvesationId]
GO
ALTER TABLE [dbo].[Convesation_replys]  WITH CHECK ADD  CONSTRAINT [FK_Convesation_replys_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Convesation_replys] CHECK CONSTRAINT [FK_Convesation_replys_Users_UserId]
GO
ALTER TABLE [dbo].[Convesations]  WITH CHECK ADD  CONSTRAINT [FK_Convesations_Users_UserOneId] FOREIGN KEY([UserOneId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Convesations] CHECK CONSTRAINT [FK_Convesations_Users_UserOneId]
GO
ALTER TABLE [dbo].[Convesations]  WITH CHECK ADD  CONSTRAINT [FK_Convesations_Users_UserTwoId] FOREIGN KEY([UserTwoId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Convesations] CHECK CONSTRAINT [FK_Convesations_Users_UserTwoId]
GO
ALTER TABLE [dbo].[Details]  WITH CHECK ADD  CONSTRAINT [FK_Details_Motels_MotelId] FOREIGN KEY([MotelId])
REFERENCES [dbo].[Motels] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Details] CHECK CONSTRAINT [FK_Details_Motels_MotelId]
GO
ALTER TABLE [dbo].[Details]  WITH CHECK ADD  CONSTRAINT [FK_Details_Typeofnews_TypeofnewId] FOREIGN KEY([TypeofnewId])
REFERENCES [dbo].[Typeofnews] ([Id])
GO
ALTER TABLE [dbo].[Details] CHECK CONSTRAINT [FK_Details_Typeofnews_TypeofnewId]
GO
ALTER TABLE [dbo].[Districts]  WITH CHECK ADD  CONSTRAINT [FK_Districts_Provinces_ProvinceId] FOREIGN KEY([ProvinceId])
REFERENCES [dbo].[Provinces] ([Id])
GO
ALTER TABLE [dbo].[Districts] CHECK CONSTRAINT [FK_Districts_Provinces_ProvinceId]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Accounts_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Accounts_AccountId]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Employees_ManageEmployeeId] FOREIGN KEY([ManageEmployeeId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Employees_ManageEmployeeId]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Images_Motels_MotelId] FOREIGN KEY([MotelId])
REFERENCES [dbo].[Motels] ([Id])
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Images_Motels_MotelId]
GO
ALTER TABLE [dbo].[Motels]  WITH CHECK ADD  CONSTRAINT [FK_Motels_Citys_CityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[Citys] ([Id])
GO
ALTER TABLE [dbo].[Motels] CHECK CONSTRAINT [FK_Motels_Citys_CityId]
GO
ALTER TABLE [dbo].[Motels]  WITH CHECK ADD  CONSTRAINT [FK_Motels_Provinces_ProvinceId] FOREIGN KEY([ProvinceId])
REFERENCES [dbo].[Provinces] ([Id])
GO
ALTER TABLE [dbo].[Motels] CHECK CONSTRAINT [FK_Motels_Provinces_ProvinceId]
GO
ALTER TABLE [dbo].[Motels]  WITH CHECK ADD  CONSTRAINT [FK_Motels_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Motels] CHECK CONSTRAINT [FK_Motels_Users_UserId]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Posts_ParentPostId] FOREIGN KEY([ParentPostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Posts_ParentPostId]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Topics_TopicId] FOREIGN KEY([TopicId])
REFERENCES [dbo].[Topics] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Topics_TopicId]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Users_UserId]
GO
ALTER TABLE [dbo].[Provinces]  WITH CHECK ADD  CONSTRAINT [FK_Provinces_Citys_CityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[Citys] ([Id])
GO
ALTER TABLE [dbo].[Provinces] CHECK CONSTRAINT [FK_Provinces_Citys_CityId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Accounts_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Accounts_AccountId]
GO
USE [master]
GO
ALTER DATABASE [NhaTroDB] SET  READ_WRITE 
GO
