USE [master]
GO
/****** Object:  Database [onlinePlatby]    Script Date: 22.12.2016 8:47:24 ******/
CREATE DATABASE [onlinePlatby]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'onlonePlatby', FILENAME = N'C:\Users\mesen\onlonePlatby.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'onlonePlatby_log', FILENAME = N'C:\Users\mesen\onlonePlatby_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [onlinePlatby] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [onlinePlatby].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [onlinePlatby] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [onlinePlatby] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [onlinePlatby] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [onlinePlatby] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [onlinePlatby] SET ARITHABORT OFF 
GO
ALTER DATABASE [onlinePlatby] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [onlinePlatby] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [onlinePlatby] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [onlinePlatby] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [onlinePlatby] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [onlinePlatby] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [onlinePlatby] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [onlinePlatby] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [onlinePlatby] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [onlinePlatby] SET  DISABLE_BROKER 
GO
ALTER DATABASE [onlinePlatby] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [onlinePlatby] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [onlinePlatby] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [onlinePlatby] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [onlinePlatby] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [onlinePlatby] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [onlinePlatby] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [onlinePlatby] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [onlinePlatby] SET  MULTI_USER 
GO
ALTER DATABASE [onlinePlatby] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [onlinePlatby] SET DB_CHAINING OFF 
GO
ALTER DATABASE [onlinePlatby] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [onlinePlatby] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [onlinePlatby] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [onlinePlatby] SET QUERY_STORE = OFF
GO
USE [onlinePlatby]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [onlinePlatby]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 22.12.2016 8:47:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Company] [nvarchar](64) NULL,
	[Country] [nvarchar](64) NOT NULL,
	[City] [nvarchar](64) NOT NULL,
	[PostalCode] [nvarchar](32) NOT NULL,
	[Street] [nvarchar](64) NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BasketProducts]    Script Date: 22.12.2016 8:47:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BasketProducts](
	[BasketId] [int] NOT NULL,
	[ProductVariantId] [int] NOT NULL,
 CONSTRAINT [PK_BasketProduct] PRIMARY KEY CLUSTERED 
(
	[BasketId] ASC,
	[ProductVariantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Baskets]    Script Date: 22.12.2016 8:47:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Baskets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IPAddress] [nvarchar](32) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[LastDateEdited] [datetime] NOT NULL,
 CONSTRAINT [PK_Basket] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CategoryProducts]    Script Date: 22.12.2016 8:47:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryProducts](
	[ProductVariantId] [int] NOT NULL,
	[ProductCategoryId] [int] NOT NULL,
 CONSTRAINT [PK_CategoryProducts] PRIMARY KEY CLUSTERED 
(
	[ProductVariantId] ASC,
	[ProductCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Currencies]    Script Date: 22.12.2016 8:47:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currencies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[Code] [nvarchar](8) NOT NULL,
	[ConvertValue] [decimal](20, 6) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Currency] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 22.12.2016 8:47:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](64) NOT NULL,
	[LastName] [nvarchar](64) NOT NULL,
	[Email] [nvarchar](64) NOT NULL,
	[DateOfBirth] [datetime] NULL,
	[Phone] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DigitalProducts]    Script Date: 22.12.2016 8:47:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DigitalProducts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductVariantId] [int] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Url] [nvarchar](256) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ExpirationDate] [datetime] NULL,
	[DaysForDownload] [int] NOT NULL,
 CONSTRAINT [PK_DigitalProducts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Images]    Script Date: 22.12.2016 8:47:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[Url] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 22.12.2016 8:47:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[PaymentTypeId] [int] NOT NULL,
	[CurrencyId] [int] NOT NULL,
	[OrderStateId] [int] NOT NULL,
	[TransportId] [int] NOT NULL,
	[DeliveryAddressId] [int] NOT NULL,
	[BillingAddressId] [int] NOT NULL,
	[IPAddress] [nvarchar](32) NOT NULL,
	[CostWithoutTax] [decimal](20, 4) NOT NULL,
	[CostWithTax] [decimal](20, 4) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[PaymentTypeFee] [decimal](20, 4) NOT NULL,
	[TransportFee] [decimal](20, 4) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderStates]    Script Date: 22.12.2016 8:47:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[Description] [nvarchar](128) NULL,
 CONSTRAINT [PK_OrderState] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PaymentTypes]    Script Date: 22.12.2016 8:47:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CurrencyId] [int] NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[Fee] [decimal](20, 4) NOT NULL,
	[Description] [nvarchar](128) NULL,
 CONSTRAINT [PK_PaymentTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductAttachments]    Script Date: 22.12.2016 8:47:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductAttachments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductVariantId] [int] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Description] [nvarchar](256) NULL,
	[Url] [nvarchar](256) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 22.12.2016 8:47:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UpperCategoryId] [int] NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[DisplayOrder] [int] NULL,
	[MetaTitle] [nvarchar](128) NULL,
	[MetaKeywords] [nvarchar](128) NULL,
	[MetaDescription] [nvarchar](256) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 22.12.2016 8:47:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[ImageId] [int] NOT NULL,
	[ProductVariantId] [int] NOT NULL,
 CONSTRAINT [PK_ProductImages] PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC,
	[ProductVariantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductProperties]    Script Date: 22.12.2016 8:47:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_ProductProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 22.12.2016 8:47:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](80) NOT NULL,
	[ShortDescription] [nvarchar](max) NULL,
	[LongDescription] [nvarchar](max) NULL,
	[Closeout] [bit] NOT NULL,
	[Tax] [decimal](6, 2) NOT NULL,
	[Weight] [float] NULL,
	[Length] [float] NULL,
	[Width] [float] NULL,
	[Height] [float] NULL,
	[Availability] [nvarchar](15) NULL,
	[Orderable] [bit] NOT NULL,
	[Visible] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductStates]    Script Date: 22.12.2016 8:47:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductStates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[Description] [nvarchar](256) NULL,
 CONSTRAINT [PK_ProductState] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductVariants]    Script Date: 22.12.2016 8:47:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductVariants](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[UniqueCombination] [nvarchar](32) NOT NULL,
	[ProductStateId] [int] NULL,
	[MainImageId] [int] NULL,
	[PurchasePriceCurrencyId] [int] NOT NULL,
	[SalePriceCurrencyId] [int] NOT NULL,
	[RecommendedPriceCurrencyId] [int] NOT NULL,
	[PurchasePrice] [decimal](20, 4) NOT NULL,
	[RecommendedPrice] [decimal](20, 4) NOT NULL,
	[SalePrice] [decimal](20, 4) NOT NULL,
	[Code] [nvarchar](64) NULL,
 CONSTRAINT [PK_ProductVariant] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PropertyCombinations]    Script Date: 22.12.2016 8:47:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyCombinations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductVariantId] [int] NOT NULL,
	[ProductPropertyValue] [nvarchar](128) NOT NULL,
	[ProductPropertyId] [int] NOT NULL,
 CONSTRAINT [PK_PropertyCombinations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Transports]    Script Date: 22.12.2016 8:47:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transports](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CurrencyId] [int] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[TermsAndConditions] [nvarchar](max) NULL,
	[TimeOfDelivery] [nvarchar](20) NOT NULL,
	[Active] [bit] NOT NULL,
	[Fee] [decimal](20, 4) NOT NULL,
 CONSTRAINT [PK_Transports] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[CategoryProducts] ([ProductVariantId], [ProductCategoryId]) VALUES (1, 1)
