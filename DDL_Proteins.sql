-- DDL for Cocktails Database


-- initial master database use statement
USE master;
GO
Alter database Proteins SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO


-- initalize database
DROP DATABASE IF EXISTS Proteins;
GO
CREATE DATABASE Proteins;
GO
USE Proteins;
GO


-- Reset Schema
DROP TABLE IF EXISTS Mouse_Protein;
GO

DROP TABLE IF EXISTS Protein;
GO

DROP TABLE IF EXISTS Mouse;
GO

DROP TABLE IF EXISTS Protein_Id;
GO

DROP TABLE IF EXISTS Gene;
GO

DROP TABLE IF EXISTS Protein_Description;
GO

DROP TABLE IF EXISTS Peptide;
GO

DROP TABLE IF EXISTS Virus;
GO

DROP TABLE IF EXISTS Biotin;
GO

DROP TABLE IF EXISTS Fraction;
GO


-- Create Protein_Id table
CREATE TABLE Protein_Id(
    Protein_Id_ID int primary key identity(1,1),
    Protein_Id_Label varchar(450) not null
);
GO

-- Create Gene table
CREATE TABLE Gene(
    Gene_ID int primary key identity(1,1),
    Gene_Label varchar(250) not null
);
GO

-- Create Protein_Description table
CREATE TABLE Protein_Description(
    Description_ID int primary key identity(1,1),
    [Description] varchar(250) not null
);
GO

-- Create Peptide table
CREATE TABLE Peptide(
    Peptide_ID int primary key identity(1,1),
    Peptide_Amount int null
);
GO

-- Create Virus table
CREATE TABLE Virus(
    Virus_ID int primary key identity(1,1),
    Virus_Label varchar(25) not null
);
GO

-- Create Biotin table
CREATE TABLE Biotin(
    Biotin_ID int primary key identity(1,1),
    Biotin_Label varchar(25) not null
);
GO

-- Create Fraction table
CREATE TABLE Fraction(
    Fraction_ID int primary key identity(1,1),
    Fraction_Label varchar(50) not null
);
GO

-- Create Protein table
CREATE TABLE Protein(
    Protein_ID int primary key identity(1,1),
    Protein_Name varchar(450) not null,
    Protein_Group varchar(250) not null,
    Protein_Id_ID int not null,
        constraint fk_Protein_Id_ID
        foreign key (Protein_Id_ID)
        references Protein_Id(Protein_Id_ID),
    Gene_ID int not null,
        constraint fk_Gene_ID
        foreign key (Gene_ID)
        references Gene(Gene_ID),
    Description_ID int not null,
        constraint fk_Description_ID
        foreign key (Description_ID)
        references Protein_Description(Description_ID),
    Peptide_ID int not null,
        constraint fk_Peptide_ID
        foreign key (Peptide_ID)
        references Peptide(Peptide_ID)
);
GO

-- Create Mouse table
CREATE TABLE Mouse(
    Mouse_ID int primary key identity(1,1),
    Sample_Name varchar(25) not null,
    Virus_ID int not null,
        constraint fk_Virus_ID
        foreign key (Virus_ID)
        references Virus(Virus_ID),
    Biotin_ID int not null,
        constraint fk_Biotin_ID
        foreign key (Biotin_ID)
        references Biotin(Biotin_ID),
    Fraction_ID int not null,
        constraint fk_Fraction_ID
        foreign key (Fraction_ID)
        references Fraction(Fraction_ID)
);
GO

-- Create Mouse_Protein table
CREATE TABLE Mouse_Protein(
    Mouse_Protein_ID int primary key identity(1,1),
    Protein_ID int not null,
        constraint fk_Protein_ID
        foreign key (Protein_ID)
        references Protein(Protein_ID),
    Mouse_ID int not null,
        constraint fk_Mouse_ID
        foreign key (Mouse_ID)
        references Mouse(Mouse_ID),
    Hits decimal(14,2) not null
);
GO