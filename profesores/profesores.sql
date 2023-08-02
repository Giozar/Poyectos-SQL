/*
Tarea y ejercicios
CORTAZAR DE LA CRUZ MANUEL GIOVANNI
213001368
• GENERE LA BD PROFESORES CON LAS SIGUIENTES TABLAS:
• PROFESOR
• CATEGORÍA
• DEPARTAMENTO
• ASISTE
• ESCRIBE
• CONGRESO
• ARTICULO
• LAS CUALES CORRESPONDEN A LA NORMALIZACIÓN DE LAS TABLAS QUE APARECEN EN EL ARCHIVO “BASE DE
DATOS PROFESORES PARA ALGEBRA RELACIONAL”. */

CREATE DATABASE profesores;
USE profesores;
SET SQL_SAFE_UPDATES = 0;

CREATE TABLE departamento (
    id_departamento INT AUTO_INCREMENT,
    nombre_departamento VARCHAR (50) NOT NULL DEFAULT "Mi departamento",
    PRIMARY KEY (id_departamento)
);

CREATE TABLE congreso (
    id_congreso INT AUTO_INCREMENT,
    nombre_congreso VARCHAR (50) NOT NULL,
    sede_congreso VARCHAR (25) NOT NULL,
    PRIMARY KEY (id_congreso)
);

create TABLE articulo (
    id_articulo INT AUTO_INCREMENT,
    titulo_articulo VARCHAR (50) NOT NULL,
    numPag_articulo int NOT NULL,
    PRIMARY KEY (id_articulo)
);


create table categoria (
    id_categoria INT AUTO_INCREMENT,
    nombre_categoria VARCHAR (50) NOT NULL,
    sueldo_categoria INT NOT NULL,
    PRIMARY KEY (id_categoria)
);

CREATE TABLE profesor (
    id_profesor INT AUTO_INCREMENT,
    numEco_profesor int not null,
    nombre_profesor VARCHAR(50) NOT NULL,
    edad_profesor INT NOT NULL,
    categoria_id_categoria int not null,
    departamento_id_departamento int not null,
    PRIMARY KEY (id_profesor),
    constraint fk_departamento_profesor foreign key (departamento_id_departamento) references departamento (id_departamento),
    constraint fk_categoria_profesor foreign key (categoria_id_categoria) references categoria (id_categoria)
);

create table asiste (
    id_asiste INT AUTO_INCREMENT,
    profesor_id_profesor int not null,
    congreso_id_congreso int not null,
    PRIMARY KEY (id_asiste),
    constraint fk_profesor_asiste foreign key (profesor_id_profesor) references profesor (id_profesor),
    constraint fk_congreso_asiste foreign key (congreso_id_congreso) references congreso (id_congreso)
);

create table escribe (
    id_escribe INT AUTO_INCREMENT,
    profesor_id_profesor int not null,
    articulo_id_articulo int not null,
    PRIMARY KEY (id_escribe),
    constraint fk_profesor_escribe foreign key (profesor_id_profesor) references profesor (id_profesor),
    constraint fk_articulo_escribe foreign key (articulo_id_articulo) references articulo (id_articulo)
);

/* insertar datos en departamento */
insert into departamento (nombre_departamento) values ("Diseño");
insert into departamento (nombre_departamento) values ("Matematica");
insert into departamento (nombre_departamento) values ("Sistemas");
insert into departamento (nombre_departamento) values ("Fisica");
insert into departamento (nombre_departamento) values ("Quimica");


/* insertar datos en congreso */
insert into congreso (nombre_congreso, sede_congreso) values ("ISWC", "Portuga");
insert into congreso (nombre_congreso, sede_congreso) values ("CIC", "USA");
insert into congreso (nombre_congreso, sede_congreso) values ("ROCC", "México");
insert into congreso (nombre_congreso, sede_congreso) values ("PLN", "España");
insert into congreso (nombre_congreso, sede_congreso) values ("SWEBIS", "México");


/* insertar datos en categoria */
insert into categoria (nombre_categoria, sueldo_categoria ) values ("Titular A", 15000); 
insert into categoria (nombre_categoria, sueldo_categoria ) values ("Titular B", 16000 );
insert into categoria (nombre_categoria, sueldo_categoria ) values ("Titular C", 22500 );
insert into categoria (nombre_categoria, sueldo_categoria ) values ("Titular D", 35500 );

