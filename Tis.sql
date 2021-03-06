USE [18ip33]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 02.12.2021 15:51:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](150) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 02.12.2021 15:51:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](150) NULL,
	[Category] [int] NULL,
	[Image] [nvarchar](200) NULL,
	[Description] [nvarchar](150) NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductsPromotion]    Script Date: 02.12.2021 15:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductsPromotion](
	[ID] [int] NOT NULL,
	[ID_Product] [int] NULL,
	[ID_Promotion] [int] NULL,
	[DateFrom] [date] NULL,
	[DateTo] [date] NULL,
 CONSTRAINT [PK_ProductsPromotion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotion]    Script Date: 02.12.2021 15:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotion](
	[ID] [int] NOT NULL,
	[Title_prom] [nvarchar](max) NULL,
	[Sale] [float] NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Promotion_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Авторизация]    Script Date: 02.12.2021 15:51:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Авторизация](
	[Логин] [nvarchar](50) NULL,
	[Пароль] [nvarchar](50) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([Category])
REFERENCES [dbo].[Category] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[ProductsPromotion]  WITH CHECK ADD  CONSTRAINT [FK_ProductsPromotion_Product] FOREIGN KEY([ID_Product])
REFERENCES [dbo].[Product] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductsPromotion] CHECK CONSTRAINT [FK_ProductsPromotion_Product]
GO
ALTER TABLE [dbo].[ProductsPromotion]  WITH CHECK ADD  CONSTRAINT [FK_ProductsPromotion_Promotion1] FOREIGN KEY([ID_Promotion])
REFERENCES [dbo].[Promotion] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductsPromotion] CHECK CONSTRAINT [FK_ProductsPromotion_Promotion1]
GO
