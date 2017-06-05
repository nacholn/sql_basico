/*
Crear a partir del diseño del ejercicio Modulo2_Ejercicio2 las relaciones FOREIGN KEY mediante comando sql
*/

--Crear relacion FK_ActividadesEmpresas_Actividades_ActividadId
ALTER TABLE ActividadesEmpresas  ADD  CONSTRAINT FK_ActividadesEmpresas_Actividades_ActividadId FOREIGN KEY(ActividadId)
REFERENCES Actividades(ActividadId);

--Crear relacion FK_ActividadesEmpresas_Empresas_EmpresaId
ALTER TABLE ActividadesEmpresas  ADD  CONSTRAINT FK_ActividadesEmpresas_Empresas_EmpresaId FOREIGN KEY(EmpresaId)
REFERENCES Empresas(EmpresaId);

--Crear relacion FK_Empresas_Clientes_EmpresaId
ALTER TABLE Empresas  ADD  CONSTRAINT FK_Empresas_Clientes_EmpresaId FOREIGN KEY(EmpresaId)
REFERENCES Clientes(ClienteId);

--Crear relacion FK_Oficinas_DireccionCalles_DireccionCalleId
ALTER TABLE Oficinas  ADD  CONSTRAINT FK_Oficinas_DireccionCalles_DireccionCalleId FOREIGN KEY(DireccionCalleId)
REFERENCES DireccionCalles(DireccionCalleId);

--Crear relacion FK_Oficinas_Empresas_EmpresaId
ALTER TABLE Oficinas  ADD  CONSTRAINT FK_Oficinas_Empresas_EmpresaId FOREIGN KEY(EmpresaId)
REFERENCES Empresas(EmpresaId);

--Crear relacion FK_OficinasFaxes_Oficinas_OficinaId
ALTER TABLE OficinasFaxes  ADD  CONSTRAINT FK_OficinasFaxes_Oficinas_OficinaId FOREIGN KEY(OficinaId)
REFERENCES Oficinas(OficinaId);

--Crear relacion FK_OficinasTelefonos_Oficinas_OficinaId
ALTER TABLE OficinasTelefonos  ADD  CONSTRAINT FK_OficinasTelefonos_Oficinas_OficinaId FOREIGN KEY(OficinaId)
REFERENCES Oficinas(OficinaId);

--Crear relacion FK_Pedidos_Clientes_ClienteId
ALTER TABLE Pedidos  ADD  CONSTRAINT FK_Pedidos_Clientes_ClienteId FOREIGN KEY(ClienteId)
REFERENCES Clientes(ClienteId);