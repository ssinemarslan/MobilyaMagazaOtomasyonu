USE [master]
GO
/****** Object:  Database [MobilyaMagaza]    Script Date: 20.03.2023 16:48:50 ******/
CREATE DATABASE [MobilyaMagaza]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MobilyaMagaza', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MobilyaMagaza.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MobilyaMagaza_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MobilyaMagaza_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MobilyaMagaza] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MobilyaMagaza].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MobilyaMagaza] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MobilyaMagaza] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MobilyaMagaza] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MobilyaMagaza] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MobilyaMagaza] SET ARITHABORT OFF 
GO
ALTER DATABASE [MobilyaMagaza] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MobilyaMagaza] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MobilyaMagaza] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MobilyaMagaza] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MobilyaMagaza] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MobilyaMagaza] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MobilyaMagaza] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MobilyaMagaza] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MobilyaMagaza] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MobilyaMagaza] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MobilyaMagaza] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MobilyaMagaza] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MobilyaMagaza] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MobilyaMagaza] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MobilyaMagaza] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MobilyaMagaza] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MobilyaMagaza] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MobilyaMagaza] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MobilyaMagaza] SET  MULTI_USER 
GO
ALTER DATABASE [MobilyaMagaza] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MobilyaMagaza] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MobilyaMagaza] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MobilyaMagaza] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MobilyaMagaza] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MobilyaMagaza] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MobilyaMagaza] SET QUERY_STORE = ON
GO
ALTER DATABASE [MobilyaMagaza] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MobilyaMagaza]
GO
/****** Object:  Table [dbo].[KullanicilarBilgiSet]    Script Date: 20.03.2023 16:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KullanicilarBilgiSet](
	[KullaniciNo] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAdi] [nvarchar](max) NOT NULL,
	[Sifre] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_KullanicilarBilgiSet] PRIMARY KEY CLUSTERED 
(
	[KullaniciNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MobilyalarBilgiSet]    Script Date: 20.03.2023 16:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MobilyalarBilgiSet](
	[MobilyaNo] [int] IDENTITY(1,1) NOT NULL,
	[MobilyaAdi] [nvarchar](max) NOT NULL,
	[MobilyaHammaddesi] [nvarchar](max) NOT NULL,
	[MusteriNo] [int] NOT NULL,
 CONSTRAINT [PK_MobilyalarBilgiSet] PRIMARY KEY CLUSTERED 
(
	[MobilyaNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MusterilerBilgiSet]    Script Date: 20.03.2023 16:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MusterilerBilgiSet](
	[MusteriNo] [int] IDENTITY(1,1) NOT NULL,
	[MusteriAdSoyad] [nvarchar](max) NOT NULL,
	[MusteriAdres] [nvarchar](max) NOT NULL,
	[MusteriTelefon] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_MusterilerBilgiSet] PRIMARY KEY CLUSTERED 
(
	[MusteriNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OzelliklerBilgiSet]    Script Date: 20.03.2023 16:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OzelliklerBilgiSet](
	[OzellikNo] [int] IDENTITY(1,1) NOT NULL,
	[MobilyaGrubu] [nvarchar](max) NOT NULL,
	[MobilyaRenk] [nvarchar](max) NOT NULL,
	[Mensei] [nvarchar](max) NOT NULL,
	[MobilyaNo] [int] NOT NULL,
 CONSTRAINT [PK_OzelliklerBilgiSet] PRIMARY KEY CLUSTERED 
(
	[OzellikNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MobilyalarBilgiSet] ON 

INSERT [dbo].[MobilyalarBilgiSet] ([MobilyaNo], [MobilyaAdi], [MobilyaHammaddesi], [MusteriNo]) VALUES (1, N'Masaa', N'Ceviz ', 1)
INSERT [dbo].[MobilyalarBilgiSet] ([MobilyaNo], [MobilyaAdi], [MobilyaHammaddesi], [MusteriNo]) VALUES (2, N'Sandalye', N'Ceviz ', 1)
INSERT [dbo].[MobilyalarBilgiSet] ([MobilyaNo], [MobilyaAdi], [MobilyaHammaddesi], [MusteriNo]) VALUES (4, N'Avize', N'Porselen', 2)
SET IDENTITY_INSERT [dbo].[MobilyalarBilgiSet] OFF
GO
SET IDENTITY_INSERT [dbo].[MusterilerBilgiSet] ON 

INSERT [dbo].[MusterilerBilgiSet] ([MusteriNo], [MusteriAdSoyad], [MusteriAdres], [MusteriTelefon]) VALUES (1, N'Elif Çelik', N'Ümraniye', N'5467894556')
INSERT [dbo].[MusterilerBilgiSet] ([MusteriNo], [MusteriAdSoyad], [MusteriAdres], [MusteriTelefon]) VALUES (2, N'Sedat Yelll', N'Bakırköy', N'5469632548')
INSERT [dbo].[MusterilerBilgiSet] ([MusteriNo], [MusteriAdSoyad], [MusteriAdres], [MusteriTelefon]) VALUES (3, N'', N'', N'')
INSERT [dbo].[MusterilerBilgiSet] ([MusteriNo], [MusteriAdSoyad], [MusteriAdres], [MusteriTelefon]) VALUES (4, N'yjjd', N'yrjutyjd', N'582785')
SET IDENTITY_INSERT [dbo].[MusterilerBilgiSet] OFF
GO
SET IDENTITY_INSERT [dbo].[OzelliklerBilgiSet] ON 

INSERT [dbo].[OzelliklerBilgiSet] ([OzellikNo], [MobilyaGrubu], [MobilyaRenk], [Mensei], [MobilyaNo]) VALUES (1, N'Yemek Odası', N'Kahverengi', N'Türkiye', 2)
INSERT [dbo].[OzelliklerBilgiSet] ([OzellikNo], [MobilyaGrubu], [MobilyaRenk], [Mensei], [MobilyaNo]) VALUES (2, N'Oturma Odası', N'Bordo', N'Türkiye', 4)
SET IDENTITY_INSERT [dbo].[OzelliklerBilgiSet] OFF
GO
/****** Object:  Index [IX_FK_MusterilerBilgiMobilyalarBilgi]    Script Date: 20.03.2023 16:48:50 ******/
CREATE NONCLUSTERED INDEX [IX_FK_MusterilerBilgiMobilyalarBilgi] ON [dbo].[MobilyalarBilgiSet]
(
	[MusteriNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_MobilyalarBilgiOzelliklerBilgi]    Script Date: 20.03.2023 16:48:50 ******/
CREATE NONCLUSTERED INDEX [IX_FK_MobilyalarBilgiOzelliklerBilgi] ON [dbo].[OzelliklerBilgiSet]
(
	[MobilyaNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MobilyalarBilgiSet]  WITH CHECK ADD  CONSTRAINT [FK_MusterilerBilgiMobilyalarBilgi] FOREIGN KEY([MusteriNo])
REFERENCES [dbo].[MusterilerBilgiSet] ([MusteriNo])
GO
ALTER TABLE [dbo].[MobilyalarBilgiSet] CHECK CONSTRAINT [FK_MusterilerBilgiMobilyalarBilgi]
GO
ALTER TABLE [dbo].[OzelliklerBilgiSet]  WITH CHECK ADD  CONSTRAINT [FK_MobilyalarBilgiOzelliklerBilgi] FOREIGN KEY([MobilyaNo])
REFERENCES [dbo].[MobilyalarBilgiSet] ([MobilyaNo])
GO
ALTER TABLE [dbo].[OzelliklerBilgiSet] CHECK CONSTRAINT [FK_MobilyalarBilgiOzelliklerBilgi]
GO
USE [master]
GO
ALTER DATABASE [MobilyaMagaza] SET  READ_WRITE 
GO
