/*
Crear la base de datos a partir del archivo Modulo1_Ejercicio1\Soluccion\sql\schema_and_data.sql y realizar las siguientes consultas
*/

--NIVEL BASICO
--Obtener los Nombres Comerciales de empresas ordenados descendentemente
SELECT NombreComercial FROM Empresas ORDER BY NombreComercial DESC;

--Obtener los Contactos de las oficinas ordenados ascendentemente
SELECT Contacto FROM Oficinas ORDER BY Contacto ASC;

--Obtener el total de Oficinas
SELECT COUNT(*) FROM Oficinas;

--Obtener el total de Emails diferentes en Oficinas
SELECT COUNT(DISTINCT Email) FROM Oficinas;

--Obtener la media de facturación
SELECT AVG(Facturacion) FROM Empresas;

--Obtener la maxima facturación
SELECT MAX(Facturacion) FROM Empresas;

--Obtener la maxima facturación
SELECT MAX(Facturacion) FROM Empresas;



--NIVEL AVANZADO
--Obtener el total de oficinas agrupadas por el Nombre Comercial de empresas
SELECT (SELECT COUNT(*) FROM Oficinas o WHERE o.EmpresaId = e.EmpresaId) AS Total, e.NombreComercial FROM Empresas e GROUP BY e.NombreComercial, e.EmpresaId

--Obtener el total de oficinas agrupadas por el Nombre Comercial de empresas que tengan mas de 1
SELECT (SELECT COUNT(*) FROM Oficinas o WHERE o.EmpresaId = e.EmpresaId) AS Total, e.NombreComercial FROM Empresas e GROUP BY e.NombreComercial, e.EmpresaId HAVING (SELECT COUNT(*) FROM Oficinas o WHERE o.EmpresaId = e.EmpresaId) > 1

--Obtener la empresa con mayor facturación
SELECT TOP 1 FROM Empresas ORDER BY Facturacion DESC

--Obtener las actividades por empresa
SELECT COUNT(ae.ActividadId), a.Nombre FROM Actividades a INNER JOIN ActividadesEmpresas ae ON a.ActividadId = ae.ActividadId GROUP BY ae.ActividadId, a.Nombre

--Obtener las actividades por empresa mayores de 5
SELECT COUNT(ae.ActividadId), a.Nombre FROM Actividades a INNER JOIN ActividadesEmpresas ae ON a.ActividadId = ae.ActividadId GROUP BY ae.ActividadId, a.Nombre HAVING COUNT(ae.ActividadId) > 5

--Obtener las empresas con mas de 5 pedidos
SELECT e.NombreComercial FROM Empresas e WHERE (SELECT COUNT(*) FROM Pedidos p WHERE p.ClienteId = e.EmpresaId) > 5

--Obtener la dirección de la calle desde la que se hacen mas pedidos
SELECT TOP 1 Calle, COUNT(Calle) FROM DireccionCalles d INNER JOIN Oficinas o ON o.DireccionCalleId = d.DireccionCalleId
INNER JOIN Empresas e ON e.EmpresaId = o.EmpresaId INNER JOIN Pedidos p ON p.ClienteId = e.EmpresaId GROUP BY Calle ORDER BY COUNT(Calle) ASC

--Obtener la dirección de la calle desde la que se hacen menos pedidos
SELECT TOP 1 Calle, COUNT(Calle) FROM DireccionCalles d INNER JOIN Oficinas o ON o.DireccionCalleId = d.DireccionCalleId
INNER JOIN Empresas e ON e.EmpresaId = o.EmpresaId INNER JOIN Pedidos p ON p.ClienteId = e.EmpresaId GROUP BY Calle ORDER BY COUNT(Calle) DESC
