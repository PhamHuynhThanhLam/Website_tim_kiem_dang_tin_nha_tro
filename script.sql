USE [master]
GO
/****** Object:  Database [NhaTroDB]    Script Date: 12/19/2020 8:02:08 PM ******/
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 12/19/2020 8:02:08 PM ******/
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
/****** Object:  Table [dbo].[Accounts]    Script Date: 12/19/2020 8:02:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[RoleId] [int] NOT NULL,
	[Phone] [nvarchar](max) NULL,
	[IsHD] [bit] NOT NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AreaSearchs]    Script Date: 12/19/2020 8:02:08 PM ******/
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
/****** Object:  Table [dbo].[Bills]    Script Date: 12/19/2020 8:02:08 PM ******/
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
 CONSTRAINT [PK_Bills] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuyMoneys]    Script Date: 12/19/2020 8:02:08 PM ******/
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
/****** Object:  Table [dbo].[Citys]    Script Date: 12/19/2020 8:02:08 PM ******/
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
/****** Object:  Table [dbo].[Convesation_replys]    Script Date: 12/19/2020 8:02:08 PM ******/
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
/****** Object:  Table [dbo].[Convesations]    Script Date: 12/19/2020 8:02:08 PM ******/
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
/****** Object:  Table [dbo].[Details]    Script Date: 12/19/2020 8:02:08 PM ******/
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
	[MotelId] [int] NOT NULL,
	[Legal] [nvarchar](max) NULL,
	[LiveTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Details] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Districts]    Script Date: 12/19/2020 8:02:08 PM ******/
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
/****** Object:  Table [dbo].[Emails]    Script Date: 12/19/2020 8:02:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[To] [nvarchar](max) NULL,
	[Cc] [nvarchar](max) NULL,
	[Subject] [nvarchar](max) NULL,
	[Text] [nvarchar](max) NULL,
 CONSTRAINT [PK_Emails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 12/19/2020 8:02:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[LastLogOnDate] [datetime2](7) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[Gender] [bit] NOT NULL,
	[EmployeeImage] [nvarchar](max) NULL,
	[Birthday] [datetime2](7) NOT NULL,
	[Phone] [nvarchar](max) NULL,
	[AddressOne] [nvarchar](max) NULL,
	[AddressTwo] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[AccountId] [int] NOT NULL,
	[ManageEmployeeId] [int] NULL,
	[HovaTen] [nvarchar](max) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 12/19/2020 8:02:08 PM ******/
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
/****** Object:  Table [dbo].[LiveTypes]    Script Date: 12/19/2020 8:02:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LiveTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_LiveTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Motels]    Script Date: 12/19/2020 8:02:08 PM ******/
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
	[VerifyAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_Motels] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 12/19/2020 8:02:08 PM ******/
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
/****** Object:  Table [dbo].[PriceSearchs]    Script Date: 12/19/2020 8:02:08 PM ******/
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
/****** Object:  Table [dbo].[Provinces]    Script Date: 12/19/2020 8:02:08 PM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 12/19/2020 8:02:08 PM ******/
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
/****** Object:  Table [dbo].[Serviceprices]    Script Date: 12/19/2020 8:02:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Serviceprices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Typeofnew] [nvarchar](max) NULL,
	[Date] [nvarchar](max) NULL,
	[PriceDate] [nvarchar](max) NULL,
	[PriceMonth] [nvarchar](max) NULL,
	[PriceUpTop] [nvarchar](max) NULL,
	[PriceWeek] [nvarchar](max) NULL,
 CONSTRAINT [PK_Serviceprices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topics]    Script Date: 12/19/2020 8:02:08 PM ******/
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
/****** Object:  Table [dbo].[Typeofnews]    Script Date: 12/19/2020 8:02:08 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 12/19/2020 8:02:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[LastLogOnDate] [datetime2](7) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[Gender] [bit] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[UserImage] [nvarchar](max) NULL,
	[AccountId] [int] NOT NULL,
	[HovaTen] [nvarchar](max) NULL,
	[Facebook] [nvarchar](max) NULL,
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
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201213164557_addemail', N'3.1.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201215042655_editservice', N'3.1.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201215042942_editservice2', N'3.1.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201216023602_Likemotel', N'3.1.9')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201216092504_editbill', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201216151037_EditImagesa', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201217015505_EditName', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201217030016_EditNameFacebook', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201217153129_Deteledata', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201217171545_AddNEW', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201218075551_Addnewtable3', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201218080119_Deteletypelivenew', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201218080509_delete2', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201218081314_new9', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201218082004_newtable', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201218082938_fix', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201218083149_fix2', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201218084304_new', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201218084714_fixdata2', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201218093932_newdate', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201218094819_newdate2', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201218095731_newdate3', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201218100530_newdateô', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201218162350_ishdEdit', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201218183450_ishdEditadminverify', N'3.1.10')
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([Id], [Username], [Password], [IsActive], [RoleId], [Phone], [IsHD]) VALUES (35, N'DEV', N'123', 1, 1, N'0968320200', 0)
INSERT [dbo].[Accounts] ([Id], [Username], [Password], [IsActive], [RoleId], [Phone], [IsHD]) VALUES (36, N'aaa', N'143', 1, 1, N'0968320253', 0)
INSERT [dbo].[Accounts] ([Id], [Username], [Password], [IsActive], [RoleId], [Phone], [IsHD]) VALUES (38, N'aaa', N'123', 1, 4, N'0231556658', 0)
INSERT [dbo].[Accounts] ([Id], [Username], [Password], [IsActive], [RoleId], [Phone], [IsHD]) VALUES (39, NULL, N'123', 1, 1, N'0124586559', 0)
INSERT [dbo].[Accounts] ([Id], [Username], [Password], [IsActive], [RoleId], [Phone], [IsHD]) VALUES (40, NULL, N'123', 1, 1, N'1234567895', 0)
INSERT [dbo].[Accounts] ([Id], [Username], [Password], [IsActive], [RoleId], [Phone], [IsHD]) VALUES (41, N'chu', N'123', 1, 2, N'5775755757', 0)
INSERT [dbo].[Accounts] ([Id], [Username], [Password], [IsActive], [RoleId], [Phone], [IsHD]) VALUES (42, N'cuong', N'123', 1, 2, N'0212123454', 0)
INSERT [dbo].[Accounts] ([Id], [Username], [Password], [IsActive], [RoleId], [Phone], [IsHD]) VALUES (43, N'ha', N'123', 1, 2, N'0124578754', 0)
INSERT [dbo].[Accounts] ([Id], [Username], [Password], [IsActive], [RoleId], [Phone], [IsHD]) VALUES (44, N'thao', N'123', 1, 3, N'0123565789', 0)
INSERT [dbo].[Accounts] ([Id], [Username], [Password], [IsActive], [RoleId], [Phone], [IsHD]) VALUES (45, N'tam', N'123', 1, 1, N'0215486856', 0)
INSERT [dbo].[Accounts] ([Id], [Username], [Password], [IsActive], [RoleId], [Phone], [IsHD]) VALUES (46, NULL, N'123', 1, 1, N'0867490321', 0)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
SET IDENTITY_INSERT [dbo].[Bills] ON 

INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (4, N'Đăng theo ngày', 12, 570000, 98)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (5, N'Đăng theo ngày', 14, 450000, 99)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (6, N'Đăng theo tuần', 4, 353535, 100)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (9, N'Đăng theo ngày', 14, 342424, 101)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (10, N'Đăng theo tuần', 4, 242434, 102)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (11, N'Đăng theo tuần', 3, 242424, 103)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (12, N'Đăng theo tuần', 4, 342422, 104)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (13, N'Đăng theo tuần', 5, 324234, 105)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (15, N'Đăng theo tuần', 4, 554544, 106)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (16, N'Đăng theo tháng', 3, 243242, 107)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (17, N'Đăng theo tuần', 5, 343443, 108)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (18, N'Đăng theo ngày', 15, 241124, 109)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (19, N'Đăng theo tuần', 5, 353435, 110)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (20, N'Đăng theo tuần', 4, 123232, 111)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (21, N'Đăng theo tuần', 3, 232423, 112)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (22, N'Đăng theo tháng', 3, 231131, 113)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (25, N'Đăng theo ngày', 12, 212311, 114)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (26, N'Đăng theo tháng', 5, 121231, 115)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (27, N'Đăng theo tuần', 3, 232323, 116)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (28, N'Đăng theo tuần', 4, 223424, 117)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (29, N'Đăng theo tháng', 3, 223424, 118)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (30, N'Đăng theo tháng', 3, 242422, 119)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (31, N'Đăng theo tuần', 3, 213133, 120)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (32, N'Đăng theo tuần', 3, 213121, 121)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (33, N'Đăng theo ngày', 8, 123113, 122)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (34, N'Đăng theo tuần', 3, 322342, 123)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (35, N'Đăng theo tuần', 3, 232424, 124)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (36, N'Đăng theo tuần', 3, 231313, 125)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (37, N'Đăng theo tháng', 3, 132131, 126)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (38, N'Đăng theo tuần', 3, 231323, 127)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (39, N'Đăng theo tháng', 3, 123133, 128)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (42, N'Đăng theo tuần', 5, 242424, 129)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (43, N'Đăng theo tháng', 4, 232424, 130)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (44, N'Đăng theo tháng', 4, 331313, 131)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (45, N'Đăng theo tháng', 4, 312133, 132)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (46, N'Đăng theo tuần', 3, 242424, 133)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (47, N'Đăng theo tuần', 4, 223131, 134)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (48, N'Đăng theo tuần', 4, 243424, 135)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (49, N'Đăng theo ngày', 9, 232142, 136)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (50, N'Đăng theo tháng', 3, 212313, 137)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (51, N'Đăng theo tháng', 3, 232131, 138)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (52, N'Đăng theo tuần', 3, 231131, 139)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (53, N'Đăng theo tuần', 3, 331331, 140)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (54, N'Đăng theo tuần', 3, 312131, 141)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (55, N'Đăng theo tuần', 4, 424242, 142)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (56, N'Đăng theo tháng', 3, 213213, 143)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (57, N'Đăng theo tháng', 3, 232323, 144)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (58, N'Đăng theo tuần', 5, 122313, 145)
INSERT [dbo].[Bills] ([Id], [TimeChoice], [NumberDatePublish], [PayMoney], [MotelId]) VALUES (63, N'Đăng theo tuần', 10, 120000, 151)
SET IDENTITY_INSERT [dbo].[Bills] OFF
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

INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (93, 2, 1, 4, N'Đông Nam', NULL, 98, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (94, 1, 1, 1, N'Đông ', NULL, 99, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (95, 2, 2, 3, NULL, NULL, 100, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (96, 1, 1, 1, NULL, NULL, 101, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (97, 2, 2, 1, NULL, NULL, 102, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (98, 3, 3, 1, NULL, NULL, 103, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (99, 1, 1, 1, NULL, NULL, 104, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (100, 1, 1, 1, NULL, NULL, 105, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (101, 2, 2, 1, NULL, NULL, 106, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (102, 2, 1, 1, NULL, NULL, 107, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (103, 1, 2, 1, NULL, NULL, 108, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (104, 1, 2, 1, NULL, NULL, 109, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (105, 3, 3, 1, NULL, NULL, 110, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (106, 3, 3, 1, NULL, NULL, 111, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (107, 2, 2, 2, NULL, NULL, 112, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (108, 1, 1, 2, NULL, NULL, 113, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (109, 1, 1, 2, NULL, NULL, 114, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (110, 4, 3, 2, NULL, NULL, 115, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (111, 2, 3, 2, NULL, NULL, 116, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (112, 3, 3, 2, NULL, NULL, 117, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (113, 1, 2, 2, NULL, NULL, 118, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (114, 1, 1, 3, NULL, NULL, 119, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (115, 1, 1, 3, NULL, NULL, 120, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (116, 2, 2, 3, NULL, NULL, 121, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (117, 2, 2, 3, NULL, NULL, 122, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (118, 2, 2, 3, NULL, NULL, 123, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (119, 4, 3, 3, NULL, NULL, 124, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (120, 1, 1, 3, NULL, NULL, 125, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (121, 2, 2, 3, NULL, NULL, 126, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (122, 2, 2, 3, NULL, NULL, 127, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (123, 1, 1, 4, NULL, NULL, 128, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (124, 1, 1, 4, NULL, NULL, 129, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (125, 1, 1, 4, NULL, NULL, 130, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (126, 1, 1, 4, NULL, NULL, 131, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (127, 1, 1, 4, NULL, NULL, 132, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (128, 1, 1, 4, NULL, NULL, 133, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (129, 1, 1, 4, NULL, NULL, 134, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (130, 1, 1, 4, NULL, NULL, 135, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (131, 1, 1, 5, NULL, NULL, 136, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (132, 1, 1, 5, NULL, NULL, 137, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (133, 2, 1, 5, NULL, NULL, 138, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (134, 1, 1, 5, NULL, NULL, 139, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (135, 1, 1, 5, NULL, NULL, 140, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (136, 1, 1, 5, NULL, NULL, 141, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (137, 1, 1, 5, NULL, NULL, 142, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (138, 1, 1, 5, NULL, NULL, 143, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (139, 1, 1, 5, NULL, NULL, 144, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (140, 1, 1, 5, NULL, NULL, 145, NULL, 1)
INSERT [dbo].[Details] ([Id], [NumberBath], [NumberLiving], [TypeofnewId], [Director], [Directormain], [MotelId], [Legal], [LiveTypeId]) VALUES (149, 3, 4, 4, N'Đông Bắc', NULL, 151, N'Giấy phép xây dựng', 1)
SET IDENTITY_INSERT [dbo].[Details] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([Id], [CreatedDate], [LastLogOnDate], [Email], [Gender], [EmployeeImage], [Birthday], [Phone], [AddressOne], [AddressTwo], [City], [Country], [AccountId], [ManageEmployeeId], [HovaTen]) VALUES (1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Hathientam@gmail.com', 1, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Employees%2Fimages%20(1).jpg?alt=media&token=33f471a3-9424-4cdc-a7c0-2b8a2f87e02b', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'0965847526', NULL, NULL, N'1', N'9', 41, NULL, N'Bùi Văn Hà')
INSERT [dbo].[Employees] ([Id], [CreatedDate], [LastLogOnDate], [Email], [Gender], [EmployeeImage], [Birthday], [Phone], [AddressOne], [AddressTwo], [City], [Country], [AccountId], [ManageEmployeeId], [HovaTen]) VALUES (3, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Thanhthien3@gmail.com', 1, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Employees%2Fimages%20(2).jpg?alt=media&token=7fa15a5e-3eb8-42c8-b1ef-b01e8ffd07d6', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'0123654879', NULL, NULL, N'1', N'7', 42, NULL, N'Nguyễn Huy Cường')
INSERT [dbo].[Employees] ([Id], [CreatedDate], [LastLogOnDate], [Email], [Gender], [EmployeeImage], [Birthday], [Phone], [AddressOne], [AddressTwo], [City], [Country], [AccountId], [ManageEmployeeId], [HovaTen]) VALUES (4, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Honghtanh@gmail.com', 0, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Employees%2Ft%E1%BA%A3i%20xu%E1%BB%91ng%20(1).jpg?alt=media&token=eded22d2-d7a0-4518-85a2-b77c158b18f4', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'0214587564', NULL, NULL, N'1', N'5', 43, NULL, N'Trần Trọng Nhân')
INSERT [dbo].[Employees] ([Id], [CreatedDate], [LastLogOnDate], [Email], [Gender], [EmployeeImage], [Birthday], [Phone], [AddressOne], [AddressTwo], [City], [Country], [AccountId], [ManageEmployeeId], [HovaTen]) VALUES (5, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'ThanhhOA@gmail.com', 1, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Employees%2Fimages%20(4).jpg?alt=media&token=fecedce8-95d1-4f9d-8275-00ef8781d379', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'0123654788', NULL, NULL, N'1', N'6', 44, NULL, N'Lưu Thanh Hoa')
INSERT [dbo].[Employees] ([Id], [CreatedDate], [LastLogOnDate], [Email], [Gender], [EmployeeImage], [Birthday], [Phone], [AddressOne], [AddressTwo], [City], [Country], [AccountId], [ManageEmployeeId], [HovaTen]) VALUES (7, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Thienhandh@gmail.com', 1, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Employees%2Ft%E1%BA%A3i%20xu%E1%BB%91ng%20(1).jpg?alt=media&token=eded22d2-d7a0-4518-85a2-b77c158b18f4', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'0478521452', NULL, NULL, N'1', N'3', 45, NULL, N'Bách Thiên Loa')
INSERT [dbo].[Employees] ([Id], [CreatedDate], [LastLogOnDate], [Email], [Gender], [EmployeeImage], [Birthday], [Phone], [AddressOne], [AddressTwo], [City], [Country], [AccountId], [ManageEmployeeId], [HovaTen]) VALUES (11, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Thanhvien@vip', 0, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Employees%2Ft%E1%BA%A3i%20xu%E1%BB%91ng.jpg?alt=media&token=fb8e7a98-bee5-47f3-b56c-511e171f3d67', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'0124585865', NULL, NULL, N'1', N'Vietname', 38, NULL, N'Thành Tú Văn')
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (49, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/MinhHoang%2F4_1607491970402?alt=media&token=3d89dd20-14ee-46b8-ab06-9c8215a43264', 98)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (50, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Lam%20Nha%2F5_1607492145420?alt=media&token=a4278584-05d9-487b-ae94-e2290e41a344', 99)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (51, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Lam%20Nha%2F6_1607492445552?alt=media&token=1b762e8f-49cf-43e2-b60a-950e8cb31e2e', 100)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (52, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/MinhHoang%2F7_1607492548122?alt=media&token=491e693e-5779-44c5-8a39-b7dfa2d72aae', 101)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (53, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/MinhHoang%2F8_1607492548134?alt=media&token=c76ea916-6314-48ea-8aba-45c024c783a9', 101)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (54, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Ph%C3%B2ng%20tr%E1%BB%8D%20T%C3%A2n%20B%C3%ACnh%20Full%20n%E1%BB%99i%20th%E1%BA%A5t%20-%20Gi%C3%A1%203tr8%2F72fa83d22dcfd6918fde8_1584192775_1607600993671?alt=media&token=b4af5e02-0844-4323-ba2e-2d0e9534f52b', 102)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (55, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Ph%C3%B2ng%20tr%E1%BB%8D%20T%C3%A2n%20B%C3%ACnh%20Full%20n%E1%BB%99i%20th%E1%BA%A5t%20-%20Gi%C3%A1%203tr8%2F2f69c766957b6e25376a11_1584192746_1607600993664?alt=media&token=f5132879-c3bf-4e3e-a2f9-e6eb65dedba7', 102)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (56, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Ph%C3%B2ng%20tr%E1%BB%8D%20T%C3%A2n%20B%C3%ACnh%20Full%20n%E1%BB%99i%20th%E1%BA%A5t%20-%20Gi%C3%A1%203tr8%2Fe9ac8aa0d8bd23e37aac14_1584192747_1607600993672?alt=media&token=523b8e4b-f864-4a80-86d8-50d63bbca0cd', 102)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (57, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/C%E1%BA%A7n%20cho%20thu%C3%AA%20ph%C3%B2ng%20tr%E1%BB%8D%20cao%20c%E1%BA%A5p%20m%E1%BB%9Bi%20x%C3%A2y%20%C4%91%E1%BA%A7y%20%C4%91%E1%BB%A7%20ti%E1%BB%87n%20nghi%2F8353c177-0f7b-4261-b926-b3b9e74d602a_1607319933_1607601117508?alt=media&token=c9ce86b1-aba4-4c55-8a28-c76048eb877b', 103)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (58, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/C%E1%BA%A7n%20cho%20thu%C3%AA%20ph%C3%B2ng%20tr%E1%BB%8D%20cao%20c%E1%BA%A5p%20m%E1%BB%9Bi%20x%C3%A2y%20%C4%91%E1%BA%A7y%20%C4%91%E1%BB%A7%20ti%E1%BB%87n%20nghi%2F2f69c766957b6e25376a11_1584192746_1607601117507?alt=media&token=8102f5aa-f77f-4a7f-9b08-2e48bb468cb1', 103)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (59, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/C%E1%BA%A7n%20cho%20thu%C3%AA%20ph%C3%B2ng%20tr%E1%BB%8D%20cao%20c%E1%BA%A5p%20m%E1%BB%9Bi%20x%C3%A2y%20%C4%91%E1%BA%A7y%20%C4%91%E1%BB%A7%20ti%E1%BB%87n%20nghi%2F1bd10940-0d14-48c3-9b3c-177f786e72af_1607319933_1607601117501?alt=media&token=dba23dd5-f1bd-405c-9b4b-07ee0aa1be34', 103)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (60, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Ph%C3%B2ng%20tr%E1%BB%8D%20d%E1%BA%A1ng%20c%C4%83n%20h%E1%BB%99%20mini%20cao%20c%E1%BA%A5p%20t%E1%BA%A1i%20796%20L%C3%AA%20%C4%90%E1%BB%A9c%20Th%E1%BB%8D%2C%20P.15%2C%20Qu%E1%BA%ADn%20G%C3%B2%20V%E1%BA%A5p%2F60eb11f6d8fa3aa463eb_1551067970_1607601266037?alt=media&token=ee8e9876-446f-462b-b34e-7818816ab66b', 104)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (61, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Ph%C3%B2ng%20tr%E1%BB%8D%20d%E1%BA%A1ng%20c%C4%83n%20h%E1%BB%99%20mini%20cao%20c%E1%BA%A5p%20t%E1%BA%A1i%20796%20L%C3%AA%20%C4%90%E1%BB%A9c%20Th%E1%BB%8D%2C%20P.15%2C%20Qu%E1%BA%ADn%20G%C3%B2%20V%E1%BA%A5p%2F1bd10940-0d14-48c3-9b3c-177f786e72af_1607319933_1607601266030?alt=media&token=df19fdd6-cf3e-42b6-ac65-f2eb2cb984d8', 104)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (62, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Ph%C3%B2ng%20tr%E1%BB%8D%20d%E1%BA%A1ng%20c%C4%83n%20h%E1%BB%99%20mini%20cao%20c%E1%BA%A5p%20t%E1%BA%A1i%20796%20L%C3%AA%20%C4%90%E1%BB%A9c%20Th%E1%BB%8D%2C%20P.15%2C%20Qu%E1%BA%ADn%20G%C3%B2%20V%E1%BA%A5p%2Fz2112041066335-4a0937a007cf168e64de4f35911591b7_1604545417_1607601266038?alt=media&token=c38f9954-f334-47b6-b170-9d1efe94d5d2', 104)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (63, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/K%E1%BA%BE%20B%C3%8AN%20LOTTE%20QU%E1%BA%ACN%207%2C%20G%E1%BB%ACI%20XE%20T%E1%BA%A6NG%20H%E1%BA%A6M%2C%20B%E1%BA%A2O%20V%E1%BB%86%2024%2F7%20GI%E1%BB%9C%20GI%E1%BA%A4C%20T%E1%BB%B0%20DO%2C%202%20THANG%20M%C3%81Y.%20ALO%3A%200906.921.009%2F255d696b-7ed5-4337-a29b-910e4f7be0b0_1584580422_1607601393954?alt=media&token=a53330ab-edb1-4849-a778-5dbbbc50c5fd', 105)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (64, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/K%E1%BA%BE%20B%C3%8AN%20LOTTE%20QU%E1%BA%ACN%207%2C%20G%E1%BB%ACI%20XE%20T%E1%BA%A6NG%20H%E1%BA%A6M%2C%20B%E1%BA%A2O%20V%E1%BB%86%2024%2F7%20GI%E1%BB%9C%20GI%E1%BA%A4C%20T%E1%BB%B0%20DO%2C%202%20THANG%20M%C3%81Y.%20ALO%3A%200906.921.009%2F47ced932-7dd5-4d8a-850e-128a7c6275be_1584580436_1607601393949?alt=media&token=41ccb00a-9d2c-44e6-9f64-d11d1671c580', 105)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (65, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/K%E1%BA%BE%20B%C3%8AN%20LOTTE%20QU%E1%BA%ACN%207%2C%20G%E1%BB%ACI%20XE%20T%E1%BA%A6NG%20H%E1%BA%A6M%2C%20B%E1%BA%A2O%20V%E1%BB%86%2024%2F7%20GI%E1%BB%9C%20GI%E1%BA%A4C%20T%E1%BB%B0%20DO%2C%202%20THANG%20M%C3%81Y.%20ALO%3A%200906.921.009%2F658561a9-d34f-47d8-a14d-e32ba3ef3ff7_1584580422_1607601393955?alt=media&token=d5e27b62-4efa-46c4-92ff-a85fd3254ab5', 105)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (66, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/PH%C3%92NG%20FULL%20TI%E1%BB%86N%20NGHI%20TRUNG%20T%C3%82M%20Q3%2Fc8b93467-8b27-4c19-9056-ce9a5820aaf6_1599188833_1607601536858?alt=media&token=6f66334c-3c80-425b-b47c-20f543c0aed7', 106)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (67, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/PH%C3%92NG%20FULL%20TI%E1%BB%86N%20NGHI%20TRUNG%20T%C3%82M%20Q3%2Ff169b896-f15e-485b-b1a9-b4243850883e_1599188838_1607601536859?alt=media&token=12212e1a-fa39-465c-ad58-c6323f2d17f4', 106)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (68, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/PH%C3%92NG%20FULL%20TI%E1%BB%86N%20NGHI%20TRUNG%20T%C3%82M%20Q3%2F47ced932-7dd5-4d8a-850e-128a7c6275be_1584580436_1607601536853?alt=media&token=640e08dc-705f-45b3-bc4c-1875e53779d0', 106)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (69, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Cho%20thu%C3%AA%20ph%C3%B2ng%20tr%E1%BB%8D%2017%20%C4%90%C6%B0%E1%BB%9Dng%20s%E1%BB%91%2061%2C%20P.Th%E1%BA%A1nh%20M%E1%BB%B9%20L%E1%BB%A3i%2C%20Q.2%20gi%C3%A1%20t%E1%BB%AB%204tr5%2Fphoto-2019-02-26-082817_1551149356_1607601647871?alt=media&token=7919538e-e4b1-4663-8fa6-886d9bb25ca9', 107)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (70, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Cho%20thu%C3%AA%20ph%C3%B2ng%20tr%E1%BB%8D%2017%20%C4%90%C6%B0%E1%BB%9Dng%20s%E1%BB%91%2061%2C%20P.Th%E1%BA%A1nh%20M%E1%BB%B9%20L%E1%BB%A3i%2C%20Q.2%20gi%C3%A1%20t%E1%BB%AB%204tr5%2Fphoto-2019-02-26-082803_1551149353_1607601647870?alt=media&token=38c2227f-a75a-4418-860e-78f1348f098d', 107)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (71, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Cho%20thu%C3%AA%20ph%C3%B2ng%20tr%E1%BB%8D%2017%20%C4%90%C6%B0%E1%BB%9Dng%20s%E1%BB%91%2061%2C%20P.Th%E1%BA%A1nh%20M%E1%BB%B9%20L%E1%BB%A3i%2C%20Q.2%20gi%C3%A1%20t%E1%BB%AB%204tr5%2F47ced932-7dd5-4d8a-850e-128a7c6275be_1584580436_1607601647864?alt=media&token=5ba56621-3168-450f-af11-b9597578548c', 107)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (72, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Cho%20thu%C3%AA%20ph%C3%B2ng%20m%E1%BB%9Bi%20di%E1%BB%87n%20t%C3%ADch%2032m2%2C%20gi%C3%A1%204.5tr%2Fth%C3%A1ng%20c%C3%B3%20s%E1%BA%B5n%20n%E1%BB%99i%20th%E1%BA%A5t%20c%C6%A1%20b%E1%BA%A3n%2Fz2216753993030-b68a21b545652284e3e01ebbc16b0fea_1607398735_1607601766687?alt=media&token=5a517228-ca7d-4d86-8ea5-4b4eec8dfae2', 108)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (73, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Cho%20thu%C3%AA%20ph%C3%B2ng%20m%E1%BB%9Bi%20di%E1%BB%87n%20t%C3%ADch%2032m2%2C%20gi%C3%A1%204.5tr%2Fth%C3%A1ng%20c%C3%B3%20s%E1%BA%B5n%20n%E1%BB%99i%20th%E1%BA%A5t%20c%C6%A1%20b%E1%BA%A3n%2Fz2216753993029-a568cfe7e11d8abc207c55af1d00959e_1607398734_1607601766686?alt=media&token=1e0b033b-4310-41ca-8c22-b381d9bc3e3e', 108)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (74, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Cho%20thu%C3%AA%20ph%C3%B2ng%20m%E1%BB%9Bi%20di%E1%BB%87n%20t%C3%ADch%2032m2%2C%20gi%C3%A1%204.5tr%2Fth%C3%A1ng%20c%C3%B3%20s%E1%BA%B5n%20n%E1%BB%99i%20th%E1%BA%A5t%20c%C6%A1%20b%E1%BA%A3n%2Fphoto-2019-02-26-082803_1551149353_1607601766681?alt=media&token=fb39331c-7ac5-41db-b611-8820b3b21fcb', 108)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (75, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/ph%C3%B2ng%20tr%E1%BB%8D%20m%E1%BB%9Bi%20x%C3%A2y%2C%20Gi%E1%BA%A3m%20ngay%20500k%203%20th%C3%A1ng%20%C4%91%E1%BA%A7u%2F3294fbd1-8dcc-4052-9f3d-0651b0d53958_1587952817_1607601892176?alt=media&token=aa90c8b2-6407-4927-9015-81151d80f1c3', 109)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (76, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/ph%C3%B2ng%20tr%E1%BB%8D%20m%E1%BB%9Bi%20x%C3%A2y%2C%20Gi%E1%BA%A3m%20ngay%20500k%203%20th%C3%A1ng%20%C4%91%E1%BA%A7u%2Fz2216753993030-b68a21b545652284e3e01ebbc16b0fea_1607398735_1607601892182?alt=media&token=9ad58809-5f3a-48d1-93b8-44f4771560ba', 109)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (77, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/ph%C3%B2ng%20tr%E1%BB%8D%20m%E1%BB%9Bi%20x%C3%A2y%2C%20Gi%E1%BA%A3m%20ngay%20500k%203%20th%C3%A1ng%20%C4%91%E1%BA%A7u%2Fd33180d6-ae78-44d9-a2c6-4e3ed7c51aa5_1587952817_1607601892181?alt=media&token=50dc07e9-91de-41e9-8e8c-9d89ae4b5a33', 109)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (78, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Ph%C3%B2ng%20full%20n%E1%BB%99i%20th%E1%BA%A5t%3A%20gi%C3%A1%20t%E1%BB%AB%3A2tr_4tr.%20%C4%90c%3A%20918A%20T%E1%BA%A1%20Quang%20B%E1%BB%ADu%2C%20P5%2C%20Q.8.%20LH%3A0903970791%20g%E1%BA%B7p%20A%20L%E1%BB%99c%2Fimg20190531192332_1593915303_1607602017675?alt=media&token=22bb159f-d472-4740-8dce-d617df38a9fa', 110)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (79, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Ph%C3%B2ng%20full%20n%E1%BB%99i%20th%E1%BA%A5t%3A%20gi%C3%A1%20t%E1%BB%AB%3A2tr_4tr.%20%C4%90c%3A%20918A%20T%E1%BA%A1%20Quang%20B%E1%BB%ADu%2C%20P5%2C%20Q.8.%20LH%3A0903970791%20g%E1%BA%B7p%20A%20L%E1%BB%99c%2Fimg20190605160437_1567650966_1607602017676?alt=media&token=7859570d-d298-40f8-8348-ce07bc41e2b7', 110)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (80, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Ph%C3%B2ng%20full%20n%E1%BB%99i%20th%E1%BA%A5t%3A%20gi%C3%A1%20t%E1%BB%AB%3A2tr_4tr.%20%C4%90c%3A%20918A%20T%E1%BA%A1%20Quang%20B%E1%BB%ADu%2C%20P5%2C%20Q.8.%20LH%3A0903970791%20g%E1%BA%B7p%20A%20L%E1%BB%99c%2F3294fbd1-8dcc-4052-9f3d-0651b0d53958_1587952817_1607602017670?alt=media&token=0517d342-5a42-426c-8ba5-9ac4b981458a', 110)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (81, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Ph%C3%B2ng%20tr%E1%BB%8D%20c%C3%B3%20n%E1%BB%99i%20th%E1%BA%A5t.%20Gi%E1%BB%9D%20gi%E1%BA%A5c%20t%E1%BB%B1%20do.%20Gi%C3%A1%3A%202tr_3tr%2Fth%C3%A1ng%3A%20%C4%90C%3A13%2F3%2C%20B%C3%B4ng%20Sao%2C%20p5%2C%20q8%3A%20%C4%90T%3A0903970791%20g%E1%BA%B7p%20anh%20L%E1%BB%99c%2Fimg20200609112802_1599542896_1607602250112?alt=media&token=84b6f29b-5721-4b60-b449-ccb63682850c', 111)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (82, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Ph%C3%B2ng%20tr%E1%BB%8D%20c%C3%B3%20n%E1%BB%99i%20th%E1%BA%A5t.%20Gi%E1%BB%9D%20gi%E1%BA%A5c%20t%E1%BB%B1%20do.%20Gi%C3%A1%3A%202tr_3tr%2Fth%C3%A1ng%3A%20%C4%90C%3A13%2F3%2C%20B%C3%B4ng%20Sao%2C%20p5%2C%20q8%3A%20%C4%90T%3A0903970791%20g%E1%BA%B7p%20anh%20L%E1%BB%99c%2F3294fbd1-8dcc-4052-9f3d-0651b0d53958_1587952817_1607602250106?alt=media&token=37647d99-44d7-48c8-a42a-bd90c2e2751d', 111)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (83, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Ph%C3%B2ng%20tr%E1%BB%8D%20c%C3%B3%20n%E1%BB%99i%20th%E1%BA%A5t.%20Gi%E1%BB%9D%20gi%E1%BA%A5c%20t%E1%BB%B1%20do.%20Gi%C3%A1%3A%202tr_3tr%2Fth%C3%A1ng%3A%20%C4%90C%3A13%2F3%2C%20B%C3%B4ng%20Sao%2C%20p5%2C%20q8%3A%20%C4%90T%3A0903970791%20g%E1%BA%B7p%20anh%20L%E1%BB%99c%2Fimg-1565871178592-1565921519615_1566458828_1607602250111?alt=media&token=9d95ca2f-9072-4ee4-a29c-ba2ed53d633e', 111)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (84, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/nh%C3%A0%20m%E1%BA%B7t%20ti%E1%BB%81n%20cho%20thu%C3%AA%20nguy%C3%AAn%20c%C4%83n%2C%20%C4%91%C6%B0%E1%BB%9Dng%20s%E1%BB%91%208%20G%C3%B2%20V%E1%BA%A5p%2Fimg20200609112802_1599542896_1607602422116?alt=media&token=743716ba-0502-4ff5-8146-fd3c170d5bb8', 112)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (85, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/nh%C3%A0%20m%E1%BA%B7t%20ti%E1%BB%81n%20cho%20thu%C3%AA%20nguy%C3%AAn%20c%C4%83n%2C%20%C4%91%C6%B0%E1%BB%9Dng%20s%E1%BB%91%208%20G%C3%B2%20V%E1%BA%A5p%2Fok-living-room-1_1607235867_1607602422122?alt=media&token=44e57eb4-35ce-4590-bcaf-588bb7b4307b', 112)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (86, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/nh%C3%A0%20m%E1%BA%B7t%20ti%E1%BB%81n%20cho%20thu%C3%AA%20nguy%C3%AAn%20c%C4%83n%2C%20%C4%91%C6%B0%E1%BB%9Dng%20s%E1%BB%91%208%20G%C3%B2%20V%E1%BA%A5p%2Fok-garden_1607235848_1607602422120?alt=media&token=09dc6fd6-0bea-408f-a9e3-3ddd6b9db7ea', 112)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (87, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Nh%C3%A0%20nguy%C3%AAn%20c%C4%83n%20gi%C3%A1%20r%E1%BA%BB%2C%20%C4%91i%E1%BB%87n%20n%C6%B0%E1%BB%9Bc%20ch%C3%ADnh%20ch%E1%BB%A7%2Fok-living-room-1_1607235867_1607602545117?alt=media&token=ce1d21a2-d6cf-4b0f-9776-95832407132d', 113)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (88, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Nh%C3%A0%20nguy%C3%AAn%20c%C4%83n%20gi%C3%A1%20r%E1%BA%BB%2C%20%C4%91i%E1%BB%87n%20n%C6%B0%E1%BB%9Bc%20ch%C3%ADnh%20ch%E1%BB%A7%2F485c5467-1933-4c66-a732-2012284121ff_1603117066_1607602545111?alt=media&token=fbcd1d56-cb85-4465-a6f1-042ebd3fd58c', 113)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (89, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Nh%C3%A0%20nguy%C3%AAn%20c%C4%83n%20gi%C3%A1%20r%E1%BA%BB%2C%20%C4%91i%E1%BB%87n%20n%C6%B0%E1%BB%9Bc%20ch%C3%ADnh%20ch%E1%BB%A7%2F5468d418-7dcb-4f41-a373-befa62b92ec0_1603117072_1607602545116?alt=media&token=84d76afe-26d1-49f2-be8c-a89924a5a3eb', 113)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (90, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/CHO%20THU%C3%8A%20NH%C3%80%20GI%C3%81%20R%E1%BA%BA%20c4%20PH%E1%BA%A0M%20H%C3%99NG%2C%20NH%C3%80%201%20TR%E1%BB%86T%2C%201%20L%E1%BA%A6U%2C%202%20PH%C3%92NG%20NG%E1%BB%A6%20%C4%90%C6%AF%E1%BB%9CNG%206%20M%2F4_1607346750_1607602689352?alt=media&token=3ccc5b73-25a6-41d0-a8b9-d1f6dd3c6493', 114)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (91, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/CHO%20THU%C3%8A%20NH%C3%80%20GI%C3%81%20R%E1%BA%BA%20c4%20PH%E1%BA%A0M%20H%C3%99NG%2C%20NH%C3%80%201%20TR%E1%BB%86T%2C%201%20L%E1%BA%A6U%2C%202%20PH%C3%92NG%20NG%E1%BB%A6%20%C4%90%C6%AF%E1%BB%9CNG%206%20M%2F5_1607346750_1607602689357?alt=media&token=aefb9ead-51af-460c-b279-2f7e893931ed', 114)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (92, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/CHO%20THU%C3%8A%20NH%C3%80%20GI%C3%81%20R%E1%BA%BA%20c4%20PH%E1%BA%A0M%20H%C3%99NG%2C%20NH%C3%80%201%20TR%E1%BB%86T%2C%201%20L%E1%BA%A6U%2C%202%20PH%C3%92NG%20NG%E1%BB%A6%20%C4%90%C6%AF%E1%BB%9CNG%206%20M%2Fok-living-room-1_1607235867_1607602689358?alt=media&token=41301dd9-7cc6-447e-af8a-2fa22dce1f01', 114)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (93, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Cho%20thu%C3%AA%20nh%C3%A0%20c%E1%BA%A5p%204%20gi%C3%A1%20r%E1%BA%BB%2C%20nguy%C3%AAn%20c%C4%83n%20k%C3%A9p%20k%C3%ADn%2Fok-living-room-1_1607235867_1607602806116?alt=media&token=302ae097-e628-45ae-bf99-9a9e24185f32', 115)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (94, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Cho%20thu%C3%AA%20nh%C3%A0%20h%E1%BA%BBm%20B%C3%A0%20L%C3%AA%20Ch%C3%A2n%2C%20Q.1%2Fviber-image-2020-11-04-10-47-02_1604483509_1607603110952?alt=media&token=eeae673f-3de3-409b-b05d-e34ccc571da6', 116)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (95, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Cho%20thu%C3%AA%20nh%C3%A0%20h%E1%BA%BBm%20B%C3%A0%20L%C3%AA%20Ch%C3%A2n%2C%20Q.1%2Fimg-0317_1576834407_1607603110944?alt=media&token=8341c7ad-b435-47f2-87cf-9e8c35a8dfea', 116)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (96, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Cho%20thu%C3%AA%20nh%C3%A0%20h%E1%BA%BBm%20B%C3%A0%20L%C3%AA%20Ch%C3%A2n%2C%20Q.1%2Fimg-0319_1576834408_1607603110951?alt=media&token=11f80f46-05bf-4ffb-8da3-4887b66c331b', 116)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (97, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Nh%C3%A0%20nguy%C3%AAn%20c%C4%83n%201%20l%E1%BA%A7u%20h%E1%BA%BBm%20300%20XVNT%2C%20P21%2C%20Qu%E1%BA%ADn%20B%C3%ACnh%20Th%E1%BA%A1nh%2F87ec58822045c21b9b54_1582190569_1607603240234?alt=media&token=3c8a8989-a699-4631-8bab-291b5303a3bc', 117)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (98, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Nh%C3%A0%20nguy%C3%AAn%20c%C4%83n%201%20l%E1%BA%A7u%20h%E1%BA%BBm%20300%20XVNT%2C%20P21%2C%20Qu%E1%BA%ADn%20B%C3%ACnh%20Th%E1%BA%A1nh%2Fviber-image-2020-11-04-10-47-02_1604483509_1607603240240?alt=media&token=94fbb9d9-dc77-451a-a576-012c6f29a0cd', 117)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (99, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Nh%C3%A0%20nguy%C3%AAn%20c%C4%83n%201%20l%E1%BA%A7u%20h%E1%BA%BBm%20300%20XVNT%2C%20P21%2C%20Qu%E1%BA%ADn%20B%C3%ACnh%20Th%E1%BA%A1nh%2Fb23293a9ea6e0830517f_1606186085_1607603240239?alt=media&token=8c2f4498-2cf2-4643-9a03-07beba68ee05', 117)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (100, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Cho%20thu%C3%AA%20nh%C3%A0%20nguy%C3%AAn%20c%C4%83n%20-%20Ch%C3%ADnh%20ch%E1%BB%A7%2C%20mi%E1%BB%85n%20trung%20gian%2F20201210-061030_1607593809_1607603605172?alt=media&token=8754f875-069e-40d5-8fb3-2012a1c66417', 118)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (101, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Cho%20thu%C3%AA%20nh%C3%A0%20nguy%C3%AAn%20c%C4%83n%20-%20Ch%C3%ADnh%20ch%E1%BB%A7%2C%20mi%E1%BB%85n%20trung%20gian%2F20201210-061133_1607593816_1607603605177?alt=media&token=9dee0b7f-ba3d-46e1-b523-e495edb68bd7', 118)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (102, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Cho%20thu%C3%AA%20nh%C3%A0%20nguy%C3%AAn%20c%C4%83n%20-%20Ch%C3%ADnh%20ch%E1%BB%A7%2C%20mi%E1%BB%85n%20trung%20gian%2Fviber-image-2020-11-04-10-47-02_1604483509_1607603605179?alt=media&token=25eeca32-5e29-4a71-89d6-0def52c9971b', 118)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (103, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Cho%20thu%C3%AA%20c%C4%83n%20h%E1%BB%99%20mini%20full%20n%E1%BB%99i%20th%E1%BA%A5t%20t%E1%BA%A1i%20Ph%C3%BA%20Nhu%E1%BA%ADn%2C%20%C4%91%E1%BB%91i%20di%E1%BB%87n%20coopmart%20Nguy%E1%BB%85n%20Ki%E1%BB%87m%2Fmg-4081_1574644165_1607603777382?alt=media&token=272e7617-5acc-42b7-a45f-abbb11955b93', 119)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (104, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Cho%20thu%C3%AA%20c%C4%83n%20h%E1%BB%99%20mini%20full%20n%E1%BB%99i%20th%E1%BA%A5t%20t%E1%BA%A1i%20Ph%C3%BA%20Nhu%E1%BA%ADn%2C%20%C4%91%E1%BB%91i%20di%E1%BB%87n%20coopmart%20Nguy%E1%BB%85n%20Ki%E1%BB%87m%2Fmg-4092_1574644154_1607603777387?alt=media&token=2b38da47-15ae-4586-96a2-07a2b12cd224', 119)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (105, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Cho%20thu%C3%AA%20c%C4%83n%20h%E1%BB%99%20mini%20full%20n%E1%BB%99i%20th%E1%BA%A5t%20t%E1%BA%A1i%20Ph%C3%BA%20Nhu%E1%BA%ADn%2C%20%C4%91%E1%BB%91i%20di%E1%BB%87n%20coopmart%20Nguy%E1%BB%85n%20Ki%E1%BB%87m%2Fviber-image-2020-11-04-10-47-02_1604483509_1607603777388?alt=media&token=6a39eb12-12ef-410a-b400-8bc5b438ba69', 119)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (106, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Cho%20Thu%C3%AA%20C%C4%83n%20H%E1%BB%99%20C%C3%B3%20G%C3%A1c%20Full%20N%E1%BB%99i%20Th%E1%BA%A5t%20Gi%C3%A1%20R%E1%BA%BB%2C%20M%E1%BB%9Bi%20100%25%2F5dd4a499-5f2a-4017-a025-a14fc30da3ed_1574060928_1607603895237?alt=media&token=00e4f775-6969-4b0f-9f8f-6000802a2ff0', 120)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (107, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Cho%20Thu%C3%AA%20C%C4%83n%20H%E1%BB%99%20C%C3%B3%20G%C3%A1c%20Full%20N%E1%BB%99i%20Th%E1%BA%A5t%20Gi%C3%A1%20R%E1%BA%BB%2C%20M%E1%BB%9Bi%20100%25%2Fviber-image-2020-11-04-10-47-02_1604483509_1607603895245?alt=media&token=1d0229cc-e35a-485a-a883-d5d1cdb00ebe', 120)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (108, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Cho%20Thu%C3%AA%20C%C4%83n%20H%E1%BB%99%20C%C3%B3%20G%C3%A1c%20Full%20N%E1%BB%99i%20Th%E1%BA%A5t%20Gi%C3%A1%20R%E1%BA%BB%2C%20M%E1%BB%9Bi%20100%25%2Fmg-4081_1574644165_1607603895244?alt=media&token=308afe20-3567-4de2-bfe2-7071e806009e', 120)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (109, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/CHO%20THU%C3%8A%20C%C4%82N%20H%E1%BB%98%20CHUNG%20C%C6%AF%20MINI%201N1K%20V%C3%80%202N1K%20NG%C3%95%2089%2C%20%C4%90%C6%AF%E1%BB%9CNG%20M%E1%BB%84%20TR%C3%8C%20TH%C6%AF%E1%BB%A2NG%2C%20M%E1%BB%84%20TR%C3%8C%2C%20NAM%20T%E1%BB%AA%20LI%C3%8AM%2C%20H%C3%80%20N%E1%BB%98I%2Fviber-image-2020-11-04-10-47-02_1604483509_1607604025301?alt=media&token=3e4c397e-573a-47c7-95a9-5a51223dac20', 121)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (110, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/CHO%20THU%C3%8A%20C%C4%82N%20H%E1%BB%98%20CHUNG%20C%C6%AF%20MINI%201N1K%20V%C3%80%202N1K%20NG%C3%95%2089%2C%20%C4%90%C6%AF%E1%BB%9CNG%20M%E1%BB%84%20TR%C3%8C%20TH%C6%AF%E1%BB%A2NG%2C%20M%E1%BB%84%20TR%C3%8C%2C%20NAM%20T%E1%BB%AA%20LI%C3%8AM%2C%20H%C3%80%20N%E1%BB%98I%2Fimg20201208174404_1607490900_1607604025295?alt=media&token=1fcd03cb-7dd1-492f-a043-6615e17c2388', 121)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (111, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/CHO%20THU%C3%8A%20C%C4%82N%20H%E1%BB%98%20CHUNG%20C%C6%AF%20MINI%201N1K%20V%C3%80%202N1K%20NG%C3%95%2089%2C%20%C4%90%C6%AF%E1%BB%9CNG%20M%E1%BB%84%20TR%C3%8C%20TH%C6%AF%E1%BB%A2NG%2C%20M%E1%BB%84%20TR%C3%8C%2C%20NAM%20T%E1%BB%AA%20LI%C3%8AM%2C%20H%C3%80%20N%E1%BB%98I%2Fimg20201208174438_1607490911_1607604025299?alt=media&token=54dea950-1567-4f9d-9f82-a4b1e066ae1b', 121)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (112, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/CHO%20THU%C3%8A%20C%C4%82N%20H%E1%BB%98%20FULL%20N%E1%BB%98I%20TH%E1%BA%A4T%205.5tr%20QU%E1%BA%ACN%20B%C3%8CNH%20TH%E1%BA%A0NH%2Fhkt8162_1606463025_1607605409780?alt=media&token=1476d398-8c2c-426e-9c89-24257441c804', 122)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (113, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/CHO%20THU%C3%8A%20C%C4%82N%20H%E1%BB%98%20FULL%20N%E1%BB%98I%20TH%E1%BA%A4T%205.5tr%20QU%E1%BA%ACN%20B%C3%8CNH%20TH%E1%BA%A0NH%2Fhkt8159_1606463024_1607605409775?alt=media&token=6c020de0-7b17-4908-8a4a-7f9884f3c022', 122)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (114, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/CHO%20THU%C3%8A%20C%C4%82N%20H%E1%BB%98%20FULL%20N%E1%BB%98I%20TH%E1%BA%A4T%205.5tr%20QU%E1%BA%ACN%20B%C3%8CNH%20TH%E1%BA%A0NH%2Fviber-image-2020-11-04-10-47-02_1604483509_1607605409781?alt=media&token=5d5dba53-0f0e-4a16-a21b-b224e3291968', 122)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (115, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/C%C4%83n%20h%E1%BB%99%20Mini%201PN%2C%20Qu%E1%BA%ADn%20T%C3%A2n%20B%C3%ACnh%2026m2%20c%C3%B3%20n%E1%BB%99%20th%E1%BA%A5t%2Fz2141172989683-fbd59321367efd5a313488eb7c2a54b1_1605584086_1607605554242?alt=media&token=95d3c769-fad7-4935-bb1b-6f0d12f003b4', 123)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (116, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/C%C4%83n%20h%E1%BB%99%20Mini%201PN%2C%20Qu%E1%BA%ADn%20T%C3%A2n%20B%C3%ACnh%2026m2%20c%C3%B3%20n%E1%BB%99%20th%E1%BA%A5t%2Fviber-image-2020-11-04-10-47-02_1604483509_1607605554236?alt=media&token=9a9916ed-e2ab-4fce-aedf-08f622b67b07', 123)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (117, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/C%C4%83n%20h%E1%BB%99%20Mini%201PN%2C%20Qu%E1%BA%ADn%20T%C3%A2n%20B%C3%ACnh%2026m2%20c%C3%B3%20n%E1%BB%99%20th%E1%BA%A5t%2Fz2141172969588-63c327f34951934b9ec1029afbaec6e0_1605584084_1607605554241?alt=media&token=7e6a4202-7025-4607-bbc2-f40ff62ac458', 123)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (118, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/C%C4%82N%20H%E1%BB%98%2045m2%20r%E1%BA%A5t%20%C4%91%E1%BA%B9p%2C%20%C4%90%E1%BA%A6Y%20%C4%90%E1%BB%A6%20N%E1%BB%98I%20TH%E1%BA%A4T%2C%20ph%C3%B2ng%20b%E1%BA%BFp%2C%20Ph%C3%B2ng%20Ng%E1%BB%A7%20ri%C3%AAng%2C%20khu%20bi%E1%BB%87t%20th%E1%BB%B1%20Him%20Lam%20sang%20tr%E1%BB%8Dng%2F2019-10-01-17-53-img-6069_1569998515_1607605898164?alt=media&token=fbd1d857-d931-4ae8-a1da-6d99566ace79', 124)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (119, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/C%C4%82N%20H%E1%BB%98%2045m2%20r%E1%BA%A5t%20%C4%91%E1%BA%B9p%2C%20%C4%90%E1%BA%A6Y%20%C4%90%E1%BB%A6%20N%E1%BB%98I%20TH%E1%BA%A4T%2C%20ph%C3%B2ng%20b%E1%BA%BFp%2C%20Ph%C3%B2ng%20Ng%E1%BB%A7%20ri%C3%AAng%2C%20khu%20bi%E1%BB%87t%20th%E1%BB%B1%20Him%20Lam%20sang%20tr%E1%BB%8Dng%2Fz2141172989683-fbd59321367efd5a313488eb7c2a54b1_1605584086_1607605898166?alt=media&token=0e146c24-2f5c-4c6e-91e2-32c7472294ab', 124)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (120, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/C%C4%82N%20H%E1%BB%98%2045m2%20r%E1%BA%A5t%20%C4%91%E1%BA%B9p%2C%20%C4%90%E1%BA%A6Y%20%C4%90%E1%BB%A6%20N%E1%BB%98I%20TH%E1%BA%A4T%2C%20ph%C3%B2ng%20b%E1%BA%BFp%2C%20Ph%C3%B2ng%20Ng%E1%BB%A7%20ri%C3%AAng%2C%20khu%20bi%E1%BB%87t%20th%E1%BB%B1%20Him%20Lam%20sang%20tr%E1%BB%8Dng%2F2019-06-21-09-36-img-4595_1569998543_1607605898159?alt=media&token=e86f8a12-0610-4c5b-9059-f256dfac4515', 124)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (121, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/C%C4%82N%20H%E1%BB%98%201PN%20%C4%90%E1%BA%A6Y%20%C4%90%E1%BB%A6%20TI%E1%BB%86N%20NGHI%20N%E1%BB%98I%20TH%E1%BA%A4T%2050M2%20NGAY%20CMT8%20-%20NG%C3%83%20T%C6%AF%20B%E1%BA%A2Y%20HI%E1%BB%80N%20GI%E1%BB%9C%20GI%E1%BA%A4C%20T%E1%BB%B0%20DO%2F2_1600243607_1607605998703?alt=media&token=8110de76-6512-4b46-9f4c-92a588e5c788', 125)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (122, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/C%C4%82N%20H%E1%BB%98%201PN%20%C4%90%E1%BA%A6Y%20%C4%90%E1%BB%A6%20TI%E1%BB%86N%20NGHI%20N%E1%BB%98I%20TH%E1%BA%A4T%2050M2%20NGAY%20CMT8%20-%20NG%C3%83%20T%C6%AF%20B%E1%BA%A2Y%20HI%E1%BB%80N%20GI%E1%BB%9C%20GI%E1%BA%A4C%20T%E1%BB%B0%20DO%2F2d24daa18b3d76632f2c_1600243609_1607605998708?alt=media&token=bd5f308a-0b20-4a15-9a40-ec8a0ca8bc09', 125)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (123, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/C%C4%82N%20H%E1%BB%98%201PN%20%C4%90%E1%BA%A6Y%20%C4%90%E1%BB%A6%20TI%E1%BB%86N%20NGHI%20N%E1%BB%98I%20TH%E1%BA%A4T%2050M2%20NGAY%20CMT8%20-%20NG%C3%83%20T%C6%AF%20B%E1%BA%A2Y%20HI%E1%BB%80N%20GI%E1%BB%9C%20GI%E1%BA%A4C%20T%E1%BB%B0%20DO%2Fz2141172989683-fbd59321367efd5a313488eb7c2a54b1_1605584086_1607605998709?alt=media&token=fbca0de4-557c-44e4-b5ba-0ed99766562d', 125)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (124, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Ph%C3%B2ng%20CC%20HAGL3%2C%20PH%C3%9A%20HO%C3%80NG%20ANH%2C%20GIAI%20VI%E1%BB%86T%20s%E1%BA%A1ch%2C%20%C4%91%E1%BA%B9p%2C%20tho%C3%A1ng%20m%C3%A1t%20c%C3%B3%20H%E1%BB%92%20B%C6%A0I%2Fz2141172989683-fbd59321367efd5a313488eb7c2a54b1_1605584086_1607606095116?alt=media&token=f5610b77-6041-425b-a691-0a779084dcba', 126)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (125, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Ph%C3%B2ng%20CC%20HAGL3%2C%20PH%C3%9A%20HO%C3%80NG%20ANH%2C%20GIAI%20VI%E1%BB%86T%20s%E1%BA%A1ch%2C%20%C4%91%E1%BA%B9p%2C%20tho%C3%A1ng%20m%C3%A1t%20c%C3%B3%20H%E1%BB%92%20B%C6%A0I%2F50_1602302006_1607606095115?alt=media&token=c576c25d-4667-4bcb-8e3e-a39f278f9e66', 126)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (126, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Ph%C3%B2ng%20CC%20HAGL3%2C%20PH%C3%9A%20HO%C3%80NG%20ANH%2C%20GIAI%20VI%E1%BB%86T%20s%E1%BA%A1ch%2C%20%C4%91%E1%BA%B9p%2C%20tho%C3%A1ng%20m%C3%A1t%20c%C3%B3%20H%E1%BB%92%20B%C6%A0I%2F49_1602302005_1607606095110?alt=media&token=b45d743d-d621-4cda-9b53-79b0293924c7', 126)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (127, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/C%C4%83n%20h%E1%BB%99%20%C4%91%E1%BB%A7%20NTh%E1%BA%A5t%20m%E1%BB%9Bi%2C%20cho%20thu%C3%AA%20ng%E1%BA%AFn-d%C3%A0i%20h%E1%BA%A1n%2C%20gi%C3%A1%20r%E1%BA%BB.%2085%20Nguy%E1%BB%85n%20V%C4%83n%20Qu%E1%BB%B3%2C%20g%C3%A2n%20BV%20Ph%C3%A1p%20Vi%E1%BB%87t%2C%20Ph%C3%BA%20M%E1%BB%B9%20H%C6%B0ng%2C%20C%E1%BA%A7u%20Ph%C3%BA%20M%E1%BB%B9%20Qu%E1%BA%ADn%207%2Fz2141172989683-fbd59321367efd5a313488eb7c2a54b1_1605584086_1607606252141?alt=media&token=dbed2e21-825a-40e5-91d9-ae68a860809d', 127)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (128, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/C%C4%83n%20h%E1%BB%99%20%C4%91%E1%BB%A7%20NTh%E1%BA%A5t%20m%E1%BB%9Bi%2C%20cho%20thu%C3%AA%20ng%E1%BA%AFn-d%C3%A0i%20h%E1%BA%A1n%2C%20gi%C3%A1%20r%E1%BA%BB.%2085%20Nguy%E1%BB%85n%20V%C4%83n%20Qu%E1%BB%B3%2C%20g%C3%A2n%20BV%20Ph%C3%A1p%20Vi%E1%BB%87t%2C%20Ph%C3%BA%20M%E1%BB%B9%20H%C6%B0ng%2C%20C%E1%BA%A7u%20Ph%C3%BA%20M%E1%BB%B9%20Qu%E1%BA%ADn%207%2F1-16_1607572708_1607606252135?alt=media&token=049583d8-4d8d-4e80-942d-2124e7c8ddcc', 127)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (129, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/C%C4%83n%20h%E1%BB%99%20%C4%91%E1%BB%A7%20NTh%E1%BA%A5t%20m%E1%BB%9Bi%2C%20cho%20thu%C3%AA%20ng%E1%BA%AFn-d%C3%A0i%20h%E1%BA%A1n%2C%20gi%C3%A1%20r%E1%BA%BB.%2085%20Nguy%E1%BB%85n%20V%C4%83n%20Qu%E1%BB%B3%2C%20g%C3%A2n%20BV%20Ph%C3%A1p%20Vi%E1%BB%87t%2C%20Ph%C3%BA%20M%E1%BB%B9%20H%C6%B0ng%2C%20C%E1%BA%A7u%20Ph%C3%BA%20M%E1%BB%B9%20Qu%E1%BA%ADn%207%2F5ba4dc0d847a7e24276b_1607568383_1607606252140?alt=media&token=6e83bbd0-cdca-469b-a1ba-7b5479470d2c', 127)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (130, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/T%C3%ACm%20b%E1%BA%A1n%20nam%20gh%C3%A9p%20ph%C3%B2ng%20chung%20c%C6%B0%20may%20l%E1%BA%A1nh%20trung%20t%C3%A2m%20qu%E1%BA%ADn%202%2Fz2141172989683-fbd59321367efd5a313488eb7c2a54b1_1605584086_1607606483545?alt=media&token=d5baac51-6e1e-4aa3-90fc-aa6f03be93ed', 128)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (131, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/T%C3%ACm%20b%E1%BA%A1n%20nam%20gh%C3%A9p%20ph%C3%B2ng%20chung%20c%C6%B0%20may%20l%E1%BA%A1nh%20trung%20t%C3%A2m%20qu%E1%BA%ADn%202%2F0c502a7a-e9e0-48bb-ae4a-72f5447b0585_1605078876_1607606483539?alt=media&token=aaf30843-d15b-4a8e-b23b-02eae860b9df', 128)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (132, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/T%C3%ACm%20b%E1%BA%A1n%20nam%20gh%C3%A9p%20ph%C3%B2ng%20chung%20c%C6%B0%20may%20l%E1%BA%A1nh%20trung%20t%C3%A2m%20qu%E1%BA%ADn%202%2F9893ae6b-3c44-41a8-99a5-e58e447b2e2e_1607319619_1607606483544?alt=media&token=fe58f687-3416-4161-bf38-7df144e4cccc', 128)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (133, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/C%E1%BA%A6N%20T%C3%8CM%20NG%C6%AF%E1%BB%9CI%20%E1%BB%9E%20GH%C3%89P%20CC%20The%20Krista%2C%20Q2%2Fz2141172989683-fbd59321367efd5a313488eb7c2a54b1_1605584086_1607606600076?alt=media&token=a3930ab1-c17f-416b-9819-a9117612e368', 129)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (134, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/C%E1%BA%A6N%20T%C3%8CM%20NG%C6%AF%E1%BB%9CI%20%E1%BB%9E%20GH%C3%89P%20CC%20The%20Krista%2C%20Q2%2F701708f8-5ae3-4f53-bbfe-2da579f04aa2_1607168243_1607606600075?alt=media&token=8a101c61-5066-498e-8fab-015222910eaf', 129)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (135, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/C%E1%BA%A6N%20T%C3%8CM%20NG%C6%AF%E1%BB%9CI%20%E1%BB%9E%20GH%C3%89P%20CC%20The%20Krista%2C%20Q2%2F48b139ee-e448-4448-81ac-c148ce6cd702_1607168243_1607606600070?alt=media&token=12e73d10-5329-48e9-99b9-dcdf9b491ee0', 129)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (136, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/C%E1%BA%A7n%20g%E1%BA%A5p%202%20n%E1%BB%AF%20%E1%BB%9F%20gh%C3%A9p%20t%E1%BA%A1i%20chung%20c%C6%B0%20cao%20c%E1%BA%A5p%20Dream%20Home%20Residence%2C%20T%C3%ACm%20ng%C6%B0%E1%BB%9Di%20%E1%BB%9F%20gh%C3%A9p%20G%C3%B2%20V%E1%BA%A5p%2Fimg-1605955484651-1605990399198_1606037449_1607606699059?alt=media&token=a5dbf7b5-6d96-44a7-89db-cc84d9c0978e', 130)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (137, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/C%E1%BA%A7n%20g%E1%BA%A5p%202%20n%E1%BB%AF%20%E1%BB%9F%20gh%C3%A9p%20t%E1%BA%A1i%20chung%20c%C6%B0%20cao%20c%E1%BA%A5p%20Dream%20Home%20Residence%2C%20T%C3%ACm%20ng%C6%B0%E1%BB%9Di%20%E1%BB%9F%20gh%C3%A9p%20G%C3%B2%20V%E1%BA%A5p%2Fz2141172989683-fbd59321367efd5a313488eb7c2a54b1_1605584086_1607606699064?alt=media&token=93476826-2844-4318-8063-2616e21d5281', 130)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (138, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/C%E1%BA%A7n%20g%E1%BA%A5p%202%20n%E1%BB%AF%20%E1%BB%9F%20gh%C3%A9p%20t%E1%BA%A1i%20chung%20c%C6%B0%20cao%20c%E1%BA%A5p%20Dream%20Home%20Residence%2C%20T%C3%ACm%20ng%C6%B0%E1%BB%9Di%20%E1%BB%9F%20gh%C3%A9p%20G%C3%B2%20V%E1%BA%A5p%2Fimg-1605955484724-1605990412192_1606037449_1607606699063?alt=media&token=59a42f81-0901-489a-9768-ee02872997a6', 130)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (139, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/C%E1%BA%A7n%20t%C3%ACm%201%20n%E1%BB%AF%20thu%C3%AA%20l%E1%BA%A1i%201%20ph%C3%B2ng%20c%C3%B3%20WC%20ri%C3%AAng%20%E1%BB%9F%20chung%20c%C6%B0%20Th%E1%BB%A7%20Thi%C3%AAm%20Star%20qu%E1%BA%ADn%202%2F1_1606838354_1607606797809?alt=media&token=85d675df-7aa7-4874-aa9d-9f47fccb71c2', 131)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (140, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/C%E1%BA%A7n%20t%C3%ACm%201%20n%E1%BB%AF%20thu%C3%AA%20l%E1%BA%A1i%201%20ph%C3%B2ng%20c%C3%B3%20WC%20ri%C3%AAng%20%E1%BB%9F%20chung%20c%C6%B0%20Th%E1%BB%A7%20Thi%C3%AAm%20Star%20qu%E1%BA%ADn%202%2Fz2141172989683-fbd59321367efd5a313488eb7c2a54b1_1605584086_1607606797815?alt=media&token=08d86d04-96e7-46ba-ab12-e17ebd19ee9a', 131)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (141, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/C%E1%BA%A7n%20t%C3%ACm%201%20n%E1%BB%AF%20thu%C3%AA%20l%E1%BA%A1i%201%20ph%C3%B2ng%20c%C3%B3%20WC%20ri%C3%AAng%20%E1%BB%9F%20chung%20c%C6%B0%20Th%E1%BB%A7%20Thi%C3%AAm%20Star%20qu%E1%BA%ADn%202%2F4_1606838362_1607606797814?alt=media&token=8646aaeb-7fef-49d7-ba82-72abc26945d4', 131)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (142, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/N%E1%BB%AF%20%E1%BB%9E%20gh%C3%A9p%20tr%E1%BB%8Dn%20g%C3%B3i%20800k%20ngay%20c%E1%BA%A7u%20Kh%C3%A1nh%20H%E1%BB%99i%2F1ebd3721-0857-49f0-b673-86926e75fdcc_1580191218_1607606889842?alt=media&token=a624956b-bec0-4351-8c15-a39295326022', 132)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (143, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/N%E1%BB%AF%20%E1%BB%9E%20gh%C3%A9p%20tr%E1%BB%8Dn%20g%C3%B3i%20800k%20ngay%20c%E1%BA%A7u%20Kh%C3%A1nh%20H%E1%BB%99i%2Fz2141172989683-fbd59321367efd5a313488eb7c2a54b1_1605584086_1607606889849?alt=media&token=cd7a62f9-0705-491f-be53-b876f0ec5a79', 132)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (144, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/N%E1%BB%AF%20%E1%BB%9E%20gh%C3%A9p%20tr%E1%BB%8Dn%20g%C3%B3i%20800k%20ngay%20c%E1%BA%A7u%20Kh%C3%A1nh%20H%E1%BB%99i%2Fa0e1b188-0257-486f-a324-03f85ecae90f_1580191223_1607606889848?alt=media&token=c69ac427-dcfe-479f-bacb-5007c72d1afa', 132)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (145, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/N%E1%BB%AF%20%E1%BB%9E%20gh%C3%A9p%20tr%E1%BB%8Dn%20g%C3%B3i%20700k%20m%C3%A1y%20l%E1%BA%A1nh%2C%20m%C3%A1y%20gi%E1%BA%B7t%2Cm%C3%A1y%20n%C6%B0%E1%BB%9Bc%20n%C3%B3ng-%20Ph%E1%BA%A1m%20H%C3%B9ng%2Fz2141172989683-fbd59321367efd5a313488eb7c2a54b1_1605584086_1607606981032?alt=media&token=ddd9feea-ee59-49a1-a4bd-816d3eb8ddea', 133)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (146, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/N%E1%BB%AF%20%E1%BB%9E%20gh%C3%A9p%20tr%E1%BB%8Dn%20g%C3%B3i%20700k%20m%C3%A1y%20l%E1%BA%A1nh%2C%20m%C3%A1y%20gi%E1%BA%B7t%2Cm%C3%A1y%20n%C6%B0%E1%BB%9Bc%20n%C3%B3ng-%20Ph%E1%BA%A1m%20H%C3%B9ng%2F16c9939b-851e-4f31-b1a9-a055ccede46c_1534746420_1607606981027?alt=media&token=e7b67dc0-2f07-4bf5-8608-2a199f31bcda', 133)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (147, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/N%E1%BB%AF%20%E1%BB%9E%20gh%C3%A9p%20tr%E1%BB%8Dn%20g%C3%B3i%20700k%20m%C3%A1y%20l%E1%BA%A1nh%2C%20m%C3%A1y%20gi%E1%BA%B7t%2Cm%C3%A1y%20n%C6%B0%E1%BB%9Bc%20n%C3%B3ng-%20Ph%E1%BA%A1m%20H%C3%B9ng%2Fd4b20c2f-46e5-4a71-b418-dfa003c07788_1534746416_1607606981031?alt=media&token=6694d202-7759-4d1d-9b0f-28997da429af', 133)
GO
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (148, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/C%E1%BA%A7n%20b%E1%BA%A1n%20%E1%BB%9F%20gh%C3%A9p%20bi%E1%BB%87t%20th%E1%BB%B1%20Hu%E1%BB%B3nh%20T%E1%BA%A5n%20Ph%C3%A1t%20ch%E1%BB%89%20650k%2F573c3135-3e7c-4482-86cd-f2ee33096537_1562734923_1607607071020?alt=media&token=a78cfdaa-3036-4256-9189-06b2854a8f11', 134)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (149, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/C%E1%BA%A7n%20b%E1%BA%A1n%20%E1%BB%9F%20gh%C3%A9p%20bi%E1%BB%87t%20th%E1%BB%B1%20Hu%E1%BB%B3nh%20T%E1%BA%A5n%20Ph%C3%A1t%20ch%E1%BB%89%20650k%2F960f3e0b-10db-4351-a556-44a390eb3131_1562734926_1607607071024?alt=media&token=7dca4561-b70e-495a-bc95-526a53f8e52e', 134)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (150, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/C%E1%BA%A7n%20b%E1%BA%A1n%20%E1%BB%9F%20gh%C3%A9p%20bi%E1%BB%87t%20th%E1%BB%B1%20Hu%E1%BB%B3nh%20T%E1%BA%A5n%20Ph%C3%A1t%20ch%E1%BB%89%20650k%2Fe8b828ea-4714-4cb0-af80-aab02661d13b_1562734924_1607607071025?alt=media&token=934640f2-21f4-492b-abc9-69075e50da14', 134)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (151, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Homestay%20Ho%C3%A0ng%20Ph%C3%BAc%3AGi%C6%B0%E1%BB%9Dng%20t%E1%BA%A7ng%20tr%E1%BB%8Dn%20g%C3%B3i%20700k%20ngay%20Lotte%20Mart%2Fcb7e4c02-92ab-4f01-be3c-0f6851ffa14d_1580190869_1607607346357?alt=media&token=4337327b-d709-4a77-b4e4-90ec04f664ad', 135)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (152, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Homestay%20Ho%C3%A0ng%20Ph%C3%BAc%3AGi%C6%B0%E1%BB%9Dng%20t%E1%BA%A7ng%20tr%E1%BB%8Dn%20g%C3%B3i%20700k%20ngay%20Lotte%20Mart%2Fb444f9dd-9530-4e62-b105-0e61d9a4e08b_1580190882_1607607346351?alt=media&token=876e06d5-3f23-4b22-ad91-5b85f13f5766', 135)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (153, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Homestay%20Ho%C3%A0ng%20Ph%C3%BAc%3AGi%C6%B0%E1%BB%9Dng%20t%E1%BA%A7ng%20tr%E1%BB%8Dn%20g%C3%B3i%20700k%20ngay%20Lotte%20Mart%2Fz2141172989683-fbd59321367efd5a313488eb7c2a54b1_1605584086_1607607346358?alt=media&token=d36b0312-f802-4577-afde-d0dacf3c2647', 135)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (154, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/V%C4%83n%20ph%C3%B2ng%20C%E1%BB%B0C%20%C4%90%E1%BA%B8P-%2090m2%2C%20g%C3%B3c%20m%E1%BA%B7t%20ti%E1%BB%81n%2C%20c%C3%B3%20s%C3%A2n%20tr%C6%B0%E1%BB%9Bc%2C%20C%E1%BB%99ng%20H%C3%B2a%2Fz2031325379926-fcafac4d88af691848c7ff6af98b32ee_1598254520_1607608162866?alt=media&token=49ed2d6e-a6ed-4233-9005-5f04e52d0cbc', 136)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (155, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/V%C4%83n%20ph%C3%B2ng%20C%E1%BB%B0C%20%C4%90%E1%BA%B8P-%2090m2%2C%20g%C3%B3c%20m%E1%BA%B7t%20ti%E1%BB%81n%2C%20c%C3%B3%20s%C3%A2n%20tr%C6%B0%E1%BB%9Bc%2C%20C%E1%BB%99ng%20H%C3%B2a%2Fz2031325379925-d95b25f4d160e9b7e75ee439e63847af_1598254519_1607608162861?alt=media&token=94e02f3a-5a21-46af-a9d8-b72e080ea936', 136)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (156, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/V%C4%83n%20ph%C3%B2ng%20C%E1%BB%B0C%20%C4%90%E1%BA%B8P-%2090m2%2C%20g%C3%B3c%20m%E1%BA%B7t%20ti%E1%BB%81n%2C%20c%C3%B3%20s%C3%A2n%20tr%C6%B0%E1%BB%9Bc%2C%20C%E1%BB%99ng%20H%C3%B2a%2Fz2141172989683-fbd59321367efd5a313488eb7c2a54b1_1605584086_1607608162867?alt=media&token=5067b08f-569b-427e-9939-cc6c2d4f3cb8', 136)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (157, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Cho%20thu%C3%AA%20m%E1%BA%B7t%20b%E1%BA%B1ng%20ngang%204%C3%9712%20gi%C3%A1%20c%C3%B3%20l%E1%BA%A7u%2Ffb-img-1601391168070_1607441365_1607608253621?alt=media&token=6cb4bbb0-3cd5-42c5-90ee-1abd97068257', 137)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (158, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Cho%20thu%C3%AA%20m%E1%BA%B7t%20b%E1%BA%B1ng%20ngang%204%C3%9712%20gi%C3%A1%20c%C3%B3%20l%E1%BA%A7u%2Fz2141172989683-fbd59321367efd5a313488eb7c2a54b1_1605584086_1607608253630?alt=media&token=0b7fd591-361d-47c0-be4c-5658643ef7a8', 137)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (159, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Cho%20thu%C3%AA%20m%E1%BA%B7t%20b%E1%BA%B1ng%20ngang%204%C3%9712%20gi%C3%A1%20c%C3%B3%20l%E1%BA%A7u%2Ffb-img-1602720522244_1607441366_1607608253628?alt=media&token=6a4fb47d-cb97-47d3-80b2-3f43d2906502', 137)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (160, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/M%E1%BA%B7t%20b%E1%BA%B1ng%20v%C4%83n%20ph%C3%B2ng%20180m2%20cho%20thu%C3%AA%20qu%E1%BA%ADn%20T%C3%A2n%20B%C3%ACnh%20%E2%80%93%20NGAY%20V%C3%92NG%20XOAY%20L%C4%82NG%20CHA%20C%E1%BA%A2%2F3_1606108664_1607608361464?alt=media&token=d099940f-557d-49bd-a6a1-faf351096fe1', 138)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (161, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/M%E1%BA%B7t%20b%E1%BA%B1ng%20v%C4%83n%20ph%C3%B2ng%20180m2%20cho%20thu%C3%AA%20qu%E1%BA%ADn%20T%C3%A2n%20B%C3%ACnh%20%E2%80%93%20NGAY%20V%C3%92NG%20XOAY%20L%C4%82NG%20CHA%20C%E1%BA%A2%2F6_1606108665_1607608361469?alt=media&token=8ae088eb-86e1-433c-9136-132b96bd4893', 138)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (162, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/M%E1%BA%B7t%20b%E1%BA%B1ng%20v%C4%83n%20ph%C3%B2ng%20180m2%20cho%20thu%C3%AA%20qu%E1%BA%ADn%20T%C3%A2n%20B%C3%ACnh%20%E2%80%93%20NGAY%20V%C3%92NG%20XOAY%20L%C4%82NG%20CHA%20C%E1%BA%A2%2Fz2141172989683-fbd59321367efd5a313488eb7c2a54b1_1605584086_1607608361470?alt=media&token=a19e0935-6e28-419a-a166-7acbaeee7617', 138)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (163, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Cho%20thu%C3%AA%20m%E1%BA%B7t%20b%E1%BA%B1ng%20kinh%20doanh%20v%E1%BB%ABa%20l%C3%A0m%20c%C4%83n%20tin%20trong%20trung%20t%C3%A2m%2C%20v%E1%BB%ABa%20n%E1%BA%B1m%20ngay%20m%E1%BA%B7t%20ti%E1%BB%81n%20%C4%91%C6%B0%E1%BB%9Dng%20%C4%90%E1%BB%99c%20L%E1%BA%ADp%2C%20Qu%E1%BA%ADn%20T%C3%A2n%20Ph%C3%BA%2Fz2141172989683-fbd59321367efd5a313488eb7c2a54b1_1605584086_1607608471111?alt=media&token=278c12f7-1e10-486f-a5a0-cf2b7695b2b2', 139)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (164, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Cho%20thu%C3%AA%20m%E1%BA%B7t%20b%E1%BA%B1ng%20kinh%20doanh%20v%E1%BB%ABa%20l%C3%A0m%20c%C4%83n%20tin%20trong%20trung%20t%C3%A2m%2C%20v%E1%BB%ABa%20n%E1%BA%B1m%20ngay%20m%E1%BA%B7t%20ti%E1%BB%81n%20%C4%91%C6%B0%E1%BB%9Dng%20%C4%90%E1%BB%99c%20L%E1%BA%ADp%2C%20Qu%E1%BA%ADn%20T%C3%A2n%20Ph%C3%BA%2Fk6_1606372515_1607608471110?alt=media&token=a36465af-8a59-4fc9-a9b7-b274730cffc8', 139)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (165, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Cho%20thu%C3%AA%20m%E1%BA%B7t%20b%E1%BA%B1ng%20kinh%20doanh%20v%E1%BB%ABa%20l%C3%A0m%20c%C4%83n%20tin%20trong%20trung%20t%C3%A2m%2C%20v%E1%BB%ABa%20n%E1%BA%B1m%20ngay%20m%E1%BA%B7t%20ti%E1%BB%81n%20%C4%91%C6%B0%E1%BB%9Dng%20%C4%90%E1%BB%99c%20L%E1%BA%ADp%2C%20Qu%E1%BA%ADn%20T%C3%A2n%20Ph%C3%BA%2Fk3_1606372516_1607608471105?alt=media&token=f4c5e81c-c697-4f09-b741-57341e3caada', 139)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (166, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/M%E1%BA%B6T%20B%E1%BA%B0NG%20Q.10%2C%2032M2%20NGAY%20CH%E1%BB%A2%20HOA%20H%E1%BB%92%20TH%E1%BB%8A%20K%E1%BB%B6%20KD%20T%E1%BB%B0%20DO%206%2C9TR%2FTH%C3%81NG%2042%2F17%20H%E1%BB%92%20TH%E1%BB%8A%20K%E1%BB%B6%2Fz2093738377674-0dbac1df69c43d4b61e792558d613f3e_1601260179_1607608557238?alt=media&token=a71c4a79-8d58-472a-8723-1e0b4ad385bf', 140)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (167, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/M%E1%BA%B6T%20B%E1%BA%B0NG%20Q.10%2C%2032M2%20NGAY%20CH%E1%BB%A2%20HOA%20H%E1%BB%92%20TH%E1%BB%8A%20K%E1%BB%B6%20KD%20T%E1%BB%B0%20DO%206%2C9TR%2FTH%C3%81NG%2042%2F17%20H%E1%BB%92%20TH%E1%BB%8A%20K%E1%BB%B6%2Fz2093753807465-d6bb9aef01f1706f0ff4ad24c38707d5_1601260181_1607608557245?alt=media&token=0f0faee8-e86c-4e6e-b405-61cdc2b71fac', 140)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (168, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/M%E1%BA%B6T%20B%E1%BA%B0NG%20Q.10%2C%2032M2%20NGAY%20CH%E1%BB%A2%20HOA%20H%E1%BB%92%20TH%E1%BB%8A%20K%E1%BB%B6%20KD%20T%E1%BB%B0%20DO%206%2C9TR%2FTH%C3%81NG%2042%2F17%20H%E1%BB%92%20TH%E1%BB%8A%20K%E1%BB%B6%2Fz2141172989683-fbd59321367efd5a313488eb7c2a54b1_1605584086_1607608557246?alt=media&token=c8a1f637-adf3-4738-9a37-d65b298946fa', 140)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (169, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Cho%20thu%C3%AA%201%20t%E1%BA%A7ng%20nh%C3%A0%20l%C3%A0m%20v%C4%83n%20ph%C3%B2ng%20cty%2C%20m%E1%BB%9F%20shop%20th%E1%BB%9Di%20trang%2C%20kho%2C%20showroom%2Fz2141172989683-fbd59321367efd5a313488eb7c2a54b1_1605584086_1607608656670?alt=media&token=7a1503c0-93ef-4f77-8439-5cf260d93188', 141)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (170, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Cho%20thu%C3%AA%201%20t%E1%BA%A7ng%20nh%C3%A0%20l%C3%A0m%20v%C4%83n%20ph%C3%B2ng%20cty%2C%20m%E1%BB%9F%20shop%20th%E1%BB%9Di%20trang%2C%20kho%2C%20showroom%2F4_1607497665_1607608656669?alt=media&token=ab6df4e4-9e5e-4a95-87c6-ed5fb7d1b039', 141)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (171, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Cho%20thu%C3%AA%201%20t%E1%BA%A7ng%20nh%C3%A0%20l%C3%A0m%20v%C4%83n%20ph%C3%B2ng%20cty%2C%20m%E1%BB%9F%20shop%20th%E1%BB%9Di%20trang%2C%20kho%2C%20showroom%2F2_1607497661_1607608656664?alt=media&token=1527cd41-5fe0-47cb-aae9-660ff543aeea', 141)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (172, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Ch%C3%ADnh%20ch%E1%BB%A7%20Sang%20Shophouse%20Qu%C3%A1n%20cafe%20ngay%20Chung%20C%C6%B0%20Celadon%20CiTy%20Q%20T%C3%A2n%20Ph%C3%BA%2Fz2141172989683-fbd59321367efd5a313488eb7c2a54b1_1605584086_1607608795256?alt=media&token=915ee727-ef12-456a-9518-2c0d13c515fd', 142)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (173, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Ch%C3%ADnh%20ch%E1%BB%A7%20Sang%20Shophouse%20Qu%C3%A1n%20cafe%20ngay%20Chung%20C%C6%B0%20Celadon%20CiTy%20Q%20T%C3%A2n%20Ph%C3%BA%2F5_1607492521_1607608795255?alt=media&token=3e2569a1-f362-4322-a8a6-e1575cc0811f', 142)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (174, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Ch%C3%ADnh%20ch%E1%BB%A7%20Sang%20Shophouse%20Qu%C3%A1n%20cafe%20ngay%20Chung%20C%C6%B0%20Celadon%20CiTy%20Q%20T%C3%A2n%20Ph%C3%BA%2F4_1607492518_1607608795250?alt=media&token=50eb13da-88c9-4189-ba3d-4d2806ea5de4', 142)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (175, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Cho%20thu%C3%AA%20m%E1%BA%B7t%20b%E1%BA%B1ng%2080m2%20t%E1%BA%A1i%20418%20Ph%E1%BA%A1m%20V%C4%83n%20%C4%90%E1%BB%93ng%20P11%20Q%20B%C3%ACnh%20Th%E1%BA%A1nh%2F3_1607491642_1607609003592?alt=media&token=38ea1425-d82f-4ac4-9918-4911bd66bf3d', 143)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (176, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Cho%20thu%C3%AA%20m%E1%BA%B7t%20b%E1%BA%B1ng%2080m2%20t%E1%BA%A1i%20418%20Ph%E1%BA%A1m%20V%C4%83n%20%C4%90%E1%BB%93ng%20P11%20Q%20B%C3%ACnh%20Th%E1%BA%A1nh%2F2_1607491642_1607609003587?alt=media&token=c889efae-ba5a-4f94-bee5-cd312ea538d1', 143)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (177, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Cho%20thu%C3%AA%20m%E1%BA%B7t%20b%E1%BA%B1ng%2080m2%20t%E1%BA%A1i%20418%20Ph%E1%BA%A1m%20V%C4%83n%20%C4%90%E1%BB%93ng%20P11%20Q%20B%C3%ACnh%20Th%E1%BA%A1nh%2Fz2141172989683-fbd59321367efd5a313488eb7c2a54b1_1605584086_1607609003593?alt=media&token=a1786dff-c485-46c6-96ea-4531098f78e6', 143)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (178, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Cho%20thu%C3%AA%20M%E1%BA%B7t%20b%E1%BA%B1ng%20kinh%20doanh%2030m2%2C%20v%E1%BB%8B%20tr%C3%AD%20M%E1%BA%B7t%20ti%E1%BB%81n%20L%C3%BD%20Ch%C3%ADnh%20Th%E1%BA%AFng%2Fz2141172989683-fbd59321367efd5a313488eb7c2a54b1_1605584086_1607609093797?alt=media&token=592798fc-7834-43c8-a6a9-d6f93c968314', 144)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (179, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Ch%C3%ADnh%20ch%E1%BB%A7%20c%E1%BA%A7n%20sang%20nh%C6%B0%E1%BB%A3ng%20ti%E1%BB%87m%20gi%E1%BA%B7t%20%E1%BB%A7i%20ngay%20m%E1%BA%B7t%20ti%E1%BB%81n%20ch%E1%BB%A3%20T%C3%A2n%20M%E1%BB%B9%20Q7%2F2_1607490181_1607609177019?alt=media&token=521b45f0-5a05-4494-bd11-3b6822d2a4b1', 145)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (180, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Ch%C3%ADnh%20ch%E1%BB%A7%20c%E1%BA%A7n%20sang%20nh%C6%B0%E1%BB%A3ng%20ti%E1%BB%87m%20gi%E1%BA%B7t%20%E1%BB%A7i%20ngay%20m%E1%BA%B7t%20ti%E1%BB%81n%20ch%E1%BB%A3%20T%C3%A2n%20M%E1%BB%B9%20Q7%2F3_1607490183_1607609177020?alt=media&token=40c91422-200f-4cc1-8e17-2e8de89ebfad', 145)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (181, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Ch%C3%ADnh%20ch%E1%BB%A7%20c%E1%BA%A7n%20sang%20nh%C6%B0%E1%BB%A3ng%20ti%E1%BB%87m%20gi%E1%BA%B7t%20%E1%BB%A7i%20ngay%20m%E1%BA%B7t%20ti%E1%BB%81n%20ch%E1%BB%A3%20T%C3%A2n%20M%E1%BB%B9%20Q7%2F1_1607490181_1607609177014?alt=media&token=83399432-6a93-4fcf-a6ee-d68d8c169ab9', 145)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (198, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Thanh%20hoa%2Fbe-home-1_1607145482_1608300086703?alt=media&token=b94ef44b-6616-4830-95b3-64a4cb4472ba', 151)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (199, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Thanh%20hoa%2Fbe-home2_1607145482_1608300086704?alt=media&token=d08d474a-2dff-4511-bd23-39dd141523d1', 151)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (200, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Thanh%20hoa%2Fbe-home11_1607145482_1608300086704?alt=media&token=74b6c6b5-7217-45a0-a1d3-a7b717e4ba56', 151)
INSERT [dbo].[Images] ([Id], [ImageMotel], [MotelId]) VALUES (201, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/Thanh%20hoa%2Fbe-home_1607145482_1608300086700?alt=media&token=e9a03aec-6142-4bcf-9bd8-b33920c8a25f', 151)
SET IDENTITY_INSERT [dbo].[Images] OFF
SET IDENTITY_INSERT [dbo].[LiveTypes] ON 

INSERT [dbo].[LiveTypes] ([Id], [Name]) VALUES (1, N'Nhà mặt phố, mặt tiền')
INSERT [dbo].[LiveTypes] ([Id], [Name]) VALUES (2, N'Nhà ngõ hẻm')
INSERT [dbo].[LiveTypes] ([Id], [Name]) VALUES (3, N'Nhà biệt thự')
INSERT [dbo].[LiveTypes] ([Id], [Name]) VALUES (4, N'Nhà phố liền kề')
SET IDENTITY_INSERT [dbo].[LiveTypes] OFF
SET IDENTITY_INSERT [dbo].[Motels] ON 

INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (98, NULL, N'Chính chủ cần bán nhà hẻm sang trọng 3 Tháng 2, Diện tích 4x16m.', N'12 tỷ 200 triệu', CAST(N'2020-12-09T12:32:52.2407107' AS DateTime2), CAST(N'2020-12-09T12:32:52.2378336' AS DateTime2), N'Tin đang hiển thị', 0, N'Đường 3 Tháng 2, Phường 12, Quận 10, TP.HCM', N'<html>
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
', NULL, N'64 m2 (4x16)', 1, 26, N'Mua', N'Tin Hot', 10, N'12 Ngày', 1)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (99, NULL, N'Bán nhà hẻm vip giá rẻ đường 3/2, Quận 10, DT: 5x13m, 3 lầu, giá 9.8 t', N'9 tỷ 800 triệu', CAST(N'2020-12-09T12:35:46.2602756' AS DateTime2), CAST(N'2020-12-09T12:35:46.2602061' AS DateTime2), N'Tin đang hiển thị', 1, N'Đường 3 Tháng 2, Phường 12, Quận 10, TP.HCM', N'<html>
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
', NULL, N'65 m2 (5x13)', 1, 26, N'Mua', N'Tin Hot', 10, N'14 Ngày', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (100, NULL, N'Nhà rất đẹp khu cư xá Nguyễn Trung Trực đường 3/2 quận 10. DT: 5x16.5m', N'14 tỷ 200 triệu', CAST(N'2020-12-09T12:40:46.6891502' AS DateTime2), CAST(N'2020-12-09T12:40:46.6890603' AS DateTime2), N'Tin đang hiển thị', 0, N'Đường 3 Tháng 2, Phường 12, Quận 10, TP.HCM', N'<html>
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
', NULL, N' 82 m2 (5x16,5)', 1, 27, N'Mua', N'Tin Hot', 10, N'4 Tuần', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (101, NULL, N'Bán gấp nhà HXH Ba Tháng Hai Phường 14 Quận 10 52m2 giá 7.9 tỷ.', N'7 tỷ 900 triệu', CAST(N'2020-12-09T12:42:29.4832000' AS DateTime2), CAST(N'2020-12-09T12:42:29.4831202' AS DateTime2), N'Tin đang hiển thị', 0, N'Đường 3 Tháng 2, Phường 14, Quận 10, TPHCM', N'<html>
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
', NULL, N'52 m2 (3,5x16)', 1, 26, N'Mua', N'Tin Hot', 10, N'14 Ngày', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (102, NULL, N'Phòng trọ Tân Bình Full nội thất - Giá 3tr8', N'4 triệu/tháng', CAST(N'2020-12-10T18:49:55.2255608' AS DateTime2), CAST(N'2020-12-10T18:49:55.2237205' AS DateTime2), N'Tin đang hiển thị', 0, N'15/29 Đường C1, Phường 13, Quận Tân Bình, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>VỊ TR&Iacute;:</p>

<p>+ Nằm ngay đường Cộng H&ograve;a, C&aacute;ch ETOWN 300m, gần khu chợ Ho&agrave;ng Hoa Th&aacute;m, c&aacute;c cửa h&agrave;ng tiện &iacute;ch ( Family Mart, Vinmart &hellip;), Thế Giới Di Động, Điện M&aacute;y Xanh</p>

<p>- Trong khu d&acirc;n cư an ninh v&agrave; cực kỳ y&ecirc;n tĩnh, hẻm xe hơi.</p>

<p>+ GI&Aacute; PH&Ograve;NG :</p>

<p>- Ph&ograve;ng c&oacute; cửa sổ, tủ đồ, giường (full chăn, dra, gối, nệm), diện t&iacute;ch 20m2 : 3,8 tr/th&aacute;ng</p>

<p>- Ph&ograve;ng c&oacute; cửa sổ, c&oacute; tủ đồ, m&aacute;y lạnh, tủ lạnh, giường (full chăn, dra, gối, nệm), mặt tiền hướng gi&oacute; trời, diện t&iacute;ch 22m2 : 4,0 tr/th&aacute;ng</p>

<p>*** Cọc 1 th&aacute;ng.</p>

<p>+ DỊCH VỤ:</p>

<p>- Điện: 3500đ/kwh</p>

<p>- Nước m&aacute;y: 100k/người</p>

<p>- Wifi : 50k/người ( ph&ograve;ng 3 người chỉ lấy 100k )</p>

<p>- R&aacute;c, v&ecirc; sinh: 100k/ph&ograve;ng/th&aacute;ng</p>

<p>TIỆN NGHI :</p>

<p>- Giờ giấc tự do, cửa kho&aacute; v&acirc;n tay ra v&agrave;o thoải m&aacute;i kh&ocirc;ng lo qu&ecirc;n ch&igrave;a kh&oacute;a, hệ thống camera An Ninh , thang m&aacute;y thuận ti&ecirc;n, chỗ giữ xe thoải m&aacute;i, vệ sinh h&agrave;nh lang lối đi chung h&agrave;ng ng&agrave;y.</p>

<p>- Ph&ograve;ng c&oacute; WC ri&ecirc;ng, d&ugrave;ng m&aacute;y nước n&oacute;ng, c&oacute; tủ đồ, m&aacute;y lạnh, tủ lạnh, giường (full chăn, dra, gối, nệm), cửa sổ &aacute;nh s&aacute;ng t&ocirc;t, kh&ocirc;ng chung chủ, tự do tiếp bạn b&egrave;, người th&acirc;n đến chơi.</p>

<p>- Ph&ograve;ng mới x&acirc;y, đều c&oacute; cửa sổ v&agrave; giếng trời n&ecirc;n rất sạch sẽ v&agrave; tho&aacute;ng m&aacute;t.</p>

<p>- Hệ thống Wifi c&aacute;p quang chuẩn 100M đến từng ng&oacute;c ng&aacute;ch của t&ograve;a nh&agrave;.</p>

<p>Clip Review :</p>

<p>https://www.youtube.com/watch?v=uCNcA_Tf7Po&amp;gidzl=e6DE4PvNN7ccV4STbqnSVArxGXcAI5fuvYX87TyVLdspAXyKYHu0ThSeI1NO7rTqjtiO4sK91IfHc5HJTW</p>

<p>LI&Ecirc;N HỆ NGAY CHO CH&Uacute;NG T&Ocirc;I ĐỂ T&Igrave;M ĐƯỢC CĂN PH&Ograve;NG ĐẸP NHẤT:</p>

<p>0339672794 ( Mr Giang )</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0339672794</strong></p>
</body>
</html>
', NULL, N'20m²', 1, 26, N'Mua', N'Tin Hot', 14, N'4 Tuần', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (103, NULL, N'Cần cho thuê phòng trọ cao cấp mới xây đầy đủ tiện nghi', N'3.5 triệu/tháng', CAST(N'2020-12-10T18:51:58.7886353' AS DateTime2), CAST(N'2020-12-10T18:51:58.7885026' AS DateTime2), N'Tin đang hiển thị', 0, N'12/4 Đường Hoàng Diệu 2, Phường Linh Chiểu, Quận Thủ Đức, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>Cần cho thu&ecirc; ph&ograve;ng trọ tiện nghi nội thất đầy đủ, c&oacute; m&aacute;y lạnh , ph&ograve;ng mới x&acirc;y rất đẹp, ở tối đa được 2 người. C&oacute; free m&aacute;y giặt nh&agrave; dưới sử dụng thoải m&aacute;i, chổ để xe nh&agrave; dưới, nh&agrave; 2 lớp cửa cổng v&agrave; cửa trong nh&agrave; rất an to&agrave;n. Khu vực gần đại học ng&acirc;n h&agrave;ng gần vincom thủ đức gần chợ thủ đức rất tiện lợi. Nước m&aacute;y mỗi người 100k điện 3k5 ( m&aacute;y giặt để ở dưới n&ecirc;n xem như sử dụng điện free ở dưới). Đồ đạc vui l&ograve;ng đem h&ecirc;t l&ecirc;n ph&ograve;ng, ưu ti&ecirc;n người &iacute;t đồ. Wifi mỗi người 20k.</p>

<p>Ph&ograve;ng ko c&oacute; nội thất th&igrave; 3tr</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0909510602</strong></p>
</body>
</html>
', NULL, N'21m²', 1, 27, N'Mua', N'Tin Hot', 18, N'3 Tuần', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (104, NULL, N'Phòng trọ dạng căn hộ mini cao cấp tại 796 Lê Đức Thọ, P.15, Quận Gò Vấp', N'2.5 triệu/tháng', CAST(N'2020-12-10T18:54:27.4340340' AS DateTime2), CAST(N'2020-12-10T18:54:27.4340024' AS DateTime2), N'Tin đang hiển thị', 0, N'796 Đường Lê Đức Thọ, Phường 15, Quận Gò Vấp, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>Cho thu&ecirc; căn hộ mini cao cấp 30m2, gi&aacute; 2.5 triệu - 3 triệu/th&aacute;ng. C&oacute; thang m&aacute;y, giờ tự do, c&oacute; bảo vệ 24/24.</p>

<p>C&oacute; Wifi, m&aacute;y nước n&oacute;ng, trường h&igrave;nh c&aacute;p.</p>

<p>Địa chỉ: 796 L&ecirc; Đức Thọ, Phường 15, Quận G&ograve; Vấp, Tp. Hồ Ch&iacute; Minh.</p>

<p>Li&ecirc;n hệ: 0328837249 Chị Giang.</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0328837249</strong></p>
</body>
</html>
', NULL, N'30m²', 1, 26, N'Mua', N'Tin Hot', 13, N'4 Tuần', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (105, NULL, N'KẾ BÊN LOTTE QUẬN 7, GỬI XE TẦNG HẦM, BẢO VỆ 24/7 GIỜ GIẤC TỰ DO, 2 THANG MÁY. ALO: 0906.921.009', N'4 triệu/tháng', CAST(N'2020-12-10T18:56:35.3085181' AS DateTime2), CAST(N'2020-12-10T18:56:35.3084579' AS DateTime2), N'Tin đang hiển thị', 0, N'167 Đường số 15, Phường Tân Quy, Quận 7, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>Địa chỉ: T&ograve;a nh&agrave; NamN, 167 đường số 15, Phường T&acirc;n Quy, Quận 7 ( ngay ng&atilde; tư đường L&ecirc; Văn Lương cắt đường số 15)</p>

<p>Li&ecirc;n hệ: 0906 921 009 Mr Hiếu</p>

<p>+ Vị tr&iacute; thuận tiện:</p>

<p>Tới c&aacute;c trường T&ocirc;n ĐỨc Thắng, Nguyễn Tất Th&agrave;nh chỉ mất 5p xe m&aacute;y.</p>

<p>Trước mặt đường l&agrave; chợ T&acirc;n Kiểng.</p>

<p>Si&ecirc;u thị Circel K c&aacute;ch 50m.</p>

<p>Xung quanh qu&aacute;n ăn uống tấp nập.</p>

<p>Lưu th&ocirc;ng qua c&aacute;c quận dễ d&agrave;ng.</p>

<p>+ Tiện &iacute;ch:</p>

<p>4 line internet c&aacute;p quang tốc độ cao.</p>

<p>Camera tới tận cửa ph&ograve;ng.</p>

<p>Bảo vệ 24/7 giờ giấc tự do</p>

<p>Nh&acirc;n vi&ecirc;n lau dọn vệ sinh hằng ng&agrave;y.</p>

<p>Đa số đều l&agrave; d&acirc;n văn ph&ograve;ng v&agrave; sinh vi&ecirc;n</p>

<p>02 Thang m&aacute;y hoạt động 24/7.</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0906921009</strong></p>
</body>
</html>
', NULL, N'25m²', 1, 27, N'Mua', N'Tin VIP 3', 7, N'5 Tuần', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (106, NULL, N'118/8 Đường Trần Quang Diệu, Phường 14, Quận 3, Hồ Chí Minh', N'6.8 triệu/tháng', CAST(N'2020-12-10T18:58:58.5655305' AS DateTime2), CAST(N'2020-12-10T18:58:58.5654832' AS DateTime2), N'Tin đang hiển thị', 0, N'118/8 Đường Trần Quang Diệu, Phường 14, Quận 3, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>(Hẻm 8m xe hơi tới nh&agrave;)</p>

<p>* VỊ TR&Iacute; :</p>

<p>- Kế b&ecirc;n bệnh viện An Sinh</p>

<p>- Khu vực trung t&acirc;m mua b&aacute;n sầm uất ra Nguyễn Văn Trỗi,L&ecirc; Văn Sỹ,Trường Sa... 3 ph&uacute;t</p>

<p>* TIỆN &Iacute;CH :</p>

<p>-Ph&ograve;ng rộng r&atilde;i,tho&aacute;ng m&aacute;t,sạch sẽ đầy đủ nội thất</p>

<p>- Ph&ograve;ng 30m2 c&oacute; ban c&ocirc;ng,cửa sổ (ở được 3-4 người)</p>

<p>️-Tủ lạnh 143l</p>

<p>-Bếp ri&ecirc;ng nấu ăn (bếp tr&ecirc;n,bếp dưới)</p>

<p>-WC ri&ecirc;ng</p>

<p>-Bếp từ</p>

<p>-L&ograve; vi s&oacute;ng</p>

<p>-Giường nệm (1,8m*2m)</p>

<p>-Tủ quần &aacute;o</p>

<p>-M&aacute;y h&uacute;t m&ugrave;i</p>

<p>-M&aacute;y lạnh</p>

<p>-B&agrave;n ghế</p>

<p>* DỊCH VỤ:</p>

<p>- Nước: 100k/người</p>

<p>- Điện : 3700k/kwh</p>

<p>- R&aacute;c,wifi,vệ sinh :150k/ph&ograve;ng</p>

<p>- Giữ xe FREE</p>

<p>- Giặt đồ FREE</p>

<p>* TIỆN NGHI :</p>

<p>-Giờ giấc tự do,kh&ocirc;ng chung chủ,cửa kh&oacute;a v&acirc;n tay v&agrave; kh&oacute;a mật m&atilde; (2 lớp),camera an ninh,vệ sinh h&agrave;nh lang lối đi chung h&agrave;ng tuần.</p>

<p>* Ch&iacute;nh chủ cho thu&ecirc; (h&igrave;nh thật,ảnh thật 100% )</p>

<p>* LH xem ph&ograve;ng 24/24 (Ho&agrave;ng)</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0352790011</strong></p>
</body>
</html>
', NULL, N'30m²', 1, 28, N'Mua', N'Tin VIP 3', 3, N'4 Tuần', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (107, NULL, N'Cho thuê phòng trọ 17 Đường số 61, P.Thạnh Mỹ Lợi, Q.2 giá từ 4tr5', N'4.5 triệu/tháng', CAST(N'2020-12-10T19:00:49.6029346' AS DateTime2), CAST(N'2020-12-10T19:00:49.6028376' AS DateTime2), N'Tin đang hiển thị', 0, N'17 Đường số 61, Phường Thạnh Mỹ Lợi, Quận 2, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>Cho thu&ecirc; ph&ograve;ng trọ tại P.Thạnh Mỹ Lợi, Q2</p>

<p>- Gi&aacute; thu&ecirc; từ: 4.5tr - 5tr</p>

<p>- Địa chỉ: 17 Đường số 61, P. Thạch Mỹ Lợi, Q2 (Đối diện mặt sau Chung cư Vista Verde). C&aacute;c bạn tới xem nh&agrave; th&igrave; tới chung cư Verde vista gọi m&igrave;nh dẫn v&ocirc; cho dễ.</p>

<p>- C&oacute; trang bị nội thất cơ bản:</p>

<p>+ M&aacute;y lạnh</p>

<p>+ Giường ngủ</p>

<p>+ Tủ quần &aacute;o</p>

<p>+ Kệ bếp</p>

<p>+ Thang m&aacute;y</p>

<p>+ Hầm để xe</p>

<p>+ Cửa sổ</p>

<p>+ Ban c&ocirc;ng tho&aacute;ng m&aacute;t</p>

<p>- Khu vực gần đảo kim cương d&acirc;n tr&iacute; cao, y&ecirc;n tĩnh th&iacute;ch hợp với c&aacute;c bạn đi l&agrave;m văn ph&ograve;ng, cần nơi y&ecirc;n tĩnh để nghỉ ngơi sau giờ l&agrave;m việc.</p>

<p>- Ph&ograve;ng ch&iacute;nh chủ mới x&acirc;y 100%.</p>

<p>Bạn n&agrave;o c&oacute; nhu cầu LH: zalo, facebook, hoặc sdt: 0989997054 (Kh&aacute;nh)</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0989997054</strong></p>
</body>
</html>
', NULL, N'30m²', 1, 27, N'Mua', N'Tin VIP 3', 2, N'3 Tháng', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (108, NULL, N'Cho thuê phòng mới diện tích 32m2, giá 4.5tr/tháng có sẵn nội thất cơ bản', N'4.5 triệu/tháng', CAST(N'2020-12-10T19:02:48.0626272' AS DateTime2), CAST(N'2020-12-10T19:02:48.0625423' AS DateTime2), N'Tin đang hiển thị', 0, N'17 Đường số 61, Phường Thạnh Mỹ Lợi, Quận 2, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>M&igrave;nh cần cho thu&ecirc; ph&ograve;ng mới diện t&iacute;ch 32m2, gi&aacute; 4.5tr/th&aacute;ng c&oacute; sẵn nội thất cơ bản</p>

<p>Địa chỉ: 17 Đường số 61, Phường Thạnh Mỹ Lợi, Quận 2, Hồ Ch&iacute; Minh</p>

<p>- Gi&aacute; cho thu&ecirc;: 4.5tr/th&aacute;ng</p>

<p>- C&oacute; sẵn nội thất cơ bản: Giường, Tủ, Tivi, M&aacute;y lạnh</p>

<p>- C&oacute; chỗ nấu ăn</p>

<p>- C&oacute; hầm để xe miễn ph&iacute;</p>

<p>- C&oacute; thang m&aacute;y.</p>

<p>- Điện: 4k/kg, nước 20k/khối</p>

<p>- Internet free si&ecirc;u mạnh.</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0989997054</strong></p>
</body>
</html>
', NULL, N'32m²', 1, 26, N'Mua', N'Tin VIP 3', 2, N'5 Tuần', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (109, NULL, N'phòng trọ mới xây, Giảm ngay 500k 3 tháng đầu', N'2.7 triệu/tháng', CAST(N'2020-12-10T19:04:53.9206347' AS DateTime2), CAST(N'2020-12-10T19:04:53.9205551' AS DateTime2), N'Tin đang hiển thị', 0, N'83/41 Đường Phạm Văn Bạch, Phường 15, Quận Tân Bình, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>HOT HOT HOT : giảm ngay 500k/th&aacute;ng. giảm ngay 3 th&aacute;ng đầu cho qu&yacute; kh&aacute;ch đến thu&ecirc; ph&ograve;ng</p>

<p>Ph&ograve;ng đầy đủ tiện nghi cao cấp, mới x&acirc;y ho&agrave;n to&agrave;n 100%, m&ocirc;i trường ở an ninh, văn minh, sạch sẽ c&oacute; m&aacute;y lạnh, thang m&aacute;y</p>

<p>Được tận hưởng c&aacute;c tiện &iacute;ch, dịch vụ cao cấp :</p>

<p>- Ph&ograve;ng c&oacute; view ban c&ocirc;ng đẹp, c&oacute; kh&ocirc;ng gian ri&ecirc;ng, kh&ocirc;ng kh&iacute; trong l&agrave;nh phục vụ tốt nhu cầu học tập, l&agrave;m việc, vui chơi giải tr&iacute;, thỏa sức s&aacute;ng tạo.</p>

<p>- Nệm, drap nệm sạch sẽ.</p>

<p>- M&aacute;y lạnh.</p>

<p>- Nh&agrave; vệ sinh ri&ecirc;ng sạch sẽ, thiết bị điện chiếu s&aacute;ng.</p>

<p>- Wifi c&aacute;p quang.</p>

<p>- Tiện &iacute;ch: Giờ giấc tự do, c&oacute; hầm để xe.</p>

<p>- C&oacute; camera an ninh khắp nh&agrave;.</p>

<p>- C&oacute; thang m&aacute;y hiện đại cao cấp. Bảo vệ 24/24.</p>

<p>- Nh&acirc;n vi&ecirc;n kỹ thuật v&agrave; chăm s&oacute;c kh&aacute;ch h&agrave;ng xử l&yacute; ngay lập tức mọi vấn đề ph&aacute;t sinh về sửa chữa, bảo tr&igrave; 24/7.</p>

<p>- Nh&acirc;n vi&ecirc;n vệ sinh hằng ng&agrave;y dọn dẹp khu vực chung.</p>

<p>Chi ph&iacute; dịch vụ mỗi th&aacute;ng:</p>

<p>- Nước: 100.000đ/người/th&aacute;ng.</p>

<p>- Điện: 3.5 ngh&igrave;n/KWH.</p>

<p>- Wifi + c&aacute;p + Thang m&aacute;y + m&aacute;y giặt đầy đủ</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0918817447</strong></p>
</body>
</html>
', NULL, N'	20m²', 1, 27, N'Mua', N'Tin VIP 3', 14, N'15 Ngày', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (110, NULL, N'	9 Phố Tạ Quang Bửu, Phường 5, Quận 8, Hồ Chí Minh', N'1.8 triệu/tháng', CAST(N'2020-12-10T19:06:59.2073416' AS DateTime2), CAST(N'2020-12-10T19:06:59.2073125' AS DateTime2), N'Tin đang hiển thị', 0, N'9 Phố Tạ Quang Bửu, Phường 5, Quận 8, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>Cho thu&ecirc; ph&ograve;ng trọ full nội thất, giờ giấc tự do:M&aacute;y lạnh,nem,cua so, bang c&ocirc;ng, wifi, m&aacute;y giặt,thang m&aacute;y, camera,WC.... nh&agrave; gần chợ, ng&acirc;n h&agrave;ng, si&ecirc;u thị, cua hang tiện lợi,trường cấp 1,2,3, thuận tiện đến c&aacute;c trường đại học,qua quận 5,6,1..7... mất 5 ..15ph&uacute;t. Phong rong rai, thoang mat , thich hop NVVP, nhom sinh vien,gia đinh nho.</p>

<p>Gi&aacute; từ :2tr_4tr</p>

<p>Li&ecirc;n hệ:918AB TẠ QUANG BỬU, P5, quận 8.</p>

<p>Đt: 0908246366 gặp chị Chi</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0908246366</strong></p>
</body>
</html>
', NULL, N'15m²', 1, 26, N'Mua', N'Tin VIP 3', 8, N'5 Tuần', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (111, NULL, N'Phòng trọ có nội thất. Giờ giấc tự do. Giá: 2tr_3tr/tháng: ĐC:13/3, Bông Sao, p5, q8: ĐT:0903970791 gặp anh Lộc', N'2 triệu/tháng', CAST(N'2020-12-10T19:10:51.5655015' AS DateTime2), CAST(N'2020-12-10T19:10:51.5654743' AS DateTime2), N'Tin đang hiển thị', 0, N'13/3 Đường Bông Sao, Phường 5, Quận 8, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>Cho thu&ecirc; ph&ograve;ng trọ, c&oacute; m&aacute;y lạnh ,nem, cua so, wc...Giờ giấc tự do.Dt: 15m-30 m. Gia:2trieu_3 tr/th</p>

<p>Nh&agrave; kề chợ B&ugrave;i Minh trực (2 ph&uacute;t đi bo).Gan cho.,truong hoc,. truong đai hoc.,trường mam non.truong tiểu học, nh&agrave; thuốc, c&acirc;y xăng...5 ph&uacute;t.. Gần cong vien,.ben xe quan 8,.va rat nhieu tien ich khac ..Thuan tien đi lai cac qgan trung tam :1, 3,4,5,6:7:10:11:binh chanh...tu 10_15 phut.Lien he tai đia chi tren.Đt:0903970791 gặp a Lộc hoac :0908246366 gap chi Chi.</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0908246366</strong></p>
</body>
</html>
', NULL, N'15m²', 1, 28, N'Mua', N'Tin VIP 3', 8, N'4 Tuần', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (112, NULL, N'nhà mặt tiền cho thuê nguyên căn, đường số 8 Gò Vấp', N'15 triệu/tháng', CAST(N'2020-12-10T19:13:44.0736180' AS DateTime2), CAST(N'2020-12-10T19:13:44.0735756' AS DateTime2), N'Tin đang hiển thị', 0, N'33 Đường số 8, Phường 11, Quận Gò Vấp, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>- Nh&agrave; hướng Đ&ocirc;ng hứng nắng mai, kh&ocirc;ng gian tho&aacute;ng m&aacute;t, được thiết kế bởi kiến tr&uacute;c sư, mang phong c&aacute;ch hiện đại, gồm 2 khu vực ri&ecirc;ng biệt: một l&agrave; ph&ograve;ng kh&aacute;ch v&agrave; s&acirc;n vườn rất rộng ph&ugrave; hợp cho c&ocirc;ng việc, cửa h&agrave;ng shophouse, tiệm qu&aacute;n, dạy học; v&agrave; hai l&agrave; khu vực ri&ecirc;ng tư, nghỉ ngơi với 5 ph&ograve;ng ngủ tối giản, tho&aacute;ng m&aacute;t, nhiều lựa chọn với g&aacute;c lửng, g&aacute;c đ&uacute;c, s&agrave;n gạch v&agrave; s&agrave;n gỗ. Chỗ để xe rộng r&atilde;i, an to&agrave;n trước nh&agrave;.</p>

<p>- Nh&agrave; mặt tiền cho thu&ecirc; nguy&ecirc;n căn, gần ch&ugrave;a Tế Độ, kế b&ecirc;n c&aacute; l&oacute;c nướng Tư Mập, Hotel Ngọc Thơ.</p>

<p>- Th&iacute;ch hợp cho văn ph&ograve;ng c&ocirc;ng ty, bu&ocirc;n b&aacute;n, mở tiệm tạp h&oacute;a, tiệm photocopy, tiệm salon nail, thẩm mỹ viện, tiệm uốn t&oacute;c, tiệm may, tiệm game.</p>

<p>- Gần nhiều trường học như: CĐ y tế miền Nam, Hồng Đức, trung t&acirc;m tin học Quang Trung, trung cấp nghề Quang Trung, trường THCS Th&ocirc;ng T&acirc;y Hội, trường mầm non Tường Vy, VUS Quang Trung, Apax Leaders.</p>

<p>- Gần Si&ecirc;u thị Lotte Mart, AEON Citimart, Coopmart Foodcosa Quang Trung.</p>

<p>- Nh&agrave; mặt tiền đường số 8, th&ocirc;ng với đường Quang Trung, đường c&acirc;y Tr&acirc;m, đường L&ecirc; Văn Thọ, đường Thống Nhất.</p>

<p>- Gần nh&agrave; thờ v&agrave; chợ Hạnh Th&ocirc;ng T&acirc;y, chợ nhỏ đường L&ecirc; Văn Thọ.</p>

<p>- Gần ch&ugrave;a Huỳnh Kim v&agrave; ch&ugrave;a Nghệ Sĩ.</p>

<p>- C&oacute; tuyến xe bu&yacute;t thuận lợi (xe bus số 18; 24; 55; 95; 103; 36).</p>

<p>Gi&aacute;: 15 triệu/th&aacute;ng (kh&ocirc;ng giới hạn số lượng người ở), điện ch&iacute;nh (đồng hồ điện ch&iacute;nh)</p>

<p>Li&ecirc;n hệ: gặp C&ocirc; Ba Hải (ch&iacute;nh chủ).</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0944603704</strong></p>
</body>
</html>
', NULL, N'120m²', 1, 28, N'Mua', N'Tin VIP 3', 8, N'3 Tuần', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (113, NULL, N'Nhà nguyên căn giá rẻ, điện nước chính chủ', N'	5.5 triệu/tháng', CAST(N'2020-12-10T19:15:46.8191267' AS DateTime2), CAST(N'2020-12-10T19:15:46.8190929' AS DateTime2), N'Tin đang hiển thị', 0, N'48/36/9 Đường Trường Sa, Phường 17, Quận Bình Thạnh, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>Nh&agrave; nguy&ecirc;n căn c&oacute; g&aacute;t suốt, diện t&iacute;ch sử dụng 50m2, điện nước gi&aacute; nh&agrave; nước. C&oacute; s&acirc;n sau phơi đồ, Hẻm an ninh</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0975181771</strong></p>
</body>
</html>
', NULL, N'	50m²', 1, 26, N'Mua', N'Tin VIP 3', 16, N'3 Tháng', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (114, NULL, N'CHO THUÊ NHÀ GIÁ RẺ c4 PHẠM HÙNG, NHÀ 1 TRỆT, 1 LẦU, 2 PHÒNG NGỦ ĐƯỜNG 6 M', N'	7 triệu/tháng', CAST(N'2020-12-10T19:18:10.6505890' AS DateTime2), CAST(N'2020-12-10T19:18:10.6505500' AS DateTime2), N'Tin đang hiển thị', 0, N'Đường Phạm Hùng, Phường 5, Quận 8, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>CHO THU&Ecirc; NH&Agrave; GI&Aacute; RẺ PHAM HUNG, NH&Agrave; 1 TRỆT ,1 LẦU 2-,3 PH&Ograve;NG NGỦ ĐƯỜNG 6-8 M , 2 TOILET, PH&Ograve;NG KH&Aacute;CH , NH&Agrave; BẾP .KHU Y&Ecirc;N TỈNH, MẤT 5 PH&Uacute;T ĐI C&Aacute;C QUẬN 1,4,5,7 , Gần NHIỀU Si&ecirc;u thị, NG&Acirc;N H&Agrave;NG,TRƯỜNG HỌC, ĐH C&ocirc;ng nghệ SG, c&ocirc;ng vi&ecirc;n, BV Q. 8, chợ, hồ bơi LH 0903 189 069</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0903189069</strong></p>
</body>
</html>
', NULL, N'	54m²', 1, 27, N'Mua', N'Tin VIP 2', 8, N'12 Ngày', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (115, NULL, N'Cho thuê nhà cấp 4 giá rẻ, nguyên căn kép kín', N'2 triệu/tháng', CAST(N'2020-12-10T19:20:07.2621171' AS DateTime2), CAST(N'2020-12-10T19:20:07.2620734' AS DateTime2), N'Tin đang hiển thị', 0, N'Ngo 196 Đường Đại Mỗ, Phường Đại Mỗ, Quận Nam Từ Liêm, Hà Nội', N'<html>
<head>
	<title></title>
</head>
<body>
<p>CẦN CHO THU&Ecirc; NH&Agrave; CẤP 4 GI&Aacute; RẺ TẠI ĐƯỜNG ĐẠI MỖ - TỪ LI&Ecirc;M - H&Agrave; NỘI .</p>

<p>* Cần cho thu&ecirc; nh&agrave; cấp 4 diện t&iacute;ch 30m2 bao gồm:</p>

<p>- 15 m2 nh&agrave; ở c&oacute; g&aacute;c x&eacute;p</p>

<p>- 15 m2 s&acirc;n để xe, vệ sinh v&agrave; bếp.</p>

<p>+ Địa chỉ: Ng&otilde; 196 đường Đại Mỗ, Từ Li&ecirc;m, H&agrave; Nội.</p>

<p>+ Gi&aacute; thu&ecirc;: 2 triệu đồng/ th&aacute;ng, trả tiền trước 3 th&aacute;ng, đặt cọc 2 triệu.</p>

<p>- Tiền điện, nước v&agrave; c&aacute;c dịch vụ kh&aacute;c b&ecirc;n thu&ecirc; thanh to&aacute;n trực tiếp theo th&ocirc;ng b&aacute;o của b&ecirc;n điện lực v&agrave; nh&agrave; m&aacute;y nước.</p>

<p>- Khu d&acirc;n cư đ&ocirc;ng đ&uacute;c nhưng rất y&ecirc;n tĩnh , an ninh tốt .</p>

<p>- Đầy đủ c&aacute;c tiện &iacute;ch xung quanh như gần chợ , trường học , bệnh viện ,...</p>

<p>Li&ecirc;n hệ ch&iacute;nh chủ: 0913.275.465 Mr. Hồng.</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0913275465</strong></p>
</body>
</html>
', NULL, N'	30m²', 2, 28, N'Mua', N'Tin VIP 2', 113, N'5 Tháng', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (116, NULL, N'Cho thuê nhà hẻm Bà Lê Chân, Q.1', N'	9 triệu/tháng', CAST(N'2020-12-10T19:25:12.3963411' AS DateTime2), CAST(N'2020-12-10T19:25:12.3945485' AS DateTime2), N'Tin đang hiển thị', 0, N'15/15 Đường Bà Lê Chân, Phường Tân Định, Quận 1, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>Cho thu&ecirc; nh&agrave; nguy&ecirc;n căn 15/15 Đường B&agrave; L&ecirc; Ch&acirc;n, Phường T&acirc;n Định, Quận 1, Hồ Ch&iacute; Minh.&nbsp;</p>

<p>- K&iacute;ch thước 3,6x15m, DTSD 70m2, trệt 55m2+g&aacute;c 16m2, 1 toilet, 1PN tr&ecirc;n g&aacute;c, c&oacute; thể bố tr&iacute; th&ecirc;m 1 PN dưới trệt, hẻm xe m&aacute;y 2,5m .</p>

<p>- Hướng nam, hai mặt ng&otilde;, c&oacute; cửa sau th&ocirc;ng tho&aacute;ng, khu vực y&ecirc;n tĩnh, hẻm c&oacute; camera an ninh, gần chợ T&acirc;n Định, BV Q1, c&oacute; s&acirc;n để xe.</p>

<p>- Bếp rộng r&atilde;i tho&aacute;ng m&aacute;t, điện-nước đồng hồ ri&ecirc;ng theo gi&aacute; nh&agrave; nước.</p>

<p>- Ph&ugrave; hợp gia đ&igrave;nh 3-4 người/shop-online.</p>

<p>- Nh&agrave; trống, tho&aacute;ng m&aacute;t, &aacute;nh s&aacute;ng tự nhi&ecirc;n, giao nh&agrave; v&agrave;o ở ngay, nh&agrave; như h&igrave;nh chụp.</p>

<p>-Gi&aacute; thu&ecirc; 9tr/th&aacute;ng, HĐ tối thiểu 1 năm.</p>

<p>- LH ch&iacute;nh chủ Mr Khu&ecirc; 0982090908, Zalo/Viber; xem nh&agrave; cuối tuần hoặc buổi tối, khuepv711@gmail.com</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0982090908</strong></p>
</body>
</html>
', NULL, N'	70m²', 1, 27, N'Mua', N'Tin VIP 2', 1, N'3 Tuần', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (117, NULL, N'Nhà nguyên căn 1 lầu hẻm 300 XVNT, P21, Quận Bình Thạnh', N'7.2 triệu/tháng', CAST(N'2020-12-10T19:27:22.2414407' AS DateTime2), CAST(N'2020-12-10T19:27:22.2413605' AS DateTime2), N'Tin đang hiển thị', 0, N'300/118/9 Xô Viết Nghệ Tĩnh, Phường 21, Quận Bình Thạnh, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>- Nh&agrave; sạch sẽ, rộng r&atilde;i, tho&aacute;ng m&aacute;t, diện t&iacute;ch 3.5x7m, c&oacute; 1 g&aacute;c</p>

<p>- Gồm 2 ph&ograve;ng ngủ, 1 WC</p>

<p>- C&oacute; m&aacute;y nước n&oacute;ng năng lượng mặt trời</p>

<p>- C&oacute; m&aacute;y lạnh</p>

<p>- Gần trung t&acirc;m th&agrave;nh phố, c&aacute;c trường cấp 3, đại học, chợ,...</p>

<p>- Khu phố văn minh, đ&ocirc; thị</p>

<p>- Li&ecirc;n hệ trực tiếp kh&ocirc;ng qua trung gian</p>

<p>- Li&ecirc;n hệ 0938455085 (Nga), 0347858541 (T&uacute;) (Vui l&ograve;ng xem nh&agrave; sau 19h tối)</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0938455085</strong></p>
</body>
</html>
', NULL, N'	50m²', 1, 28, N'Mua', N'Tin VIP 2', 16, N'4 Tuần', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (118, NULL, N'37/32/9/17 Lâm Thị Hố Đường Huỳnh Thị Hai, Phường Tân Chánh Hiệp, Quận 12, Hồ Chí Minh', N'5 triệu/tháng', CAST(N'2020-12-10T19:33:26.5299497' AS DateTime2), CAST(N'2020-12-10T19:33:26.5281578' AS DateTime2), N'Tin đang hiển thị', 0, N'37/32/9/17 Lâm Thị Hố Đường Huỳnh Thị Hai, Phường Tân Chánh Hiệp, Quận 12, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>- Hẻm 4m xe hơi di chuyển thuận tiện.</p>

<p>+ Diện t&iacute;ch x&acirc;y dựng: 4m x 14 m.</p>

<p>+ Kết cấu nh&agrave;: 1 trệt, 1 tầng ( 2 tolet, 2 ph&ograve;ng ngủ, 1 bếp, 1 ph&ograve;ng kh&aacute;ch )</p>

<p>* Tầng trệt: 56 m2 (gồm 1 ph&ograve;ng kh&aacute;ch, 1 bếp, 1 nh&agrave; vệ sinh ở cuối nh&agrave;)</p>

<p>* Tầng 1: 56 m2 (gồm 2 ph&ograve;ng ngủ, 1 nh&agrave; vệ sinh ở cuối nh&agrave;).</p>

<p>+ Nh&agrave; chủ ở giữ sạch sẽ, rộng r&atilde;i, th&iacute;ch hợp cho hộ gia đ&igrave;nh, nh&acirc;n vi&ecirc;n văn ph&ograve;ng, người lao động,...</p>

<p>+ M&igrave;nh cho thu&ecirc; ch&iacute;nh chủ, vui l&ograve;ng th&ocirc;ng cảm gi&ugrave;m kh&ocirc;ng cho thu&ecirc; l&agrave;m kho, gia c&ocirc;ng may, dịch vụ ăn uống,...</p>

<p>- Tiện &iacute;ch đầy đủ: gần chợ, trạm y tế, UBND, c&ocirc;ng an, si&ecirc;u thị Metro, trường học, B&aacute;ch H&oacute;a Xanh, Pharmacity, cửa h&agrave;ng kinh doanh,....</p>

<p>- Thuận tiện di chuyển qua c&aacute;c tuyến đường Nguyễn Ảnh Thủ, Dương Thị Mười, Đ&ocirc;ng Bắc,... sang c&aacute;c khu vực xung quanh H&oacute;c M&ocirc;n, Quận G&ograve; Vấp...</p>

<p>- Nh&agrave; hướng Bắc.</p>

<p>- Gi&aacute; thu&ecirc; : 5 triệu/th&aacute;ng, cọc 1 th&aacute;ng.</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0934808306</strong></p>
</body>
</html>
', NULL, N'	112m²', 1, 28, N'Mua', N'Tin VIP 2', 13, N'3 Tháng', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (119, NULL, N'Cho thuê căn hộ mini full nội thất tại Phú Nhuận, đối diện coopmart Nguyễn Kiệm', N'8 triệu/tháng', CAST(N'2020-12-10T19:36:19.7165760' AS DateTime2), CAST(N'2020-12-10T19:36:19.7165302' AS DateTime2), N'Tin đang hiển thị', 0, N'Đường Nguyễn Kiệm, Phường 4, Quận Phú Nhuận, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>Cho thu&ecirc; căn hộ mini full nội thất tại Ph&uacute; Nhuận, đối diện coopmart Nguyễn Kiệm.</p>

<p>Nội thất bao gồm</p>

<p>-giường, nệm l&ograve; xo cao cấp.</p>

<p>- Tủ Lạnh,</p>

<p>- L&ograve; Vi s&oacute;ng.</p>

<p>- Tủ quần &aacute;o.</p>

<p>- Toilet v&ograve;i sen.</p>

<p>- Bếp trong ph&ograve;ng v&agrave; kệ bếp như h&igrave;nh.</p>

<p>- B&agrave;n ăn.</p>

<p>- Hợp đồng tr&ecirc;n 1 năm sẽ được cung cấp th&ecirc;m vật dụng như bếp, chắn đĩa, muỗng, nồi nấu...</p>

<p>- Để xe tại hầm giữ xe của Builing.</p>

<p>- C&oacute; chỗ để &ocirc; t&ocirc;. Gi&aacute; thu&ecirc; t&ugrave;y từ 6tr đến 8tr t&ugrave;y ph&ograve;ng c&oacute; ban c&ocirc;ng hay ko c&oacute; ban c&ocirc;ng v&agrave; diện t&iacute;ch. Nh&agrave; đươc thiết kế thu&ecirc; phong c&aacute;ch ch&acirc;u &Acirc;u n&ecirc;n rất đẹp v&agrave; dễ thương. Khuyến kh&iacute;ch đến xem trực tiếp.</p>

<p>Diện t&iacute;ch từ 20 - 25m2 - t&ugrave;y theo loại ph&ograve;ng v&agrave; điện t&iacute;ch sẽ c&oacute; gi&aacute; ph&ograve;ng kh&aacute;c nhau. Giữa to&agrave;n nh&agrave; c&oacute; 1 khu&ocirc;n vi&ecirc;n lớn ( c&oacute; ph&ograve;ng tập Gym , garden free cho kh&aacute;ch</p>

<p>LI&Ecirc;N HỆ LOAN ĐỂ XEM NGAY!!!</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0332119954</strong></p>
</body>
</html>
', NULL, N'25m²', 1, 27, N'Mua', N'Tin VIP 2', 17, N'3 Tháng', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (120, NULL, N'Cho Thuê Căn Hộ Có Gác Full Nội Thất Giá Rẻ, Mới 100%', N'4.5 triệu/tháng', CAST(N'2020-12-10T19:38:16.8655386' AS DateTime2), CAST(N'2020-12-10T19:38:16.8654464' AS DateTime2), N'Tin đang hiển thị', 0, N'217/9/23 Đường Bùi Đình Túy, Phường 24, Quận Bình Thạnh, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>BẠN CẦN T&Igrave;M CĂN HỘ DỊCH VỤ - PH&Ograve;NG ĐẸP GI&Aacute; TỐT KHU VỰC QUẬN B&Igrave;NH THẠNH</p>

<p>Ph&ograve;ng mới x&acirc;y v&agrave; nội thất mới 100% chỉ với 5.000.000 vnđ</p>

<p>&gt;&gt;&gt; Địa Chỉ: 217/9/23 B&ugrave;i Đ&igrave;nh Tu&yacute;,Phường 24,Quận B&igrave;nh Thạnh</p>

<p>C&aacute;ch mặt tiền đường lớn 10m, Hẻm 5m, Xe &ocirc; t&ocirc; đỗ trước to&agrave; nh&agrave; , khu vực an ninh,s&aacute;t b&ecirc;n l&agrave; trung t&acirc;m thương mại VINCOM,Ng&acirc;n H&agrave;ng,Nh&agrave; H&agrave;ng,The Coffee House....</p>

<p>Vị tr&iacute; đẹp, view đẹp, gần khu vui chơi trung t&acirc;m th&agrave;nh phố,Gần Chợ,Trường Học,Bệnh Viện,S&acirc;n Bay</p>

<p>--------------</p>

<p>Ph&ograve;ng căn hộ được bố tr&iacute; FULL nội thất cơ bản:</p>

<p>️Tủ lạnh ️ M&aacute;y lạnh M&aacute;y tắm nước n&oacute;ng lạnh NLMT Tủ Quần &Aacute;o , Nệm sạch sẽ,Bếp Hồng Ngoại</p>

<p>Tủ Bếp MINI gọn g&agrave;ng</p>

<p>Nh&agrave; Vệ sinh như h&igrave;nh: thiết bị vệ sinh cao cấp</p>

<p>Ph&ograve;ng n&agrave;o cũng c&oacute; cửa sổ tho&aacute;ng m&aacute;t, thoải m&aacute;i</p>

<p>--------------</p>

<p>Đặc biệt:</p>

<p>Nh&agrave; mới x&acirc;y xong v&agrave; to&agrave;n bộ nội thất đều mới 100%</p>

<p>Camera quan s&aacute;t khu vực chung 24/24h</p>

<p>C&oacute; M&aacute;y Giặt v&agrave; người dọn dẹp ph&ograve;ng theo y&ecirc;u cầu.</p>

<p>Giờ giấc tự do, kh&ocirc;ng chung chủ,hệ thống thang m&aacute;y v&agrave; cửa ra v&agrave;o đều quẹt bằng thẻ được sử dụng miễn ph&iacute;</p>

<p>Cơ sở 1: 643/24/1G X&ocirc; VIết Nghệ Tĩnh, p26, quận B&igrave;nh Thạnh</p>

<p>Cơ sở 2: 71/6 Chu Văn An,Phường 26,Quận B&igrave;nh Thạnh</p>

<p>Cơ sở 3: 217/9/23 B&ugrave;i Đ&igrave;nh Tu&yacute;,Phường 24,Quận B&igrave;nh Thạnh</p>

<p>Cơ sở 4: 12/1 Đường Số 1 Nguyễn Duy Trinh,Phường B&igrave;nh Trưng T&acirc;y,Quận 2</p>

<p>Cơ sở 5: 643/16 X&ocirc; Viết Nghệ Tĩnh,Phường 26,Quận B&igrave;nh Thạnh</p>

<p>Li&ecirc;n Hệ : 033.663.3939</p>

<p>0837.991.199</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0942829821</strong></p>
</body>
</html>
', NULL, N'	25m²', 1, 28, N'Mua', N'Tin VIP 2', 16, N'3 Tuần', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (121, NULL, N'CHO THUÊ CĂN HỘ CHUNG CƯ MINI 1N1K VÀ 2N1K NGÕ 89, ĐƯỜNG MỄ TRÌ THƯỢNG, MỄ TRÌ, NAM TỪ LIÊM, HÀ NỘI', N'5.5 triệu/tháng', CAST(N'2020-12-10T19:40:26.3135171' AS DateTime2), CAST(N'2020-12-10T19:40:26.3134674' AS DateTime2), N'Tin đang hiển thị', 0, N'Đường Mễ Trì Thượng, Phường Mễ Trì, Quận Nam Từ Liêm, Hà Nội', N'<html>
<head>
	<title></title>
</head>
<body>
<p>CHO THU&Ecirc; CĂN HỘ KIỂU CHUNG CƯ MINI KH&Eacute;P K&Iacute;N GỒM 1N1K V&Agrave; 2N1K RỘNG 35-40 M2 NH&Agrave; ĐẸP, TIỆN NGHI, VĂN MINH, NG&Otilde; 89, ĐƯỜNG MỄ TR&Igrave; THƯỢNG, MỄ TR&Igrave;, NAM TỪ LI&Ecirc;M, H&Agrave; NỘI.</p>

<p>Bạn đang mong muốn sống trong 1 căn hộ đẳng cấp, tiện nghi, văn minh của chung cư mini tiện nghi như ch&iacute;nh nh&agrave; của m&igrave;nh? Bạn đang mong muốn thu&ecirc; căn hộ gi&aacute; cả hợp l&yacute; m&agrave; lại rất chất lượng?</p>

<p>- Hiện tại m&igrave;nh đang c&oacute; căn hộ cho thu&ecirc; tại địa chỉ: Số nh&agrave; 12, ng&otilde; 89, đường Mễ Tr&igrave; Thượng, phường Mễ Tr&igrave;, quận Nam Từ Li&ecirc;m, H&agrave; Nội (Gần đường Mễ Tr&igrave;)</p>

<p>- Vị tr&iacute;: cực kỳ thuận tiện khi di chuyển, c&aacute;ch đường Mễ Tr&igrave; 100m, c&aacute;ch đường Phạm H&ugrave;ng 300m, c&aacute;ch đường Dương Đ&igrave;nh Nghệ 300m, c&aacute;ch đường L&ecirc; Quang Đạo 200m, c&aacute;ch trường mầm non Mễ Tr&igrave; Hạ 50m, c&aacute;ch trường cấp 1-2 Mễ Tr&igrave; 50m, c&aacute;ch Keangnam, to&agrave; nh&agrave; S&ocirc;ng Đ&agrave; 300m,...</p>

<p>+ Nh&agrave; gần khu đ&ocirc; thị Mễ Tr&igrave; Hạ, khu đ&ocirc; thị Mỹ Đ&igrave;nh - Mễ Tr&igrave;, gần chợ Mễ Tr&igrave; Hạ, gần si&ecirc;u thị Vinmart, TTTM the Garden, Vincom Plaza, BigC Thăng Long, xung quanh c&oacute; nhiều cửa h&agrave;ng qu&aacute;n ăn, rạp chiếu phim...</p>

<p>+ &Ocirc; t&ocirc; dễ d&agrave;ng v&agrave;o tận nh&agrave;, c&oacute; b&atilde;i gửi xe &ocirc; t&ocirc; c&aacute;ch nh&agrave; 50m.</p>

<p>- Tiện &iacute;ch căn hộ đầy đủ gồm:</p>

<p>+ Thang m&aacute;y tốc độ cao</p>

<p>+ Điều h&ograve;a</p>

<p>+ N&oacute;ng lạnh an to&agrave;n chống giật</p>

<p>+ Giường, t&aacute;p đầu giường, b&agrave;n phấn</p>

<p>+ Tủ quần &aacute;o cho bạn gọn g&agrave;ng ngăn nắp</p>

<p>+ Tủ lạnh</p>

<p>+ M&aacute;y giặt</p>

<p>+ B&agrave;n ăn</p>

<p>+ B&agrave;n bếp c&oacute; ch&acirc;ụ rửa, c&oacute; tủ bếp tr&ecirc;n dưới trang bị h&uacute;t m&ugrave;i, bếp từ.</p>

<p>+ Khu bếp nấu ăn ri&ecirc;ng biệt kh&ocirc;ng lo &aacute;m m&ugrave;i v&agrave;o ph&ograve;ng rất thuận tiện cho việc nấu ăn.</p>

<p>+ Khu vệ sinh kh&eacute;p k&iacute;n, ri&ecirc;ng biệt c&oacute; đầy đủ thiết bị vệ sinh, k&iacute;n đ&aacute;o, sạch sẽ.</p>

<p>+ C&oacute; cửa sổ tho&aacute;ng m&aacute;t ngập tr&agrave;n &aacute;nh s&aacute;ng tự nhi&ecirc;n cho căn ph&ograve;ng.</p>

<p>+ Ban c&ocirc;ng để m&aacute;y giặt phơi đồ tho&aacute;ng rộng ri&ecirc;ng biệt với ph&ograve;ng ngủ.</p>

<p>+ Internet tốc độ cao, wifi đến từng ph&ograve;ng</p>

<p>+ C&oacute; camera gi&aacute;m s&aacute;t từng tầng.</p>

<p>+ C&oacute; c&ocirc;ng tơ điện nước ri&ecirc;ng từng ph&ograve;ng.</p>

<p>- Nh&agrave; c&oacute; chỗ để xe ở tầng 1 rộng r&atilde;i miễn ph&iacute;</p>

<p>- Giờ giấc thoải m&aacute;i c&oacute; kh&oacute;a v&acirc;n tay, kh&oacute;a cơ, camera an ninh an to&agrave;n cho t&agrave;i sản của bạn.</p>

<p>- Kh&ocirc;ng gian sống tho&aacute;ng đ&atilde;ng, y&ecirc;n tĩnh, tiện nghi, văn minh, sạch sẽ, c&oacute; vệ sinh lau dọn h&agrave;ng tuần.</p>

<p>- Căn hộ: 1N+1K: 35m2 - Gi&aacute;: 5.5tr</p>

<p>- Căn hộ: 2N+1K: 40m2 - Gi&aacute;: 6tr</p>

<p>- Nh&agrave; mới 100% v&agrave;o ở được ngay.</p>

<p>- LH: Lực 0969.139.826. H&atilde;y li&ecirc;n hệ ngay để hẹn giờ xem ph&ograve;ng trước khi đến kẻo hết. Đảm bảo bạn xem l&agrave; th&iacute;ch. (Ưu ti&ecirc;n hộ gia đ&igrave;nh; người đi l&agrave;m tử tế, lịch sự, ở l&acirc;u d&agrave;i)</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0969139826</strong></p>
</body>
</html>
', NULL, N'5.5 triệu/tháng', 2, 28, N'Mua', N'Tin VIP 2', 113, N'3 Tuần', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (122, NULL, N'CHO THUÊ CĂN HỘ FULL NỘI THẤT 5.5tr QUẬN BÌNH THẠNH', N'5.5 triệu/tháng', CAST(N'2020-12-10T20:03:31.7280548' AS DateTime2), CAST(N'2020-12-10T20:03:31.7280179' AS DateTime2), N'Tin đang hiển thị', 0, N'765/54 Đường Xô Viết Nghệ Tĩnh, Phường 26, Quận Bình Thạnh, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>Cho thu&ecirc; căn hộ đầy đủ nội thất cao cấp ngay trung t&acirc;m quận B&igrave;nh Thạnh.</p>

<p>Nh&agrave; mới x&acirc;y, thiết kế hiện đại, đầy đủ nội thất phục vụ nhu cầu sinh hoạt. Nh&agrave; x&acirc;y đẹp, tiện lợi, ph&acirc;n bố khu vực hợp l&yacute;. Gần trường ĐH Hutech đường Ung Văn Khi&ecirc;m, gần s&ocirc;ng S&agrave;i G&ograve;n n&ecirc;n kh&ocirc;ng kh&iacute; m&aacute;t mẻ.</p>

<p>Ph&ograve;ng rộng 25 - 30m2 đều c&oacute; cửa sổ lớn đ&oacute;n gi&oacute;, ph&ograve;ng th&ocirc;ng tho&aacute;ng, sạch sẽ l&agrave; ti&ecirc;u ch&iacute; h&agrave;ng đầu v&agrave; được trang bị full nội thất cao cấp mới ho&agrave;n to&agrave;n:</p>

<p>- M&aacute;y lạnh, tủ lạnh, bếp điện 2 b&ecirc;n, m&aacute;y h&uacute;t m&ugrave;i.</p>

<p>- Giường, nệm, tủ quần &aacute;o, b&agrave;n ăn.</p>

<p>- Tivi, wifi mạnh, m&aacute;y nước n&oacute;ng.</p>

<p>Hẻm xe hơi cực kỳ y&ecirc;n tĩnh, đ&aacute;ng sống, h&agrave;ng x&oacute;m th&acirc;n thiện, tốt bụng. S&acirc;n thượng c&oacute; b&agrave;n ghế thưởng thức Cafe, view Landmark. Ph&ograve;ng kh&aacute;ch tầng trệt thiết kế b&agrave;n tr&agrave; Nhật Bản, v&ocirc; c&ugrave;ng thuận tiện để mời bạn b&egrave; tụ họp. Địa chỉ nh&agrave;: 765/54/19 X&ocirc; Viết Nghệ Tĩnh, P26, B&igrave;nh Thạnh (t&igrave;m số 801/39 Tầm Vu sẽ dễ di chuyển hơn m&agrave; đường bao rộng r&atilde;i). Gi&aacute;: 5.5 -6tr/th&aacute;ng. H&igrave;nh thật 100%.</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0938358084</strong></p>
</body>
</html>
', NULL, N'	25m²', 1, 26, N'Mua', N'Tin VIP 2', 16, N'8 Ngày', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (123, NULL, N'Căn hộ Mini 1PN, Quận Tân Bình 26m2 có nộ thất', N'5.5 triệu/tháng', CAST(N'2020-12-10T20:05:56.0279235' AS DateTime2), CAST(N'2020-12-10T20:05:56.0278853' AS DateTime2), N'Tin đang ẩn', 1, N'880 Đường Âu Cơ, Phường 14, Quận Tân Bình, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>Căn hộ mới x&acirc;y c&oacute; diện t&iacute;ch 25m2 ( 1 Ph&ograve;ng kh&aacute;ch 1 ph&ograve;ng ngủ ), c&oacute; cửa sổ lớn m&aacute;t mẻ, lấy &aacute;nh s&aacute;ng tự nhi&ecirc;n, đầy đủ nội thất như:</p>

<p>- Nệm 1m4</p>

<p>- Quạt treo tường</p>

<p>- M&aacute;y lạnh inverter tiết kiệm điện</p>

<p>- Tủ lạnh 160l</p>

<p>- Tủ gi&agrave;y, tủ quần &aacute;o</p>

<p>- Bếp từ &acirc;m đ&ocirc;i, tủ bếp</p>

<p>- C&oacute; thang m&aacute;y, b&atilde;i để xe trong nh&agrave; rộng r&atilde;i an to&agrave;n</p>

<p>- Hệ thống an ninh chặt chẽ, camera</p>

<p>- Kh&oacute;a cổng v&acirc;n tay 2 lớp</p>

<p>- Giờ giấc tự do - kh&ocirc;ng chung chủ</p>

<p>- Hệ thống PCCC an to&agrave;n tuyệt đối</p>

<p>Vị tr&iacute;:</p>

<p>- Gần V&ograve;ng xoay S&acirc;n bay T&acirc;n Sơn Nhất, Cộng H&ograve;a Palaza, Lotte Mart Cộng H&ograve;a dễ di chuyển qua Q10, Q3 , S&acirc;n bay T&acirc;n Sơn Nhất</p>

<p>#canhosghouses</p>

<p>#canhotanbinh</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0902789679</strong></p>
</body>
</html>
', NULL, N'26m²', 1, 29, N'Mua', N'Tin VIP 2', 14, N'3 Tuần', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (124, NULL, N'CĂN HỘ 45m2 rất đẹp, ĐẦY ĐỦ NỘI THẤT, phòng bếp, Phòng Ngủ riêng, khu biệt thự Him Lam sang trọng', N'5 triệu/tháng', CAST(N'2020-12-10T20:11:41.1509189' AS DateTime2), CAST(N'2020-12-10T20:11:41.1488763' AS DateTime2), N'Tin đang ẩn', 0, N'34 Đường số 11, Phường Tân Hưng, Quận 7, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>- CHO THU&Ecirc; CĂN HỘ ngay khu biệt thự Him Lam - Trung Sơn, đầy đủ nội thất sang trọng, nh&agrave; rất mới v&agrave; đẹp, ngay Khu biệt thự d&acirc;n tr&iacute; cao, an ninh tốt.</p>

<p>- Vị tr&iacute;: Khu Him Lam Trung Sơn, gần si&ecirc;u thị Lotte Mart Quận 7, gần cầu Nguyễn Văn Cừ, cầu K&ecirc;nh Tẻ, n&ecirc;n đi qua c&aacute;c quận: Q1, q3, q5, q7, q4, q10,... Chỉ mất 10 ph&uacute;t.</p>

<p>- Đặc điểm:</p>

<p>+ Chỉ c&ograve;n 2 căn: Ở lầu 1 c&oacute; ban c&ocirc;ng, rộng 40m2, rất đẹp.</p>

<p>+ Căn ngay trệt 45m2: C&oacute; ph&ograve;ng ngủ ri&ecirc;ng, ph&ograve;ng bếp, Đủ nội thất.</p>

<p>+ PH&Ograve;NG C&Oacute; NỘI THẤT: M&aacute;y lạnh, tủ &aacute;o, b&agrave;n ăn cơm, giường, nệm, quạt, tivi, tủ lạnh, m&aacute;y giặt..... Cho kh&ocirc;ng gian sống l&yacute; tưởng.</p>

<p>+ C&oacute; ban c&ocirc;ng rộng r&atilde;i, cửa sổ th&ocirc;ng ra trời m&aacute;t mẻ cả ng&agrave;y.</p>

<p>+ Giờ giấc tự do, về l&uacute;c n&agrave;o cũng được.</p>

<p>+ Đặt biệt kh&ocirc;ng thu ph&iacute; xe.</p>

<p>+ C&oacute; m&aacute;y giặt.</p>

<p>+ Wifi, chỗ phơi đồ rộng r&atilde;i.</p>

<p>+ Cửa ra v&agrave;o mở bằng v&acirc;n tay, nh&agrave; xe c&oacute; camera chống trộm 24/24.</p>

<p>+ Ngay Khu biệt thự d&acirc;n tr&iacute; cao, đường trước nh&agrave; rộng 16m, gần chợ, si&ecirc;u thị, trung t&acirc;m...</p>

<p>+ Xem ph&ograve;ng đảm bảo th&iacute;ch ngay.</p>

<p>--------------</p>

<p>+ Gi&aacute;: 4.5tr - 5 tr/th&aacute;ng (rộng 40m2 - c&oacute; ban c&ocirc;ng - ĐỦ NỘI THẤT).</p>

<p>+ Gi&aacute;: 5.5tr/th&aacute;ng (rộng 45m2 - ngay trệt, c&oacute; ph&ograve;ng ngủ ri&ecirc;ng, ph&ograve;ng bếp - ĐỦ NỘI THẤT).</p>

<p>---------</p>

<p>- Li&ecirc;n hệ: -- 0938.268.490 - để hẹn xem (xin gọi hẹn trước).</p>

<p>- Địa chỉ: 34 Đường 11, khu Him Lam, Trung Sơn - (gần Lotte Q7 v&agrave; gần cầu Nguyễn Văn Cừ).</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0938268490</strong></p>
</body>
</html>
', NULL, N'50m²', 7, 26, N'Mua', N'Tin VIP 2', 7, N'3 Tuần', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (125, NULL, N'CĂN HỘ 1PN ĐẦY ĐỦ TIỆN NGHI NỘI THẤT 50M2 NGAY CMT8 - NGÃ TƯ BẢY HIỀN GIỜ GIẤC TỰ DO', N'7.3 triệu/tháng', CAST(N'2020-12-10T20:13:22.3520077' AS DateTime2), CAST(N'2020-12-10T20:13:22.3519735' AS DateTime2), N'Tin đang ẩn', 0, N'10 Đường Chử Đồng Tử, Phường 4, Quận Tân Bình, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>CĂN HỘ 1 PH&Ograve;NG NGỦ 50m2 NGAY NG&Atilde; TƯ BẢY HIỀN</p>

<p>Diện t&iacute;ch căn hộ 40m2</p>

<p>Vị tr&iacute; 10 Chử Đồng Tử, phường 07, T&acirc;n B&igrave;nh</p>

<p>Bảo vệ 24/24, camera an ninh, ph&ograve;ng bếp ri&ecirc;ng, giờ giấc tự do, kh&ocirc;ng chung chủ.</p>

<p>Nằm ngay v&ograve;ng xoay Lăng Cha Cả, Cộng Ho&agrave;, ngay trục đường lớn Ho&agrave;ng Văn Thụ, L&ecirc; Văn Sỹ, Nguyễn Văn Trỗi. Thuận tiện đi Quận 1, Ph&uacute; Nhuận, Quận 3.</p>

<p>Căn hộ được trang bị đầy đủ nội thất.</p>

<p>Gi&aacute; ph&ograve;ng: 7.3tr/th&aacute;ng</p>

<p>Điện: 3,500₫/kwh</p>

<p>Nước: 100,000₫/người</p>

<p>Wifi: 100,000₫/ph&ograve;ng</p>

<p>Giữ xe: 150,000₫/xe</p>

<p>Li&ecirc;n hệ: Anh Vũ: 0981.820.133 - Chị Uy&ecirc;n 0908.301.994</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0908301994</strong></p>
</body>
</html>
', NULL, N'40m²', 1, 29, N'Mua', N'Tin VIP 2', 14, N'3 Tuần', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (126, NULL, N'Phòng CC HAGL3, PHÚ HOÀNG ANH, GIAI VIỆT sạch, đẹp, thoáng mát có HỒ BƠI', N'3.6 triệu/tháng', CAST(N'2020-12-10T20:15:01.0344395' AS DateTime2), CAST(N'2020-12-10T20:15:01.0343690' AS DateTime2), N'Tin đang ẩn', 0, N'Phố Tạ Quang Bửu, Phường 5, Quận 8, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>Hệ thống ph&ograve;ng cho thu&ecirc; trong khu căn hộ CC Ho&agrave;ng Anh Gia Lai 3 gần PMH, CC Ho&agrave;ng Anh Thanh B&igrave;nh Q.7, CC Ph&uacute; Ho&agrave;ng Anh Nh&agrave; B&egrave;, CC Ho&agrave;ng Anh Giai Việt Q.8.</p>

<p>Hiện c&ograve;n 5 ph&ograve;ng y&ecirc;n tĩnh, sạch, đẹp trong khu CC Ho&agrave;ng Anh Giai Việt, 856 Tạ Quang Bửu, P.5, Q.8 v&agrave; HAGL3 hoặc Ph&uacute; Ho&agrave;ng Anh Q.7 ( c&aacute;ch Đại học TĐT, RMIT 3p đi xe) . Chung Cư nằm trong khu&ocirc;n vi&ecirc;n kh&eacute;p k&iacute;n, c&oacute; c&ocirc;ng vi&ecirc;n nhiều c&acirc;y xanh, tho&aacute;ng m&aacute;t, kh&ocirc;ng kh&iacute; trong l&agrave;nh, khu vui chơi trẻ em, bảo vệ 24/24, tầng hầm để xe. C&aacute;c cửa h&agrave;ng ăn uống, cafe, si&ecirc;u thị, t&oacute;c, spa, BBQ ngo&agrave;i trời... c&oacute; trong t&ograve;a nh&agrave;.</p>

<p>Ph&ograve;ng s&agrave;n gỗ cao cấp c&oacute; m&aacute;y lạnh, cửa k&iacute;nh lớn tho&aacute;ng m&aacute;t, c&oacute; giường + nệm d&agrave;y 20 ph&acirc;n, drap phủ, b&agrave;n l&agrave;m việc, LCD, tủ QA &acirc;m tường, quạt. C&oacute; toilet ri&ecirc;ng, c&oacute; bồn tắm, c&oacute; m&aacute;y nước n&oacute;ng. Ph&ograve;ng đẹp, mới, sạch sẽ, view tho&aacute;ng đẹp.</p>

<p>* D&ugrave;ng chung trong căn hộ: B&agrave;n ghế ăn, tủ lạnh, khu vực bếp c&oacute; tủ kệ bếp, bếp gas, l&ograve; viba, m&aacute;y giặt.</p>

<p>Giờ giấc tự do. Ph&ograve;ng c&oacute; ch&igrave;a kh&oacute;a ri&ecirc;ng. Kh&ocirc;ng ở chung với chủ nh&agrave;. Ra v&agrave;o Cao ốc bất kỳ thời điểm n&agrave;o. Bảo vệ 24/7. Điện sử dụng (c&oacute; đồng hồ điện), nước (chia tr&ecirc;n đầu người) theo gi&aacute; nh&agrave; nước tr&ecirc;n bill mỗi th&aacute;ng. B&igrave;nh qu&acirc;n điện 2.500đ/Kw. Nước # 50.000đ/người/th&aacute;ng. Internet 60.000đ/ph&ograve;ng. Gửi xe tại Cao ốc 80.000đ/xe/th&aacute;ng.</p>

<p>* MIỄN PH&Iacute; dịch vụ dọn vệ sinh khu sinh hoat trong căn hộ n&ecirc;n căn hộ lu&ocirc;n gọn g&agrave;ng, sạch sẽ.</p>

<p>* MIỄN PH&Iacute; dịch vụ sữa chữa c&aacute;c thiết bị trong căn hộ</p>

<p>PH&Ograve;NG MASTER 5tr-5tr5 (WC ri&ecirc;ng trong ph&ograve;ng, c&oacute; BỒN TẮM - Ở được 3 người).</p>

<p>PH&Ograve;NG THƯỜNG từ 3,8 Tr - 4 Tr - 4,5 Triệu (Ở được 2 - 3 người).</p>

<p>Hợp Đồng d&agrave;i hạn, từ 6 th&aacute;ng.</p>

<p>Ph&ograve;ng đẹp, sạch sẽ , sẵn s&agrave;ng. Nhận ph&ograve;ng ở ngay.</p>

<p>LH xem ph&ograve;ng:</p>

<p>B&iacute;ch Ngọc 091.8855.538 &ndash; 0911.114511 (từ 8h s&aacute;ng đến 18h30 chiều).</p>

<p>**Bạn h&atilde;y chọn thu&ecirc; ph&ograve;ng ở đơn vị tin cậy để y&ecirc;n t&acirc;m học v&agrave; l&agrave;m việc!!</p>

<p>Cảm ơn c&aacute;c bạn đ&atilde; đọc tin.</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0918855538</strong></p>
</body>
</html>
', NULL, N'	17m²', 1, 29, N'Mua', N'Tin VIP 1', 8, N'3 Tháng', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (127, NULL, N'Căn hộ đủ NThất mới, cho thuê ngắn-dài hạn, giá rẻ. 85 Nguyễn Văn Quỳ, gân BV Pháp Việt, Phú Mỹ Hưng, Cầu Phú Mỹ Quận 7', N'5.2 triệu/tháng', CAST(N'2020-12-10T20:17:38.1788344' AS DateTime2), CAST(N'2020-12-10T20:17:38.1788047' AS DateTime2), N'Tin đang ẩn', 0, N'85 Đường Nguyễn Văn Quỳ, Phường Tân Thuận Đông, Quận 7, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>Ph&ograve;ng full nội thất Ph&ugrave; hợp B&aacute;c sĩ l&agrave;m bệnh viện Ph&aacute;p Viện, BV T&acirc;m Đức, Ph&uacute; Mỹ Hưng Quận 7, CNV v&agrave; Sv Quận 7.</p>

<p>CHO THU&Ecirc; NGẮN (1-3t th&aacute;ng) V&Agrave; D&Agrave;I HẠN( 4-12 th&aacute;ng), XEM V&Agrave; Ở NGAY SẼ GIẢM S&Acirc;U TIỀN PH&Ograve;NG th&ecirc;m!!!</p>

<p>GI&Aacute;: 5,200,000. C&oacute; giảm th&ecirc;m cho hợp đồng d&agrave;i hạn</p>

<p>Miễn ph&iacute;: Internet, Ph&iacute; đậu xe m&aacute;y, ph&iacute; quản l&yacute;, Ph&iacute; vệ sinh chung 2L/ tuần,</p>

<p>Ph&iacute; đi thang m&aacute;y. Khu Vực D&acirc;n cư, y&ecirc;n tĩnh, ra v&agrave;o thoải m&aacute;i c&oacute; thẻ v&agrave;o nh&agrave;, ph&ograve;ng.</p>

<p>Đc: 85 Nguyễn Văn Quỳ, T&acirc;n Thuận Đ&ocirc;ng, Q7.</p>

<p>Allo ngay: 0903893998-0938446558 nh&eacute;! Hoặc add zalo tiện li&ecirc;n lạc nh&eacute;!</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0901693820</strong></p>
</body>
</html>
', NULL, N'5.2 triệu/30m²', 1, 26, N'Mua', N'Tin VIP 1', 7, N'3 Tuần', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (128, NULL, N'Tìm bạn nam ghép phòng chung cư may lạnh trung tâm quận 2', N'1.3 triệu/tháng', CAST(N'2020-12-10T20:21:25.5716265' AS DateTime2), CAST(N'2020-12-10T20:21:25.5713640' AS DateTime2), N'Tin đang ẩn', 0, N'125 Đường Đồng Văn Cống, Phường Thạnh Mỹ Lợi, Quận 2, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>C&aacute;c bạn Nam đang cần t&igrave;m một chỗ ở b&igrave;nh d&acirc;n v&agrave; thuận lợi đi l&agrave;m trong th&agrave;nh phố. Th&igrave; đ&acirc;y căn ph&ograve;ng chỉ c&oacute; 4 giường tổng cộng gi&agrave;nh cho 1 bạn nam may mắn nhất th&agrave;nh phố. Căn ph&ograve;ng thuộc chung của quận 2 với đủ tiện &iacute;ch sinh hoạt xung quanh v&ocirc; c&ugrave;ng thuận lợi giao th&ocirc;ng đi c&aacute;c quận trong th&agrave;nh phố n&agrave;y. H&igrave;nh giường trong ph&ograve;ng 100% sự thật. WC trong ph&ograve;ng. View 2 cửa sổ tho&aacute;ng m&aacute;t. Gi&aacute; cho thu&ecirc; chỉ 1.3 triệu / th&aacute;ng.C&aacute;c ho&aacute; đơn sinh hoạt kh&aacute;c t&iacute;nh theo ho&aacute; đơn gi&aacute; gốc. B&atilde;i để xe 24/24 an to&agrave;n. H&atilde;y trải nghiệm kiểu ở gh&eacute;p tuyệt vời n&agrave;y nha bạn. Gọi hoặc nhắn tin zalo cho Sđt: 0943426719</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0943426719</strong></p>
</body>
</html>
', NULL, N'	25m²', 1, 29, N'Mua', N'Tin VIP 1', 2, N'3 Tháng', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (129, NULL, N'CẦN TÌM NGƯỜI Ở GHÉP CC The Krista, Q2', N'	3.5 triệu/tháng', CAST(N'2020-12-10T20:23:23.3007648' AS DateTime2), CAST(N'2020-12-10T20:23:23.3006837' AS DateTime2), N'Tin đang hiển thị', 0, N'537 Đường Nguyễn Duy Trinh, Phường Bình Trưng Đông, Quận 2, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>Cần t&igrave;m 1 nữ thu&ecirc; lại 1 ph&ograve;ng c&oacute; WC ri&ecirc;ng ở CC The Krista quận . Ph&ograve;ng c&oacute; diện t&iacute;ch 25m2, ph&ograve;ng c&oacute; giường, tủ quần &aacute;o, m&aacute;y lạnh, b&agrave;n, nệm.</p>

<p>Được sử dụng chung ph&ograve;ng kh&aacute;ch, b&agrave;n ăn, bếp, s&acirc;n phơi. C&oacute; thể sử dụng chung thiết bị c&oacute; sẵn như: m&aacute;y giặt, tủ lạnh, l&ograve; vi s&oacute;ng. Chung cư The Krista, c&oacute; bảo vệ 24/24, dướii sảnh th&igrave; c&oacute; cửa h&agrave;ng tiện lợi 24/24 v&agrave; nhiều tiện &iacute;ch</p>

<p>- Chung cư c&aacute;ch quận 1: 20 ph&uacute;t đi xe m&aacute;y, 15 ph&uacute;t qua Thảo Điền, 15 ph&uacute;t qua Thủ Đức, v&agrave; 10 ph&uacute;t qua Quận 9.</p>

<p>- Cần t&igrave;m 1 bạn nữ sống hướng nội, ch&acirc;n thật, th&iacute;ch sự y&ecirc;n tĩnh, xem nh&agrave; l&agrave; nơi nghỉ ngơi.</p>

<p>- Gi&aacute; 3.5triệu/th&aacute;ng/ 1 phong, đ&atilde; bao gồm ph&iacute; quản l&yacute;, nước.</p>

<p>- Nh&agrave; gồm: 3 ph&ograve;ng ngủ, 1 ph&ograve;ng kh&aacute;ch, bếp, toilet, ngo&agrave;i ra c&ograve;n c&oacute; hồi bơi, ph&ograve;ng tập gym, khu nướng BBQ. Tất cả đều miễn ph&iacute;.</p>

<p>Li&ecirc;n hệ: Ms Như : 0943880098 (Nếu kh&ocirc;ng gọi được vui l&ograve;ng để lại tin nhắn hoặc Zalo)</p>

<p>Lưu &yacute;: Cần t&igrave;m người c&oacute; nhu cầu thực sự, kh&ocirc;ng c&oacute; thời gian tiếp m&ocirc;i giới. C&aacute;m ơn.</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0943880098</strong></p>
</body>
</html>
', NULL, N'101m²', 1, 26, N'Mua', N'Tin VIP 1', 2, N'5 Tuần', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (130, NULL, N'Cần gấp 2 nữ ở ghép tại chung cư cao cấp Dream Home Residence, Tìm người ở ghép Gò Vấp', N'1.36 triệu/tháng', CAST(N'2020-12-10T20:25:00.2194473' AS DateTime2), CAST(N'2020-12-10T20:25:00.2193922' AS DateTime2), N'Tin đang ẩn', 0, N'Đường 48, Phường 17, Quận Gò Vấp, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>Cần gấp 2 nữ ở gh&eacute;p tại chung cư cao cấp Dream Home Residence , đường số 59, phường 14, G&ograve; Vấp</p>

<p>Chung cư gồm 2 ph&ograve;ng ngủ, 2WC ( mỗi ph&ograve;ng c&oacute; wc ri&ecirc;ng) , bếp, ph&ograve;ng kh&aacute;ch , view hướng hồ bơi, c&oacute; ban c&ocirc;ng to rộng, s&acirc;n phơi đồ ...</p>

<p>Chị ở một m&igrave;nh một ph&ograve;ng, c&ograve;n 1 ph&ograve;ng trống cho c&aacute;c bạn nữ thu&ecirc; ở gh&eacute;p th&igrave; 1tr360k/bạn... 3 người một ph&ograve;ng nh&eacute;!</p>

<p>B&ecirc;n n&agrave;y c&oacute; giường tầng, n&ecirc;n mỗi bạn một giường ri&ecirc;ng, c&oacute; kh&ocirc;ng gian ri&ecirc;ng v&agrave; chỗ sinh hoạt ri&ecirc;ng nh&eacute;! Rất tiện nghi v&agrave; thoải m&aacute;i! ️️️</p>

<p>Kh&ocirc;ng kh&iacute; th&igrave; m&aacute;t lạnh cả ng&agrave;y v&igrave; nh&agrave; hai hướng view ( tại chung cư m&igrave;nh căn g&oacute;c n&ecirc;n được hai hướng view lộng gi&oacute;) ai qua đ&acirc;y ở nhớ chuẩn bị &aacute;o ấm nha, n&oacute;i vậy l&agrave; đủ hiểu kh&ocirc;ng kh&iacute; b&ecirc;n n&agrave;y m&aacute;t lạnh thế n&agrave;o rồi ạ!</p>

<p>Chung cư c&oacute; bảo vệ 24/24 , n&ecirc;n rất an ninh, kh&ocirc;ng sợ người gian kẻ lạ đột nhập ăn trộm ăn cắp! C&oacute; cả Camera chống trộm nữa</p>

<p>Tiện &iacute;ch:</p>

<p>- C&oacute; si&ecirc;u thị, trường học ngoại ngữ, trường học &acirc;m nhạc ngay trong khu&ocirc;n vi&ecirc;n chung cư, bạn n&agrave;o đam m&ecirc; ngoại ngữ, đ&agrave;n h&aacute;t th&igrave; nơi n&agrave;y rất thuận tiện cho c&aacute;c bạn học tập. Gần chợ nữa n&agrave;, rất thuận tiện nh&eacute; ^^</p>

<p>- C&ocirc;ng vi&ecirc;n to bự trước nh&agrave; tha hồ đi dạo, hẹn h&ograve; người y&ecirc;u</p>

<p>- Xung quanh c&oacute; c&aacute;c nh&agrave; h&agrave;ng ăn uống, qu&aacute;n c&agrave; ph&ecirc; lớn, đẹp sang chảnh</p>

<p>- C&oacute; hồ bơi, ph&ograve;ng tập gym, yoga, spa , ph&ograve;ng nail, trang điểm ...</p>

<p>Nội thất:</p>

<p>- Kệ bếp gỗ sang đẹp như h&igrave;nh</p>

<p>- Bếp từ , dụng cụ bếp đầy đủ</p>

<p>- Tủ lạnh, M&aacute;y giặt, ...</p>

<p>C&aacute;c bạn chỉ cần x&aacute;ch vali v&agrave;o ở th&ocirc;i ... Nh&agrave; đầy đủ nội thất, tiện nghi hết rồi n&agrave;</p>

<p>Gi&aacute;: 1tr360k/bạn/ ph&ograve;ng 3 người... Điện nước gi&aacute; nh&agrave; nước n&ecirc;n khỏi lo nha c&aacute;c bạn trẻ! Gi&aacute; cực k&igrave; rẻ ️️️</p>

<p>B&ecirc;n n&agrave;y giờ giấc tự do, thẻ từ ra v&ocirc; thoải m&aacute;i, giữ xe 24/24 , n&ecirc;n c&aacute;c bạn cứ tung tăng thoải m&aacute;i nh&eacute;!</p>

<p>Li&ecirc;n hệ: Vy : 0792.64.68.16 để xem ph&ograve;ng nh&eacute; c&aacute;c bạn! Thanks</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0792646816</strong></p>
</body>
</html>
', NULL, N'	60m²', 1, 29, N'Mua', N'Tin VIP 1', 13, N'4 Tháng', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (131, NULL, N'Cần tìm 1 nữ thuê lại 1 phòng có WC riêng ở chung cư Thủ Thiêm Star quận 2', N'3 triệu/tháng', CAST(N'2020-12-10T20:26:39.1162040' AS DateTime2), CAST(N'2020-12-10T20:26:39.1161756' AS DateTime2), N'Tin đang ẩn', 0, N'Đường Nguyễn Duy Trinh, Phường Bình Trưng Đông, Quận 2, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>Cần t&igrave;m 1 nữ thu&ecirc; lại 1 ph&ograve;ng c&oacute; WC ri&ecirc;ng ở chung cư Thủ Thi&ecirc;m Star quận 2 (Xem h&igrave;nh sơ đồ nh&agrave; c&oacute; đ&aacute;nh dấu vị tr&iacute; ph&ograve;ng). Ph&ograve;ng c&oacute; diện t&iacute;ch 12m2 (chưa t&iacute;nh WC), c&oacute; sẵn giường đơn, tủ &aacute;o, b&agrave;n học. Căn hộ c&oacute; diện t&iacute;ch 81m2, 2 ph&ograve;ng ngủ, 2WC, ph&ograve;ng kh&aacute;ch c&oacute; ban c&ocirc;ng kh&ocirc;ng bị chắn tầm nh&igrave;n, tho&aacute;ng m&aacute;t, bếp c&oacute; s&acirc;n phơi.</p>

<p>Được sử dụng chung ph&ograve;ng kh&aacute;ch, b&agrave;n ăn, bếp, s&acirc;n phơi. C&oacute; thể sử dụng chung thiết bị c&oacute; sẵn như: m&aacute;y giặt, tủ lạnh, l&ograve; vi s&oacute;ng, nồi cơm điện. Chung cư an ninh, trong đường nội bộ khu d&acirc;n cư y&ecirc;n tĩnh, đối diện c&ocirc;ng vi&ecirc;n c&acirc;y xanh, gần s&ocirc;ng nhỏ, gần đường Nguyễn Duy Trinh c&oacute; nhiều cửa h&agrave;ng, dịch vụ.</p>

<p>Cần t&igrave;m 1 bạn nữ sống hướng nội, ch&acirc;n thật, th&iacute;ch sự y&ecirc;n tĩnh, xem nh&agrave; l&agrave; nơi nghỉ ngơi.</p>

<p>Gi&aacute; 3 triệu/th&aacute;ng đ&atilde; bao gồm ph&iacute; quản l&yacute;, điện, nước.</p>

<p>Li&ecirc;n hệ: chị Anh 0983.200.057 (Nếu kh&ocirc;ng gọi được vui l&ograve;ng để lại tin nhắn hoặc Zalo)</p>

<p>Lưu &yacute;: Cần t&igrave;m người c&oacute; nhu cầu thực sự, kh&ocirc;ng c&oacute; thời gian tiếp m&ocirc;i giới. C&aacute;m ơn.</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0983057248</strong></p>
</body>
</html>
', NULL, N'12m²', 1, 26, N'Mua', N'Tin VIP 1', 2, N'4 Tháng', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (132, NULL, N'Nữ Ở ghép trọn gói 800k ngay cầu Khánh Hội', N'	800.000 đồng/tháng', CAST(N'2020-12-10T20:28:11.3787141' AS DateTime2), CAST(N'2020-12-10T20:28:11.3786671' AS DateTime2), N'Tin đang hiển thị', 0, N'84 Đường Nguyễn Tất Thành, Phường 12, Quận 4, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>Homestay Ho&agrave;ng Ph&uacute;c - CAO CẤP - ĐẦY ĐỦ TIỆN NGHI - CHUẨN 2 SAO- Trọn g&oacute;i chỉ 800k - c&aacute;c th&aacute;ng sau chỉ từ 1tr đ&atilde; bao gồm: tiền ph&ograve;ng, điện nước, m&aacute;y giặt, giữ xe, m&aacute;y lạnh,wifi, m&aacute;y tắm nước n&oacute;ng, nước uống... ( Cam kết kh&ocirc;ng ph&aacute;t sinh).</p>

<p>Tiện &iacute;ch :</p>

<p>- Giường tầng tho&aacute;ng m&aacute;t, rộng r&atilde;i.</p>

<p>- Tủ quần &aacute;o.</p>

<p>- M&aacute;y tắm nước n&oacute;ng.</p>

<p>- M&aacute;y lạnh.</p>

<p>- M&aacute;y giặt.</p>

<p>- Nh&agrave; bếp tiện nghi đầy đủ dụng cụ.</p>

<p>- Nước uống miễn ph&iacute;.</p>

<p>- Internet 72 Mbps.</p>

<p>- Ph&ograve;ng sinh hoạt, ph&ograve;ng kh&aacute;ch, đọc s&aacute;ch tiện nghi.</p>

<p>- M&aacute;y tắm nước n&oacute;ng.</p>

<p>- S&acirc;n phơi đồ rộng r&atilde;i, d&agrave;n phơi th&ocirc;ng minh.</p>

<p>- C&oacute; camera an ninh,c&oacute; bảo vệ.</p>

<p>- C&oacute; người dọn vệ sinh MIỄN PH&Iacute;.</p>

<p>- Nh&agrave; vệ sinh với thiết bị cao cấp (v&ograve;i sen, lavabo,...), nước n&oacute;ng lạnh.</p>

<p>- Giờ giấc tự do</p>

<p>- Giữ xe miễn ph&iacute;.</p>

<p>Chi ph&iacute; sinh hoạt, ăn uống khu vực xung quanh cực dễ chịu, gần si&ecirc;u thị Coop mart, Ngay Ph&uacute; Mỹ Hưng...tiện đi lại c&aacute;c quận trung t&acirc;m v&agrave; quận 7.</p>

<p>Y&ecirc;u cầu: người đi l&agrave;m c&oacute; l&iacute; lịch r&otilde; r&agrave;ng, c&ocirc;ng việc ổn định hoặc học sinh, sinh vi&ecirc;n.</p>

<p>Địa chỉ: 84 Nguyễn Tất Th&agrave;nh p12 q4</p>

<p>&mdash;&mdash;&mdash;&mdash; Địa chỉ: C&aacute;c chi nh&aacute;nh q7&mdash;&mdash;&mdash;&mdash;</p>

<p>Cs1: 34 đường 36 P. T&acirc;n Quy, Q7 (C&aacute;ch Lotte Mart chỉ 400m )</p>

<p>Cs2: 1134/4 Huỳnh Tấn Ph&aacute;t, Q7( sau lưng Ph&uacute; Mỹ Hưng )</p>

<p>Cs3: Hẻm 350 Huỳnh Tấn Ph&aacute;t,Q7 (C&aacute;ch KCX Tan thuan, ĐH T&agrave;i Ch&iacute;nh Marketing chỉ 500m)</p>

<p>C&aacute;c chi nh&aacute;nh quận kh&aacute;c:</p>

<p>Cs4: 233/11/6 Nguyễn Tr&atilde;i, P2, Q5</p>

<p>Cs5: 84 Nguyễn tất th&agrave;nh Q4- c&aacute;ch đại học Luật 200m, đại học Nguyễn Tất Th&agrave;nh.</p>

<p>Cs6: Hẻm C4 đường Phạm H&ugrave;ng Q8 (Gần si&ecirc;u thị Satra) đến gọi m&igrave;nh ra đ&oacute;n</p>

<p>H&igrave;nh ảnh v&agrave; th&ocirc;ng tin đ&uacute;ng 100%.</p>

<p>️ Hotline:</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0931313570</strong></p>
</body>
</html>
', NULL, N'	25m²', 1, 29, N'Mua', N'Tin VIP 1', 4, N'4 Tháng', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (133, NULL, N'Nữ Ở ghép trọn gói 700k máy lạnh, máy giặt,máy nước nóng- Phạm Hùng', N'	600.000 đồng/tháng', CAST(N'2020-12-10T20:29:42.9743291' AS DateTime2), CAST(N'2020-12-10T20:29:42.9742836' AS DateTime2), N'Tin đang ẩn', 0, N'Xã Bình Hưng, Huyện Bình Chánh, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>Ph&ograve;ng K&yacute; T&uacute;c X&aacute; cao cấp chỉ 900 ng&agrave;n/th&aacute;ng ( Th&aacute;ng đầu giảm 200k ) Dịch vụ cung cấp bao gồm: mỗi người một giường ri&ecirc;ng biệt,m&aacute;y lạnh, tủ đựng đồ c&oacute; ch&igrave;a kh&oacute;a ri&ecirc;ng, m&aacute;y tắm n&oacute;ng lạnh, wifi, dọn ph&ograve;ng mỗi ng&agrave;y.Ph&ograve;ng nam-nữ ri&ecirc;ng biệt, c&oacute; người quản l&iacute; v&agrave; giữ xe, đặc biệt khu vực c&oacute; nắp camera an ninh an to&agrave;n- l&agrave;nh mạnh.</p>

<p>Địa chỉ hẻm C4 đường Phạm H&ugrave;ng. Đến đầu hẻm gọi m&igrave;nh ra đ&oacute;n .Ph&ograve;ng như h&igrave;nh 100% nh&eacute;. Li&ecirc;n hệ: 0931313570 ( Mr.Ph&uacute;c)</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0931313570</strong></p>
</body>
</html>
', NULL, N'	20m²', 1, 26, N'Mua', N'Tin VIP 1', 20, N'3 Tuần', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (134, NULL, N'Cần bạn ở ghép biệt thự Huỳnh Tấn Phát chỉ 650k', N'700.000 đồng/tháng', CAST(N'2020-12-10T20:31:12.7572323' AS DateTime2), CAST(N'2020-12-10T20:31:12.7571874' AS DateTime2), N'Tin đang hiển thị', 0, N'Đường Huỳnh Tấn Phát, Phường Tân Phú, Quận 7, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>Cần t&igrave;m người ở gh&eacute;p: Bao điện nước, wifi, m&aacute;y giặt, nước uống, giữ xe, c&oacute; m&aacute;y lạnh v&agrave; m&aacute;y tắm nước n&oacute;ng, c&oacute; người dọn vệ sinh h&agrave;ng ng&agrave;y trọn g&oacute;i 700k trong th&aacute;ng đầu - c&aacute;c th&aacute;ng sau chỉ từ 900k</p>

<p>Tiện &iacute;ch :</p>

<p>- Giường 2 tầng.</p>

<p>- Tủ quần &aacute;o.</p>

<p>- M&aacute;y tắm nước n&oacute;ng.</p>

<p>- M&aacute;y lạnh.</p>

<p>- M&aacute;y giặt.</p>

<p>- Nh&agrave; bếp tiện nghi đầy đủ dụng cụ.</p>

<p>- Nước uống miễn ph&iacute;.</p>

<p>- Internet 60 Mbps.</p>

<p>- Ph&ograve;ng sinh hoạt, ph&ograve;ng kh&aacute;ch, đọc s&aacute;ch tiện nghi.</p>

<p>- M&aacute;y tắm nước n&oacute;ng.</p>

<p>- S&acirc;n phơi đồ rộng r&atilde;i, d&agrave;n phơi th&ocirc;ng minh.</p>

<p>- C&oacute; camera an ninh,c&oacute; bảo vệ 24/24.</p>

<p>- C&oacute; người dọn vệ sinh MIỄN PH&Iacute;.</p>

<p>- Nh&agrave; vệ sinh với thiết bị cao cấp (v&ograve;i sen, lavabo,...), nước n&oacute;ng lạnh.</p>

<p>- Giờ giấc tự do, thoải m&aacute;i.</p>

<p>- Giữ xe miễn ph&iacute;.</p>

<p>Chi ph&iacute; sinh hoạt, ăn uống khu vực xung quanh cực dễ chịu, gần si&ecirc;u thị Coop mart, Ngay Ph&uacute; Mỹ Hưng, KCX T&acirc;n Thuận...tiện đi lại c&aacute;c quận 1,2,4,7,8,b&igrave;nh ch&aacute;nh</p>

<p>Y&ecirc;u cầu: người đi l&agrave;m c&oacute; l&iacute; lịch r&otilde; r&agrave;ng, c&ocirc;ng việc ổn định hoặc học sinh, sinh vi&ecirc;n.</p>

<p>Địa chỉ: 1134/4 huỳnh tấn ph&aacute;t quận 7.</p>

<p>Cs 2: 34 đường 36 T&acirc;n quy q7 ( gần Lotte )</p>

<p>Cs3 : hẻm 350 Huỳnh tấn ph&aacute;t</p>

<p>Cs4: 84 Nguyễn tất th&agrave;nh q4</p>

<p>Cs5: Hẻm C4 Phạm h&ugrave;ng q8</p>

<p>H&igrave;nh ảnh v&agrave; th&ocirc;ng tin ch&iacute;nh x&aacute;c 100%</p>

<p>️ Hotline: 0931313570</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0931313570</strong></p>
</body>
</html>
', NULL, N'20m²', 1, 29, N'Mua', N'Tin VIP 1', 7, N'4 Tuần', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (135, NULL, N'Homestay Hoàng Phúc:Giường tầng trọn gói 700k ngay Lotte Mart', N'700.000 đồng/tháng', CAST(N'2020-12-10T20:35:47.6410445' AS DateTime2), CAST(N'2020-12-10T20:35:47.6395913' AS DateTime2), N'Tin đang ẩn', 0, N'436 Đường Nguyễn Thị Thập, Phường Tân Quy, Quận 7, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>Đến Homestay Ho&agrave;ng Ph&uacute;c &ndash; chuỗi kytucxa q7 rẻ nhất S&agrave;i G&ograve;n &ndash; bạn sẽ được sống trong những căn ph&ograve;ng đẹp lung linh chuẩn 2 sao, đa dạng tiện &iacute;ch v&agrave; được sinh hoạt trong kh&ocirc;ng gian ấm c&uacute;ng như ch&iacute;nh ở nh&agrave;.</p>

<p>Nhằm hỗ trợ tối ưu cho c&aacute;c sinh vi&ecirc;n v&agrave; người đi l&agrave;m, hệ thống KTX Q7 ch&uacute;ng m&igrave;nh miễn ph&iacute; to&agrave;n bộ c&aacute;c chi ph&iacute; (cam kết 100% kh&ocirc;ng ph&aacute;t sinh), c&aacute;c bạn chỉ cần v&agrave;o ở với mức gi&aacute; cố định 700.000 VNĐ/ th&aacute;ng th&ocirc;i n&egrave;!</p>

<p>Tiện &iacute;ch c&aacute; nh&acirc;n ở k&yacute; t&uacute;c x&aacute;:</p>

<p>- Ph&ograve;ng giường tầng ri&ecirc;ng tư, rộng r&atilde;i, c&oacute; chăn ga gối nệm, tủ để đồ tại giường k&egrave;m hệ thống m&oacute;c treo th&ocirc;ng minh.</p>

<p>- Gi&aacute; cố định trọn g&oacute;i, miễn ph&iacute; tiền điện nước v&agrave; c&aacute;c chi ph&iacute; bổ sung kh&aacute;c.</p>

<p>Tiện &iacute;ch chung tại k&yacute; t&uacute;c x&aacute;:</p>

<p>- Ph&ograve;ng ở mới tinh tươm, được decor si&ecirc;u xinh v&agrave; đầy đủ đồ d&ugrave;ng thiết yếu.</p>

<p>- Trang bị m&aacute;y lạnh inventer, wifi tốc độ cao ở mỗi tầng.</p>

<p>- C&oacute; nh&agrave; vệ sinh ri&ecirc;ng, được dọn dẹp vệ sinh ph&ograve;ng hằng ng&agrave;y.</p>

<p>- C&oacute; ph&ograve;ng đọc s&aacute;ch, ph&ograve;ng sinh hoạt, ph&ograve;ng kh&aacute;ch...rộng r&atilde;i v&agrave; thoải m&aacute;i.</p>

<p>- M&aacute;y giặt, m&aacute;y n&oacute;ng lạnh, b&igrave;nh lọc nước,&hellip; được sử dụng thả ga.</p>

<p>- C&oacute; nh&agrave; để xe rộng, bảo vệ kiểm tra t&iacute;ch hợp camera gi&aacute;m s&aacute;t.</p>

<p>- Giờ giấc tự do, m&ocirc;i trường sống văn minh th&acirc;n thiện.</p>

<p>- Khu nh&agrave; bếp đầy đủ tiện nghi, đồ d&ugrave;ng nấu nướng.</p>

<p>- C&oacute; s&acirc;n phơi quần &aacute;o rộng k&egrave;m hệ thống phơi th&ocirc;ng minh.</p>

<p>Tiện &iacute;ch khu vực k&yacute; t&uacute;c x&aacute;:</p>

<p>- Vị tr&iacute; nằm ở trung t&acirc;m, thuận lợi di chuyển đến c&aacute;c quận 4, quận 8, quận 5, quận 1,&hellip; trong thời gian ngắn.</p>

<p>- Gần c&aacute;c trung t&acirc;m thương mại như si&ecirc;u thị Lotte, si&ecirc;u thị BigC, trường ĐH T&ocirc;n Đức Thắng, ĐH T&agrave;i Ch&iacute;nh Marketing, KCX T&acirc;n Thuận,&hellip;</p>

<p>- Mức sống khu vực dễ chịu, dễ d&agrave;ng đi lại v&agrave; ăn uống.</p>

<p>Địa chỉ c&aacute;c cơ sở chi nh&aacute;nh KTX:</p>

<p>CN1: 34 đường 36, P. T&acirc;n Quy, Q7 (C&aacute;ch Lotte Mart chỉ 400m).</p>

<p>CN2: 1134/14A Huỳnh Tấn Ph&aacute;t, Q7 (sau lưng Ph&uacute; Mỹ Hưng).</p>

<p>CN3: Hẻm 350 Huỳnh Tấn Ph&aacute;t, Q7 (C&aacute;ch KCX T&acirc;n Thuận, c&aacute;ch ĐH T&agrave;i Ch&iacute;nh Marketing chỉ 500m).</p>

<p>CN4: 233/11/6 Nguyễn Tr&atilde;i, P2, Q5 gần KHTN, Đai học Sư Phạm.</p>

<p>CN5: 84 Nguyễn Tất Th&agrave;nh, Q4 - c&aacute;ch đại học Luật 200m, đại học Nguyễn Tất Th&agrave;nh 300m.</p>

<p>CN6: Hẻm C4 đường Phạm H&ugrave;ng, Q8 (Gần si&ecirc;u thị Satra).</p>

<p>Th&ocirc;ng tin li&ecirc;n hệ tư vấn v&agrave; xem ph&ograve;ng: qua hotline 0931313570 (gặp anh Ph&uacute;c) hoặc c&oacute; thể đến trực tiếp xem trực tiếp.</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0931313570</strong></p>
</body>
</html>
', NULL, N'	25m²', 1, 29, N'Mua', N'Tin VIP 1', 7, N'4 Tuần', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (136, NULL, N'Văn phòng CỰC ĐẸP- 90m2, góc mặt tiền, có sân trước, Cộng Hòa', N'12 triệu/tháng', CAST(N'2020-12-10T20:49:24.3493189' AS DateTime2), CAST(N'2020-12-10T20:49:24.3492901' AS DateTime2), N'Tin đang ẩn', 0, N'232/45 Đường Cộng Hòa, Phường 12, Quận Tân Bình, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>+ ĐỊA CHỈ: 232/45 Cộng H&ograve;a, Phường 12, T&acirc;n B&igrave;nh</p>

<p>- GI&Aacute;: 12 TRIỆU/ TH&Aacute;NG</p>

<p>- DT: 90M2</p>

<p>CHI TIẾT</p>

<p>- Chia th&agrave;nh sảnh tiếp kh&aacute;ch, kế to&aacute;n, ph&ograve;ng gi&aacute;m đốc</p>

<p>- Lối đi ri&ecirc;ng biệt, mặt k&iacute;nh sang trọng</p>

<p>- G&oacute;c mặt tiền, đường cực lớn, tận dụng vỉa h&egrave; thoải m&aacute;i</p>

<p>- B&ecirc;n cạnh l&agrave; cửa h&agrave;ng tiện lợi, khu d&acirc;n cư sầm uất</p>

<p>- Tầng trệt của t&ograve;a nh&agrave; lớn, ho&agrave;nh tr&aacute;ng</p>

<p>- C&oacute; bảo vệ t&ograve;a nh&agrave; 24/24 (tiết kiệm nếu bạn dự t&iacute;nh phải thu&ecirc; bảo vệ giữ xe)</p>

<p>LI&Ecirc;N HỆ XEM TRỰC TIẾP: 0919833709 Huy</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0917460309</strong></p>
</body>
</html>
', NULL, N'90m²', 1, 26, N'Mua', N'Tin thường', 14, N'9 Ngày', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (137, NULL, N'Cho thuê mặt bằng ngang 4×12 giá có lầu', N'10 triệu/tháng', CAST(N'2020-12-10T20:50:54.9781992' AS DateTime2), CAST(N'2020-12-10T20:50:54.9781439' AS DateTime2), N'Tin đang hiển thị', 0, N'Đường Phạm Văn Xảo, Phường Phú Thọ Hòa, Quận Tân Phú, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>Cho thu&ecirc; mặt bằng mặt tiền đường.</p>

<p>59 phạm văn xảo.t&acirc;n ph&uacute;.</p>

<p>Khu trung t&acirc;m quận t&acirc;n ph&uacute; sầm uất thuận tiện kinh mọi ng&agrave;nh nghề</p>

<p>Free ph&iacute; để xe.</p>

<p>CAM KẾT NHƯ H&Igrave;NH</p>

<p>Gi&aacute; : 10tr .</p>

<p>LH 0374810208</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0374810208</strong></p>
</body>
</html>
', NULL, N'100m²', 1, 29, N'Mua', N'Tin thường', 15, N'3 Tháng', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (138, NULL, N'Mặt bằng văn phòng 180m2 cho thuê quận Tân Bình – NGAY VÒNG XOAY LĂNG CHA CẢ', N'	46 triệu/tháng', CAST(N'2020-12-10T20:52:42.5751807' AS DateTime2), CAST(N'2020-12-10T20:52:42.5751320' AS DateTime2), N'Tin đang ẩn', 0, N'7 Đường Cộng Hòa, Phường 4, Quận Tân Bình, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>Mặt bằng văn ph&ograve;ng cho thu&ecirc; quận T&acirc;n B&igrave;nh &ndash; NGAY V&Ograve;NG XOAY LĂNG CHA CẢ</p>

<p>Địa chỉ: 7 đường Cộng H&ograve;a, Phường 4, Quận T&acirc;n B&igrave;nh.</p>

<p>Kết cấu: 1 Hầm &ndash; 1 Trệt &ndash; 6 Tầng &ndash; 1 Thang M&aacute;y</p>

<p>Diện t&iacute;ch cho thu&ecirc;: 180m2</p>

<p>Gi&aacute; cho thu&ecirc;: 2000$/th&aacute;ng (free ph&iacute; quản l&iacute;) - chưa bao gồm thuế</p>

<p>Ph&iacute; giữ xe: 150k /xe m&aacute;y/ th&aacute;ng</p>

<p>Tiền nước: Miễn ph&iacute;</p>

<p>Tiền điện: C&oacute; đồng hồ ri&ecirc;ng.</p>

<p>Ph&iacute; ngo&agrave;i giờ: FREE</p>

<p>Đặt cọc: 3 th&aacute;ng</p>

<p>Thanh to&aacute;n: theo th&aacute;ng</p>

<p>Thời gian thu&ecirc;: tối thiểu 2 năm</p>

<p>Li&ecirc;n hệ: 0345611655 - 0919237655 gặp anh Vũ</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0908301994</strong></p>
</body>
</html>
', NULL, N'	180m²', 1, 29, N'Mua', N'Tin thường', 14, N'3 Tháng', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (139, NULL, N'Cho thuê mặt bằng kinh doanh vừa làm căn tin trong trung tâm, vừa nằm ngay mặt tiền đường Độc Lập, Quận Tân Phú', N'	5 triệu/tháng', CAST(N'2020-12-10T20:54:32.9477644' AS DateTime2), CAST(N'2020-12-10T20:54:32.9476991' AS DateTime2), N'Tin đang hiển thị', 0, N'194 Đường Độc Lập, Phường Tân Thành, Quận Tân Phú, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>Đ/c: 194 độc lập _t&acirc;n th&agrave;nh _ t&acirc;n ph&uacute;</p>

<p>L&agrave; quầy căn tin trong 1 trung t&acirc;m gi&aacute;o dục, trung t&acirc;m c&oacute; sẵn lượng kh&aacute;ch, Nằm tr&ecirc;n mặt tiền đường lớn gần trường học gần chợ, rất thuận tiện kinh doanh bu&ocirc;n b&aacute;n</p>

<p>Gi&aacute; thu&ecirc; 5 triệu</p>

<p>Li&ecirc;n hệ để trao đổi th&ecirc;m chi tiết ạ</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0906635460</strong></p>
</body>
</html>
', NULL, N'20m²', 1, 27, N'Mua', N'Tin thường', 15, N'3 Tuần', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (140, NULL, N'MẶT BẰNG Q.10, 32M2 NGAY CHỢ HOA HỒ THỊ KỶ KD TỰ DO 6,9TR/THÁNG 42/17 HỒ THỊ KỶ', N'	6.9 triệu/tháng', CAST(N'2020-12-10T20:55:58.8655689' AS DateTime2), CAST(N'2020-12-10T20:55:58.8655251' AS DateTime2), N'Tin đang ẩn', 0, N'42/17 Đường Hồ Thị Kỷ, Phường 1, Quận 10, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>Mặt bằng bề ngang rộng 4m chiều d&agrave;i 8m,c&oacute; toilet ri&ecirc;ng, gi&aacute; 7,9tr/th&aacute;ng, , khu chợ Phố HOA HỒ THỊ KỶ sầm uất , cho kinh doanh tự do, đường tho&aacute;ng,xe tải v&agrave;o được, th&iacute;ch hợp sử dụng l&agrave;m mặt bằng kinh doanh b&aacute;n hoa tươi, l&agrave;m văn ph&ograve;ng c&ocirc;ng ty, SPA, cafe &hellip; c&oacute; s&acirc;n để xe. Xung quanh mặt bằng c&oacute; rất nhiều cửa h&agrave;ng hoa, shop thời trang....</p>

<p>Hợp đồng cho thu&ecirc; d&agrave;i hạn, thanh to&aacute;n từng th&aacute;ng, li&ecirc;n hệ: 42/17 Hồ Thị Kỷ - Mr.T&igrave;nh: 0938763637</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0938500486</strong></p>
</body>
</html>
', NULL, N'	32m²', 1, 26, N'Mua', N'Tin thường', 10, N'3 Tuần', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (141, NULL, N'Cho thuê 1 tầng nhà làm văn phòng cty, mở shop thời trang, kho, showroom', N'	3.5 triệu/tháng', CAST(N'2020-12-10T20:57:37.7577583' AS DateTime2), CAST(N'2020-12-10T20:57:37.7577151' AS DateTime2), N'Tin đang ẩn', 0, N'184/1M Đường Tân Hòa Đông, Phường 14, Quận 6, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>* T&ocirc;i cần cho thu&ecirc; 1 tầng lầu (diện t&iacute;ch xử dụng 30 m2) l&agrave;m văn ph&ograve;ng c&ocirc;ng ty, mở shop thời trang, showroom hay nh&agrave; kho,&hellip;&hellip;.</p>

<p>* Tiện &iacute;ch: C&oacute; ch&igrave;a kh&oacute;a ri&ecirc;ng, ph&ograve;ng vệ sinh rộng sạch sẽ 24/24, m&aacute;y nước n&oacute;ng lạnh, điện nước gi&aacute; nh&agrave; nước. Mặt tiền thục T&acirc;n H&ograve;a Đ&ocirc;ng quận 6 khu sầm uất đ&ocirc;ng d&acirc;n cư.</p>

<p>* Điều kiện thu&ecirc;: T&ocirc;i cho thu&ecirc; k&iacute; hợp đồng d&agrave;i hạn (k&iacute; theo 6 th&aacute;ng hoặc theo 1 năm trở l&ecirc;n)</p>

<p>* Đặt cọc 1 th&aacute;ng trước khi ở (Khi trả ph&ograve;ng th&igrave; lấy lại). Ưu ti&ecirc;n L&Acirc;U D&Agrave;I v&agrave; SẠCH SẼ</p>

<p>* Gi&aacute; thu&ecirc;: 3,5 triệu miễn trả gi&aacute;.</p>

<p>* Địa chỉ: 184/1M T&acirc;n H&ograve;a Đ&ocirc;ng, P. 14, Q. 6</p>

<p>Tel: 0367582554 (A. Bảo) miễn SMS.</p>

<p>=&gt; V&agrave;i ảnh về ph&ograve;ng:</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0367582554</strong></p>
</body>
</html>
', NULL, N'	30m²', 1, 29, N'Mua', N'Tin thường', 6, N'3 Tuần', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (142, NULL, N'Chính chủ Sang Shophouse Quán cafe ngay Chung Cư Celadon CiTy Q Tân Phú', N'	230 triệu/tháng', CAST(N'2020-12-10T20:59:56.6625964' AS DateTime2), CAST(N'2020-12-10T20:59:56.6625475' AS DateTime2), N'Tin đang hiển thị', 0, N'Đường Hương Lộ 3, Phường Sơn Kỳ, Quận Tân Phú, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>Địa chỉ Mặt tiền Chung Cư Celadon CiTy Q T&acirc;n Ph&uacute;</p>

<p>Shophouse Cafe mới 100% d&agrave;nh cho ai c&oacute; nhu cầu kinh doanh CAFE</p>

<p>DTSD 145m2 . C&oacute; 1pn, 2wc</p>

<p>Ngay mặt tiền đường lớn, rộng r&atilde;i v&agrave; th&ocirc;ng tho&aacute;ng</p>

<p>Khu sầm uất, d&acirc;n cư đ&ocirc;ng đ&uacute;c xe cộ qua lại hằng ng&agrave;y</p>

<p>Để lại to&agrave;n bộ trang thiết bị c&oacute; sẵn v&agrave;o chỉ cần kinh doanh th&ocirc;i</p>

<p>(1 tv 55 inch, bếp từ, m&aacute;y &eacute;p, m&aacute;y xay, 2 camera, 3 loa, m&aacute;y phun sương, d&ugrave;, b&agrave;n ghế, quầy bar...)</p>

<p>Nh&agrave; Ngay khu d&acirc;n cư an ninh, d&acirc;n tr&iacute; cao..</p>

<p>vị tr&iacute; đắc địa ngay trung t&acirc;m h&agrave;nh ch&iacute;nh Q T&acirc;n Ph&uacute;... Ngay trục đường ch&iacute;nh rất thuận tiện giao th&ocirc;ng</p>

<p>Gần chợ, trường học, s&acirc;n bay, si&ecirc;u thị, bệnh viện, c&ocirc;ng vi&ecirc;n, cửa h&agrave;ng tiện lợi, giao th&ocirc;ng c&ocirc;ng cộng, ng&acirc;n h&agrave;ng, ATM, qu&aacute;n x&aacute;...</p>

<p>Gi&aacute; sang 230tr</p>

<p>LH Ch&iacute;nh chủ Ms Ngọc 0363264918</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0363264918</strong></p>
</body>
</html>
', NULL, N'145m²', 1, 27, N'Mua', N'Tin thường', 15, N'4 Tuần', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (143, NULL, N'Cho thuê mặt bằng 80m2 tại 418 Phạm Văn Đồng P11 Q Bình Thạnh', N'18 triệu/tháng', CAST(N'2020-12-10T21:03:25.4146328' AS DateTime2), CAST(N'2020-12-10T21:03:25.4145953' AS DateTime2), N'Tin đang ẩn', 0, N'418 Đường Phạm Văn Đồng, Phường 11, Quận Bình Thạnh, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>Địa chỉ cho thu&ecirc; 418, Đường Phạm Văn Đồng, Phường 11, Quận B&igrave;nh Thạnh,</p>

<p>DTSD 80m2</p>

<p>Kết cấu 1 trệt 1 lầu c&oacute; 2pn, 2wc, c&ograve;n c&oacute; th&ecirc;m 1 g&aacute;c lửng</p>

<p>b&agrave;n ghế trong qu&aacute;n nếu cần c&oacute; thể sang nhượng lại.</p>

<p>Nh&agrave; Ngay khu d&acirc;n cư an ninh, d&acirc;n tr&iacute; cao..</p>

<p>vị tr&iacute; đắc địa ngay trung t&acirc;m h&agrave;nh ch&iacute;nh Q B&igrave;nh Thạnh... Ngay trục đường ch&iacute;nh rất thuận tiện giao th&ocirc;ng</p>

<p>Gần chợ, trường học, s&acirc;n bay, si&ecirc;u thị, bệnh viện, c&ocirc;ng vi&ecirc;n, cửa h&agrave;ng tiện lợi, giao th&ocirc;ng c&ocirc;ng cộng, ng&acirc;n h&agrave;ng, ATM, qu&aacute;n x&aacute;...</p>

<p>gi&aacute; thu&ecirc; 18tr/th</p>

<p>LH Ms Như &Yacute; 0902855958</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0902855958</strong></p>
</body>
</html>
', NULL, N'	80m²', 1, 26, N'Mua', N'Tin thường', 15, N'3 Tháng', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (144, NULL, N'Cho thuê Mặt bằng kinh doanh 30m2, vị trí Mặt tiền Lý Chính Thắng', N'15 triệu/tháng', CAST(N'2020-12-10T21:04:54.9172286' AS DateTime2), CAST(N'2020-12-10T21:04:54.9172015' AS DateTime2), N'Tin đang hiển thị', 0, N'5 Đường Lý Chính Thắng, Phường 8, Quận 3, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>Cho thu&ecirc; mặt bằng kinh doanh vị tr&iacute; mặt tiền số 5 L&yacute; Ch&iacute;nh Thắng, gần g&oacute;c L&yacute; Ch&iacute;nh Thắng - Hai B&agrave; Trưng. Diện t&iacute;ch thu&ecirc; 2.5 x 12 = 30m2. Ph&ugrave; hợp kinh doanh mọi ng&agrave;nh nghề (c&agrave; ph&ecirc;, tr&agrave; sữa, thức ăn nhanh, nh&agrave; thuốc, mỹ phẩm, l&agrave;m đẹp, b&aacute;n quần &aacute;o, .... ).</p>

<p>Gi&aacute; thu&ecirc;: 15 triệu/th&aacute;ng.</p>

<p>Li&ecirc;n hệ: A. Cường - 0937189955 (Vui l&ograve;ng điện thoại trước 17h từ T2-T6; Zalo 24/7)</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0937189955</strong></p>
</body>
</html>
', NULL, N'	30m²', 1, 26, N'Mua', N'Tin thường', 3, N'3 Tháng', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (145, NULL, N'Chính chủ cần sang nhượng tiệm giặt ủi ngay mặt tiền chợ Tân Mỹ Q7', N'15 triệu/tháng', CAST(N'2020-12-10T21:06:18.2016763' AS DateTime2), CAST(N'2020-12-10T21:06:18.2016308' AS DateTime2), N'Tin đang hiển thị', 0, N'Đường số 1, Phường Tân Phú, Quận 7, Hồ Chí Minh', N'<html>
<head>
	<title></title>
</head>
<body>
<p>Địa chỉ Đường Số 1, Phường T&acirc;n Ph&uacute;, Quận 7, Tp Hồ Ch&iacute; Minh</p>

<p>DTSD 35m2</p>

<p>Do kh&ocirc;ng người tr&ocirc;ng coi n&ecirc;n cần sang lại căn tiệm giặt ủi Ngay mặt tiền chợ T&acirc;n Mỹ Đường số 1</p>

<p>2 b&ecirc;n l&agrave; 2 d&atilde;y nh&agrave; trọ đ&ocirc;ng đ&uacute;c. C&oacute; lượng kh&aacute;ch ổn định, v&agrave; l&agrave; khu vực rất an ninh.</p>

<p>Ph&iacute;a trước c&oacute; thể cho thu&ecirc; lại từ 2 đến 2,5tr. Hiện tiệm đang giặt hợp đồng của trường học v&agrave; ph&ograve;ng tập...</p>

<p>Gi&aacute; sang 130.000.000 đ trong đ&oacute; đ&atilde; bao gồm 15 triệu tiền cọc.</p>

<p>Tiệm giặt hiện c&oacute; 4 giặt 4 sấy (hiệu electrolax) trong đ&oacute; c&oacute; 1 m&aacute;y giặt lớn d&ugrave;ng để giặt đồ to như gấu b&ocirc;ng, topper, chăn m&agrave;n lớn. Ngo&agrave;i ra c&ograve;n 1 số thiết bị d&ugrave;ng c&aacute; nh&acirc;n như tủ lạnh, m&aacute;y lạnh, m&aacute;y nước n&oacute;ng, bếp ga &acirc;m, tủ &acirc;m..,.v&agrave; to&agrave;n bộ thiết bị trong nh&agrave;.</p>

<p>Giống như 1 căn nh&agrave; nhỏ với đầy đủ thiết bị, th&iacute;ch hợp cho gia đ&igrave;nh nhỏ vừa l&agrave;m vừa ở.</p>

<p>LH Ms Phượng 0938625691</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0938625691</strong></p>
</body>
</html>
', NULL, N'	35m²', 1, 29, N'Mua', N'Tin thường', 7, N'5 Tuần', 0)
INSERT [dbo].[Motels] ([Id], [IdNew], [Title], [Price], [DateUpdate], [DateDue], [Status], [Verify], [Address], [Description], [Phone], [AreaZone], [CityId], [UserId], [Typemotel], [Typeservice], [ProvinceId], [Time], [VerifyAdmin]) VALUES (151, NULL, N'KTX giá chỉ 999k ngay mặt tiền đường ĐBL gần Bến Xe Miền Đông Q.Bình Thạnh', N'999.000 đồng/tháng', CAST(N'2020-12-18T21:01:27.7557244' AS DateTime2), CAST(N'2020-12-18T21:01:27.7556845' AS DateTime2), N'Tin đang hiển thị', 0, N'Rạch Bùng Binh, Phường 10, Quận 3, TPHCM', N'<html>
<head>
	<title></title>
</head>
<body>
<p>*** KTX cho sinh vi&ecirc;n mặt tiền đường Đinh Bộ Lĩnh, trung t&acirc;m B&igrave;nh Thạnh. C&aacute;ch bến xe Miền Đ&ocirc;ng 500m</p>

<p>*** Nằm ngay vị tr&iacute; trắc địa, tr&ecirc;n đường Đinh Bộ Lĩnh giao B&ugrave;i Đ&igrave;nh T&uacute;y. C&aacute;ch bến xe Bus 100m, Bến xe Miền Đ&ocirc;ng 500m.</p>

<p>+ Gần c&aacute;c trường đại học như:</p>

<p>- Đại học Ngoại thương: 5 ph&uacute;t đi bộ</p>

<p>- Đại học HUTECH: 7 ph&uacute;t đi bộ</p>

<p>- Đại học giao th&ocirc;ng vận tải: 10 ph&uacute;t đi bộ</p>

<p>- Đại Học C&ocirc;ng nghệ TP.HCM 8 ph&uacute;t đi xe</p>

<p>- Đại Học Mỹ Thuật TP.HCM 8 ph&uacute;t đi xe</p>

<p>- Trường Đại học Thủy Lợi 6 ph&uacute;t đi xe</p>

<p>Tiện lợi cho c&aacute;c em đi học.</p>

<p>Khu vực y&ecirc;n tĩnh, an ninh,bảo vệ 24/24, camera 24/7</p>

<p>Gi&aacute; 999k - 1tr2</p>

<p>Địa chỉ: 102 Đinh Bộ Lĩnh, Phường 26, Quận B&igrave;nh Thạnh</p>

<p>Li&ecirc;n hệ : Ms Hoa (0385378034)</p>

<p>---------------------------------------------</p>

<p>☎️ Điện thoại li&ecirc;n hệ:&nbsp;<strong>0385378034</strong></p>
</body>
</html>
', NULL, N'25m²', 12, 28, N'Mua', N'Tin thường', 218, N'10 Tuần', 0)
SET IDENTITY_INSERT [dbo].[Motels] OFF
SET IDENTITY_INSERT [dbo].[PriceSearchs] ON 

INSERT [dbo].[PriceSearchs] ([Id], [Number]) VALUES (1, NULL)
INSERT [dbo].[PriceSearchs] ([Id], [Number]) VALUES (2, NULL)
INSERT [dbo].[PriceSearchs] ([Id], [Number]) VALUES (3, NULL)
INSERT [dbo].[PriceSearchs] ([Id], [Number]) VALUES (4, NULL)
INSERT [dbo].[PriceSearchs] ([Id], [Number]) VALUES (5, NULL)
INSERT [dbo].[PriceSearchs] ([Id], [Number]) VALUES (6, N'7 triệu - 10 triệu')
INSERT [dbo].[PriceSearchs] ([Id], [Number]) VALUES (7, N'10 triệu - 15 triệu')
INSERT [dbo].[PriceSearchs] ([Id], [Number]) VALUES (8, N'Trên 15 triệu')
SET IDENTITY_INSERT [dbo].[PriceSearchs] OFF
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
INSERT [dbo].[Roles] ([Id], [RoleName]) VALUES (2, N'Nhân viên nhân sự')
INSERT [dbo].[Roles] ([Id], [RoleName]) VALUES (3, N'Nhân viên kế toán')
INSERT [dbo].[Roles] ([Id], [RoleName]) VALUES (4, N'Nhân viên quản lý')
INSERT [dbo].[Roles] ([Id], [RoleName]) VALUES (5, N'dev')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Serviceprices] ON 

INSERT [dbo].[Serviceprices] ([Id], [Typeofnew], [Date], [PriceDate], [PriceMonth], [PriceUpTop], [PriceWeek]) VALUES (1, N'Tin VIP nổi bật', N'7 ngày', N'50000 đồng', N'1.200.000 đồng', N'5.000 đồng', N'315.000 đồng')
INSERT [dbo].[Serviceprices] ([Id], [Typeofnew], [Date], [PriceDate], [PriceMonth], [PriceUpTop], [PriceWeek]) VALUES (2, N'Tin VIP 1', N'1 ngày', N'30.000 đồng', N'800.000 đồng', N'3.000 đồng', N'190.000 đồng')
INSERT [dbo].[Serviceprices] ([Id], [Typeofnew], [Date], [PriceDate], [PriceMonth], [PriceUpTop], [PriceWeek]) VALUES (3, N'Tin VIP 2', N'1 ngày', N'20.000 đồng', N'540.000 đồng', N'2.000 đồng', N'133.000 đồng')
INSERT [dbo].[Serviceprices] ([Id], [Typeofnew], [Date], [PriceDate], [PriceMonth], [PriceUpTop], [PriceWeek]) VALUES (4, N'Tin VIP 3', N'1 ngày', N'10.000 đồng', N'240.000 đồng', N'2.000 đồng', N'63.000 đồng')
INSERT [dbo].[Serviceprices] ([Id], [Typeofnew], [Date], [PriceDate], [PriceMonth], [PriceUpTop], [PriceWeek]) VALUES (5, N'Tin thường', N'1 ngày', N'2.000 đồng', N'48.000 đồng', N'2.000 đồng', N'12.000 đồng')
SET IDENTITY_INSERT [dbo].[Serviceprices] OFF
SET IDENTITY_INSERT [dbo].[Typeofnews] ON 

INSERT [dbo].[Typeofnews] ([Id], [Name]) VALUES (1, N'Phòng trọ, nhà trọ')
INSERT [dbo].[Typeofnews] ([Id], [Name]) VALUES (2, N'Nhà thuê nguyên căn')
INSERT [dbo].[Typeofnews] ([Id], [Name]) VALUES (3, N'Cho thuê căn hộ')
INSERT [dbo].[Typeofnews] ([Id], [Name]) VALUES (4, N'Tìm người ở ghép')
INSERT [dbo].[Typeofnews] ([Id], [Name]) VALUES (5, N'Cho thuê mặt bằng')
SET IDENTITY_INSERT [dbo].[Typeofnews] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [CreatedDate], [LastLogOnDate], [Email], [Gender], [Title], [UserImage], [AccountId], [HovaTen], [Facebook]) VALUES (26, CAST(N'2018-03-29T13:34:00.0000000' AS DateTime2), CAST(N'2018-03-29T13:34:00.0000000' AS DateTime2), NULL, 1, NULL, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/userimages%2Fimages_1608224128104?alt=media&token=e6b6dfa2-f9ce-4ddc-930d-be604bab6f83', 35, N'Chu Minh Hoàng', NULL)
INSERT [dbo].[Users] ([Id], [CreatedDate], [LastLogOnDate], [Email], [Gender], [Title], [UserImage], [AccountId], [HovaTen], [Facebook]) VALUES (27, CAST(N'2018-03-29T13:34:00.0000000' AS DateTime2), CAST(N'2018-03-29T13:34:00.0000000' AS DateTime2), NULL, 1, NULL, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/userimages%2Fo6WtDZcnKEyqhVFs7hWpKG-320-80_1608224263429?alt=media&token=740aeb38-bb33-44f9-a491-181551701a50', 36, N'Chu Tinh Hà', NULL)
INSERT [dbo].[Users] ([Id], [CreatedDate], [LastLogOnDate], [Email], [Gender], [Title], [UserImage], [AccountId], [HovaTen], [Facebook]) VALUES (28, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/userimages%2Ft%E1%BA%A3i%20xu%E1%BB%91ng%20(1)_1608224317509?alt=media&token=c1ed2105-eea2-4d47-a5bd-8fb34662f59a', 39, N'Thất Thông Minh', NULL)
INSERT [dbo].[Users] ([Id], [CreatedDate], [LastLogOnDate], [Email], [Gender], [Title], [UserImage], [AccountId], [HovaTen], [Facebook]) VALUES (29, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'https://firebasestorage.googleapis.com/v0/b/nhatrofirebase-f21b1.appspot.com/o/userimages%2Ft%E1%BA%A3i%20xu%E1%BB%91ng_1608224340653?alt=media&token=47409151-15fd-49fb-8639-bf9acac15195', 40, N'Thông Thành Thiên', NULL)
INSERT [dbo].[Users] ([Id], [CreatedDate], [LastLogOnDate], [Email], [Gender], [Title], [UserImage], [AccountId], [HovaTen], [Facebook]) VALUES (30, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, NULL, 46, N'nhan', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Index [IX_Accounts_RoleId]    Script Date: 12/19/2020 8:02:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Accounts_RoleId] ON [dbo].[Accounts]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bills_MotelId]    Script Date: 12/19/2020 8:02:08 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Bills_MotelId] ON [dbo].[Bills]
(
	[MotelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BuyMoneys_UserId]    Script Date: 12/19/2020 8:02:08 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_BuyMoneys_UserId] ON [dbo].[BuyMoneys]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Convesation_replys_ConvesationId]    Script Date: 12/19/2020 8:02:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Convesation_replys_ConvesationId] ON [dbo].[Convesation_replys]
(
	[ConvesationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Convesation_replys_UserId]    Script Date: 12/19/2020 8:02:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Convesation_replys_UserId] ON [dbo].[Convesation_replys]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Convesations_UserOneId]    Script Date: 12/19/2020 8:02:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Convesations_UserOneId] ON [dbo].[Convesations]
(
	[UserOneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Convesations_UserTwoId]    Script Date: 12/19/2020 8:02:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Convesations_UserTwoId] ON [dbo].[Convesations]
(
	[UserTwoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Details_LiveTypeId]    Script Date: 12/19/2020 8:02:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Details_LiveTypeId] ON [dbo].[Details]
(
	[LiveTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Details_MotelId]    Script Date: 12/19/2020 8:02:08 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Details_MotelId] ON [dbo].[Details]
(
	[MotelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Details_TypeofnewId]    Script Date: 12/19/2020 8:02:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Details_TypeofnewId] ON [dbo].[Details]
(
	[TypeofnewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Districts_ProvinceId]    Script Date: 12/19/2020 8:02:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Districts_ProvinceId] ON [dbo].[Districts]
(
	[ProvinceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Employees_AccountId]    Script Date: 12/19/2020 8:02:08 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Employees_AccountId] ON [dbo].[Employees]
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Employees_ManageEmployeeId]    Script Date: 12/19/2020 8:02:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Employees_ManageEmployeeId] ON [dbo].[Employees]
(
	[ManageEmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Images_MotelId]    Script Date: 12/19/2020 8:02:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Images_MotelId] ON [dbo].[Images]
(
	[MotelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Motels_CityId]    Script Date: 12/19/2020 8:02:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Motels_CityId] ON [dbo].[Motels]
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Motels_ProvinceId]    Script Date: 12/19/2020 8:02:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Motels_ProvinceId] ON [dbo].[Motels]
(
	[ProvinceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Motels_UserId]    Script Date: 12/19/2020 8:02:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Motels_UserId] ON [dbo].[Motels]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Posts_ParentPostId]    Script Date: 12/19/2020 8:02:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Posts_ParentPostId] ON [dbo].[Posts]
(
	[ParentPostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Posts_TopicId]    Script Date: 12/19/2020 8:02:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Posts_TopicId] ON [dbo].[Posts]
(
	[TopicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Posts_UserId]    Script Date: 12/19/2020 8:02:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Posts_UserId] ON [dbo].[Posts]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Provinces_CityId]    Script Date: 12/19/2020 8:02:08 PM ******/
CREATE NONCLUSTERED INDEX [IX_Provinces_CityId] ON [dbo].[Provinces]
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_AccountId]    Script Date: 12/19/2020 8:02:08 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_AccountId] ON [dbo].[Users]
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Details] ADD  DEFAULT ((0)) FOR [MotelId]
GO
ALTER TABLE [dbo].[Details] ADD  DEFAULT ((0)) FOR [LiveTypeId]
GO
ALTER TABLE [dbo].[Motels] ADD  DEFAULT ((0)) FOR [ProvinceId]
GO
ALTER TABLE [dbo].[Motels] ADD  DEFAULT (CONVERT([bit],(0))) FOR [VerifyAdmin]
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
ALTER TABLE [dbo].[Details]  WITH CHECK ADD  CONSTRAINT [FK_Details_LiveTypes_LiveTypeId] FOREIGN KEY([LiveTypeId])
REFERENCES [dbo].[LiveTypes] ([Id])
GO
ALTER TABLE [dbo].[Details] CHECK CONSTRAINT [FK_Details_LiveTypes_LiveTypeId]
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
