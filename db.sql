USE [ShopDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/3/2024 3:34:35 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/3/2024 3:34:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/3/2024 3:34:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[TotalAmount] [float] NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 7/3/2024 3:34:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[PricePerUnit] [float] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 7/3/2024 3:34:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Gender] [bit] NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Role] [int] NOT NULL,
	[otpcheck] [bit] NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/3/2024 3:34:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[ProductImage] [nchar](100) NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[UnitInStock] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rates]    Script Date: 7/3/2024 3:34:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rates](
	[Id] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
	[Comment] [nvarchar](50) NULL,
	[RateStar] [int] NOT NULL,
	[Time] [time](7) NOT NULL,
 CONSTRAINT [PK_Rates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (1, N'Asus')
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (2, N'Levono')
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (3, N'MSI')
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (4, N'Dell')
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [PersonId], [OrderDate], [TotalAmount], [Address]) VALUES (1, 2, CAST(N'2023-04-26' AS Date), 153980000, N'')
INSERT [dbo].[Order] ([Id], [PersonId], [OrderDate], [TotalAmount], [Address]) VALUES (2, 2, CAST(N'2023-04-26' AS Date), 20990000, N'vippro')
INSERT [dbo].[Order] ([Id], [PersonId], [OrderDate], [TotalAmount], [Address]) VALUES (3, 2, CAST(N'2023-04-26' AS Date), 221960000, N'dddd')
INSERT [dbo].[Order] ([Id], [PersonId], [OrderDate], [TotalAmount], [Address]) VALUES (4, 2, CAST(N'2023-04-26' AS Date), 153980000, N'fff')
INSERT [dbo].[Order] ([Id], [PersonId], [OrderDate], [TotalAmount], [Address]) VALUES (5, 4, CAST(N'2023-04-26' AS Date), 17490000, N'vippro')
INSERT [dbo].[Order] ([Id], [PersonId], [OrderDate], [TotalAmount], [Address]) VALUES (6, 4, CAST(N'2023-04-26' AS Date), 153980000, N'adda')
INSERT [dbo].[Order] ([Id], [PersonId], [OrderDate], [TotalAmount], [Address]) VALUES (7, 1, CAST(N'2024-03-10' AS Date), 76990000, N'')
INSERT [dbo].[Order] ([Id], [PersonId], [OrderDate], [TotalAmount], [Address]) VALUES (8, 2, CAST(N'2024-03-14' AS Date), 70000000, N'')
INSERT [dbo].[Order] ([Id], [PersonId], [OrderDate], [TotalAmount], [Address]) VALUES (9, 2, CAST(N'2024-03-14' AS Date), 70000000, N'')
INSERT [dbo].[Order] ([Id], [PersonId], [OrderDate], [TotalAmount], [Address]) VALUES (10, 2, CAST(N'2024-03-14' AS Date), 70000000, N'')
INSERT [dbo].[Order] ([Id], [PersonId], [OrderDate], [TotalAmount], [Address]) VALUES (11, 2, CAST(N'2024-03-14' AS Date), 70000000, N'')
INSERT [dbo].[Order] ([Id], [PersonId], [OrderDate], [TotalAmount], [Address]) VALUES (13, 2, CAST(N'2024-03-14' AS Date), 70000000, N'')
INSERT [dbo].[Order] ([Id], [PersonId], [OrderDate], [TotalAmount], [Address]) VALUES (17, 1058, CAST(N'2024-03-15' AS Date), 42000000, N'')
INSERT [dbo].[Order] ([Id], [PersonId], [OrderDate], [TotalAmount], [Address]) VALUES (18, 1059, CAST(N'2024-03-22' AS Date), 272880000, N'')
INSERT [dbo].[Order] ([Id], [PersonId], [OrderDate], [TotalAmount], [Address]) VALUES (19, 1059, CAST(N'2024-03-22' AS Date), 272880000, N'')
INSERT [dbo].[Order] ([Id], [PersonId], [OrderDate], [TotalAmount], [Address]) VALUES (20, 1, CAST(N'2024-03-22' AS Date), 52000000, N'')
INSERT [dbo].[Order] ([Id], [PersonId], [OrderDate], [TotalAmount], [Address]) VALUES (21, 1059, CAST(N'2024-03-22' AS Date), 272880000, N'')
INSERT [dbo].[Order] ([Id], [PersonId], [OrderDate], [TotalAmount], [Address]) VALUES (22, 1059, CAST(N'2024-03-22' AS Date), 272880000, N'')
INSERT [dbo].[Order] ([Id], [PersonId], [OrderDate], [TotalAmount], [Address]) VALUES (23, 1059, CAST(N'2024-03-22' AS Date), 272880000, N'')
INSERT [dbo].[Order] ([Id], [PersonId], [OrderDate], [TotalAmount], [Address]) VALUES (24, 1, CAST(N'2024-03-22' AS Date), 52000000, N'')
INSERT [dbo].[Order] ([Id], [PersonId], [OrderDate], [TotalAmount], [Address]) VALUES (25, 1059, CAST(N'2024-03-22' AS Date), 272880000, N'')
INSERT [dbo].[Order] ([Id], [PersonId], [OrderDate], [TotalAmount], [Address]) VALUES (26, 1059, CAST(N'2024-03-22' AS Date), 272880000, N'')
INSERT [dbo].[Order] ([Id], [PersonId], [OrderDate], [TotalAmount], [Address]) VALUES (27, 1059, CAST(N'2024-03-22' AS Date), 83970000, N'')
INSERT [dbo].[Order] ([Id], [PersonId], [OrderDate], [TotalAmount], [Address]) VALUES (28, 1059, CAST(N'2024-03-22' AS Date), 272880000, N'')
INSERT [dbo].[Order] ([Id], [PersonId], [OrderDate], [TotalAmount], [Address]) VALUES (29, 1059, CAST(N'2024-03-22' AS Date), 272880000, N'')
INSERT [dbo].[Order] ([Id], [PersonId], [OrderDate], [TotalAmount], [Address]) VALUES (30, 1059, CAST(N'2024-03-22' AS Date), 272880000, N'')
INSERT [dbo].[Order] ([Id], [PersonId], [OrderDate], [TotalAmount], [Address]) VALUES (31, 1, CAST(N'2024-03-22' AS Date), 95200000, N'')
INSERT [dbo].[Order] ([Id], [PersonId], [OrderDate], [TotalAmount], [Address]) VALUES (32, 1059, CAST(N'2024-03-22' AS Date), 272880000, N'')
INSERT [dbo].[Order] ([Id], [PersonId], [OrderDate], [TotalAmount], [Address]) VALUES (33, 1059, CAST(N'2024-03-22' AS Date), 272880000, N'')
INSERT [dbo].[Order] ([Id], [PersonId], [OrderDate], [TotalAmount], [Address]) VALUES (34, 1059, CAST(N'2024-03-22' AS Date), 272880000, N'')
INSERT [dbo].[Order] ([Id], [PersonId], [OrderDate], [TotalAmount], [Address]) VALUES (35, 1, CAST(N'2024-03-22' AS Date), 70000000, N'')
INSERT [dbo].[Order] ([Id], [PersonId], [OrderDate], [TotalAmount], [Address]) VALUES (36, 1, CAST(N'2024-03-22' AS Date), 840000000, N'')
INSERT [dbo].[Order] ([Id], [PersonId], [OrderDate], [TotalAmount], [Address]) VALUES (37, 1059, CAST(N'2024-03-22' AS Date), 272880000, N'')
INSERT [dbo].[Order] ([Id], [PersonId], [OrderDate], [TotalAmount], [Address]) VALUES (38, 1059, CAST(N'2024-03-22' AS Date), 293870000, N'')
INSERT [dbo].[Order] ([Id], [PersonId], [OrderDate], [TotalAmount], [Address]) VALUES (39, 1059, CAST(N'2024-03-22' AS Date), 293870000, N'')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [PricePerUnit]) VALUES (1, 1, 2, 2, 76990000)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [PricePerUnit]) VALUES (2, 2, 1, 1, 20990000)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [PricePerUnit]) VALUES (3, 3, 2, 2, 33990000)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [PricePerUnit]) VALUES (4, 3, 2, 2, 76990000)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [PricePerUnit]) VALUES (5, 5, 1, 1, 17490000)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [PricePerUnit]) VALUES (6, 6, 2, 2, 76990000)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [PricePerUnit]) VALUES (7, 7, 1, 1, 76990000)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [PricePerUnit]) VALUES (8, 8, 1, 1, 70000000)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [PricePerUnit]) VALUES (9, 9, 1, 1, 70000000)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [PricePerUnit]) VALUES (10, 10, 1, 1, 70000000)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [PricePerUnit]) VALUES (11, 11, 1, 1, 70000000)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [PricePerUnit]) VALUES (12, 13, 1, 1, 70000000)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [PricePerUnit]) VALUES (13, 17, 2, 2, 21000000)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [PricePerUnit]) VALUES (16, 20, 1, 1, 52000000)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [PricePerUnit]) VALUES (20, 24, 1, 1, 52000000)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [PricePerUnit]) VALUES (23, 27, 3, 3, 20990000)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [PricePerUnit]) VALUES (24, 27, 1, 1, 21000000)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [PricePerUnit]) VALUES (28, 31, 1, 1, 52000000)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [PricePerUnit]) VALUES (29, 31, 1, 1, 43200000)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [PricePerUnit]) VALUES (32, 35, 1, 1, 70000000)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [PricePerUnit]) VALUES (35, 39, 2, 13, 20990000)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity], [PricePerUnit]) VALUES (36, 39, 1, 1, 21000000)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([Id], [FullName], [Gender], [Email], [Password], [Role], [otpcheck]) VALUES (1, N'aaa', 1, N'aaa@gmail.com', N'123', 0, NULL)
INSERT [dbo].[Person] ([Id], [FullName], [Gender], [Email], [Password], [Role], [otpcheck]) VALUES (2, N'admin', 1, N'admin@gmail.com', N'admin', 1, NULL)
INSERT [dbo].[Person] ([Id], [FullName], [Gender], [Email], [Password], [Role], [otpcheck]) VALUES (3, N'customer', 0, N'cus@gmail.com', N'123', 0, NULL)
INSERT [dbo].[Person] ([Id], [FullName], [Gender], [Email], [Password], [Role], [otpcheck]) VALUES (4, N'fff', 1, N'user@test.com', N'123', 0, NULL)
INSERT [dbo].[Person] ([Id], [FullName], [Gender], [Email], [Password], [Role], [otpcheck]) VALUES (9, N'hung', NULL, N'chanvoi2001@gmail.com', N'1', 0, NULL)
INSERT [dbo].[Person] ([Id], [FullName], [Gender], [Email], [Password], [Role], [otpcheck]) VALUES (11, N'', 0, N'chanvoi2005@gmail.com', N'1234567', 0, NULL)
INSERT [dbo].[Person] ([Id], [FullName], [Gender], [Email], [Password], [Role], [otpcheck]) VALUES (12, N'', 0, N'chanvoi2004@gmail.com', N'12345', 0, NULL)
INSERT [dbo].[Person] ([Id], [FullName], [Gender], [Email], [Password], [Role], [otpcheck]) VALUES (14, N'duyhung', 0, N'chanvoi2006@gmail.com', N'123', 0, NULL)
INSERT [dbo].[Person] ([Id], [FullName], [Gender], [Email], [Password], [Role], [otpcheck]) VALUES (15, N'duyhung', NULL, N'chanvoi@gmail.com', N'123', 0, 0)
INSERT [dbo].[Person] ([Id], [FullName], [Gender], [Email], [Password], [Role], [otpcheck]) VALUES (80, N'duyhung', NULL, N'dattthe163324@fpt.edu.vn', N'123', 0, 1)
INSERT [dbo].[Person] ([Id], [FullName], [Gender], [Email], [Password], [Role], [otpcheck]) VALUES (1058, N'duyhung', NULL, N'hungndhe153622@fpt.edu.vn', N'123', 1, 1)
INSERT [dbo].[Person] ([Id], [FullName], [Gender], [Email], [Password], [Role], [otpcheck]) VALUES (1059, N'minh', NULL, N'minhdnhe161535@fpt.edu.vn', N'123', 0, 1)
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
INSERT [dbo].[Product] ([Id], [CategoryId], [ProductImage], [ProductName], [Price], [Description], [UnitInStock]) VALUES (1, 1, N'1.jpg                                                                                               ', N'Asus TUF Gaming F15 FX506LHB-HN188W', 21000000, N'Thiết kế tuyệt đẹp, phong cách chuẩn game thủ', 20)
INSERT [dbo].[Product] ([Id], [CategoryId], [ProductImage], [ProductName], [Price], [Description], [UnitInStock]) VALUES (2, 1, N'2.jpg                                                                                               ', N'Asus TUF Gaming F15 FX506HC HN144W', 20990000, N'Asus TUF Gaming F15 FX506HC HN144W sở hữu cấu hình tuyệt vời với những linh kiện mới nhất cùng một thiết kế di động, bền bỉ nhưng lại được bán ở mức giá rẻ đến khó tin. Đây chắc chắn là mẫu laptop gaming giá tốt mà các game thủ sẽ rất yêu thích.', 21)
INSERT [dbo].[Product] ([Id], [CategoryId], [ProductImage], [ProductName], [Price], [Description], [UnitInStock]) VALUES (3, 3, N'3.jpg                                                                                               ', N'MSI Gaming GF63 Thin 11SC-664VN', 16490000, N'MSI Gaming GF63 Thin 11SC-664VN đưa laptop gaming đến gần người dùng hơn với giá bán chỉ tương đương một chiếc laptop văn phòng thông thường nhưng bạn sẽ nhận được cấu hình vượt trội, màn hình 144Hz mượt mà và thiết kế đầy phong cách.', 45)
INSERT [dbo].[Product] ([Id], [CategoryId], [ProductImage], [ProductName], [Price], [Description], [UnitInStock]) VALUES (4, 2, N'4.jpg                                                                                               ', N'Laptop Lenovo Legion 5 15IAH7', 33990000, N'Laptop Lenovo Legion 5 15IAH7 là chiếc laptop chơi game mạnh mẽ một cách toàn diện khi không chỉ sở hữu cấu hình đỉnh cao từ bộ vi xử lý Intel Core i7 12700H, card rời RTX 3060 mà sản phẩm còn mang trên mình màn hình 15,6 inch WQHD 165Hz đáng mơ ước cho mọi game thủ.

', 34)
INSERT [dbo].[Product] ([Id], [CategoryId], [ProductImage], [ProductName], [Price], [Description], [UnitInStock]) VALUES (5, 4, N'5.jpg                                                                                               ', N'Dell Gaming G15', 37000000, N'LaptopDell cấu hình I7 13650HX/16GB RAM/512GB SSD/RTX4060 8G/15.6 INCH FHD 165HZ 100% SRGB/WIN11/OFFICEHS21/XÁM ĐEN', 30)
INSERT [dbo].[Product] ([Id], [CategoryId], [ProductImage], [ProductName], [Price], [Description], [UnitInStock]) VALUES (6, 4, N'6.jpeg                                                                                              ', N'LAPTOP DELL ALLIENWARE', 40000000, N'I7 11800H/32GB RAM/1TB SSD/RTX3060 6G/15.6 INCH QHD 240HZ/WIN11/OFFICEHS21/XÁM ĐEN', 40)
INSERT [dbo].[Product] ([Id], [CategoryId], [ProductImage], [ProductName], [Price], [Description], [UnitInStock]) VALUES (7, 3, N'7.jpg                                                                                               ', N'LAPTOP MSI GAMING', 52000000, N'I9 14900HX/32GB RAM/ 2TB SSD/RTX4090 16GB/16.0 INCH QHD+ 240HZ/ WIN11/ĐEN', 40)
INSERT [dbo].[Product] ([Id], [CategoryId], [ProductImage], [ProductName], [Price], [Description], [UnitInStock]) VALUES (8, 3, N'8.jpg                                                                                               ', N'LAPTOP MSI STEALTH', 70000000, N'I9-13900H/32GB RAM/2TB SSD/RTX4070 8G/16 INCH UHD+ OLED/WIN 11/XÁM', 40)
INSERT [dbo].[Product] ([Id], [CategoryId], [ProductImage], [ProductName], [Price], [Description], [UnitInStock]) VALUES (9, 3, N'9.png                                                                                               ', N'MSI GAMING KATANA ', 25000000, N'I7 12650H 8GB RAM/512GB SSD/RTX3050 4G/15.6 INCH FHD 144HZ/WIN11/ĐEN', 40)
INSERT [dbo].[Product] ([Id], [CategoryId], [ProductImage], [ProductName], [Price], [Description], [UnitInStock]) VALUES (10, 3, N'10.jpg                                                                                              ', N'MSI GAMING SWORD', 38000000, N'I7-14700HX/16GB/1TB SSD/RTX4060 8GB/16 INCH QHD+ 240HZ//WIN11/XÁM', 40)
INSERT [dbo].[Product] ([Id], [CategoryId], [ProductImage], [ProductName], [Price], [Description], [UnitInStock]) VALUES (11, 1, N'19.png                                                                                              ', N'GAMING ROG STRIX', 43200000, N'7 13650HX/16GB RAM/512GB SSD/16 QHD 240HZ/RTX 4060 8GB/WIN11/BALO/XÁM', 40)
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Person]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Rates]  WITH CHECK ADD  CONSTRAINT [FK_Rates_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[Rates] CHECK CONSTRAINT [FK_Rates_Person]
GO
ALTER TABLE [dbo].[Rates]  WITH CHECK ADD  CONSTRAINT [FK_Rates_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Rates] CHECK CONSTRAINT [FK_Rates_Product]
GO
