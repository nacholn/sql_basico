/*
Crear la base de datos a partir del archivo Modulo1_Ejercicio1\Soluccion\sql\schema_and_data.sql y realizar las siguientes consultas
*/



--NIVEL BASICO
--1. Obtener los Nombres Comerciales de empresas ordenados descendentemente
SELECT NombreComercial FROM Empresas ORDER BY NombreComercial DESC;

--2. Obtener los Contactos de las oficinas ordenados ascendentemente
SELECT Contacto FROM Oficinas ORDER BY Contacto ASC;

--3. Obtener el total de Oficinas
SELECT COUNT(*) FROM Oficinas;

--4. Obtener el total de Emails diferentes en Oficinas
SELECT COUNT(DISTINCT Email) FROM Oficinas;

--5. Obtener la media de facturación
SELECT AVG(Facturacion) FROM Empresas;

--6. Obtener la maxima facturación
SELECT MAX(Facturacion) FROM Empresas;

--7. Obtener la maxima facturación
SELECT MAX(Facturacion) FROM Empresas;

--8. Obtener el nombre de las Empresas y las Actividades
SELECT e.NombreComercial, a.Nombre FROM Empresas e INNER JOIN ActividadesEmpresas ae ON ae.EmpresaId = e.EmpresaId INNER JOIN Actividades a ON a.ActividadId = ae.ActividadId;

--NIVEL AVANZADO
--1. Obtener el total de oficinas agrupadas por el Nombre Comercial de empresas
SELECT (SELECT COUNT(*) FROM Oficinas o WHERE o.EmpresaId = e.EmpresaId) AS Total, e.NombreComercial FROM Empresas e GROUP BY e.NombreComercial, e.EmpresaId

--2. Obtener el total de oficinas agrupadas por el Nombre Comercial de empresas que tengan mas de 1
SELECT (SELECT COUNT(*) FROM Oficinas o WHERE o.EmpresaId = e.EmpresaId) AS Total, e.NombreComercial FROM Empresas e GROUP BY e.NombreComercial, e.EmpresaId HAVING (SELECT COUNT(*) FROM Oficinas o WHERE o.EmpresaId = e.EmpresaId) > 1

--3. Obtener la empresa con mayor facturación
SELECT TOP 1 FROM Empresas ORDER BY Facturacion DESC

--4. Obtener las actividades por empresa
SELECT COUNT(ae.ActividadId), a.Nombre FROM Actividades a INNER JOIN ActividadesEmpresas ae ON a.ActividadId = ae.ActividadId GROUP BY ae.ActividadId, a.Nombre

--5. Obtener las actividades por empresa mayores de 5
SELECT COUNT(ae.ActividadId), a.Nombre FROM Actividades a INNER JOIN ActividadesEmpresas ae ON a.ActividadId = ae.ActividadId GROUP BY ae.ActividadId, a.Nombre HAVING COUNT(ae.ActividadId) > 5

--6. Obtener las empresas con mas de 5 pedidos
SELECT e.NombreComercial FROM Empresas e WHERE (SELECT COUNT(*) FROM Pedidos p WHERE p.ClienteId = e.EmpresaId) > 5

--7. Obtener las empresas con pedidos superiores a 50.000 €
SELECT e.NombreComercial FROM Empresas e WHERE (SELECT SUM(Total) FROM Pedidos p WHERE p.ClienteId = e.EmpresaId) > 50000

--7. Obtener la dirección de la calle desde la que se hacen mas pedidos
SELECT TOP 1 Calle, COUNT(Calle) FROM DireccionCalles d INNER JOIN Oficinas o ON o.DireccionCalleId = d.DireccionCalleId
INNER JOIN Empresas e ON e.EmpresaId = o.EmpresaId INNER JOIN Pedidos p ON p.ClienteId = e.EmpresaId GROUP BY Calle ORDER BY COUNT(Calle) ASC

--8. Obtener la dirección de la calle desde la que se hacen menos pedidos
SELECT TOP 1 Calle, COUNT(Calle) FROM DireccionCalles d INNER JOIN Oficinas o ON o.DireccionCalleId = d.DireccionCalleId
INNER JOIN Empresas e ON e.EmpresaId = o.EmpresaId INNER JOIN Pedidos p ON p.ClienteId = e.EmpresaId GROUP BY Calle ORDER BY COUNT(Calle) DESC

--9. Obtener el total de los pedidos por empresa
SELECT SUM(p.Total) As Total, e.NombreComercial FROM Empresas e INNER JOIN Pedidos p ON p.ClienteId = e.EmpresaId GROUP BY e.NombreComercial;

--10. Obtener el total de los pedidos por empresa ordenados por el menor total al mayor
SELECT SUM(p.Total) As Total, e.NombreComercial FROM Empresas e INNER JOIN Pedidos p ON p.ClienteId = e.EmpresaId GROUP BY e.NombreComercial ORDER BY SUM(p.Total) DESC;

--11. Obtener la empresa con mayor total en el pedido (NO ANSI)
SELECT TOP 1 SUM(p.Total) As Total, e.NombreComercial FROM Empresas e INNER JOIN Pedidos p ON p.ClienteId = e.EmpresaId GROUP BY e.NombreComercial ORDER BY SUM(p.Total);