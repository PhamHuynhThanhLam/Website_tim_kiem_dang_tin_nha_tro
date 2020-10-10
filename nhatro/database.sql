USE [master]
GO
/****** Object:  Database [test]    Script Date: 4/6/2018 3:29:05 PM ******/
CREATE DATABASE [test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'test', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\test.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'test_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\test_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [test] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [test] SET ARITHABORT OFF 
GO
ALTER DATABASE [test] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [test] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [test] SET  DISABLE_BROKER 
GO
ALTER DATABASE [test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [test] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [test] SET  MULTI_USER 
GO
ALTER DATABASE [test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [test] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [test]
GO
/****** Object:  Table [dbo].[tbl_per_relationship]    Script Date: 4/6/2018 3:29:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_per_relationship](
	[id_rel] [int] IDENTITY(1,1) NOT NULL,
	[id_user_rel] [int] NOT NULL,
	[id_per_rel] [int] NOT NULL,
	[suspended] [bit] NULL,
 CONSTRAINT [PK_tbl_per_relationship] PRIMARY KEY CLUSTERED 
(
	[id_rel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_permision]    Script Date: 4/6/2018 3:29:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_permision](
	[id_per] [int] IDENTITY(1,1) NOT NULL,
	[name_per] [nvarchar](50) NOT NULL,
	[description] [nvarchar](100) NULL,
 CONSTRAINT [PK_tbl_permision] PRIMARY KEY CLUSTERED 
(
	[id_per] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_permision_detail]    Script Date: 4/6/2018 3:29:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_permision_detail](
	[id_pd] [int] IDENTITY(1,1) NOT NULL,
	[name_action] [nvarchar](50) NOT NULL,
	[code_action] [varchar](50) NOT NULL,
	[id_per] [int] NOT NULL,
 CONSTRAINT [PK_tbl_permision_detail] PRIMARY KEY CLUSTERED 
(
	[id_pd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_user]    Script Date: 4/6/2018 3:29:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_user](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[name_user] [nvarchar](50) NOT NULL,
	[user_name] [varchar](50) NOT NULL,
	[pass] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_user] PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[tbl_per_relationship]  WITH CHECK ADD  CONSTRAINT [FK_tbl_per_relationship_tbl_permision] FOREIGN KEY([id_per_rel])
REFERENCES [dbo].[tbl_permision] ([id_per])
GO
ALTER TABLE [dbo].[tbl_per_relationship] CHECK CONSTRAINT [FK_tbl_per_relationship_tbl_permision]
GO
ALTER TABLE [dbo].[tbl_per_relationship]  WITH CHECK ADD  CONSTRAINT [FK_tbl_per_relationship_tbl_user] FOREIGN KEY([id_user_rel])
REFERENCES [dbo].[tbl_user] ([id_user])
GO
ALTER TABLE [dbo].[tbl_per_relationship] CHECK CONSTRAINT [FK_tbl_per_relationship_tbl_user]
GO
ALTER TABLE [dbo].[tbl_permision_detail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_permision_detail_tbl_permision] FOREIGN KEY([id_per])
REFERENCES [dbo].[tbl_permision] ([id_per])
GO
ALTER TABLE [dbo].[tbl_permision_detail] CHECK CONSTRAINT [FK_tbl_permision_detail_tbl_permision]
GO
USE [master]
GO
ALTER DATABASE [test] SET  READ_WRITE 
GO
