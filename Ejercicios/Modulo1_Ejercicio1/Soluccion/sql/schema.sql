USE [Experian]
GO
/****** Object:  Table [dbo].[Actividades]    Script Date: 06/06/2017 13:01:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actividades](
	[ActividadId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Actividades] PRIMARY KEY CLUSTERED 
(
	[ActividadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ActividadesEmpresas]    Script Date: 06/06/2017 13:01:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActividadesEmpresas](
	[ActividadEmpresaId] [int] IDENTITY(1,1) NOT NULL,
	[ActividadId] [int] NOT NULL,
	[EmpresaId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ActividadesEmpresas] PRIMARY KEY CLUSTERED 
(
	[ActividadEmpresaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 06/06/2017 13:01:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ClienteId] [int] NOT NULL,
	[CIF] [nvarchar](50) NOT NULL,
	[NumeroCuenta] [nvarchar](50) NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DireccionCalles]    Script Date: 06/06/2017 13:01:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DireccionCalles](
	[DireccionCalleId] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [nvarchar](max) NOT NULL,
	[Calle] [nvarchar](max) NOT NULL,
	[CodigoPostal] [nvarchar](max) NOT NULL,
	[Zona] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.DireccionCalles] PRIMARY KEY CLUSTERED 
(
	[DireccionCalleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Empresas]    Script Date: 06/06/2017 13:01:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresas](
	[EmpresaId] [int] IDENTITY(1,1) NOT NULL,
	[NombreComercial] [nvarchar](max) NOT NULL,
	[PaginaWeb] [nvarchar](max) NULL,
	[Facturacion] [decimal](18, 2) NULL,
 CONSTRAINT [PK_dbo.Empresas] PRIMARY KEY CLUSTERED 
(
	[EmpresaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Oficinas]    Script Date: 06/06/2017 13:01:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oficinas](
	[OficinaId] [int] IDENTITY(1,1) NOT NULL,
	[EmpresaId] [int] NOT NULL,
	[DireccionCalleId] [int] NOT NULL,
	[Numero] [nvarchar](max) NOT NULL,
	[Contacto] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Planta] [nvarchar](max) NULL,
	[Latitud] [decimal](10, 8) NOT NULL,
	[Longitud] [decimal](10, 8) NOT NULL,
 CONSTRAINT [PK_dbo.Oficinas] PRIMARY KEY CLUSTERED 
(
	[OficinaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OficinasFaxes]    Script Date: 06/06/2017 13:01:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OficinasFaxes](
	[FaxOficinaId] [int] IDENTITY(1,1) NOT NULL,
	[OficinaId] [int] NOT NULL,
	[Fax] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.OficinasFaxes] PRIMARY KEY CLUSTERED 
(
	[FaxOficinaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OficinasTelefonos]    Script Date: 06/06/2017 13:01:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OficinasTelefonos](
	[TelefonoOficinaId] [int] IDENTITY(1,1) NOT NULL,
	[OficinaId] [int] NOT NULL,
	[Telefono] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.OficinasTelefonos] PRIMARY KEY CLUSTERED 
(
	[TelefonoOficinaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 06/06/2017 13:01:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[PedidoId] [int] IDENTITY(1,1) NOT NULL,
	[ClienteId] [int] NOT NULL,
	[Referencia] [nvarchar](50) NOT NULL,
	[FechaPedido] [datetime] NOT NULL,
	[Total] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Pedidos] PRIMARY KEY CLUSTERED 
(
	[PedidoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[ActividadesEmpresas]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ActividadesEmpresas_dbo.Actividades_ActividadId] FOREIGN KEY([ActividadId])
REFERENCES [dbo].[Actividades] ([ActividadId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActividadesEmpresas] CHECK CONSTRAINT [FK_dbo.ActividadesEmpresas_dbo.Actividades_ActividadId]
GO
ALTER TABLE [dbo].[ActividadesEmpresas]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ActividadesEmpresas_dbo.Empresas_EmpresaId] FOREIGN KEY([EmpresaId])
REFERENCES [dbo].[Empresas] ([EmpresaId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActividadesEmpresas] CHECK CONSTRAINT [FK_dbo.ActividadesEmpresas_dbo.Empresas_EmpresaId]
GO
ALTER TABLE [dbo].[Empresas]  WITH NOCHECK ADD  CONSTRAINT [FK_Empresas_Clientes] FOREIGN KEY([EmpresaId])
REFERENCES [dbo].[Clientes] ([ClienteId])
GO
ALTER TABLE [dbo].[Empresas] NOCHECK CONSTRAINT [FK_Empresas_Clientes]
GO
ALTER TABLE [dbo].[Oficinas]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Oficinas_dbo.DireccionCalles_DireccionCalleId] FOREIGN KEY([DireccionCalleId])
REFERENCES [dbo].[DireccionCalles] ([DireccionCalleId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Oficinas] CHECK CONSTRAINT [FK_dbo.Oficinas_dbo.DireccionCalles_DireccionCalleId]
GO
ALTER TABLE [dbo].[Oficinas]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Oficinas_dbo.Empresas_EmpresaId] FOREIGN KEY([EmpresaId])
REFERENCES [dbo].[Empresas] ([EmpresaId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Oficinas] CHECK CONSTRAINT [FK_dbo.Oficinas_dbo.Empresas_EmpresaId]
GO
ALTER TABLE [dbo].[OficinasFaxes]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OficinasFaxes_dbo.Oficinas_OficinaId] FOREIGN KEY([OficinaId])
REFERENCES [dbo].[Oficinas] ([OficinaId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OficinasFaxes] CHECK CONSTRAINT [FK_dbo.OficinasFaxes_dbo.Oficinas_OficinaId]
GO
ALTER TABLE [dbo].[OficinasTelefonos]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OficinasTelefonos_dbo.Oficinas_OficinaId] FOREIGN KEY([OficinaId])
REFERENCES [dbo].[Oficinas] ([OficinaId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OficinasTelefonos] CHECK CONSTRAINT [FK_dbo.OficinasTelefonos_dbo.Oficinas_OficinaId]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Clientes] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Clientes] ([ClienteId])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Clientes]
GO
