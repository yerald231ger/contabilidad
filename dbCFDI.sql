/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2014 (12.0.2269)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
--USE [master]
--GO
--/****** Object:  Database [dbCFDI]    Script Date: 13/02/2018 11:21:20 p. m. ******/
--CREATE DATABASE [dbCFDI]
-- CONTAINMENT = NONE
-- ON  PRIMARY 
--( NAME = N'dbCFDI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\dbCFDI.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
-- LOG ON 
--( NAME = N'dbCFDI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\dbCFDI_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
--GO
--ALTER DATABASE [dbCFDI] SET COMPATIBILITY_LEVEL = 120
--GO
--IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
--begin
--EXEC [dbCFDI].[dbo].[sp_fulltext_database] @action = 'enable'
--end
--GO
ALTER DATABASE [dbCFDI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbCFDI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbCFDI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbCFDI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbCFDI] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbCFDI] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [dbCFDI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbCFDI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbCFDI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbCFDI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbCFDI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbCFDI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbCFDI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbCFDI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbCFDI] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbCFDI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbCFDI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbCFDI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbCFDI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbCFDI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbCFDI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbCFDI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbCFDI] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbCFDI] SET  MULTI_USER 
GO
ALTER DATABASE [dbCFDI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbCFDI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbCFDI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbCFDI] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [dbCFDI] SET DELAYED_DURABILITY = DISABLED 
GO
USE [dbCFDI]
GO
/****** Object:  Table [dbo].[tbCliente]    Script Date: 13/02/2018 11:21:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbCliente](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[idEmpresa] [uniqueidentifier] NULL,
	[idSucursal] [int] NULL,
	[RFC] [varchar](13) NULL,
	[Nombre] [varchar](255) NULL,
	[Correo] [varchar](255) NULL,
	[Calle] [varchar](255) NULL,
	[NumeroExterior] [varchar](10) NULL,
	[NumeroInterior] [varchar](10) NULL,
	[idMunicipio] [int] NULL,
	[idEstado] [int] NULL,
	[idPais] [int] NULL,
	[Referencia] [varchar](500) NULL,
	[CodigoPostal] [varchar](5) NULL,
	[EsActivo] [bit] NULL,
	[FechaAlta] [datetime] NULL,
	[FechaMod] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbEmpresa]    Script Date: 13/02/2018 11:21:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbEmpresa](
	[idEmpresa] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](255) NULL,
	[RasonSocial] [varchar](255) NULL,
	[RFC] [varchar](12) NULL,
	[EsActivo] [bit] NULL,
	[FechaAlta] [datetime] NULL,
	[FechaMod] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbEspecificaciones]    Script Date: 13/02/2018 11:21:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbEspecificaciones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[Valor] [varchar](max) NOT NULL,
	[FechaAlta] [datetime2](7) NOT NULL,
	[FechaModificacion] [datetime2](7) NOT NULL,
	[EsActivo] [bit] NOT NULL,
	[IdUsuario] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Especificaciones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbEstado]    Script Date: 13/02/2018 11:21:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbEstado](
	[idEstado] [int] IDENTITY(1,1) NOT NULL,
	[idPais] [int] NULL,
	[Nombre] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[idEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbFactura]    Script Date: 13/02/2018 11:21:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbFactura](
	[idFactura] [int] IDENTITY(1,1) NOT NULL,
	[idEmpresa] [uniqueidentifier] NULL,
	[idSucursal] [int] NULL,
	[idCliente] [int] NULL,
	[Folio] [int] NULL,
	[FechaEmision] [datetime] NULL,
	[idMoneda] [int] NULL,
	[TipoCambio] [decimal](14, 4) NULL,
	[idFormaPago] [int] NULL,
	[idMetodoPago] [int] NULL,
	[SubTotal] [decimal](14, 4) NULL,
	[Descuento] [decimal](14, 4) NULL,
	[IVA] [decimal](14, 4) NULL,
	[ImpuestoTraslado] [decimal](14, 4) NULL,
	[ImpuestoRetenido] [decimal](14, 4) NULL,
	[Total] [decimal](14, 4) NULL,
	[FechaAlta] [datetime] NULL,
	[FechaMod] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbFormaPago]    Script Date: 13/02/2018 11:21:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbFormaPago](
	[idFormaPago] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[idFormaPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbMetodoPago]    Script Date: 13/02/2018 11:21:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbMetodoPago](
	[idMetodoPago] [int] IDENTITY(1,1) NOT NULL,
	[Clave] [varchar](3) NULL,
	[Nombre] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[idMetodoPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbMoneda]    Script Date: 13/02/2018 11:21:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbMoneda](
	[idMoneda] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](255) NULL,
	[ISO] [varchar](3) NULL,
	[Simbolo] [nvarchar](10) NULL,
	[TipoCambio] [decimal](14, 4) NULL,
PRIMARY KEY CLUSTERED 
(
	[idMoneda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbMunicipio]    Script Date: 13/02/2018 11:21:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbMunicipio](
	[idMunicipio] [int] IDENTITY(1,1) NOT NULL,
	[idEstado] [int] NULL,
	[Nombre] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[idMunicipio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbPais]    Script Date: 13/02/2018 11:21:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbPais](
	[idPais] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](255) NULL,
	[ISO] [varchar](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[idPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbRol]    Script Date: 13/02/2018 11:21:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbRol](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[FechaAlta] [datetime2](7) NOT NULL,
	[FechaModificacion] [datetime2](7) NOT NULL,
	[EsActivo] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbRolUsuario]    Script Date: 13/02/2018 11:21:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbRolUsuario](
	[IdUsuario] [int] NOT NULL,
	[IdRol] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbSucursal]    Script Date: 13/02/2018 11:21:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbSucursal](
	[idSucursal] [int] IDENTITY(1,1) NOT NULL,
	[idEmpresa] [uniqueidentifier] NULL,
	[Nombre] [varchar](255) NULL,
	[Calle] [varchar](255) NULL,
	[NumeroExterior] [varchar](10) NULL,
	[NumeroInterior] [varchar](10) NULL,
	[CodigoPostal] [varchar](5) NULL,
	[idEstado] [int] NULL,
	[idPais] [int] NULL,
	[Referencia] [varchar](500) NULL,
	[EsActivo] [bit] NULL,
	[FechaAlta] [datetime] NULL,
	[FechaMod] [datetime] NULL,
	[Municipio] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[idSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbUsuario]    Script Date: 13/02/2018 11:21:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbUsuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[PrimerApellido] [varchar](255) NOT NULL,
	[SegundoApellido] [varchar](255) NULL,
	[NumeroCelular] [varchar](255) NULL,
	[NombreUsuario] [varchar](255) NOT NULL,
	[Correo] [varchar](255) NOT NULL,
	[Contrasena] [varchar](255) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[FechaAlta] [datetime2](7) NULL,
	[FechaModificacion] [datetime2](7) NULL,
	[EsActivo] [bit] NULL,
	[HashContrasena] [varchar](1000) NULL,
	[idSucursal] [int] NULL,
	[idEmpresa] [uniqueidentifier] NULL,
 CONSTRAINT [PK_tbl_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbUsuarioCFDI]    Script Date: 13/02/2018 11:21:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbUsuarioCFDI](
	[idUsuarioCFDI] [int] IDENTITY(1,1) NOT NULL,
	[RFC] [varchar](13) NULL,
	[Nombre] [varchar](255) NULL,
	[PrimerApellido] [varchar](255) NULL,
	[SegundoApellido] [varchar](255) NULL,
	[Correo] [varchar](255) NULL,
	[Contrasena] [varchar](255) NULL,
	[Calle] [varchar](255) NULL,
	[NumeroExterior] [varchar](10) NULL,
	[NumeroInterior] [varchar](10) NULL,
	[CodigoPostal] [varchar](5) NULL,
	[idMunicipio] [int] NULL,
	[idEstado] [int] NULL,
	[idPais] [int] NULL,
	[Referencia] [varchar](500) NULL,
	[EsActivo] [bit] NULL,
	[FechaAlta] [datetime] NULL,
	[FechaMod] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idUsuarioCFDI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbEspecificaciones] ON 

INSERT [dbo].[tbEspecificaciones] ([Id], [Nombre], [Valor], [FechaAlta], [FechaModificacion], [EsActivo], [IdUsuario]) VALUES (2, N'Espec.Edad', N'19', CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), 1, 2)
INSERT [dbo].[tbEspecificaciones] ([Id], [Nombre], [Valor], [FechaAlta], [FechaModificacion], [EsActivo], [IdUsuario]) VALUES (3, N'Espec.Edad', N'18', CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), 1, 1)
INSERT [dbo].[tbEspecificaciones] ([Id], [Nombre], [Valor], [FechaAlta], [FechaModificacion], [EsActivo], [IdUsuario]) VALUES (4, N'Espec.Alias', N'gera', CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), 1, 2)
INSERT [dbo].[tbEspecificaciones] ([Id], [Nombre], [Valor], [FechaAlta], [FechaModificacion], [EsActivo], [IdUsuario]) VALUES (5, N'Espec.Alias', N'luisito', CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), 1, 1)
INSERT [dbo].[tbEspecificaciones] ([Id], [Nombre], [Valor], [FechaAlta], [FechaModificacion], [EsActivo], [IdUsuario]) VALUES (6, N'Espec.EmailAlterno', N'luisito@gmail.com', CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), 1, 1)
INSERT [dbo].[tbEspecificaciones] ([Id], [Nombre], [Valor], [FechaAlta], [FechaModificacion], [EsActivo], [IdUsuario]) VALUES (7, N'Espec.TelefonoAlterno', N'48722390', CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), 1, 1)
SET IDENTITY_INSERT [dbo].[tbEspecificaciones] OFF
SET IDENTITY_INSERT [dbo].[tbFormaPago] ON 

INSERT [dbo].[tbFormaPago] ([idFormaPago], [Nombre]) VALUES (1, N'Pago en una sola exhibición')
INSERT [dbo].[tbFormaPago] ([idFormaPago], [Nombre]) VALUES (2, N'Pago en parcialidades')
SET IDENTITY_INSERT [dbo].[tbFormaPago] OFF
SET IDENTITY_INSERT [dbo].[tbMetodoPago] ON 

INSERT [dbo].[tbMetodoPago] ([idMetodoPago], [Clave], [Nombre]) VALUES (1, N'01', N'Efectivo')
INSERT [dbo].[tbMetodoPago] ([idMetodoPago], [Clave], [Nombre]) VALUES (2, N'02', N'Cheque nominativo')
INSERT [dbo].[tbMetodoPago] ([idMetodoPago], [Clave], [Nombre]) VALUES (3, N'03', N'Transferencia electrónica de fondos')
INSERT [dbo].[tbMetodoPago] ([idMetodoPago], [Clave], [Nombre]) VALUES (4, N'04', N'Tarjeta de crédito')
INSERT [dbo].[tbMetodoPago] ([idMetodoPago], [Clave], [Nombre]) VALUES (5, N'05', N'Monedero electrónico')
INSERT [dbo].[tbMetodoPago] ([idMetodoPago], [Clave], [Nombre]) VALUES (6, N'06', N'Dinero electrónico')
INSERT [dbo].[tbMetodoPago] ([idMetodoPago], [Clave], [Nombre]) VALUES (7, N'08', N'Vales de despensa')
INSERT [dbo].[tbMetodoPago] ([idMetodoPago], [Clave], [Nombre]) VALUES (8, N'28', N'Tarjeta de debito')
INSERT [dbo].[tbMetodoPago] ([idMetodoPago], [Clave], [Nombre]) VALUES (9, N'29', N'Tarjeta de servicio')
INSERT [dbo].[tbMetodoPago] ([idMetodoPago], [Clave], [Nombre]) VALUES (10, N'99', N'Otros')
SET IDENTITY_INSERT [dbo].[tbMetodoPago] OFF
SET IDENTITY_INSERT [dbo].[tbMoneda] ON 

INSERT [dbo].[tbMoneda] ([idMoneda], [Nombre], [ISO], [Simbolo], [TipoCambio]) VALUES (1, N'Peso Mexicano', N'MXN', N'$', CAST(1.0000 AS Decimal(14, 4)))
INSERT [dbo].[tbMoneda] ([idMoneda], [Nombre], [ISO], [Simbolo], [TipoCambio]) VALUES (2, N'Dólar Estadounidense', N'USD', N'$', CAST(18.8815 AS Decimal(14, 4)))
SET IDENTITY_INSERT [dbo].[tbMoneda] OFF
SET IDENTITY_INSERT [dbo].[tbRol] ON 

INSERT [dbo].[tbRol] ([Id], [Nombre], [FechaAlta], [FechaModificacion], [EsActivo]) VALUES (1, N'Admin', CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[tbRol] ([Id], [Nombre], [FechaAlta], [FechaModificacion], [EsActivo]) VALUES (2, N'User', CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[tbRol] ([Id], [Nombre], [FechaAlta], [FechaModificacion], [EsActivo]) VALUES (3, N'Issuer', CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[tbRol] OFF
INSERT [dbo].[tbRolUsuario] ([IdUsuario], [IdRol]) VALUES (1, 1)
INSERT [dbo].[tbRolUsuario] ([IdUsuario], [IdRol]) VALUES (2, 2)
INSERT [dbo].[tbRolUsuario] ([IdUsuario], [IdRol]) VALUES (1, 3)
INSERT [dbo].[tbRolUsuario] ([IdUsuario], [IdRol]) VALUES (1, 2)
SET IDENTITY_INSERT [dbo].[tbUsuario] ON 

INSERT [dbo].[tbUsuario] ([Id], [Nombre], [PrimerApellido], [SegundoApellido], [NumeroCelular], [NombreUsuario], [Correo], [Contrasena], [FechaNacimiento], [FechaAlta], [FechaModificacion], [EsActivo], [HashContrasena], [idSucursal], [idEmpresa]) VALUES (1, N'Gerardo ', N'Sanchez', N'Hernandez', N'4875509482', N'yerald231ger', N'yerald231ger@gmail.com', N'ndsMTcbMokgzfmMTTN+s2Q==', CAST(N'2012-12-12' AS Date), CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), 1, NULL, NULL, NULL)
INSERT [dbo].[tbUsuario] ([Id], [Nombre], [PrimerApellido], [SegundoApellido], [NumeroCelular], [NombreUsuario], [Correo], [Contrasena], [FechaNacimiento], [FechaAlta], [FechaModificacion], [EsActivo], [HashContrasena], [idSucursal], [idEmpresa]) VALUES (2, N'Luis', N'Sanchez', N'Hernandez', N'8125660570', N'yerald231ger', N'yerald231luis@gmail.com', N'ndsMTcbMokgzfmMTTN+s2Q==', CAST(N'2012-12-12' AS Date), CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tbUsuario] OFF
ALTER TABLE [dbo].[tbCliente]  WITH CHECK ADD  CONSTRAINT [fk_tbCliente_tbEmpresa] FOREIGN KEY([idEmpresa])
REFERENCES [dbo].[tbEmpresa] ([idEmpresa])
GO
ALTER TABLE [dbo].[tbCliente] CHECK CONSTRAINT [fk_tbCliente_tbEmpresa]
GO
ALTER TABLE [dbo].[tbCliente]  WITH CHECK ADD  CONSTRAINT [fk_tbCliente_tbSucursal] FOREIGN KEY([idSucursal])
REFERENCES [dbo].[tbSucursal] ([idSucursal])
GO
ALTER TABLE [dbo].[tbCliente] CHECK CONSTRAINT [fk_tbCliente_tbSucursal]
GO
ALTER TABLE [dbo].[tbEspecificaciones]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Especificaciones_tbl_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[tbUsuario] ([Id])
GO
ALTER TABLE [dbo].[tbEspecificaciones] CHECK CONSTRAINT [FK_tbl_Especificaciones_tbl_Usuarios]
GO
ALTER TABLE [dbo].[tbEstado]  WITH CHECK ADD  CONSTRAINT [fk_tEstado_tbPais] FOREIGN KEY([idPais])
REFERENCES [dbo].[tbPais] ([idPais])
GO
ALTER TABLE [dbo].[tbEstado] CHECK CONSTRAINT [fk_tEstado_tbPais]
GO
ALTER TABLE [dbo].[tbFactura]  WITH CHECK ADD  CONSTRAINT [fk_tbFactura_tbCliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[tbCliente] ([idCliente])
GO
ALTER TABLE [dbo].[tbFactura] CHECK CONSTRAINT [fk_tbFactura_tbCliente]
GO
ALTER TABLE [dbo].[tbFactura]  WITH CHECK ADD  CONSTRAINT [fk_tbFactura_tbEmpresa] FOREIGN KEY([idEmpresa])
REFERENCES [dbo].[tbEmpresa] ([idEmpresa])
GO
ALTER TABLE [dbo].[tbFactura] CHECK CONSTRAINT [fk_tbFactura_tbEmpresa]
GO
ALTER TABLE [dbo].[tbFactura]  WITH CHECK ADD  CONSTRAINT [fk_tbFactura_tbFormaPago] FOREIGN KEY([idFormaPago])
REFERENCES [dbo].[tbFormaPago] ([idFormaPago])
GO
ALTER TABLE [dbo].[tbFactura] CHECK CONSTRAINT [fk_tbFactura_tbFormaPago]
GO
ALTER TABLE [dbo].[tbFactura]  WITH CHECK ADD  CONSTRAINT [fk_tbFactura_tbMetodoPago] FOREIGN KEY([idMetodoPago])
REFERENCES [dbo].[tbMetodoPago] ([idMetodoPago])
GO
ALTER TABLE [dbo].[tbFactura] CHECK CONSTRAINT [fk_tbFactura_tbMetodoPago]
GO
ALTER TABLE [dbo].[tbFactura]  WITH CHECK ADD  CONSTRAINT [fk_tbFactura_tbMoneda] FOREIGN KEY([idMoneda])
REFERENCES [dbo].[tbMoneda] ([idMoneda])
GO
ALTER TABLE [dbo].[tbFactura] CHECK CONSTRAINT [fk_tbFactura_tbMoneda]
GO
ALTER TABLE [dbo].[tbFactura]  WITH CHECK ADD  CONSTRAINT [fk_tbFactura_tbSucursal] FOREIGN KEY([idSucursal])
REFERENCES [dbo].[tbSucursal] ([idSucursal])
GO
ALTER TABLE [dbo].[tbFactura] CHECK CONSTRAINT [fk_tbFactura_tbSucursal]
GO
ALTER TABLE [dbo].[tbMunicipio]  WITH CHECK ADD  CONSTRAINT [fk_tbMunicipio_tbEstado] FOREIGN KEY([idEstado])
REFERENCES [dbo].[tbEstado] ([idEstado])
GO
ALTER TABLE [dbo].[tbMunicipio] CHECK CONSTRAINT [fk_tbMunicipio_tbEstado]
GO
ALTER TABLE [dbo].[tbRolUsuario]  WITH CHECK ADD  CONSTRAINT [FK_tbl_RolesUsuario_tbl_Roles] FOREIGN KEY([IdRol])
REFERENCES [dbo].[tbRol] ([Id])
GO
ALTER TABLE [dbo].[tbRolUsuario] CHECK CONSTRAINT [FK_tbl_RolesUsuario_tbl_Roles]
GO
ALTER TABLE [dbo].[tbRolUsuario]  WITH CHECK ADD  CONSTRAINT [FK_tbl_RolesUsuario_tbl_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[tbUsuario] ([Id])
GO
ALTER TABLE [dbo].[tbRolUsuario] CHECK CONSTRAINT [FK_tbl_RolesUsuario_tbl_Usuarios]
GO
ALTER TABLE [dbo].[tbUsuario]  WITH CHECK ADD  CONSTRAINT [fk_tbUsuario_tbEmpresa] FOREIGN KEY([idEmpresa])
REFERENCES [dbo].[tbEmpresa] ([idEmpresa])
GO
ALTER TABLE [dbo].[tbUsuario] CHECK CONSTRAINT [fk_tbUsuario_tbEmpresa]
GO
ALTER TABLE [dbo].[tbUsuario]  WITH CHECK ADD  CONSTRAINT [fk_tbUsuario_tbSucursal] FOREIGN KEY([idSucursal])
REFERENCES [dbo].[tbSucursal] ([idSucursal])
GO
ALTER TABLE [dbo].[tbUsuario] CHECK CONSTRAINT [fk_tbUsuario_tbSucursal]
GO
USE [master]
GO
ALTER DATABASE [dbCFDI] SET  READ_WRITE 
GO