INSERT [dbo].[CategoryProducts] ([ProductVariantId], [ProductCategoryId]) VALUES (2, 1)
INSERT [dbo].[CategoryProducts] ([ProductVariantId], [ProductCategoryId]) VALUES (3, 1)
INSERT [dbo].[CategoryProducts] ([ProductVariantId], [ProductCategoryId]) VALUES (4, 2)
INSERT [dbo].[CategoryProducts] ([ProductVariantId], [ProductCategoryId]) VALUES (5, 2)
INSERT [dbo].[CategoryProducts] ([ProductVariantId], [ProductCategoryId]) VALUES (7, 2)
INSERT [dbo].[CategoryProducts] ([ProductVariantId], [ProductCategoryId]) VALUES (8, 2)
INSERT [dbo].[CategoryProducts] ([ProductVariantId], [ProductCategoryId]) VALUES (11, 2)
INSERT [dbo].[CategoryProducts] ([ProductVariantId], [ProductCategoryId]) VALUES (12, 3)
INSERT [dbo].[CategoryProducts] ([ProductVariantId], [ProductCategoryId]) VALUES (13, 3)
INSERT [dbo].[CategoryProducts] ([ProductVariantId], [ProductCategoryId]) VALUES (15, 4)
INSERT [dbo].[CategoryProducts] ([ProductVariantId], [ProductCategoryId]) VALUES (16, 4)
INSERT [dbo].[CategoryProducts] ([ProductVariantId], [ProductCategoryId]) VALUES (17, 4)
SET IDENTITY_INSERT [dbo].[Currencies] ON 

INSERT [dbo].[Currencies] ([Id], [Name], [Code], [ConvertValue], [Active]) VALUES (1, N'Česká koruna', N'CZK', CAST(1.000000 AS Decimal(20, 6)), 1)
SET IDENTITY_INSERT [dbo].[Currencies] OFF
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([Id], [Name], [Url]) VALUES (1, N'HappyMin', N'/Content/appData/Products/Season_1/Min/41.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Url]) VALUES (2, N'HappyNormal', N'/Content/appData/Products/Season_1/Normal/41.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Url]) VALUES (3, N'PrincessMin', N'/Content/appData/Products/Season_1/Min/674.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Url]) VALUES (5, N'PrincessNormal', N'/Content/appData/Products/Season_1/Normal/674.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Url]) VALUES (6, N'SmallChairMin', N'/Content/appData/Products/Season_1/Min/2679.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Url]) VALUES (7, N'SmallChairNormal', N'/Content/appData/Products/Season_1/Normal/2679.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Url]) VALUES (8, N'CarsWomenMin', N'/Content/appData/Products/Season_2/Min/2681.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Url]) VALUES (9, N'CarsWomenNormal', N'/Content/appData/Products/Season_2/Normal/2681.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Url]) VALUES (10, N'BlueOneMin', N'/Content/appData/Products/Season_2/Min/2844.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Url]) VALUES (11, N'BlueOneNormal', N'/Content/appData/Products/Season_2/Normal/2844.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Url]) VALUES (12, N'StartMin', N'/Content/appData/Products/Season_2/Min/2847.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Url]) VALUES (13, N'StartNormal', N'/Content/appData/Products/Season_2/Normal/2847.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Url]) VALUES (14, N'FamilyMin', N'/Content/appData/Products/Season_2/Min/2848.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Url]) VALUES (15, N'FamilyNormal', N'/Content/appData/Products/Season_2/Normal/2848.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Url]) VALUES (16, N'BandMin', N'/Content/appData/Products/Season_2/Min/3236.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Url]) VALUES (17, N'BandNormal', N'/Content/appData/Products/Season_2/Normal/3236.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Url]) VALUES (18, N'ISeeYouMin', N'/Content/appData/Products/Season_3/Min/3237.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Url]) VALUES (19, N'ISeeYouNormal', N'/Content/appData/Products/Season_3/Normal/3237.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Url]) VALUES (20, N'SalutMin', N'/Content/appData/Products/Season_3/Min/3240.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Url]) VALUES (21, N'SalutNormal', N'/Content/appData/Products/Season_3/Normal/3240.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Url]) VALUES (22, N'NewOneMin', N'/Content/appData/Products/Season_4/Min/3241.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Url]) VALUES (23, N'NewOneNormal', N'/Content/appData/Products/Season_4/Normal/3241.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Url]) VALUES (24, N'SeeTheHorizonMin', N'/Content/appData/Products/Season_4/Min/4501.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Url]) VALUES (25, N'SeeTheHorizonNormal', N'/Content/appData/Products/Season_4/Normal/4501.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Url]) VALUES (26, N'HaveACupMin', N'/Content/appData/Products/Season_4/Min/4502.jpg')
INSERT [dbo].[Images] ([Id], [Name], [Url]) VALUES (27, N'HaveACupNormal', N'/Content/appData/Products/Season_4/Normal/4502.jpg')
SET IDENTITY_INSERT [dbo].[Images] OFF
SET IDENTITY_INSERT [dbo].[OrderStates] ON 

INSERT [dbo].[OrderStates] ([Id], [Name], [Description]) VALUES (1, N'Objednávka přijata', N'Objednávka byla přijata a nyní čeká na vyexpedování.')
INSERT [dbo].[OrderStates] ([Id], [Name], [Description]) VALUES (2, N'Předáno transportu', N'Objednávka byla předána transportu a je na cestě k vám.')
INSERT [dbo].[OrderStates] ([Id], [Name], [Description]) VALUES (3, N'Objedávka uzavřena', N'Objednávka byla úspěšně vyřízena.')
SET IDENTITY_INSERT [dbo].[OrderStates] OFF
SET IDENTITY_INSERT [dbo].[PaymentTypes] ON 

INSERT [dbo].[PaymentTypes] ([Id], [CurrencyId], [Name], [Fee], [Description]) VALUES (1, 1, N'Platba kartou', CAST(0.0000 AS Decimal(20, 4)), N'Platba kreditní nebo debetní kartou.')
INSERT [dbo].[PaymentTypes] ([Id], [CurrencyId], [Name], [Fee], [Description]) VALUES (2, 1, N'Platba na dobírku', CAST(50.0000 AS Decimal(20, 4)), N'Platba při předání zboží')
SET IDENTITY_INSERT [dbo].[PaymentTypes] OFF
SET IDENTITY_INSERT [dbo].[ProductCategories] ON 

