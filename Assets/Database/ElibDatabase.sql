USE [master]
GO
/****** Object:  Database [ELib]    Script Date: 2/13/2023 7:16:14 PM ******/
CREATE DATABASE [ELib]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ELib', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ELib.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ELib_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ELib_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ELib] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ELib].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ELib] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ELib] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ELib] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ELib] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ELib] SET ARITHABORT OFF 
GO
ALTER DATABASE [ELib] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ELib] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ELib] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ELib] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ELib] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ELib] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ELib] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ELib] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ELib] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ELib] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ELib] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ELib] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ELib] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ELib] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ELib] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ELib] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ELib] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ELib] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ELib] SET  MULTI_USER 
GO
ALTER DATABASE [ELib] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ELib] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ELib] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ELib] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ELib] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ELib]
GO
/****** Object:  Table [dbo].[admin_master_tb1]    Script Date: 2/13/2023 7:16:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_master_tb1](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[full_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_admin_master_tb1] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[author_master_tb1]    Script Date: 2/13/2023 7:16:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[author_master_tb1](
	[author_id] [nvarchar](50) NOT NULL,
	[author_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_author_master_tb1] PRIMARY KEY CLUSTERED 
(
	[author_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book_issue_tb1]    Script Date: 2/13/2023 7:16:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book_issue_tb1](
	[member_id] [nvarchar](50) NULL,
	[member_name] [nvarchar](50) NULL,
	[book_id] [nvarchar](50) NULL,
	[book_name] [nvarchar](max) NULL,
	[issue_date] [nvarchar](50) NULL,
	[due_date] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book_master_tb1]    Script Date: 2/13/2023 7:16:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book_master_tb1](
	[book_id] [nvarchar](50) NOT NULL,
	[book_name] [nvarchar](max) NULL,
	[author_name] [nvarchar](max) NULL,
	[publisher_name] [nvarchar](max) NULL,
	[publish_date] [nvarchar](50) NULL,
	[language] [nvarchar](50) NULL,
	[edition] [nvarchar](max) NULL,
	[book_cost] [nvarchar](50) NULL,
	[no_of_pages] [nvarchar](50) NULL,
	[book_description] [nvarchar](max) NULL,
	[actual_stock] [nvarchar](50) NULL,
	[current_stock] [nvarchar](50) NULL,
 CONSTRAINT [PK_book_master_tb1] PRIMARY KEY CLUSTERED 
(
	[book_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[member_master_tb1]    Script Date: 2/13/2023 7:16:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[member_master_tb1](
	[full_name] [nvarchar](50) NULL,
	[dob] [nvarchar](50) NULL,
	[contact_no] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[city] [nvarchar](50) NULL,
	[full_address] [nvarchar](max) NULL,
	[member_id] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
	[account_status] [nvarchar](50) NULL,
 CONSTRAINT [PK_member_master_tb1] PRIMARY KEY CLUSTERED 
(
	[member_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[publisher_master_tb1]    Script Date: 2/13/2023 7:16:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[publisher_master_tb1](
	[publisher_id] [nvarchar](50) NOT NULL,
	[publisher_name] [nvarchar](max) NULL,
 CONSTRAINT [PK_publisher_master_tb1] PRIMARY KEY CLUSTERED 
(
	[publisher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [ELib] SET  READ_WRITE 
GO
