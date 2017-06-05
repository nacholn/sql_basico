/*
Crear la base de datos a partir del archivo Modulo1_Ejercicio1\Soluccion\sql\schema_and_data.sql y realizar las siguientes consultas
*/

--Obtener los nombres de empresa
SELECT NombreComercial
FROM Empresas;

--Obtener todas las columnas de oficinas sin wildcard
SELECT OficinaId, EmpresaId, Numero, DireccionCalleId, Email, Contacto, Planta, Latitud, Longitud
FROM Oficinas;

--Obtener todas las columnas de oficinas con wildcard
SELECT *
FROM Oficinas;

--Obtener los distintos numeros de las oficinas
SELECT DISTINCT(Numero)
FROM Oficinas;

--Obtener el contacto con numero igual a 1
SELECT Contacto
FROM Oficinas
WHERE Numero = 1;

--Obtener el contacto con numero distinto a 1
SELECT Contacto
FROM Oficinas
WHERE Numero <> 1;


--Obtener el contacto que tenga email
SELECT Contacto
FROM Oficinas
WHERE Email IS NOT NULL;

--Obtener el contacto que tenga email y cuyo numero sea mayor que 100
SELECT Contacto
FROM Oficinas
WHERE Email IS NOT NULL AND Numero > 100;

--Obtener las calles que empiezen por C o que el tipo de calle sea CL
SELECT Calle
FROM DireccionCalles
WHERE Calle LIKE 'C%' OR TipoCalle = 'CL';

--Obtener los emails de las Oficinas que terminen en .com
SELECT Email
FROM Oficinas
WHERE Email LIKE '%.com';

--Obtener las referencias de los pedidos que se hayan realizado entre el 1 de Enero de 2015 y el 1 de Enero de 2017 utilizando BETWEEN
SELECT Referencia
FROM Pedidos
WHERE (FechaPedido BETWEEN '2015/01/01' AND '2017/01/01');

--Obtener las referencias de los pedidos que se hayan realizado entre el 1 de Enero de 2015 y el 1 de Enero de 2017 sin utilizar BETWEEN
SELECT Referencia
FROM Pedidos
WHERE FechaPedido >= '2016/01/01' AND FechaPedido <= '2018/01/01';