/* insertar datos en profesor */
insert into profesor (numEco_profesor, nombre_profesor, edad_profesor, categoria_id_categoria, departamento_id_departamento) values (38574, "Hugo Estrada", 35, 1, 3);
insert into profesor (numEco_profesor, nombre_profesor, edad_profesor, categoria_id_categoria, departamento_id_departamento) values (12584, "Alicia Martínez", 38, 2, 2);
insert into profesor (numEco_profesor, nombre_profesor, edad_profesor, categoria_id_categoria, departamento_id_departamento) values (02584, "Máximo López", 39, 3, 3);
insert into profesor (numEco_profesor, nombre_profesor, edad_profesor, categoria_id_categoria, departamento_id_departamento) values (96473, "Noé Alejandro", 30, 1, 3);
insert into profesor (numEco_profesor, nombre_profesor, edad_profesor, categoria_id_categoria, departamento_id_departamento) values (39874, "Azucena Montes", 32, 1, 2);
insert into profesor (numEco_profesor, nombre_profesor, edad_profesor, categoria_id_categoria, departamento_id_departamento) values (25874, "Gabriel Serna", 33, 2,  2);
insert into profesor (numEco_profesor, nombre_profesor, edad_profesor, categoria_id_categoria, departamento_id_departamento) values (12566, "Andrea Fuentes", 34, 1, 1);
insert into profesor (numEco_profesor, nombre_profesor, edad_profesor, categoria_id_categoria, departamento_id_departamento) values (24987, "José Ruiz", 44, 3, 4);
insert into profesor (numEco_profesor, nombre_profesor, edad_profesor, categoria_id_categoria, departamento_id_departamento) values (24687, "Eignacio Flores", 42, 2, 1);

/* insertar datos en articulo */
insert into articulo (titulo_articulo, numPag_articulo) values ("Minería de datos en redes sociales", 11);
insert into articulo (titulo_articulo, numPag_articulo) values ("El futuro de Base de Datos", 6);
insert into articulo (titulo_articulo, numPag_articulo) values ("Algoritmos bioinspirados", 5);
insert into articulo (titulo_articulo, numPag_articulo) values ("Algoritmos genético", 12);
insert into articulo (titulo_articulo, numPag_articulo) values ("Redes neuronales", 4);
insert into articulo (titulo_articulo, numPag_articulo) values ("Modelo del cerebro humano", 7);

/* insertar datos en asiste */
insert into asiste (profesor_id_profesor, congreso_id_congreso) values (1, 1);
insert into asiste (profesor_id_profesor, congreso_id_congreso) values (2, 1);
insert into asiste (profesor_id_profesor, congreso_id_congreso) values (1, 2);
insert into asiste (profesor_id_profesor, congreso_id_congreso) values (2, 2);
insert into asiste (profesor_id_profesor, congreso_id_congreso) values (1, 3);
insert into asiste (profesor_id_profesor, congreso_id_congreso) values (1, 4);
insert into asiste (profesor_id_profesor, congreso_id_congreso) values (1, 5);

/* insertar datos en escribe */
insert into escribe (profesor_id_profesor, articulo_id_articulo) values (1, 1);
insert into escribe (profesor_id_profesor, articulo_id_articulo) values (1, 2);
insert into escribe (profesor_id_profesor, articulo_id_articulo) values (1, 3);
insert into escribe (profesor_id_profesor, articulo_id_articulo) values (2, 4);
insert into escribe (profesor_id_profesor, articulo_id_articulo) values (2, 5);
insert into escribe (profesor_id_profesor, articulo_id_articulo) values (4, 6);
insert into escribe (profesor_id_profesor, articulo_id_articulo) values (4, 1);
-- sesion 19
/* GUARDE EN UN ARCHIVO CON TODAS LAS SENTENCIAS NECESARIAS PARA:
1. NORMALICE SUS TABLAS A MODO DE QUE PROFESO Y CATEGORÍA SEAN DOS TABLAS
INDEPENDIENTES.
2. GENERE UNA COPIA DE LA TABLA CATEGORÍA LLAMADA CATEGORÍA2
3. MODIFIQUE TODOS LOS VALORES ASOCIADOS AL CAMPO SUELDO DE LA TABLA
CATEGORÍA2, DE MODO QUE:
1. TODOS LOS PROFESORES TITULAR A TENGAN SUELDO IGUAL A 10000
2. TODOS LOS PROFESORES TITULAR B TENGAN SUELDO IGUAL A 15000
3. TODOS LOS PROFESORES TITULAR C TENGAN SUELDO IGUAL A 20000 */

create table categoria2 (
    id_categoria INT AUTO_INCREMENT,
    nombre_categoria VARCHAR (50) NOT NULL,
    sueldo_categoria INT NOT NULL,
    PRIMARY KEY (id_categoria)
);

/* insertar datos en categoria2 */
insert into categoria2 (nombre_categoria, sueldo_categoria ) values ("Titular A", 15000); 
insert into categoria2 (nombre_categoria, sueldo_categoria ) values ("Titular B", 16000 );
insert into categoria2 (nombre_categoria, sueldo_categoria ) values ("Titular C", 22500 );
insert into categoria2 (nombre_categoria, sueldo_categoria ) values ("Titular D", 35500 );