INSERT [dbo].[ProductCategories] ([Id], [UpperCategoryId], [Name], [Description], [DisplayOrder], [MetaTitle], [MetaKeywords], [MetaDescription], [Active]) VALUES (1, NULL, N'Season 1', N'Fotografie z prvního roku.', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[ProductCategories] ([Id], [UpperCategoryId], [Name], [Description], [DisplayOrder], [MetaTitle], [MetaKeywords], [MetaDescription], [Active]) VALUES (2, NULL, N'Season 2', N'Fotografie z druhého roku.', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[ProductCategories] ([Id], [UpperCategoryId], [Name], [Description], [DisplayOrder], [MetaTitle], [MetaKeywords], [MetaDescription], [Active]) VALUES (3, NULL, N'Season 3', N'Fotografie z třetího roku.', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[ProductCategories] ([Id], [UpperCategoryId], [Name], [Description], [DisplayOrder], [MetaTitle], [MetaKeywords], [MetaDescription], [Active]) VALUES (4, NULL, N'Season 4', N'Fotografie z čtvrtého roku.', NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[ProductCategories] OFF
INSERT [dbo].[ProductImages] ([ImageId], [ProductVariantId]) VALUES (2, 1)
INSERT [dbo].[ProductImages] ([ImageId], [ProductVariantId]) VALUES (5, 2)
INSERT [dbo].[ProductImages] ([ImageId], [ProductVariantId]) VALUES (7, 3)
INSERT [dbo].[ProductImages] ([ImageId], [ProductVariantId]) VALUES (9, 4)
INSERT [dbo].[ProductImages] ([ImageId], [ProductVariantId]) VALUES (11, 5)
INSERT [dbo].[ProductImages] ([ImageId], [ProductVariantId]) VALUES (13, 7)
INSERT [dbo].[ProductImages] ([ImageId], [ProductVariantId]) VALUES (15, 8)
INSERT [dbo].[ProductImages] ([ImageId], [ProductVariantId]) VALUES (17, 11)
INSERT [dbo].[ProductImages] ([ImageId], [ProductVariantId]) VALUES (19, 12)
INSERT [dbo].[ProductImages] ([ImageId], [ProductVariantId]) VALUES (21, 13)
INSERT [dbo].[ProductImages] ([ImageId], [ProductVariantId]) VALUES (23, 15)
INSERT [dbo].[ProductImages] ([ImageId], [ProductVariantId]) VALUES (25, 16)
INSERT [dbo].[ProductImages] ([ImageId], [ProductVariantId]) VALUES (27, 17)
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [ShortDescription], [LongDescription], [Closeout], [Tax], [Weight], [Length], [Width], [Height], [Availability], [Orderable], [Visible], [CreatedAt]) VALUES (1, N'Happy', N'Lorem ipsum dolor sit amet.', N'        <p>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nec justo tellus. Donec tincidunt
            , erat at condimentum bibendum, ante ante commodo risus, non congue erat justo fringilla ligula.
            Pellentesque ac quam sit amet eros dapibus finibus quis vitae tortor. Etiam hendrerit quam nec dignissim porta.
            Morbi porttitor, tellus quis elementum condimentum, metus justo dapibus quam, vel feugiat erat arcu sed sem. Nam
            accumsan eu mauris vitae mattis. Integer mi metus, consectetur vel lacinia at, elementum a risus. Proin vel maximus
            felis. Curabitur efficitur aliquam justo, sit amet sodales augue convallis in. Donec porttitor odio ipsum,
            non viverra est porttitor nec. Suspendisse sit amet fermentum lectus, eu elementum lorem. Etiam suscipit mi qui
            s maximus efficitur. Maecenas fringilla placerat mollis.
        </p>
        <p class="text-center"><img src="http://placehold.it/800x400" alt="obraz v popisu" /></p>
        <p>
            Nam sagittis aliquet ultricies. Suspendisse viverra volutpat condimentum.
            In condimentum et nulla et blandit. Donec sodales eros ut tristique suscipit.
            Integer id ante nulla. Nunc euismod magna a mi elementum, ac scelerisque arcu placerat.
            Ut lacinia scelerisque erat, sed suscipit nibh egestas eu. Etiam molestie mauris tortor,
            et venenatis mi condimentum at.
</p>', 0, CAST(21.00 AS Decimal(6, 2)), NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2016-12-17T08:35:12.830' AS DateTime))
INSERT [dbo].[Products] ([Id], [Name], [ShortDescription], [LongDescription], [Closeout], [Tax], [Weight], [Length], [Width], [Height], [Availability], [Orderable], [Visible], [CreatedAt]) VALUES (3, N'Princess', N'Lorem ipsum', N'        <p>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nec justo tellus. Donec tincidunt
            , erat at condimentum bibendum, ante ante commodo risus, non congue erat justo fringilla ligula.
            Pellentesque ac quam sit amet eros dapibus finibus quis vitae tortor. Etiam hendrerit quam nec dignissim porta.
            Morbi porttitor, tellus quis elementum condimentum, metus justo dapibus quam, vel feugiat erat arcu sed sem. Nam
            accumsan eu mauris vitae mattis. Integer mi metus, consectetur vel lacinia at, elementum a risus. Proin vel maximus
            felis. Curabitur efficitur aliquam justo, sit amet sodales augue convallis in. Donec porttitor odio ipsum,
            non viverra est porttitor nec. Suspendisse sit amet fermentum lectus, eu elementum lorem. Etiam suscipit mi qui
            s maximus efficitur. Maecenas fringilla placerat mollis.
        </p>
        <p class="text-center"><img src="http://placehold.it/800x400" alt="obraz v popisu" /></p>
        <p>
            Nam sagittis aliquet ultricies. Suspendisse viverra volutpat condimentum.
            In condimentum et nulla et blandit. Donec sodales eros ut tristique suscipit.
            Integer id ante nulla. Nunc euismod magna a mi elementum, ac scelerisque arcu placerat.
            Ut lacinia scelerisque erat, sed suscipit nibh egestas eu. Etiam molestie mauris tortor,
            et venenatis mi condimentum at.
</p>', 0, CAST(21.00 AS Decimal(6, 2)), NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2016-12-17T08:36:07.190' AS DateTime))
INSERT [dbo].[Products] ([Id], [Name], [ShortDescription], [LongDescription], [Closeout], [Tax], [Weight], [Length], [Width], [Height], [Availability], [Orderable], [Visible], [CreatedAt]) VALUES (5, N'Small chair, big girl', N'Lorem ipsum', N'        <p>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nec justo tellus. Donec tincidunt
            , erat at condimentum bibendum, ante ante commodo risus, non congue erat justo fringilla ligula.
            Pellentesque ac quam sit amet eros dapibus finibus quis vitae tortor. Etiam hendrerit quam nec dignissim porta.
            Morbi porttitor, tellus quis elementum condimentum, metus justo dapibus quam, vel feugiat erat arcu sed sem. Nam
            accumsan eu mauris vitae mattis. Integer mi metus, consectetur vel lacinia at, elementum a risus. Proin vel maximus
            felis. Curabitur efficitur aliquam justo, sit amet sodales augue convallis in. Donec porttitor odio ipsum,
            non viverra est porttitor nec. Suspendisse sit amet fermentum lectus, eu elementum lorem. Etiam suscipit mi qui
            s maximus efficitur. Maecenas fringilla placerat mollis.
        </p>
        <p class="text-center"><img src="http://placehold.it/800x400" alt="obraz v popisu" /></p>
        <p>
            Nam sagittis aliquet ultricies. Suspendisse viverra volutpat condimentum.
            In condimentum et nulla et blandit. Donec sodales eros ut tristique suscipit.
            Integer id ante nulla. Nunc euismod magna a mi elementum, ac scelerisque arcu placerat.
            Ut lacinia scelerisque erat, sed suscipit nibh egestas eu. Etiam molestie mauris tortor,
            et venenatis mi condimentum at.
        </p>', 0, CAST(21.00 AS Decimal(6, 2)), NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2016-12-17T08:37:55.640' AS DateTime))
INSERT [dbo].[Products] ([Id], [Name], [ShortDescription], [LongDescription], [Closeout], [Tax], [Weight], [Length], [Width], [Height], [Availability], [Orderable], [Visible], [CreatedAt]) VALUES (6, N'Cars, Women and Money', N'Lorem ipsum', N'        <p>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nec justo tellus. Donec tincidunt
            , erat at condimentum bibendum, ante ante commodo risus, non congue erat justo fringilla ligula.
            Pellentesque ac quam sit amet eros dapibus finibus quis vitae tortor. Etiam hendrerit quam nec dignissim porta.
            Morbi porttitor, tellus quis elementum condimentum, metus justo dapibus quam, vel feugiat erat arcu sed sem. Nam
            accumsan eu mauris vitae mattis. Integer mi metus, consectetur vel lacinia at, elementum a risus. Proin vel maximus
            felis. Curabitur efficitur aliquam justo, sit amet sodales augue convallis in. Donec porttitor odio ipsum,
            non viverra est porttitor nec. Suspendisse sit amet fermentum lectus, eu elementum lorem. Etiam suscipit mi qui
            s maximus efficitur. Maecenas fringilla placerat mollis.
        </p>
        <p class="text-center"><img src="http://placehold.it/800x400" alt="obraz v popisu" /></p>
        <p>
            Nam sagittis aliquet ultricies. Suspendisse viverra volutpat condimentum.
            In condimentum et nulla et blandit. Donec sodales eros ut tristique suscipit.
            Integer id ante nulla. Nunc euismod magna a mi elementum, ac scelerisque arcu placerat.
            Ut lacinia scelerisque erat, sed suscipit nibh egestas eu. Etiam molestie mauris tortor,
            et venenatis mi condimentum at.
        </p>', 0, CAST(21.00 AS Decimal(6, 2)), NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2016-12-17T08:40:34.010' AS DateTime))
