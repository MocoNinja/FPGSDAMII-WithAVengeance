
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/24/2017 10:50:31
-- Generated from EDMX file: C:\Agustin\Acceso\EsteSi2\EsteSi2\AlumnoModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Colegio];
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

-- Creating table 'Clases'
CREATE TABLE [dbo].[Clases] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Curso] nvarchar(2)  NOT NULL
);
GO

-- Creating table 'Alumnos'
CREATE TABLE [dbo].[Alumnos] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(50)  NOT NULL,
    [Apellidos] nvarchar(50)  NOT NULL,
    [Genero] nvarchar(50)  NOT NULL,
    [Edad] int  NOT NULL,
    [ClaseID] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ID] in table 'Clases'
ALTER TABLE [dbo].[Clases]
ADD CONSTRAINT [PK_Clases]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Alumnos'
ALTER TABLE [dbo].[Alumnos]
ADD CONSTRAINT [PK_Alumnos]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ClaseID] in table 'Alumnos'
ALTER TABLE [dbo].[Alumnos]
ADD CONSTRAINT [FK_ClaseAlumno]
    FOREIGN KEY ([ClaseID])
    REFERENCES [dbo].[Clases]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClaseAlumno'
CREATE INDEX [IX_FK_ClaseAlumno]
ON [dbo].[Alumnos]
    ([ClaseID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------