USE [master]
GO
/****** Object:  Database [cars]    Script Date: 9/26/2022 9:29:21 AM ******/
CREATE DATABASE [cars]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'cars', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\cars.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'cars_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\cars_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [cars] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cars].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [cars] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [cars] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [cars] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [cars] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [cars] SET ARITHABORT OFF 
GO
ALTER DATABASE [cars] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [cars] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [cars] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [cars] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [cars] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [cars] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [cars] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [cars] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [cars] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [cars] SET  ENABLE_BROKER 
GO
ALTER DATABASE [cars] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [cars] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [cars] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [cars] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [cars] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [cars] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [cars] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [cars] SET RECOVERY FULL 
GO
ALTER DATABASE [cars] SET  MULTI_USER 
GO
ALTER DATABASE [cars] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [cars] SET DB_CHAINING OFF 
GO
ALTER DATABASE [cars] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [cars] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [cars] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [cars] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'cars', N'ON'
GO
ALTER DATABASE [cars] SET QUERY_STORE = OFF
GO
USE [cars]
GO
/****** Object:  Table [dbo].[infoCars]    Script Date: 9/26/2022 9:29:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[infoCars](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Brand] [varchar](50) NOT NULL,
	[Model] [varchar](50) NOT NULL,
	[YearCar] [varchar](50) NOT NULL,
	[Color] [varchar](50) NOT NULL,
	[Img] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[DeleteCars]    Script Date: 9/26/2022 9:29:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[DeleteCars]
@Id int
as
delete from infoCars where Id=@Id
GO
/****** Object:  StoredProcedure [dbo].[InsertCars]    Script Date: 9/26/2022 9:29:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertCars]
@Brand varchar (50),
@Model varchar (50),
@YearCar varchar (50),
@Color varchar (50),
@Img varchar (250)

as
insert into infoCars values (@Brand, @Model, @YearCar, @Color, @Img)
GO
/****** Object:  StoredProcedure [dbo].[ShowACar]    Script Date: 9/26/2022 9:29:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ShowACar]
@Brand varchar(50)
as
select * from infoCars where Brand = @Brand
GO
/****** Object:  StoredProcedure [dbo].[ShowCars]    Script Date: 9/26/2022 9:29:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ShowCars]
as
select * from infoCars
GO
/****** Object:  StoredProcedure [dbo].[UpdateCars]    Script Date: 9/26/2022 9:29:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[UpdateCars]
@Brand varchar (50),
@Model varchar (50),
@YearCar varchar (50),
@Color varchar (50),
@Img varchar (250),
@id int
as
update infoCars set Brand = @Brand, Model = @Model, YearCar = @YearCar, Color = @Color, Img = @Img where Id = @id

GO
USE [master]
GO
ALTER DATABASE [cars] SET  READ_WRITE 
GO
