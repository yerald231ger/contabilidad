USE [dbCFDI]
GO
/****** Object:  Table [dbo].[tbl_Especificaciones]    Script Date: 09/02/2018 05:44:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Especificaciones](
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
/****** Object:  Table [dbo].[tbl_Roles]    Script Date: 09/02/2018 05:44:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Roles](
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
/****** Object:  Table [dbo].[tbl_RolesUsuario]    Script Date: 09/02/2018 05:44:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_RolesUsuario](
	[IdUsuario] [int] NOT NULL,
	[IdRol] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Usuarios]    Script Date: 09/02/2018 05:44:17 p. m. ******/
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
	[HashContrasena] [varchar](255) NOT NULL,
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
SET IDENTITY_INSERT [dbo].[tbl_Especificaciones] ON 
GO
INSERT [dbo].[tbl_Especificaciones] ([Id], [Nombre], [Valor], [FechaAlta], [FechaModificacion], [EsActivo], [IdUsuario]) VALUES (2, N'Espec.Edad', N'19', CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), 1, 2)
GO
INSERT [dbo].[tbl_Especificaciones] ([Id], [Nombre], [Valor], [FechaAlta], [FechaModificacion], [EsActivo], [IdUsuario]) VALUES (3, N'Espec.Edad', N'18', CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), 1, 1)
GO
INSERT [dbo].[tbl_Especificaciones] ([Id], [Nombre], [Valor], [FechaAlta], [FechaModificacion], [EsActivo], [IdUsuario]) VALUES (4, N'Espec.Alias', N'gera', CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), 1, 2)
GO
INSERT [dbo].[tbl_Especificaciones] ([Id], [Nombre], [Valor], [FechaAlta], [FechaModificacion], [EsActivo], [IdUsuario]) VALUES (5, N'Espec.Alias', N'luisito', CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), 1, 1)
GO
INSERT [dbo].[tbl_Especificaciones] ([Id], [Nombre], [Valor], [FechaAlta], [FechaModificacion], [EsActivo], [IdUsuario]) VALUES (6, N'Espec.EmailAlterno', N'luisito@gmail.com', CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), 1, 1)
GO
INSERT [dbo].[tbl_Especificaciones] ([Id], [Nombre], [Valor], [FechaAlta], [FechaModificacion], [EsActivo], [IdUsuario]) VALUES (7, N'Espec.TelefonoAlterno', N'48722390', CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), 1, 1)
GO
SET IDENTITY_INSERT [dbo].[tbl_Especificaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Roles] ON 
GO
INSERT [dbo].[tbl_Roles] ([Id], [Nombre], [FechaAlta], [FechaModificacion], [EsActivo]) VALUES (1, N'Admin', CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[tbl_Roles] ([Id], [Nombre], [FechaAlta], [FechaModificacion], [EsActivo]) VALUES (2, N'User', CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[tbl_Roles] ([Id], [Nombre], [FechaAlta], [FechaModificacion], [EsActivo]) VALUES (3, N'Issuer', CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), 1)
GO
SET IDENTITY_INSERT [dbo].[tbl_Roles] OFF
GO
INSERT [dbo].[tbl_RolesUsuario] ([IdUsuario], [IdRol]) VALUES (1, 1)
GO
INSERT [dbo].[tbl_RolesUsuario] ([IdUsuario], [IdRol]) VALUES (2, 2)
GO
INSERT [dbo].[tbl_RolesUsuario] ([IdUsuario], [IdRol]) VALUES (1, 3)
GO
INSERT [dbo].[tbl_RolesUsuario] ([IdUsuario], [IdRol]) VALUES (1, 2)
GO
SET IDENTITY_INSERT [dbo].[tbl_Usuarios] ON 
GO
INSERT [dbo].[tbl_Usuarios] ([Id], [Nombre], [PrimerApellido], [SegundoApellido], [NumeroCelular], [NombreUsuario], [Correo], [HashContrasena], [FechaNacimiento], [FechaAlta], [FechaModificacion], [EsActivo]) VALUES (1, N'Gerardo ', N'Sanchez', N'Hernandez', N'4875509482', N'yerald231ger', N'yerald231ger@gmail.com', N'ndsMTcbMokgzfmMTTN+s2Q==', CAST(N'2012-12-12' AS Date), CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[tbl_Usuarios] ([Id], [Nombre], [PrimerApellido], [SegundoApellido], [NumeroCelular], [NombreUsuario], [Correo], [HashContrasena], [FechaNacimiento], [FechaAlta], [FechaModificacion], [EsActivo]) VALUES (2, N'Luis', N'Sanchez', N'Hernandez', N'8125660570', N'yerald231ger', N'yerald231luis@gmail.com', N'ndsMTcbMokgzfmMTTN+s2Q==', CAST(N'2012-12-12' AS Date), CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), CAST(N'2012-12-12T00:00:00.0000000' AS DateTime2), 1)
GO
SET IDENTITY_INSERT [dbo].[tbl_Usuarios] OFF
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
