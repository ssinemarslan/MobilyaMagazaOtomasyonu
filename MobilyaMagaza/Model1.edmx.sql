
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/12/2023 20:51:22
-- Generated from EDMX file: C:\Users\sinem\OneDrive\Masaüstü\Uygulamalarım Sinem\KitapOtomasyon\MobilyaMagaza\MobilyaMagaza\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [MobilyaMagaza];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'MusterilerBilgiSet'
CREATE TABLE [dbo].[MusterilerBilgiSet] (
    [MusteriNo] int IDENTITY(1,1) NOT NULL,
    [MusteriAdSoyad] nvarchar(max)  NOT NULL,
    [MusteriAdres] nvarchar(max)  NOT NULL,
    [MusteriTelefon] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'MobilyalarBilgiSet'
CREATE TABLE [dbo].[MobilyalarBilgiSet] (
    [MobilyaNo] int IDENTITY(1,1) NOT NULL,
    [MobilyaAdi] nvarchar(max)  NOT NULL,
    [MobilyaHammaddesi] nvarchar(max)  NOT NULL,
    [MusteriNo] int  NOT NULL
);
GO

-- Creating table 'OzelliklerBilgiSet'
CREATE TABLE [dbo].[OzelliklerBilgiSet] (
    [OzellikNo] int IDENTITY(1,1) NOT NULL,
    [MobilyaGrubu] nvarchar(max)  NOT NULL,
    [MobilyaRenk] nvarchar(max)  NOT NULL,
    [Mensei] nvarchar(max)  NOT NULL,
    [MobilyaNo] int  NOT NULL
);
GO

-- Creating table 'KullanicilarBilgiSet'
CREATE TABLE [dbo].[KullanicilarBilgiSet] (
    [KullaniciNo] int IDENTITY(1,1) NOT NULL,
    [KullaniciAdi] nvarchar(max)  NOT NULL,
    [Sifre] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [MusteriNo] in table 'MusterilerBilgiSet'
ALTER TABLE [dbo].[MusterilerBilgiSet]
ADD CONSTRAINT [PK_MusterilerBilgiSet]
    PRIMARY KEY CLUSTERED ([MusteriNo] ASC);
GO

-- Creating primary key on [MobilyaNo] in table 'MobilyalarBilgiSet'
ALTER TABLE [dbo].[MobilyalarBilgiSet]
ADD CONSTRAINT [PK_MobilyalarBilgiSet]
    PRIMARY KEY CLUSTERED ([MobilyaNo] ASC);
GO

-- Creating primary key on [OzellikNo] in table 'OzelliklerBilgiSet'
ALTER TABLE [dbo].[OzelliklerBilgiSet]
ADD CONSTRAINT [PK_OzelliklerBilgiSet]
    PRIMARY KEY CLUSTERED ([OzellikNo] ASC);
GO

-- Creating primary key on [KullaniciNo] in table 'KullanicilarBilgiSet'
ALTER TABLE [dbo].[KullanicilarBilgiSet]
ADD CONSTRAINT [PK_KullanicilarBilgiSet]
    PRIMARY KEY CLUSTERED ([KullaniciNo] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [MusteriNo] in table 'MobilyalarBilgiSet'
ALTER TABLE [dbo].[MobilyalarBilgiSet]
ADD CONSTRAINT [FK_MusterilerBilgiMobilyalarBilgi]
    FOREIGN KEY ([MusteriNo])
    REFERENCES [dbo].[MusterilerBilgiSet]
        ([MusteriNo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MusterilerBilgiMobilyalarBilgi'
CREATE INDEX [IX_FK_MusterilerBilgiMobilyalarBilgi]
ON [dbo].[MobilyalarBilgiSet]
    ([MusteriNo]);
GO

-- Creating foreign key on [MobilyaNo] in table 'OzelliklerBilgiSet'
ALTER TABLE [dbo].[OzelliklerBilgiSet]
ADD CONSTRAINT [FK_MobilyalarBilgiOzelliklerBilgi]
    FOREIGN KEY ([MobilyaNo])
    REFERENCES [dbo].[MobilyalarBilgiSet]
        ([MobilyaNo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MobilyalarBilgiOzelliklerBilgi'
CREATE INDEX [IX_FK_MobilyalarBilgiOzelliklerBilgi]
ON [dbo].[OzelliklerBilgiSet]
    ([MobilyaNo]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------