USE [dbCFDI]
GO
/****** Object:  Table [dbo].[tbl_Especificaciones]    Script Date: 07/02/2018 09:31:35 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Especificaciones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](255) NOT NULL, 
	[FechaAlta] [datetime2](7) NOT NULL,
	[FechaModificaion] [datetime2](7) NOT NULL,
	[EsActivo] [bit] NOT NULL,
	[IdUsuario] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Especificaciones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Roles]    Script Date: 07/02/2018 09:31:35 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](255) NULL,
	[FechaAlta] [datetime2](7) NULL,
	[FechaModificacion] [datetime2](7) NULL,
	[EsActivo] [bit] NULL,
 CONSTRAINT [PK_tbl_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_RolesUsuario]    Script Date: 07/02/2018 09:31:35 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_RolesUsuario](
	[IdUsuario] [int] NOT NULL,
	[IdRol] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Usuarios]    Script Date: 07/02/2018 09:31:35 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Usuarios](
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
 CONSTRAINT [PK_tbl_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_Especificaciones]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Especificaciones_tbl_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[tbl_Usuarios] ([Id])
GO
ALTER TABLE [dbo].[tbl_Especificaciones] CHECK CONSTRAINT [FK_tbl_Especificaciones_tbl_Usuarios]
GO
ALTER TABLE [dbo].[tbl_RolesUsuario]  WITH CHECK ADD  CONSTRAINT [FK_tbl_RolesUsuario_tbl_Roles] FOREIGN KEY([IdRol])
REFERENCES [dbo].[tbl_Roles] ([Id])
GO
ALTER TABLE [dbo].[tbl_RolesUsuario] CHECK CONSTRAINT [FK_tbl_RolesUsuario_tbl_Roles]
GO
ALTER TABLE [dbo].[tbl_RolesUsuario]  WITH CHECK ADD  CONSTRAINT [FK_tbl_RolesUsuario_tbl_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[tbl_Usuarios] ([Id])
GO
ALTER TABLE [dbo].[tbl_RolesUsuario] CHECK CONSTRAINT [FK_tbl_RolesUsuario_tbl_Usuarios]
GO
