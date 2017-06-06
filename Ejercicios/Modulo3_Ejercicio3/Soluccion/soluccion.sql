/*
Crear la base de datos a partir del archivo Modulo1_Ejercicio1\Soluccion\sql\schema_and_data.sql y realizar las siguientes consultas
*/

--1. Realizar el comando para insertar una empresa y una oficina solo con los campos obligatorios con nombre comercial nuestro nombre (inventar el resto y DireccionCalleId = 1)
INSERT INTO Empresas(NombreComercial) VALUES ('Ignacio Lequerica');
INSERT INTO Oficinas(EmpresaId, DireccionCalleId, Numero, Latitud, Longitud) VALUEs (@@IDENTITY, 1, 1, 40.123123, 3.123123);

--2. Actualizar la empresa creada para ponerle el valor de la pagina web (A partir de nuestro NombreComercial)
UPDATE Empresa SET PaginaWeb = 'paginaweb.com' WHERE NombreComercial = 'Ignacio Lequerica'

--2. Borrar la empresa creada para ponerle el valor de la pagina web (A partir de nuestro NombreComercial)
DELETE FROM Empresa WHERE NombreComercial = 'Ignacio Lequerica'