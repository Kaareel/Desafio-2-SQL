CREATE DATABASE desafio2_Carlos_Venegas_997 

CREATE TABLE IF NOT EXISTS INSCRITOS(cantidad INT, fecha DATE, fuente VARCHAR);

INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 56, '01/01/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 99, '01/08/2021', 'Página' );

-- 1. ¿Cuántos registros hay?
SELECT COUNT(*) AS Total_Registros FROM Inscritos;

-- RESPUESTA :  16 

-- 2. ¿Cuántos inscritos hay en total?
SELECT sum(cantidad) AS total_Inscritos FROM inscritos;

-- RESPUESTA :  774 

-- 3. ¿Cuál o cuáles son los registros de mayor antigüedad?
SELECT * FROM Inscritos WHERE fecha = (SELECT MIN(DISTINCT(FECHA))FROM Inscritos);

--RESPUESTA : LOS DOS REGISTROS DE ENERO DE 2021

-- 4. ¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de ahora en adelante)
SELECT fecha, SUM(CANTIDAD)FROM Inscritos GROUP BY fecha ORDER BY fecha ASC;

/*RESPUESTA : 2021-01-01 = 100
              2021-02-01 = 120
              2021-03-01 = 103
              2021-04-01 =  93
              2021-05-01 =  88
              2021-06-01 =  30
              2021-07-01 =  58
              2021-08-01 = 182
*/

-- 5. ¿Cuántos inscritos hay por fuente?
SELECT fuente AS Fuente,  SUM(cantidad) as total FROM inscritos GROUP BY fuente; 

--RESPUESTA : página = 441, Blog = 333

-- 6. ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se inscribieron en ese día?
SELECT fecha, SUM(cantidad) AS total FROM inscritos GROUP BY fecha  ORDER BY total DESC LIMIT 1;
--RESPUESTA 1 : EL DIA QUE MAYOR MATRICULA TUVO FUE EL 1 DE AGOSTO DE 2021 Y SE ISCRIBIERON UN TOTAL DE 182 PERSONAS.  

-- 7. ¿Qué días se inscribieron la mayor cantidad de personas utilizando el blog y cuántas personas fueron?
SELECT * from INSCRITOS WHERE fuente = 'Blog' ORDER by cantidad DESC LIMIT 1;

--RESPUESTA 1 : EL DIA 01-08-2021 Y FUERON 83 PERSONAS


-- 8. ¿Cuántas personas en promedio se inscriben en un día?
SELECT ROUND(AVG(total)) FROM (SELECT fecha, SUM(cantidad) AS total FROM inscritos GROUP BY fecha ) as consultaPromedio; 
--RESPUESTA : EN PROMEDIO SE INSCRIBEN 97 PERSONAS. 

-- 9. ¿Qué días se inscribieron más de 50 personas?
SELECT fecha, SUM(cantidad) FROM inscritos GROUP BY fecha HAVING sum(cantidad) > 50;

/*RESPUESTA :  2021-02-01 = 120
               2021-08-01 = 182
               2021-05-01 =  88
               2021-04-01 =  93
               2021-07-01 =  58
               2021-03-01 = 103
               2021-01-01 = 100
*/

--10. ¿Cuántas personas se registraron en promedio cada día a partir del tercer día?
SELECT ROUND(AVG(total)) from (SELECT SUM(cantidad) as total FROM inscritos WHERE fecha >= '2021-01-03' GROUP BY fecha) as tercerDia

-- RESPUESTA: se registraron 92 personas en promedio