INSERT [dbo].[Products] ([Id], [Name], [ShortDescription], [LongDescription], [Closeout], [Tax], [Weight], [Length], [Width], [Height], [Availability], [Orderable], [Visible], [CreatedAt]) VALUES (8, N'Blue one', N'Lorem ipsum', N'        <p>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nec justo tellus. Donec tincidunt
            , erat at condimentum bibendum, ante ante commodo risus, non congue erat justo fringilla ligula.
            Pellentesque ac quam sit amet eros dapibus finibus quis vitae tortor. Etiam hendrerit quam nec dignissim porta.
            Morbi porttitor, tellus quis elementum condimentum, metus justo dapibus quam, vel feugiat erat arcu sed sem. Nam
            accumsan eu mauris vitae mattis. Integer mi metus, consectetur vel lacinia at, elementum a risus. Proin vel maximus
            felis. Curabitur efficitur aliquam justo, sit amet sodales augue convallis in. Donec porttitor odio ipsum,
            non viverra est porttitor nec. Suspendisse sit amet fermentum lectus, eu elementum lorem. Etiam suscipit mi qui
            s maximus efficitur. Maecenas fringilla placerat mollis.
        </p>
        <p class="text-center"><img src="http://placehold.it/800x400" alt="obraz v popisu" /></p>
        <p>
            Nam sagittis aliquet ultricies. Suspendisse viverra volutpat condimentum.
            In condimentum et nulla et blandit. Donec sodales eros ut tristique suscipit.
            Integer id ante nulla. Nunc euismod magna a mi elementum, ac scelerisque arcu placerat.
            Ut lacinia scelerisque erat, sed suscipit nibh egestas eu. Etiam molestie mauris tortor,
            et venenatis mi condimentum at.
        </p>', 0, CAST(21.00 AS Decimal(6, 2)), NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2016-12-17T08:41:58.750' AS DateTime))
INSERT [dbo].[Products] ([Id], [Name], [ShortDescription], [LongDescription], [Closeout], [Tax], [Weight], [Length], [Width], [Height], [Availability], [Orderable], [Visible], [CreatedAt]) VALUES (9, N'Start', N'Lorem ipsum', N'        <p>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nec justo tellus. Donec tincidunt
            , erat at condimentum bibendum, ante ante commodo risus, non congue erat justo fringilla ligula.
            Pellentesque ac quam sit amet eros dapibus finibus quis vitae tortor. Etiam hendrerit quam nec dignissim porta.
            Morbi porttitor, tellus quis elementum condimentum, metus justo dapibus quam, vel feugiat erat arcu sed sem. Nam
            accumsan eu mauris vitae mattis. Integer mi metus, consectetur vel lacinia at, elementum a risus. Proin vel maximus
            felis. Curabitur efficitur aliquam justo, sit amet sodales augue convallis in. Donec porttitor odio ipsum,
            non viverra est porttitor nec. Suspendisse sit amet fermentum lectus, eu elementum lorem. Etiam suscipit mi qui
            s maximus efficitur. Maecenas fringilla placerat mollis.
        </p>
        <p class="text-center"><img src="http://placehold.it/800x400" alt="obraz v popisu" /></p>
        <p>
            Nam sagittis aliquet ultricies. Suspendisse viverra volutpat condimentum.
            In condimentum et nulla et blandit. Donec sodales eros ut tristique suscipit.
            Integer id ante nulla. Nunc euismod magna a mi elementum, ac scelerisque arcu placerat.
            Ut lacinia scelerisque erat, sed suscipit nibh egestas eu. Etiam molestie mauris tortor,
            et venenatis mi condimentum at.
        </p>', 0, CAST(21.00 AS Decimal(6, 2)), NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2016-12-17T08:43:19.163' AS DateTime))
INSERT [dbo].[Products] ([Id], [Name], [ShortDescription], [LongDescription], [Closeout], [Tax], [Weight], [Length], [Width], [Height], [Availability], [Orderable], [Visible], [CreatedAt]) VALUES (10, N'Family', N'Lorem ipsum', N'        <p>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nec justo tellus. Donec tincidunt
            , erat at condimentum bibendum, ante ante commodo risus, non congue erat justo fringilla ligula.
            Pellentesque ac quam sit amet eros dapibus finibus quis vitae tortor. Etiam hendrerit quam nec dignissim porta.
            Morbi porttitor, tellus quis elementum condimentum, metus justo dapibus quam, vel feugiat erat arcu sed sem. Nam
            accumsan eu mauris vitae mattis. Integer mi metus, consectetur vel lacinia at, elementum a risus. Proin vel maximus
            felis. Curabitur efficitur aliquam justo, sit amet sodales augue convallis in. Donec porttitor odio ipsum,
            non viverra est porttitor nec. Suspendisse sit amet fermentum lectus, eu elementum lorem. Etiam suscipit mi qui
            s maximus efficitur. Maecenas fringilla placerat mollis.
        </p>
        <p class="text-center"><img src="http://placehold.it/800x400" alt="obraz v popisu" /></p>
        <p>
            Nam sagittis aliquet ultricies. Suspendisse viverra volutpat condimentum.
            In condimentum et nulla et blandit. Donec sodales eros ut tristique suscipit.
            Integer id ante nulla. Nunc euismod magna a mi elementum, ac scelerisque arcu placerat.
            Ut lacinia scelerisque erat, sed suscipit nibh egestas eu. Etiam molestie mauris tortor,
            et venenatis mi condimentum at.
        </p>', 0, CAST(21.00 AS Decimal(6, 2)), NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2016-12-17T08:44:09.797' AS DateTime))
INSERT [dbo].[Products] ([Id], [Name], [ShortDescription], [LongDescription], [Closeout], [Tax], [Weight], [Length], [Width], [Height], [Availability], [Orderable], [Visible], [CreatedAt]) VALUES (11, N'Band!', N'Lorem ipsum', N'        <p>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nec justo tellus. Donec tincidunt
            , erat at condimentum bibendum, ante ante commodo risus, non congue erat justo fringilla ligula.
            Pellentesque ac quam sit amet eros dapibus finibus quis vitae tortor. Etiam hendrerit quam nec dignissim porta.
            Morbi porttitor, tellus quis elementum condimentum, metus justo dapibus quam, vel feugiat erat arcu sed sem. Nam
            accumsan eu mauris vitae mattis. Integer mi metus, consectetur vel lacinia at, elementum a risus. Proin vel maximus
            felis. Curabitur efficitur aliquam justo, sit amet sodales augue convallis in. Donec porttitor odio ipsum,
            non viverra est porttitor nec. Suspendisse sit amet fermentum lectus, eu elementum lorem. Etiam suscipit mi qui
            s maximus efficitur. Maecenas fringilla placerat mollis.
        </p>
        <p class="text-center"><img src="http://placehold.it/800x400" alt="obraz v popisu" /></p>
        <p>
            Nam sagittis aliquet ultricies. Suspendisse viverra volutpat condimentum.
            In condimentum et nulla et blandit. Donec sodales eros ut tristique suscipit.
            Integer id ante nulla. Nunc euismod magna a mi elementum, ac scelerisque arcu placerat.
            Ut lacinia scelerisque erat, sed suscipit nibh egestas eu. Etiam molestie mauris tortor,
            et venenatis mi condimentum at.
        </p>', 0, CAST(21.00 AS Decimal(6, 2)), NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2016-12-17T08:44:50.727' AS DateTime))
