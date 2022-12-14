Drop DATABASE DenkShop
USE [master]
GO
/****** Object:  Database [DenkShop]    Script Date: 7/5/2022 10:11:18 AM ******/
CREATE DATABASE [DenkShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DenkShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DenkShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DenkShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DenkShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DenkShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DenkShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DenkShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DenkShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DenkShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DenkShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DenkShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [DenkShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DenkShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DenkShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DenkShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DenkShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DenkShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DenkShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DenkShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DenkShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DenkShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DenkShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DenkShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DenkShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DenkShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DenkShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DenkShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DenkShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DenkShop] SET RECOVERY FULL 
GO
ALTER DATABASE [DenkShop] SET  MULTI_USER 
GO
ALTER DATABASE [DenkShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DenkShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DenkShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DenkShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DenkShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DenkShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DenkShop', N'ON'
GO
ALTER DATABASE [DenkShop] SET QUERY_STORE = OFF
GO
USE [DenkShop]
GO
/****** Object:  Table [dbo].[tblCaterory]    Script Date: 7/5/2022 10:11:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCaterory](
	[categoryID] [nchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblCaterory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 7/5/2022 10:11:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[oderID] int IDENTITY(1,1) NOT NULL ,
	[UserID] [nchar](20) NOT NULL,
	[date] [date] NULL,
	[total] [int] NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[oderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 7/5/2022 10:11:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[detailID] int IDENTITY(1,1) NOT NULL,
	[orderID] int NOT NULL,
	[productID] [nchar](10) NULL,
	[price] [int] NULL,
	[quantity] [nchar](10) NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 7/5/2022 10:11:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productID] [nchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
	[price] [int] NULL,
	[quantity] [int] NULL,
	[categoyID] [nchar](10) NOT NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 7/5/2022 10:11:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [nchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 7/5/2022 10:11:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nchar](20) NOT NULL,
	[roleID] [nchar](10) NOT NULL,
	[password] [nchar](10) NULL,
	[userName] [nvarchar](50) NULL,
	[phone] [nchar](12) NULL,
	[address] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblCaterory] ([categoryID], [name]) VALUES (N'A', N'Healthy')
INSERT [dbo].[tblCaterory] ([categoryID], [name]) VALUES (N'B', N'Machiato')
INSERT [dbo].[tblCaterory] ([categoryID], [name]) VALUES (N'C', N'IceBlended')
GO
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [categoyID]) VALUES (N'P01', N'Tra Sua', 20000, 50, N'A')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [categoyID]) VALUES (N'P02', N'Tra Dao', 27000, 20, N'A')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [categoyID]) VALUES (N'P03', N'Tra Vai', 27000, 20, N'A')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [categoyID]) VALUES (N'P04', N'Tra Sen Vang', 30000, 15, N'B')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [categoyID]) VALUES (N'P05', N'Tra Xanh MatCha', 35000, 10, N'B')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [categoyID]) VALUES (N'P06', N'Cacao', 35000, 20, N'B')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [categoyID]) VALUES (N'P07', N'MatCha', 37000, 10, N'C')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [categoyID]) VALUES (N'P08', N'VietQuat', 37000, 7, N'C')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [categoyID]) VALUES (N'P09', N'Dau', 37000, 5, N'C')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [categoyID]) VALUES (N'P10', N'Ep Tao', 29000, 2, N'A')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [categoyID]) VALUES (N'P11', N'Ep Thom', 29000, 5, N'A')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [categoyID]) VALUES (N'P12', N'Ep Dau', 30000, 5, N'A')
GO
INSERT [dbo].[tblRoles] ([roleID], [name]) VALUES (N'AD', N'Admin')
INSERT [dbo].[tblRoles] ([roleID], [name]) VALUES (N'US', N'User')
GO
INSERT [dbo].[tblUsers] ([userID], [roleID], [password], [userName], [phone], [address], [email]) VALUES (N'Denkhotieu ', N'AD', N'1', N'Denkhotieu', N'0888226311', N'Kien Giang', N'Denkhotieu@gmail.com')
INSERT [dbo].[tblUsers] ([userID], [roleID], [password], [userName], [phone], [address], [email]) VALUES (N'SE160411', N'US', N'1', N'VietThu', N'0944101131', N'Kien Giang', N'Vietthu@gmail.com')
INSERT [dbo].[tblUsers] ([userID], [roleID], [password], [userName], [phone], [address], [email]) VALUES (N'SE160412', N'US', N'1', N'Letter', N'0917855077', N'Bac Giang', N'Denkhotieu1@gmail.com')
INSERT [dbo].[tblUsers] ([userID], [roleID], [password], [userName], [phone], [address], [email]) VALUES (N'SE160413', N'US', N'1', N'ThienTran', N'0947818336', N'Ha Giang', NULL)
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblUsers]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrder] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([oderID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrder]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblProduct] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProduct] ([productID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblProduct]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblCaterory] FOREIGN KEY([categoyID])
REFERENCES [dbo].[tblCaterory] ([categoryID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblCaterory]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoles]
GO
USE [master]
GO
ALTER DATABASE [DenkShop] SET  READ_WRITE 
GO
