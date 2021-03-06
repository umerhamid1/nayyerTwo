USE [master]
GO
/****** Object:  Database [OrderManagementSystem]    Script Date: 6/24/2020 11:41:01 PM ******/
CREATE DATABASE [OrderManagementSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OrderManagementSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\OrderManagementSystem.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OrderManagementSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\OrderManagementSystem_log.ldf' , SIZE = 2304KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [OrderManagementSystem] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OrderManagementSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OrderManagementSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OrderManagementSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OrderManagementSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OrderManagementSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OrderManagementSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [OrderManagementSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OrderManagementSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OrderManagementSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OrderManagementSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OrderManagementSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OrderManagementSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OrderManagementSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OrderManagementSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OrderManagementSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OrderManagementSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OrderManagementSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OrderManagementSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OrderManagementSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OrderManagementSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OrderManagementSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OrderManagementSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OrderManagementSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OrderManagementSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [OrderManagementSystem] SET  MULTI_USER 
GO
ALTER DATABASE [OrderManagementSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OrderManagementSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OrderManagementSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OrderManagementSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [OrderManagementSystem] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'OrderManagementSystem', N'ON'
GO
USE [OrderManagementSystem]
GO
/****** Object:  Table [dbo].[AddNewCompany]    Script Date: 6/24/2020 11:41:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddNewCompany](
	[Id] [int] NOT NULL,
	[CompanyName] [nvarchar](50) NULL,
	[Contact] [nvarchar](50) NULL,
 CONSTRAINT [PK_AddNewCompany_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BillReceive]    Script Date: 6/24/2020 11:41:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillReceive](
	[VrNo] [int] NOT NULL,
	[Jrn_Type] [nvarchar](15) NULL,
	[CompanyName] [nvarchar](50) NULL,
	[Description] [nvarchar](100) NULL,
	[BillAmount] [numeric](18, 0) NULL,
	[ReceiveAmount] [numeric](18, 0) NULL,
	[Date] [date] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Login]    Script Date: 6/24/2020 11:41:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[password_change_status] [bit] NULL,
 CONSTRAINT [PK_Login_1] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OldDataBillReceive]    Script Date: 6/24/2020 11:41:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OldDataBillReceive](
	[TableName] [varchar](50) NULL,
	[Id] [int] NULL,
	[VrNo] [int] NULL,
	[Jrn_Type] [nvarchar](15) NULL,
	[CompanyName] [nvarchar](50) NULL,
	[Description] [nvarchar](100) NULL,
	[BillAmount] [numeric](18, 0) NULL,
	[ReceiveAmount] [numeric](18, 0) NULL,
	[Date] [varchar](50) NULL,
	[Contact] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[DateUpdate] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[GetOrdersByDates4]    Script Date: 6/24/2020 11:41:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetOrdersByDates4]
(@From date ,
@To date)
AS
begin

select 
'xyz' as Code , 
br.CompanyName   as 'PartyName' ,
(SELECT sum(BillAmount) - sum(ReceiveAmount)  as balancedd from BillReceive where Date < @From and CompanyName = br.CompanyName GROUP   BY CompanyName) as openingBalance,
sum(br.BillAmount) as sales,
sum(br.ReceiveAmount) as 'ReceiptAndOhterReceipt'
from BillReceive br
where   
Date  between @From and @To
GROUP   BY CompanyName

end
GO
/****** Object:  StoredProcedure [dbo].[GetOrdersByDates5]    Script Date: 6/24/2020 11:41:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[GetOrdersByDates5]
(@From date ,
@cName nvarchar(50),
@To date)
AS
begin


select
 
 br.Date,
 Jrn_Type,VrNo,CompanyName,Description,BillAmount as Debit, ReceiveAmount as Credit,
	(
	SELECT  
	COALESCE(
	sum(BillAmount),0)- COALESCE(sum(ReceiveAmount),0)  as balancedrrrrrr
	from BillReceive
	where Date  < @From   and
	CompanyName = @cName
	) 
	+
	(
		select COALESCE(
	sum(BillAmount),0) from BillReceive
		 where Date  between @From and br.Date   and
	CompanyName = @cName
	GROUP   BY CompanyName 
	)
	-
	(
		select COALESCE(sum(ReceiveAmount),0) from BillReceive
		 where Date  between @From and br.Date   and
	CompanyName = @cName
	GROUP   BY CompanyName 
	) as balanced

   from BillReceive br
  where 
  CompanyName = @cName and 
  Date  between @From and @To
  end
GO
USE [master]
GO
ALTER DATABASE [OrderManagementSystem] SET  READ_WRITE 
GO