INSERT [dbo].[Products] ([Id], [Name], [ShortDescription], [LongDescription], [Closeout], [Tax], [Weight], [Length], [Width], [Height], [Availability], [Orderable], [Visible], [CreatedAt]) VALUES (13, N'I see you', N'Lorem ipsum', N'        <p>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nec justo tellus. Donec tincidunt
            , erat at condimentum bibendum, ante ante commodo risus, non congue erat justo fringilla ligula.
            Pellentesque ac quam sit amet eros dapibus finibus quis vitae tortor. Etiam hendrerit quam nec dignissim porta.
            Morbi porttitor, tellus quis elementum condimentum, metus justo dapibus quam, vel feugiat erat arcu sed sem. Nam
            accumsan eu mauris vitae mattis. Integer mi metus, consectetur vel lacinia at, elementum a risus. Proin vel maximus
            felis. Curabitur efficitur aliquam justo, sit amet sodales augue convallis in. Donec porttitor odio ipsum,
            non viverra est porttitor nec. Suspendisse sit amet fermentum lectus, eu elementum lorem. Etiam suscipit mi qui
            s maximus efficitur. Maecenas fringilla placerat mollis.
        </p>
        <p class="text-center"><img src="http://placehold.it/800x400" alt="obraz v popisu" /></p>
        <p>
            Nam sagittis aliquet ultricies. Suspendisse viverra volutpat condimentum.
            In condimentum et nulla et blandit. Donec sodales eros ut tristique suscipit.
            Integer id ante nulla. Nunc euismod magna a mi elementum, ac scelerisque arcu placerat.
            Ut lacinia scelerisque erat, sed suscipit nibh egestas eu. Etiam molestie mauris tortor,
            et venenatis mi condimentum at.
        </p>', 0, CAST(21.00 AS Decimal(6, 2)), NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2016-12-17T08:45:44.817' AS DateTime))
INSERT [dbo].[Products] ([Id], [Name], [ShortDescription], [LongDescription], [Closeout], [Tax], [Weight], [Length], [Width], [Height], [Availability], [Orderable], [Visible], [CreatedAt]) VALUES (15, N'Salut!', N'Lorem ipsum', N'        <p>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nec justo tellus. Donec tincidunt
            , erat at condimentum bibendum, ante ante commodo risus, non congue erat justo fringilla ligula.
            Pellentesque ac quam sit amet eros dapibus finibus quis vitae tortor. Etiam hendrerit quam nec dignissim porta.
            Morbi porttitor, tellus quis elementum condimentum, metus justo dapibus quam, vel feugiat erat arcu sed sem. Nam
            accumsan eu mauris vitae mattis. Integer mi metus, consectetur vel lacinia at, elementum a risus. Proin vel maximus
            felis. Curabitur efficitur aliquam justo, sit amet sodales augue convallis in. Donec porttitor odio ipsum,
            non viverra est porttitor nec. Suspendisse sit amet fermentum lectus, eu elementum lorem. Etiam suscipit mi qui
            s maximus efficitur. Maecenas fringilla placerat mollis.
        </p>
        <p class="text-center"><img src="http://placehold.it/800x400" alt="obraz v popisu" /></p>
        <p>
            Nam sagittis aliquet ultricies. Suspendisse viverra volutpat condimentum.
            In condimentum et nulla et blandit. Donec sodales eros ut tristique suscipit.
            Integer id ante nulla. Nunc euismod magna a mi elementum, ac scelerisque arcu placerat.
            Ut lacinia scelerisque erat, sed suscipit nibh egestas eu. Etiam molestie mauris tortor,
            et venenatis mi condimentum at.
        </p>', 0, CAST(21.00 AS Decimal(6, 2)), NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2016-12-17T08:46:25.453' AS DateTime))
INSERT [dbo].[Products] ([Id], [Name], [ShortDescription], [LongDescription], [Closeout], [Tax], [Weight], [Length], [Width], [Height], [Availability], [Orderable], [Visible], [CreatedAt]) VALUES (16, N'New one', N'Lorem ipsum', N'        <p>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nec justo tellus. Donec tincidunt
            , erat at condimentum bibendum, ante ante commodo risus, non congue erat justo fringilla ligula.
            Pellentesque ac quam sit amet eros dapibus finibus quis vitae tortor. Etiam hendrerit quam nec dignissim porta.
            Morbi porttitor, tellus quis elementum condimentum, metus justo dapibus quam, vel feugiat erat arcu sed sem. Nam
            accumsan eu mauris vitae mattis. Integer mi metus, consectetur vel lacinia at, elementum a risus. Proin vel maximus
            felis. Curabitur efficitur aliquam justo, sit amet sodales augue convallis in. Donec porttitor odio ipsum,
            non viverra est porttitor nec. Suspendisse sit amet fermentum lectus, eu elementum lorem. Etiam suscipit mi qui
            s maximus efficitur. Maecenas fringilla placerat mollis.
        </p>
        <p class="text-center"><img src="http://placehold.it/800x400" alt="obraz v popisu" /></p>
        <p>
            Nam sagittis aliquet ultricies. Suspendisse viverra volutpat condimentum.
            In condimentum et nulla et blandit. Donec sodales eros ut tristique suscipit.
            Integer id ante nulla. Nunc euismod magna a mi elementum, ac scelerisque arcu placerat.
            Ut lacinia scelerisque erat, sed suscipit nibh egestas eu. Etiam molestie mauris tortor,
            et venenatis mi condimentum at.
        </p>', 0, CAST(21.00 AS Decimal(6, 2)), NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2016-12-17T08:48:07.070' AS DateTime))
INSERT [dbo].[Products] ([Id], [Name], [ShortDescription], [LongDescription], [Closeout], [Tax], [Weight], [Length], [Width], [Height], [Availability], [Orderable], [Visible], [CreatedAt]) VALUES (17, N'See the horizon', N'Lorem ipsum', N'        <p>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nec justo tellus. Donec tincidunt
            , erat at condimentum bibendum, ante ante commodo risus, non congue erat justo fringilla ligula.
            Pellentesque ac quam sit amet eros dapibus finibus quis vitae tortor. Etiam hendrerit quam nec dignissim porta.
            Morbi porttitor, tellus quis elementum condimentum, metus justo dapibus quam, vel feugiat erat arcu sed sem. Nam
            accumsan eu mauris vitae mattis. Integer mi metus, consectetur vel lacinia at, elementum a risus. Proin vel maximus
            felis. Curabitur efficitur aliquam justo, sit amet sodales augue convallis in. Donec porttitor odio ipsum,
            non viverra est porttitor nec. Suspendisse sit amet fermentum lectus, eu elementum lorem. Etiam suscipit mi qui
            s maximus efficitur. Maecenas fringilla placerat mollis.
        </p>
        <p class="text-center"><img src="http://placehold.it/800x400" alt="obraz v popisu" /></p>
        <p>
            Nam sagittis aliquet ultricies. Suspendisse viverra volutpat condimentum.
            In condimentum et nulla et blandit. Donec sodales eros ut tristique suscipit.
            Integer id ante nulla. Nunc euismod magna a mi elementum, ac scelerisque arcu placerat.
            Ut lacinia scelerisque erat, sed suscipit nibh egestas eu. Etiam molestie mauris tortor,
            et venenatis mi condimentum at.
        </p>', 0, CAST(21.00 AS Decimal(6, 2)), NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2016-12-17T08:49:03.263' AS DateTime))
INSERT [dbo].[Products] ([Id], [Name], [ShortDescription], [LongDescription], [Closeout], [Tax], [Weight], [Length], [Width], [Height], [Availability], [Orderable], [Visible], [CreatedAt]) VALUES (19, N'Have a cup', N'Lorem ipsum', N'        <p>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nec justo tellus. Donec tincidunt
            , erat at condimentum bibendum, ante ante commodo risus, non congue erat justo fringilla ligula.
            Pellentesque ac quam sit amet eros dapibus finibus quis vitae tortor. Etiam hendrerit quam nec dignissim porta.
            Morbi porttitor, tellus quis elementum condimentum, metus justo dapibus quam, vel feugiat erat arcu sed sem. Nam
            accumsan eu mauris vitae mattis. Integer mi metus, consectetur vel lacinia at, elementum a risus. Proin vel maximus
            felis. Curabitur efficitur aliquam justo, sit amet sodales augue convallis in. Donec porttitor odio ipsum,
            non viverra est porttitor nec. Suspendisse sit amet fermentum lectus, eu elementum lorem. Etiam suscipit mi qui
            s maximus efficitur. Maecenas fringilla placerat mollis.
        </p>
        <p class="text-center"><img src="http://placehold.it/800x400" alt="obraz v popisu" /></p>
        <p>
            Nam sagittis aliquet ultricies. Suspendisse viverra volutpat condimentum.
            In condimentum et nulla et blandit. Donec sodales eros ut tristique suscipit.
            Integer id ante nulla. Nunc euismod magna a mi elementum, ac scelerisque arcu placerat.
            Ut lacinia scelerisque erat, sed suscipit nibh egestas eu. Etiam molestie mauris tortor,
            et venenatis mi condimentum at.
        </p>', 0, CAST(21.00 AS Decimal(6, 2)), NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2016-12-17T08:50:01.420' AS DateTime))
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[ProductStates] ON 