/* Actualizar datos en categoria2 */
SET SQL_SAFE_UPDATES = 0;
update categoria2 set sueldo_categoria = 10000 where nombre_categoria = "Titular A";
update categoria2 set sueldo_categoria = 15000 where nombre_categoria = "Titular B";
update categoria2 set sueldo_categoria = 20000 where nombre_categoria = "Titular C";
SET SQL_SAFE_UPDATES = 1;

CREATE TABLE profesor2 (
    id_profesor INT AUTO_INCREMENT,
    numEco_profesor int not null,
    nombre_profesor VARCHAR(50) NOT NULL,
    edad_profesor INT NOT NULL,
    categoria_id_categoria int not null,
    departamento_id_departamento int not null,
    PRIMARY KEY (id_profesor),
    constraint fk_departamento_profesor2 foreign key (departamento_id_departamento) references departamento (id_departamento),
    constraint fk_categoria_profesor2 foreign key (categoria_id_categoria) references categoria (id_categoria)
);
-- elimnar campo departamento de la tabla profesor2
ALTER TABLE profesor2   
DROP CONSTRAINT fk_departamento_profesor2;  
alter table profesor2 drop column departamento_id_departamento;

/* GENERE UNA TABLA LLAMADA “ASISTENCIA” CON LAS SIGUIENTES CARACTERÍSTICAS:
1. ID_ASISTENCIA
2. PROFESOR_ID
3. FECHA → DATE
4. HORA → TIME */

create table asistencia (
    id_asistencia INT AUTO_INCREMENT,
    profesor_id_profesor int not null,
    fecha_asistencia DATE NOT NULL,
    hora_asistencia TIME NOT NULL,
    PRIMARY KEY (id_asistencia),
    constraint fk_profesor_asistencia foreign key (profesor_id_profesor) references profesor (id_profesor)
);

/* • INSERTE 25 REGISTROS PARA EL MISMO PROFESOR CON FECHAS ALEATORIAS ENTRE EL
01/01/2018 Y EL 31/05/2020 Y TIEMPOS ALEATORIOS ENTRE LAS 08:00 Y LAS 09:00 HRS-> */

insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (1, '2018-01-01', '08:00:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (2, '2018-02-02', '08:05:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (3, '2018-03-03', '08:10:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (4, '2018-04-04', '08:15:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (5, '2018-05-05', '08:20:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (6, '2018-06-06', '08:25:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (7, '2018-07-07', '08:30:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (8, '2018-08-08', '08:35:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (9, '2018-09-09', '08:40:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (1, '2018-10-10', '08:45:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (2, '2018-11-11', '08:50:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (3, '2018-12-12', '08:55:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (4, '2019-01-01', '09:00:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (5, '2019-02-02', '08:05:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (6, '2019-03-03', '08:10:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (7, '2019-04-04', '08:15:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (8, '2019-05-05', '08:20:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (9, '2019-06-06', '08:25:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (1, '2019-07-07', '08:30:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (2, '2019-08-08', '08:35:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (3, '2019-09-09', '08:40:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (4, '2019-10-10', '08:45:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (5, '2019-11-11', '08:50:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (6, '2019-12-12', '08:55:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (7, '2019-12-24', '09:00:00');
-- sesion 21
/* EN EL MISMO ARCHIVO INCLUYA LAS SENTENCIAS PARA :
• RECUPERE EL NOMBRE DE TODOS LOS PROFESORES QUE SON CATEGORIA 1
• RECUPERE EL ID DEL DEPARTAMENTO DE TODOS LOS PROFESORES QUE TIENEN NÚMERO ECONÓMICO QUE EMPIEZA CON 3
• LISTAR NOMBRE DE LOS ARTÍCULOS CON NÚMERO DE PÁGINAS ENTRE 6 Y 12.
• LISTAR NOMBRE DE LOS ARTÍCULOS CON NÚMERO DE PÁGINAS MAYOR A 6 Y QUE ADEMÁS CONTENGA LA PALABRA
“ALGORITMO” EN SU NOMBRE.
• LISTAR NOMBRE DE PROFESORES CUYO NOMBRE NO INICIE CON VOCAL MAYÚSCULA O MINÚSCULA, PERO QUE SU
SEGUNDA LETRA SI SEA VOCAL.
• LISTAR NOMBRE Y SEDE DE LOS CONGRESOS QUE EL NOMBRE DE LA SEDE INICIE CON CONSONANTE, SEGUIDO DE
CUALQUIER CARÁCTER Y DESPUÉS UNA LETRA “X”.
• LISTAR EL ID DE LOS PROFESORES QUE ASITIERON ENTRE EL MES DE MARZO Y EL MES DE SEPTIEMBRE DE 2018 */

select nombre_profesor from profesor where categoria_id_categoria = 1;
select departamento_id_departamento from profesor where numEco_profesor like '3%';
select titulo_articulo from articulo where numPag_articulo between 6 and 12;
select titulo_articulo from articulo where numPag_articulo > 6 and titulo_articulo like '%ALGORITMO%';
select nombre_profesor from profesor where nombre_profesor not regexp '^[AEIOU]' and nombre_profesor regexp '^.[AEIOU]' ;
select nombre_congreso, sede_congreso from congreso where sede_congreso not regexp '^[AEIOU]' and sede_congreso regexp '^..x';
select profesor_id_profesor from asistencia where fecha_asistencia regexp '^2018-0[3-9]';
/* • LISTAR LOS NOMBRES DE TODOS LOS DEPARTAMENTOS.
• MOSTRAR TODA LA INFORMACIÓN DE LOS PROFESORES QUE TENGAN CATEGORÍA 1 DEL
DEPARTAMENTO D3.
• MOSTRAR NOMBRE Y CATEGORÍA DE PROFESORES MAYORES A 35 AÑOS
• MOSTRAR NOMBRE Y EDAD DE PROFESORES CON SUELDO SUPERIOR A 20,000 QUE SEAN
MAYORES A 40 AÑOS Y CON CATEGORÍA 3.
• MOSTRAR EL NÚMERO ECONÓMICO Y NOMBRE DE LOS PROFESORES CON SUELDO MAYOR A
15000 QUE NO SEAN CATEGORÍA 1.
• LOCALIZAR LOS ID_PROF DE LOS PROFESORES QUE HAN ASISTIDO A CONGRESOS. */
select nombre_departamento from departamento;
select nombre_profesor from profesor where categoria_id_categoria = 1 and departamento_id_departamento = 3;
select nombre_profesor, categoria_id_categoria from profesor where edad_profesor > 35;
select id_profesor, nombre_profesor, edad_profesor from profesor where edad_profesor > 40 and categoria_id_categoria = 3;
select numEco_profesor, nombre_profesor from profesor where categoria_id_categoria != 1;
select profesor_id_profesor from asiste group by profesor_id_profesor;
-- sesion 22
/* REALICE LAS SIGUIENTES CONSULTAS:
• LA EDAD MAYOR Y MENOR DE TODOS LOS PROFESORES.
• PROMEDIO DE EDADES DE PROFESORES CON APELLIDO “LÓPEZ”
• MOSTRAR NOMBRE DE LOS ARTÍCULOS CON NÚMERO DE PÁGINAS ENTRE 6 Y 12.
• MOSTRAR NOMBRE DE LOS ARTÍCULOS CON NÚMERO DE PÁGINAS MAYOR A 6 Y QUE ADEMÁS
CONTENGA LA PALABRA “DATOS” EN SU NOMBRE; DATOS PUEDE INICIAR CON MAYÚSCULA O
MINÚSCULA.
• MOSTRAR NOMBRE E ID DEPARTAMENTO DE PROFESORES CUYO NOMBRE NO INICIE CON VOCAL
MAYÚSCULA O MINÚSCULA, PERO QUE SU SEGUNDA LETRA SI SEA VOCAL MINÚSCULA.
• MOSTRAR NOMBRE Y SEDE DE LOS CONGRESOS QUE EL NOMBRE DE LA SEDE INICIE CON
CONSONANTE, SEGUIDO DE CUALQUIER CARÁCTER Y DESPUÉS UNA LETRA “X” */
select max(edad_profesor) from profesor;
select min(edad_profesor) from profesor;
select avg(edad_profesor) from profesor where nombre_profesor like '%LOPEZ%';
select titulo_articulo from articulo where numPag_articulo between 6 and 12;
select titulo_articulo from articulo where numPag_articulo > 6 and titulo_articulo like '%DATOS%'; 
select nombre_profesor, departamento_id_departamento from profesor where nombre_profesor not regexp '^[AEIOU]' and nombre_profesor regexp '^.[aeiou]';
select nombre_congreso, sede_congreso from congreso where sede_congreso not regexp '^[AEIOU]' and sede_congreso regexp '^..X';

/* GENERE UNA TABLA LLAMADA “PROFESOR_BACKUP” COMO UNA COPIA EXACTA DE OTRA
• GENERE TODOS LOS COMANDOS DDL NECESARIOS PARA ELLO
• INSERTE TODOS LOS REGISTROS DE LA TABLA “PROFESOR” EN LA “TABLA PROFESOR_BACKUP” CUYA
CATEGORÍA SEA LA DE UN TITULAR C (3)
• MODIFIQUE LA TABLA “PROFESOR_BACKUP” AGREGANDO UN CAMPO ADICIONAL A ESTA EN EL QUE SE
INDIQUE EL TIEMPO DE DEDICACIÓN DE UN PROFESOR (TIEMPO COMPLETO O TIEMPO PARCIAL)
• AGREGUE UN REGISTRO A LA TABLA PROFESOR_BACKUP LLAMADO “BRENDA ESPARSA”, NUM_ECO
99999, EDAD 30, CATEGORÍA 4 (TITULAR D, SUELDO 40000), DEPARTAMENTO 2 Y TIEMPO COMPLETO
• MODIFIQUE TODOS LOS REGISTROS DE LA TABLA PROFESOR_BACKUP CUYA EDAD SEA MENOR A 40 Y
ASÍGNELES EN EL CAMPO DEDICACIÓN TIEMPO COMPLETO Y AL RESTO TIEMPO PARCIAL.
• RECUPERE TODOS LO PROFESORES DE LA TABLA PROFESOR_BACKUP QUE SU NOMBRE EMPIECE CON
DOS CONSONANTES 6 */

create table profesor_backup (
    id_profesor INT AUTO_INCREMENT,
    numEco_profesor int not null,
    nombre_profesor VARCHAR(50) NOT NULL,
    edad_profesor INT NOT NULL,
    categoria_id_categoria int not null,
    departamento_id_departamento int not null,
    dedicacion_profesor VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_profesor),
    constraint fk_departamento_profesor_backup foreign key (departamento_id_departamento) references departamento (id_departamento),
    constraint fk_categoria_profesor_backup foreign key (categoria_id_categoria) references categoria (id_categoria)
);



-- sesion 23
/* • EXTRAER NOMBRE DEL PROFESOR QUE TRABAJAN EN EL DEPARTAMENTO DE SISTEMAS.
• MOSTRAR LOS NOMBRES DE LOS PROFESORES QUE HAN ASISTIDO A CONGRESO Y EL
NOMBRE DEL CONGRESO AL QUE ASISTIERON.
• EXTRAER EL NOMBRE Y SUELDO DE LOS PROFESORES QUE HAN ESCRITO ARTÍCULOS
EXTENSOS, ES DECIR, CON MÁS DE 10 PÁGINAS.
• NOMBRE DE LOS ARTÍCULOS QUE FUERON ESCRITOS POR PROFESORES QUE
PERTENECEN AL DEPARTAMENTO DE MATEMÁTICAS, ADEMÁS HAN ASISTIDO AL
CONGRESO LLAMADO ISWC.
• NOMBRE DE LOS ARTÍCULOS QUE FUERON ESCRITOS POR PROFESORES QUE
PERTENECEN AL DEPARTAMENTO DE MATEMÁTICAS, ADEMÁS HAN ASISTIDO AL
CONGRESO LLAMADO ISWC
• MOSTRAR EL NOMBRE DE TODOS LOS PROFESORES QUE HAN ESCRITO AL MENOS UN
ARTÍCULO 
. */
select nombre_profesor from profesor, departamento where profesor.departamento_id_departamento = departamento.id_departamento and nombre_departamento = 'SISTEMAS';
select nombre_profesor, nombre_congreso from profesor, asiste, congreso where profesor.id_profesor = asiste.profesor_id_profesor and congreso.id_congreso = asiste.congreso_id_congreso;
select nombre_profesor, sueldo_categoria from profesor, categoria, escribe, articulo where profesor.id_profesor = escribe.profesor_id_profesor and escribe.articulo_id_articulo = articulo.id_articulo and numPag_articulo > 10 and profesor.categoria_id_categoria = categoria.id_categoria;
select titulo_articulo from profesor inner join asiste on profesor.id_profesor = asiste.profesor_id_profesor inner join congreso on congreso.id_congreso = asiste.congreso_id_congreso and congreso.nombre_congreso = 'ISWC' inner join departamento on departamento_id_departamento = id_departamento and id_departamento = 2 inner join escribe on profesor.id_profesor = escribe.profesor_id_profesor inner join articulo on escribe.articulo_id_articulo = articulo.id_articulo; 
select nombre_profesor from profesor inner join escribe on profesor.id_profesor = escribe.profesor_id_profesor inner join articulo on escribe.articulo_id_articulo = articulo.id_articulo group by nombre_profesor;
/* • MOSTRAR EL NOMBRE DE TODOS LOS PROFESORES QUE NO TIENE
RETARDOS
• MOSTRAR EL NOMBRE DE LOS DEPARTAMENTOS CON AL MENOS UN
PROFESOR EN ÉL
• RECUPERAR EL NOMBRE Y SUELDO DE LOS PROFESORES QUE LLEGAN
TARDE */
select nombre_profesor from profesor inner join asistencia where hora_asistencia < '08:30:00' group by nombre_profesor;
select nombre_departamento from departamento inner join profesor on profesor.departamento_id_departamento = departamento.id_departamento where profesor.id_profesor not in (select profesor_id_profesor from asistencia where hora_asistencia > '08:30:00') group by nombre_departamento;
select nombre_profesor from profesor inner join asistencia on hora_asistencia < '08:30:00' inner join categoria group by nombre_profesor;

/* 
• RECUPERAR EL ID DE LOS PROFESORES QUE NO TIENEN RETARDOS, ES DECIR, AQUELLOS
PROFESORES QUE SIEMPRE HAN LLEGADO ANTES DE LAS 08:30 HRS
• RECUPERAR EL ID DE LOS PROFESORES QUE ASISTIERON EL DÍA 31/DIC/2018
• RECUPERAR TODAS LAS HORAS DE ENTRADA ASOCIADAS AL PROFESOR CON ID=15 */
select id_profesor from profesor where id_profesor not in (select profesor_id_profesor from asistencia where hora_asistencia > '08:30:00');
select id_profesor from profesor where id_profesor not in (select profesor_id_profesor from asistencia where fecha_asistencia = '2018-12-31');
select hora_asistencia from asistencia where profesor_id_profesor = 15;

-- sesion 24
/* • AGREGUE UN REGISTRO EN LA TABLA CONGRESO CON LOS SIGUIENTES DATOS:
• NOMBRE: WIMOB
• SEDE: FRANCIA
• AGREGUE UN REGISTRO POR CADA PROFESOR “TITULAR C” EN LA TABLA ASISTE
CON EL CONGRESO CREADO EN EL PUNTO ANTERIOR
• MUESTRE EL NOMBRE DEL PROFESOR, DEPARTAMENTO Y NOMBRE DEL CONGRESO
• RECUPERE EL NOMBRE DE TODOS LOS ARTÍCULOS QUE SE HAN ESCRITO POR LOS
PROFESORES DEL DEPARTAMENTO DE “MATEMÁTICAS” */
insert into congreso (nombre_congreso, sede_congreso) values ('WIMOB', 'FRANCIA');
insert into asiste (profesor_id_profesor, congreso_id_congreso) values (1, 6);
/* • RECUPERE EL NOMBRE Y NOMBRE DE DEPARTAMENTO DE TODOS LOS
PROFESORES QUE HAN ESCRITO ARTÍCULOS RELACIONADOS CON
“ALGORITMOS” EN GENERAL
• RECUPERE EL NOMBRE , DEPARTAMENTO Y CATEGORÍA DE CADA
PROFESOR QUE HAYA LLEGADO ENTRE LAS 08:00 Y 08:30 AL MENOS UNA
VEZ
• RECUPERE EL NOMBRE , DEPARTAMENTO, CATEGORÍA, FECHA Y HORA
PARA CADA PROFESOR, CONSIDERANDO QUE SE DEBE DEVOLVER EL
REGISTRO QUE SE TENGA PARA CADA PROFESOR CON MAYOR HORA DE
ENTRADA SIN IMPORTAR LA FECHA. */
select nombre_departamento from(select * from profesor inner join escribe on profesor.id_profesor = escribe.profesor_id_profesor inner join articulo on escribe.articulo_id_articulo = articulo.id_articulo where titulo_articulo like '%ALGORITMOS%') as A inner join departamento on departamento_id_departamento = id_departamento;
select nombre_profesor, nombre_departamento, fecha_asistencia, hora_asistencia, categoria_id_categoria, nombre_categoria from profesor inner join asistencia on hora_asistencia > '08:00:00' and hora_asistencia < '08:30:00' and id_profesor = profesor_id_profesor inner join departamento on id_departamento = departamento_id_departamento inner join categoria on categoria_id_categoria = id_categoria;
select nombre_profesor, nombre_departamento, nombre_categoria, fecha_asistencia, hora_asistencia  from profesor inner join departamento on profesor.departamento_id_departamento = departamento.id_departamento inner join categoria on profesor.categoria_id_categoria = categoria.id_categoria inner join asistencia on asistencia.profesor_id_profesor = profesor.id_profesor;
/* • VERIFIQUE EL RESULTADO DE LAS SIGUIENTES CONSULTAS:
• SELECT * FROM (PROFESOR P INNER JOIN DEPARTAMENTO D ON P.IDDEPTO =
D.IDDEPARTAMENTO) INNER JOIN ASISTE A ON P.IDPROFESOR=A.PROFIDPROF;
• SELECT * FROM (PROFESOR P INNER JOIN DEPARTAMENTO D ON P.IDDEPTO =
D.IDDEPARTAMENTO ) LEFT JOIN ASISTE A ON P.IDPROFESOR=A.PROFIDPROF;
• AGREGUE LAS SENTENCIAS EN SU ARCHIVO SQL Y AGREGUE LAS
RESPUESTAS A LAS SIGUIENTES PREGUNTAS:
• ¿QUÉ SUCEDIÓ?
-- note unda didrencia al sellecionar los datos, sobre todo en el apartado de los profesfores
• ¿CUÁL ES LA DIFERENCIA ENTRE UNA Y OTRA? */
-- note que en una hay profesores que no estaba en la anterior e igual en el nombre de departamentos
SELECT * FROM (profesor P INNER JOIN departamento D ON P.departamento_id_departamento = D.id_departamento) INNER JOIN asiste A ON P.id_profesor=A.profesor_id_profesor;
SELECT * FROM (profesor P INNER JOIN departamento D ON P.departamento_id_departamento = D.id_departamento ) LEFT JOIN asiste A ON P.id_profesor=A.profesor_id_profesor;
-- sesion 25
/* • CONSIDERE LA BD PROFESORES
• ¿CUÁL SERÍA LA SENTENCIA CORRECTA PARA ACTUALIZAR EL SUELDO DE
TODOS LOS PROFESORES DEL DEPARTAMENTO 1 A 15000?
• INSERTE 5 PROFESORES CON CATEGORÍA D Y SUELDO > 30000
• GENERE LA SENTENCIA SQL PARA OBTENER EL ID DEL PROFESOR QUE
TIENE EL MAYOR SUELDO
• ACTUALICE EL SUELDO DE TODOS LOS PROFESORES DEL DEPARTAMENTO
DE SISTEMAS A 50000 */
SET SQL_SAFE_UPDATES = 0;
update categoria inner join profesor set sueldo_categoria = 15000 where departamento_id_departamento = 1;
insert into profesor (numEco_profesor, nombre_profesor, edad_profesor, categoria_id_categoria, departamento_id_departamento) values (12365, "Raul Danilo", 32, 4, 1);
insert into profesor (numEco_profesor, nombre_profesor, edad_profesor, categoria_id_categoria, departamento_id_departamento) values (25682, "Jorge Sanchez", 22, 4, 2);
insert into profesor (numEco_profesor, nombre_profesor, edad_profesor, categoria_id_categoria, departamento_id_departamento) values (69854, "Emilio Rodriguez", 42, 4, 3);
insert into profesor (numEco_profesor, nombre_profesor, edad_profesor, categoria_id_categoria, departamento_id_departamento) values (3254,  "SaulAlvarez", 31, 4, 4);
insert into profesor (numEco_profesor, nombre_profesor, edad_profesor, categoria_id_categoria, departamento_id_departamento) values (78965, "Pedro Flores", 62, 4, 4);
select nombre_profesor, id_profesor from profesor inner join categoria on categoria_id_categoria = id_categoria order by sueldo_categoria limit 1;
update categoria inner join profesor set sueldo_categoria = 50000 where departamento_id_departamento = 3;



-- sesion 26
/* • AGREGUE LAS SIGUIENTES CATEGORÍAS: “ASOCIADO A, ASOCIADO B, ASOCIADO C Y ASOCIADO D”, CON LOS SUELDOS
“10000,12000,14000,16000”.
• AGREGUE 5 REGISTROS EN LA TABLA PROFESOR PARA CADA UNA DE LAS CATEGORÍAS CREADAS

• CREAR UNA FUNCIÓN QUE DEVUELVA EL ID DE UN DEPARTAMENTO CON BASE EN SU NOMBRE Y UNA PARA OBTENER EL
ID DE LA CATEGORÍA CON BASE EN SU NOMBRE */
insert into categoria (nombre_categoria, sueldo_categoria ) values ('ASOCIADO A', 10000);
insert into categoria (nombre_categoria, sueldo_categoria ) values ('ASOCIADO B', 12000);
insert into categoria (nombre_categoria, sueldo_categoria ) values ('ASOCIADO C', 14000);
insert into categoria (nombre_categoria, sueldo_categoria ) values ('ASOCIADO D', 16000);
insert into profesor (numEco_profesor, nombre_profesor, edad_profesor, categoria_id_categoria, departamento_id_departamento) values (15684, "Perla Fuentes", 42, 4, 4);
insert into profesor (numEco_profesor, nombre_profesor, edad_profesor, categoria_id_categoria, departamento_id_departamento) values (56212, "Rodolfo El Reno", 41, 6, 5);
insert into profesor (numEco_profesor, nombre_profesor, edad_profesor, categoria_id_categoria, departamento_id_departamento) values (82684, "Yepeto Madera", 35, 5, 3);
insert into profesor (numEco_profesor, nombre_profesor, edad_profesor, categoria_id_categoria, departamento_id_departamento) values (95134, "Rosa Melano", 29, 7, 2);

/* • CREAR UNA VISTA DE LA TABLA PROFESOR PARA CADA CATEGORÍA EXISTENTE, DE MODO QUE CADA VISTA CONTENGA
UNA CATEGORÍA DE PROFESORES (TITULAR, ASOCIADO) */
create view titularAsociado as select nombre_profesor as TITULAR, nombre_categoria as ASOCIADO from profesor inner join categoria on profesor.categoria_id_categoria = categoria.id_categoria where categoria.nombre_categoria like '%ASOCIADO%'; 

/* • CREAR UN PROCEDIMIENTO ALMACENADO LLAMADO INSERTA_PROFESOR QUE RECIBA LOS
SIGUIENTES DATOS DE UN PROFESOR Y QUE LOS INSERTE EN LA BD:
• NUM_ECO
• NOMBRE
• EDAD
• NOMBRE_DEPARTAMENTO
• NOMBRE_CATEGORIA */
delimiter //
create procedure inserta_profesor(in numEco_profesor int, in nombre_profesor varchar(50), in edad_profesor int, in categoria_id_categoria int, in ndepartamento_id_departamento int)
begin
    insert into profesor (numEco_profesor, nombre_profesor, edad_profesor, departamento_id_departamento, categoria_id_categoria) values (numEco_profesor, nombre_profesor, edad_profesor, categoria_id_categoria, departamento_id_departamento);
    select categoria_id_categoria, departamento_id_departamento from profesor where numEco_profesor = numEco_profesor;
END //
delimiter ;


-- sesion 27
/* • TOMANDO SU BASE DE DATOS PROFESOR:
1. INSERTE AL MENOS DOS PROFESORES UTILIZANDO SU PROCEDIMIENTO ALMACENADO
INTENTE QUE SU PROCEDIMIENTO UTILICE LAS FUNCIONES DEFINIDAS PARA OBTENER EL ID DE LA
CATEGORÍA Y EL ID DEL DEPARTAMENTO ¿QUÉ RESULTADO OBTUVO? ¿ES POSIBLE? */
call inserta_profesor(56284, 'Alan Brito Delgado', 22, 4, 3);
call inserta_profesor(82684, 'Elsa Banon', 42, 2, 6);

/* • TOMANDO SU BASE DE DATOS PROFESOR:
1. INSERTE AL MENOS DOS CONGRESOS CON SEDE EN MÉXICO
2. GENERE LA VISTA DE TODAS LOS CONGRESOS REALIZADAS EN MÉXICO, LA CUAL SE LLAMARÁ
MEX_CONG
3. GENERE LA VISTA DE TODOS LOS CONGRESOS QUE EMPIEZAN CON UNA VOCAL, LLAMADA
CONG_VOCAL
4. GENERE UN PROCEDIMIENTO ALMACENADO QUE PERMITA INSERTAR UN REGISTRO EN LA TABLA
DEPARTAMENTO, PASANDO COMO ARGUMENTO EL NOMBRE DEL DEPARTAMENTO  */
insert into congreso (nombre_congreso, sede_congreso) values ("BCSPN", "México");
insert into congreso (nombre_congreso, sede_congreso) values ("MANBDS", "México");
create view mex_cong as select * from congreso where sede_congreso like '%Mexico%'; 
create view cong_vocal as select * from congreso where nombre_congreso regexp '^[aeiou]';

delimiter //
create procedure insertar_departamento(nombre_departamento varchar (50))
begin
	insert into departamento (nombre_departamento) values (nombre_departamento);
END //
delimiter ;

call insertar_departamento('Idiomas');
call insertar_departamento('Medicina');
/* 5. GENERE UNA TABLA QUE SE LLAME LOG_PROFESOR, LA CUAL CONTENDRÁ:
1. LOG_PROFESOR_ID
2. USUARIO (VARCHAR)
3. FECHA (DATETIME)
4. NUMREGISTRO
5. CATEGO ANTERIOR
6. CATEGO POSTERIOR
6. GENERE UN TRIGGER QUE AL MODIFICAR EL CAMPO CATEGORIA DE LA TABLA PROFESOR, INSERTE UN REGISTRO EN LA TABLA
LOG_PROFESOR CON EL NOMBRE DE USUARIO QUE REALIZÓ LA CONSULTA Y LA FECHA ACTUAL
PARA EL ÚLTIMO PUNTO CONSIDERE UTILIZAR LAS FUNCIONES CURRENT_USER() Y NOW() DE MYSQL */
create table log_profesor (
    log_profesor_id int primary key auto_increment, 
    usuario varchar(50), 
    fecha datetime, 
    numEco_profesor int, 
    categoria_id_categoria int, 
    categoria_id_categoria_nueva int);

DELIMITER //
CREATE TRIGGER modificar after update on profesor 
FOR EACH ROW
	BEGIN
        insert into log_profesor (usuario, fecha, numEco_profesor, categoria_id_categoria, categoria_id_categoria_nueva) values (current_user(), now(), old.numEco_profesor, old.categoria_id_categoria, new.categoria_id_categoria);
	END//
DELIMITER ;
SET SQL_SAFE_UPDATES = 0;
update profesor set categoria_id_categoria = 2 where numEco_profesor = 56284;