INSERT [dbo].[ProductStates] ([Id], [Name], [Description]) VALUES (1, N'Ihned k dispozici', N'Produkt po zakoupení budete mít okamžitě k dispozici')
INSERT [dbo].[ProductStates] ([Id], [Name], [Description]) VALUES (2, N'Skladem', N'Produkt je skladem')
INSERT [dbo].[ProductStates] ([Id], [Name], [Description]) VALUES (3, N'Není skladem', N'Produkt v současné době není na skladu')
SET IDENTITY_INSERT [dbo].[ProductStates] OFF
SET IDENTITY_INSERT [dbo].[ProductVariants] ON 

INSERT [dbo].[ProductVariants] ([Id], [ProductId], [UniqueCombination], [ProductStateId], [MainImageId], [PurchasePriceCurrencyId], [SalePriceCurrencyId], [RecommendedPriceCurrencyId], [PurchasePrice], [RecommendedPrice], [SalePrice], [Code]) VALUES (1, 1, N'Happy', NULL, 1, 1, 1, 1, CAST(300.0000 AS Decimal(20, 4)), CAST(1000.0000 AS Decimal(20, 4)), CAST(849.0000 AS Decimal(20, 4)), NULL)
INSERT [dbo].[ProductVariants] ([Id], [ProductId], [UniqueCombination], [ProductStateId], [MainImageId], [PurchasePriceCurrencyId], [SalePriceCurrencyId], [RecommendedPriceCurrencyId], [PurchasePrice], [RecommendedPrice], [SalePrice], [Code]) VALUES (2, 3, N'Princess', NULL, 3, 1, 1, 1, CAST(300.0000 AS Decimal(20, 4)), CAST(1100.0000 AS Decimal(20, 4)), CAST(899.0000 AS Decimal(20, 4)), NULL)
INSERT [dbo].[ProductVariants] ([Id], [ProductId], [UniqueCombination], [ProductStateId], [MainImageId], [PurchasePriceCurrencyId], [SalePriceCurrencyId], [RecommendedPriceCurrencyId], [PurchasePrice], [RecommendedPrice], [SalePrice], [Code]) VALUES (3, 5, N'Small chair, big girl', NULL, 6, 1, 1, 1, CAST(300.0000 AS Decimal(20, 4)), CAST(1000.0000 AS Decimal(20, 4)), CAST(849.0000 AS Decimal(20, 4)), NULL)
INSERT [dbo].[ProductVariants] ([Id], [ProductId], [UniqueCombination], [ProductStateId], [MainImageId], [PurchasePriceCurrencyId], [SalePriceCurrencyId], [RecommendedPriceCurrencyId], [PurchasePrice], [RecommendedPrice], [SalePrice], [Code]) VALUES (4, 6, N'Cars, Women and Money', NULL, 8, 1, 1, 1, CAST(300.0000 AS Decimal(20, 4)), CAST(1200.0000 AS Decimal(20, 4)), CAST(949.0000 AS Decimal(20, 4)), NULL)
INSERT [dbo].[ProductVariants] ([Id], [ProductId], [UniqueCombination], [ProductStateId], [MainImageId], [PurchasePriceCurrencyId], [SalePriceCurrencyId], [RecommendedPriceCurrencyId], [PurchasePrice], [RecommendedPrice], [SalePrice], [Code]) VALUES (5, 8, N'Blue one', NULL, 10, 1, 1, 1, CAST(300.0000 AS Decimal(20, 4)), CAST(1200.0000 AS Decimal(20, 4)), CAST(949.0000 AS Decimal(20, 4)), NULL)
INSERT [dbo].[ProductVariants] ([Id], [ProductId], [UniqueCombination], [ProductStateId], [MainImageId], [PurchasePriceCurrencyId], [SalePriceCurrencyId], [RecommendedPriceCurrencyId], [PurchasePrice], [RecommendedPrice], [SalePrice], [Code]) VALUES (7, 9, N'Start', NULL, 12, 1, 1, 1, CAST(300.0000 AS Decimal(20, 4)), CAST(1000.0000 AS Decimal(20, 4)), CAST(849.0000 AS Decimal(20, 4)), NULL)
INSERT [dbo].[ProductVariants] ([Id], [ProductId], [UniqueCombination], [ProductStateId], [MainImageId], [PurchasePriceCurrencyId], [SalePriceCurrencyId], [RecommendedPriceCurrencyId], [PurchasePrice], [RecommendedPrice], [SalePrice], [Code]) VALUES (8, 10, N'Family', NULL, 14, 1, 1, 1, CAST(300.0000 AS Decimal(20, 4)), CAST(1100.0000 AS Decimal(20, 4)), CAST(899.0000 AS Decimal(20, 4)), NULL)
INSERT [dbo].[ProductVariants] ([Id], [ProductId], [UniqueCombination], [ProductStateId], [MainImageId], [PurchasePriceCurrencyId], [SalePriceCurrencyId], [RecommendedPriceCurrencyId], [PurchasePrice], [RecommendedPrice], [SalePrice], [Code]) VALUES (11, 11, N'Band!', NULL, 16, 1, 1, 1, CAST(300.0000 AS Decimal(20, 4)), CAST(1100.0000 AS Decimal(20, 4)), CAST(849.0000 AS Decimal(20, 4)), NULL)
INSERT [dbo].[ProductVariants] ([Id], [ProductId], [UniqueCombination], [ProductStateId], [MainImageId], [PurchasePriceCurrencyId], [SalePriceCurrencyId], [RecommendedPriceCurrencyId], [PurchasePrice], [RecommendedPrice], [SalePrice], [Code]) VALUES (12, 13, N'I see you', NULL, 18, 1, 1, 1, CAST(300.0000 AS Decimal(20, 4)), CAST(1200.0000 AS Decimal(20, 4)), CAST(949.0000 AS Decimal(20, 4)), NULL)
INSERT [dbo].[ProductVariants] ([Id], [ProductId], [UniqueCombination], [ProductStateId], [MainImageId], [PurchasePriceCurrencyId], [SalePriceCurrencyId], [RecommendedPriceCurrencyId], [PurchasePrice], [RecommendedPrice], [SalePrice], [Code]) VALUES (13, 15, N'Salut!', NULL, 20, 1, 1, 1, CAST(300.0000 AS Decimal(20, 4)), CAST(1100.0000 AS Decimal(20, 4)), CAST(899.0000 AS Decimal(20, 4)), NULL)
INSERT [dbo].[ProductVariants] ([Id], [ProductId], [UniqueCombination], [ProductStateId], [MainImageId], [PurchasePriceCurrencyId], [SalePriceCurrencyId], [RecommendedPriceCurrencyId], [PurchasePrice], [RecommendedPrice], [SalePrice], [Code]) VALUES (15, 16, N'New one', NULL, 22, 1, 1, 1, CAST(300.0000 AS Decimal(20, 4)), CAST(1100.0000 AS Decimal(20, 4)), CAST(899.0000 AS Decimal(20, 4)), NULL)
INSERT [dbo].[ProductVariants] ([Id], [ProductId], [UniqueCombination], [ProductStateId], [MainImageId], [PurchasePriceCurrencyId], [SalePriceCurrencyId], [RecommendedPriceCurrencyId], [PurchasePrice], [RecommendedPrice], [SalePrice], [Code]) VALUES (16, 17, N'See the horizon', NULL, 24, 1, 1, 1, CAST(300.0000 AS Decimal(20, 4)), CAST(1100.0000 AS Decimal(20, 4)), CAST(899.0000 AS Decimal(20, 4)), NULL)
INSERT [dbo].[ProductVariants] ([Id], [ProductId], [UniqueCombination], [ProductStateId], [MainImageId], [PurchasePriceCurrencyId], [SalePriceCurrencyId], [RecommendedPriceCurrencyId], [PurchasePrice], [RecommendedPrice], [SalePrice], [Code]) VALUES (17, 19, N'Have a cup', NULL, 26, 1, 1, 1, CAST(300.0000 AS Decimal(20, 4)), CAST(1100.0000 AS Decimal(20, 4)), CAST(899.0000 AS Decimal(20, 4)), NULL)
SET IDENTITY_INSERT [dbo].[ProductVariants] OFF
SET IDENTITY_INSERT [dbo].[Transports] ON 

INSERT [dbo].[Transports] ([Id], [CurrencyId], [Name], [Description], [TermsAndConditions], [TimeOfDelivery], [Active], [Fee]) VALUES (2, 1, N'Česká pošta', N'Zboží vám bude doručeno prostřednictvím české pošty', NULL, N'Do 2 dnů', 1, CAST(50.0000 AS Decimal(20, 4)))
INSERT [dbo].[Transports] ([Id], [CurrencyId], [Name], [Description], [TermsAndConditions], [TimeOfDelivery], [Active], [Fee]) VALUES (4, 1, N'DPD', N'Zboží vám bude doručeno prostřednicvím DPD', NULL, N'Do 2 dnů', 1, CAST(45.0000 AS Decimal(20, 4)))
SET IDENTITY_INSERT [dbo].[Transports] OFF
ALTER TABLE [dbo].[Baskets] ADD  CONSTRAINT [DF_Basket_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Baskets] ADD  CONSTRAINT [DF_Basket_LastDateEdited]  DEFAULT (getdate()) FOR [LastDateEdited]
GO
ALTER TABLE [dbo].[Currencies] ADD  CONSTRAINT [DF_Currency_Active]  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[DigitalProducts] ADD  CONSTRAINT [DF_DigitalProducts_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[ProductCategories] ADD  CONSTRAINT [DF_ProductCategories_Active]  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Closeout]  DEFAULT ((0)) FOR [Closeout]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Orderable]  DEFAULT ((1)) FOR [Orderable]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Visible]  DEFAULT ((0)) FOR [Visible]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Transports] ADD  CONSTRAINT [DF_Transports_Active]  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [AddressHasCustomer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [AddressHasCustomer]
GO
ALTER TABLE [dbo].[BasketProducts]  WITH CHECK ADD  CONSTRAINT [BasketProductHasBasket] FOREIGN KEY([BasketId])
REFERENCES [dbo].[Baskets] ([Id])
GO
ALTER TABLE [dbo].[BasketProducts] CHECK CONSTRAINT [BasketProductHasBasket]
GO
ALTER TABLE [dbo].[BasketProducts]  WITH CHECK ADD  CONSTRAINT [BasketProductHasProductVariant] FOREIGN KEY([ProductVariantId])
REFERENCES [dbo].[ProductVariants] ([Id])
GO
ALTER TABLE [dbo].[BasketProducts] CHECK CONSTRAINT [BasketProductHasProductVariant]
GO
ALTER TABLE [dbo].[CategoryProducts]  WITH CHECK ADD  CONSTRAINT [CategoryProductHasProductCategory] FOREIGN KEY([ProductCategoryId])
REFERENCES [dbo].[ProductCategories] ([Id])
GO
ALTER TABLE [dbo].[CategoryProducts] CHECK CONSTRAINT [CategoryProductHasProductCategory]
GO
ALTER TABLE [dbo].[CategoryProducts]  WITH CHECK ADD  CONSTRAINT [CategoryProductHasProductVariant] FOREIGN KEY([ProductVariantId])
REFERENCES [dbo].[ProductVariants] ([Id])
GO
ALTER TABLE [dbo].[CategoryProducts] CHECK CONSTRAINT [CategoryProductHasProductVariant]
GO
ALTER TABLE [dbo].[DigitalProducts]  WITH CHECK ADD  CONSTRAINT [DigitalProductHasProductVariand] FOREIGN KEY([ProductVariantId])
REFERENCES [dbo].[ProductVariants] ([Id])
GO
ALTER TABLE [dbo].[DigitalProducts] CHECK CONSTRAINT [DigitalProductHasProductVariand]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [OrderHasBillingAddress] FOREIGN KEY([BillingAddressId])
REFERENCES [dbo].[Addresses] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [OrderHasBillingAddress]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [OrderHasCustomer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [OrderHasCustomer]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [OrderHasDeliveryAddress] FOREIGN KEY([DeliveryAddressId])
REFERENCES [dbo].[Addresses] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [OrderHasDeliveryAddress]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [OrderHasOrderState] FOREIGN KEY([OrderStateId])
REFERENCES [dbo].[OrderStates] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [OrderHasOrderState]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [OrderHasPaymentType] FOREIGN KEY([PaymentTypeId])
REFERENCES [dbo].[PaymentTypes] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [OrderHasPaymentType]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [OrderHasTransport] FOREIGN KEY([TransportId])
REFERENCES [dbo].[Transports] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [OrderHasTransport]
GO
ALTER TABLE [dbo].[PaymentTypes]  WITH CHECK ADD  CONSTRAINT [FK_PaymentTypes_Currencies] FOREIGN KEY([CurrencyId])
REFERENCES [dbo].[Currencies] ([Id])
GO
ALTER TABLE [dbo].[PaymentTypes] CHECK CONSTRAINT [FK_PaymentTypes_Currencies]
GO
ALTER TABLE [dbo].[ProductAttachments]  WITH CHECK ADD  CONSTRAINT [ProductAttachmentHasProductVariant] FOREIGN KEY([ProductVariantId])
REFERENCES [dbo].[ProductVariants] ([Id])
GO
ALTER TABLE [dbo].[ProductAttachments] CHECK CONSTRAINT [ProductAttachmentHasProductVariant]
GO
ALTER TABLE [dbo].[ProductCategories]  WITH CHECK ADD  CONSTRAINT [ProductCategoryCanHaveUpperCategory] FOREIGN KEY([UpperCategoryId])
REFERENCES [dbo].[ProductCategories] ([Id])
GO
ALTER TABLE [dbo].[ProductCategories] CHECK CONSTRAINT [ProductCategoryCanHaveUpperCategory]
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD  CONSTRAINT [ProductImageHasImage] FOREIGN KEY([ImageId])
REFERENCES [dbo].[Images] ([Id])
GO
ALTER TABLE [dbo].[ProductImages] CHECK CONSTRAINT [ProductImageHasImage]
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD  CONSTRAINT [ProductImageHasProductVariant] FOREIGN KEY([ProductVariantId])
REFERENCES [dbo].[ProductVariants] ([Id])
GO
ALTER TABLE [dbo].[ProductImages] CHECK CONSTRAINT [ProductImageHasProductVariant]
GO
ALTER TABLE [dbo].[ProductVariants]  WITH CHECK ADD  CONSTRAINT [MainImageHas1OrInfiniteProductVariants] FOREIGN KEY([MainImageId])
REFERENCES [dbo].[Images] ([Id])
GO
ALTER TABLE [dbo].[ProductVariants] CHECK CONSTRAINT [MainImageHas1OrInfiniteProductVariants]
GO
ALTER TABLE [dbo].[ProductVariants]  WITH CHECK ADD  CONSTRAINT [ProductHas0ToInfiniteProductVariants] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductVariants] CHECK CONSTRAINT [ProductHas0ToInfiniteProductVariants]
GO
ALTER TABLE [dbo].[ProductVariants]  WITH CHECK ADD  CONSTRAINT [ProductVariantHas1ProductState] FOREIGN KEY([ProductStateId])
REFERENCES [dbo].[ProductStates] ([Id])
GO
ALTER TABLE [dbo].[ProductVariants] CHECK CONSTRAINT [ProductVariantHas1ProductState]
GO
ALTER TABLE [dbo].[ProductVariants]  WITH CHECK ADD  CONSTRAINT [PurchasePriceHasCurrency] FOREIGN KEY([PurchasePriceCurrencyId])
REFERENCES [dbo].[Currencies] ([Id])
GO
ALTER TABLE [dbo].[ProductVariants] CHECK CONSTRAINT [PurchasePriceHasCurrency]
GO
ALTER TABLE [dbo].[ProductVariants]  WITH CHECK ADD  CONSTRAINT [RecommendedPriceHasCurrency] FOREIGN KEY([RecommendedPriceCurrencyId])
REFERENCES [dbo].[Currencies] ([Id])
GO
ALTER TABLE [dbo].[ProductVariants] CHECK CONSTRAINT [RecommendedPriceHasCurrency]
GO
ALTER TABLE [dbo].[ProductVariants]  WITH CHECK ADD  CONSTRAINT [SalePriceHasCurrency] FOREIGN KEY([SalePriceCurrencyId])
REFERENCES [dbo].[Currencies] ([Id])
GO
ALTER TABLE [dbo].[ProductVariants] CHECK CONSTRAINT [SalePriceHasCurrency]
GO
ALTER TABLE [dbo].[PropertyCombinations]  WITH CHECK ADD  CONSTRAINT [PropertyCombinationHasProductProperty] FOREIGN KEY([ProductPropertyId])
REFERENCES [dbo].[ProductProperties] ([Id])
GO
ALTER TABLE [dbo].[PropertyCombinations] CHECK CONSTRAINT [PropertyCombinationHasProductProperty]
GO
ALTER TABLE [dbo].[PropertyCombinations]  WITH CHECK ADD  CONSTRAINT [PropertyCombinationsHasProductVarian] FOREIGN KEY([ProductVariantId])
REFERENCES [dbo].[ProductVariants] ([Id])
GO
ALTER TABLE [dbo].[PropertyCombinations] CHECK CONSTRAINT [PropertyCombinationsHasProductVarian]
GO
ALTER TABLE [dbo].[Transports]  WITH CHECK ADD  CONSTRAINT [TransportHasCurrency] FOREIGN KEY([CurrencyId])
REFERENCES [dbo].[Currencies] ([Id])
GO
ALTER TABLE [dbo].[Transports] CHECK CONSTRAINT [TransportHasCurrency]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifier of the address' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Addresses', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id of the customer that this address belongs to' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Addresses', @level2type=N'COLUMN',@level2name=N'CustomerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Company on address' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Addresses', @level2type=N'COLUMN',@level2name=N'Company'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Country of the address' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Addresses', @level2type=N'COLUMN',@level2name=N'Country'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'City of the address' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Addresses', @level2type=N'COLUMN',@level2name=N'City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Postal code of the address' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Addresses', @level2type=N'COLUMN',@level2name=N'PostalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Street of the address' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Addresses', @level2type=N'COLUMN',@level2name=N'Street'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id of the basket' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BasketProducts', @level2type=N'COLUMN',@level2name=N'BasketId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id of the product variant' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BasketProducts', @level2type=N'COLUMN',@level2name=N'ProductVariantId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Basket identifier' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Baskets', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'IP for cookie' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Baskets', @level2type=N'COLUMN',@level2name=N'IPAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifier of the currency' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Currencies', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Name of the currency (Euro)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Currencies', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The code of the currency (USD)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Currencies', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Convert value to our currency' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Currencies', @level2type=N'COLUMN',@level2name=N'ConvertValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Is currency active (0-no, 1-yes)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Currencies', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifier of the digital product' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DigitalProducts', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id of the product variant' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DigitalProducts', @level2type=N'COLUMN',@level2name=N'ProductVariantId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the file' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DigitalProducts', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The url of the file' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DigitalProducts', @level2type=N'COLUMN',@level2name=N'Url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'When was the product created' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DigitalProducts', @level2type=N'COLUMN',@level2name=N'CreatedAt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Expiration date of the digital product (null - no expiration date)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DigitalProducts', @level2type=N'COLUMN',@level2name=N'ExpirationDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Number of days for customer to download his digital product' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DigitalProducts', @level2type=N'COLUMN',@level2name=N'DaysForDownload'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Name of the image' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Images', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Path to the image (url)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Images', @level2type=N'COLUMN',@level2name=N'Url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id of upper category (if null - no upper category)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductCategories', @level2type=N'COLUMN',@level2name=N'UpperCategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the category' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductCategories', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Description of the category' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductCategories', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the order of displaying categories' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductCategories', @level2type=N'COLUMN',@level2name=N'DisplayOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Title for meta tag ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductCategories', @level2type=N'COLUMN',@level2name=N'MetaTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Keywords for meta tag' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductCategories', @level2type=N'COLUMN',@level2name=N'MetaKeywords'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductCategories', @level2type=N'COLUMN',@level2name=N'MetaDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Is category active' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductCategories', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifier of product property' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductProperties', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the property' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductProperties', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Displayed name of the product' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Short description of product' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'ShortDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Long description of product' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'LongDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Is product in closeout (0-no, 1-yes)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Closeout'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The tax in percents' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Tax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The weight of the product' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Weight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The length of the product (Y)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Length'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The width of the product (X)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Width'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The height of the product (Z)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Height'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Verbal availability (in 3 days...)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Availability'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Is product orderable (0-no, 1-yes)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Orderable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Can customer see the product (0-no, 1-yes)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Visible'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date the product was added' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'CreatedAt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifier of the state' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductStates', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the state' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductStates', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The description of the state' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductStates', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique identifier' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductVariants', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product that is assigned to variant' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductVariants', @level2type=N'COLUMN',@level2name=N'ProductId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique combination of product (black with steel,...)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductVariants', @level2type=N'COLUMN',@level2name=N'UniqueCombination'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id of product state' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductVariants', @level2type=N'COLUMN',@level2name=N'ProductStateId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id of the main image' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductVariants', @level2type=N'COLUMN',@level2name=N'MainImageId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The currency of purchase price.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductVariants', @level2type=N'COLUMN',@level2name=N'PurchasePriceCurrencyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The currency of the sale price' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductVariants', @level2type=N'COLUMN',@level2name=N'SalePriceCurrencyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Id of currency of recommended price' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductVariants', @level2type=N'COLUMN',@level2name=N'RecommendedPriceCurrencyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The price of purchase' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductVariants', @level2type=N'COLUMN',@level2name=N'PurchasePrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The recommended price' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductVariants', @level2type=N'COLUMN',@level2name=N'RecommendedPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The price of the sale' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductVariants', @level2type=N'COLUMN',@level2name=N'SalePrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The code of the product (if available)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductVariants', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The id of the product variant' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PropertyCombinations', @level2type=N'COLUMN',@level2name=N'ProductVariantId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The value of the product property' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PropertyCombinations', @level2type=N'COLUMN',@level2name=N'ProductPropertyValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Id of the product property' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PropertyCombinations', @level2type=N'COLUMN',@level2name=N'ProductPropertyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'In two days, etc.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Transports', @level2type=N'COLUMN',@level2name=N'TimeOfDelivery'
GO
USE [master]
GO
ALTER DATABASE [onlinePlatby] SET  READ_WRITE 
GO
