-- sesion 19
/* • GENERE LA BD PROFESORES CON LAS SIGUIENTES TABLAS:
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
insert into categoria (nombre_categoria, sueldo_categoria ) values ("Titular C", 22000 );

/* insertar datos en profesor */
insert into profesor (numEco_profesor, nombre_profesor, edad_profesor, categoria_id_categoria, departamento_id_departamento) values (38574, "Hugo Estrada", 35, 1, 3);
insert into profesor (numEco_profesor, nombre_profesor, edad_profesor, categoria_id_categoria, departamento_id_departamento) values (12584, "Alicia Martínez", 38, 2, 2);
insert into profesor (numEco_profesor, nombre_profesor, edad_profesor, categoria_id_categoria, departamento_id_departamento) values (02584, "Máximo López", 39, 3, 3);
insert into profesor (numEco_profesor, nombre_profesor, edad_profesor, categoria_id_categoria, departamento_id_departamento) values (96473, "Noé Alejandro", 30, 1, 3);
insert into profesor (numEco_profesor, nombre_profesor, edad_profesor, categoria_id_categoria, departamento_id_departamento) values (39874, "Azucena Montes", 32, 1, 2);
insert into profesor (numEco_profesor, nombre_profesor, edad_profesor, categoria_id_categoria, departamento_id_departamento) values (25874, "Gabriel Serna", 33, 2,  2);
insert into profesor (numEco_profesor, nombre_profesor, edad_profesor, categoria_id_categoria, departamento_id_departamento) values (12566, "Andrea Fuentes", 34, 1, 1);
insert into profesor (numEco_profesor, nombre_profesor, edad_profesor, categoria_id_categoria, departamento_id_departamento) values (24987, "José Ruiz", 44, 3, 4);

/* insertar datos en articulo */
insert into articulo (titulo_articulo, numPag_articulo) values ("Minería de datos en redes sociales", 11);
insert into articulo (titulo_articulo, numPag_articulo) values ("El futuro de Base de Datos", 6);
insert into articulo (titulo_articulo, numPag_articulo) values ("Algoritmos bioinspirados", 5);
insert into articulo (titulo_articulo, numPag_articulo) values ("lgoritmos genético", 12);
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
insert into categoria (nombre_categoria, sueldo_categoria ) values ("Titular A", 15000); 
insert into categoria (nombre_categoria, sueldo_categoria ) values ("Titular B", 16000 );
insert into categoria (nombre_categoria, sueldo_categoria ) values ("Titular C", 22000 );

update categoria2 set sueldo_categoria = 10000 where nombre_categoria = "Titular A";
update categoria2 set sueldo_categoria = 15000 where nombre_categoria = "Titular B";
update categoria2 set sueldo_categoria = 20000 where nombre_categoria = "Titular C";


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

/* insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (1, '2018-01-01', '08:00:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (1, '2018-02-02', '08:05:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (1, '2018-03-03', '08:10:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (1, '2018-04-04', '08:15:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (1, '2018-05-05', '08:20:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (1, '2018-06-06', '08:25:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (1, '2018-07-07', '08:30:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (1, '2018-08-08', '08:35:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (1, '2018-09-09', '08:40:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (1, '2018-10-10', '08:45:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (1, '2018-11-11', '08:50:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (1, '2018-12-12', '08:55:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (1, '2019-01-01', '09:00:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (1, '2019-02-02', '08:05:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (1, '2019-03-03', '08:10:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (1, '2019-04-04', '08:15:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (1, '2019-05-05', '08:20:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (1, '2019-06-06', '08:25:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (1, '2019-07-07', '08:30:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (1, '2019-08-08', '08:35:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (1, '2019-09-09', '08:40:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (1, '2019-10-10', '08:45:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (1, '2019-11-11', '08:50:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (1, '2019-12-12', '08:55:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (1, '2020-01-01', '09:00:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (1, '2020-02-02', '08:05:00');
insert into asistencia (profesor_id_profesor, fecha_asistencia, hora_asistencia) values (1, '2020-03-03', '08:10:00');
 */
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

/* select nombre_profesor from profesor where categoria_id_categoria = 1;
select id_departamento from profesor where numero_economico like '3%';
select nombre_articulo from articulo where numero_paginas between 6 and 12;
select nombre_articulo from articulo where numero_paginas > 6 and nombre_articulo like '%ALGORITMO%';
select nombre_profesor from profesor where nombre_profesor like '^[aeiou]%' and nombre_profesor like '%[aeiou]%'; */
-- select nombre_sede from congreso where nombre_sede like '%[A-Z]%' and nombre_sede like '%[a-z]%';
-- select id_profesor from asistencia where fecha_asistencia like '2018-03-%';

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
/* select max(edad_profesor) from profesor;
select min(edad_profesor) from profesor;
select avg(edad_profesor) from profesor where apellido_profesor like '%LOPEZ%';
select nombre_articulo from articulo where numero_paginas between 6 and 12;
select nombre_articulo from articulo where numero_paginas > 6 and nombre_articulo like '%DATOS%'; */
-- select nombre_profesor, id_departamento from profesor where nombre_profesor like '%[A-Z]%' and nombre_profesor like '%[a-z]%';
-- select nombre_sede, id_congreso from congreso where nombre_sede like '%[A-Z]%' and nombre_sede like '%[a-z]%';

-- sesion 23
/* • EXTRAER NOMBRE DEL PROFESOR QUE TRABAJAN EN EL DEPARTAMENTO DE SISTEMAS.
• MOSTRAR LOS NOMBRES DE LOS PROFESORES QUE HAN ASISTIDO A CONGRESO Y EL
NOMBRE DEL CONGRESO AL QUE ASISTIERON.
• EXTRAER EL NOMBRE Y SUELDO DE LOS PROFESORES QUE HAN ESCRITO ARTÍCULOS
EXTENSOS, ES DECIR, CON MÁS DE 10 PÁGINAS.
• NOMBRE DE LOS ARTÍCULOS QUE FUERON ESCRITOS POR PROFESORES QUE
PERTENECEN AL DEPARTAMENTO DE MATEMÁTICAS, ADEMÁS HAN ASISTIDO AL
CONGRESO LLAMADO ISWC.
• MOSTRAR EL NOMBRE DE TODOS LOS PROFESORES QUE HAN ESCRITO AL MENOS UN
ARTÍCULO */

/* select nombre_profesor from profesor where id_departamento = 1; */
-- select nombre_profesor, nombre_congreso from asistencia join congreso on asistencia.congreso_id_congreso = congreso.id_congreso where nombre_departamento like '%SISTEMAS%';

/* • MOSTRAR EL NOMBRE DE TODOS LOS PROFESORES QUE NO TIENE
RETARDOS
• MOSTRAR EL NOMBRE DE LOS DEPARTAMENTOS CON AL MENOS UN
PROFESOR EN ÉL
• RECUPERAR EL NOMBRE Y SUELDO DE LOS PROFESORES QUE LLEGAN
TARDE */


-- sesion 24
/* • AGREGUE UN REGISTRO EN LA TABLA CONGRESO CON LOS SIGUIENTES DATOS:
• NOMBRE: WIMOB
• SEDE: FRANCIA
• AGREGUE UN REGISTRO POR CADA PROFESOR “TITULAR C” EN LA TABLA ASISTE
CON EL CONGRESO CREADO EN EL PUNTO ANTERIOR
• MUESTRE EL NOMBRE DEL PROFESOR, DEPARTAMENTO Y NOMBRE DEL CONGRESO
• RECUPERE EL NOMBRE DE TODOS LOS ARTÍCULOS QUE SE HAN ESCRITO POR LOS
PROFESORES DEL DEPARTAMENTO DE “MATEMÁTICAS” */

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

/* • VERIFIQUE EL RESULTADO DE LAS SIGUIENTES CONSULTAS:
• SELECT * FROM (PROFESOR P INNER JOIN DEPARTAMENTO D ON P.IDDEPTO =
D.IDDEPARTAMENTO) INNER JOIN ASISTE A ON P.IDPROFESOR=A.PROFIDPROF;
• SELECT * FROM (PROFESOR P INNER JOIN DEPARTAMENTO D ON P.IDDEPTO =
D.IDDEPARTAMENTO ) LEFT JOIN ASISTE A ON P.IDPROFESOR=A.PROFIDPROF;
• AGREGUE LAS SENTENCIAS EN SU ARCHIVO SQL Y AGREGUE LAS
RESPUESTAS A LAS SIGUIENTES PREGUNTAS:
• ¿QUÉ SUCEDIÓ?
• ¿CUÁL ES LA DIFERENCIA ENTRE UNA Y OTRA? */


-- sesion 26
/* • AGREGUE LAS SIGUIENTES CATEGORÍAS: “ASOCIADO A, ASOCIADO B, ASOCIADO C Y ASOCIADO D”, CON LOS SUELDOS
“10000,12000,14000,16000”.
• AGREGUE 5 REGISTROS EN LA TABLA PROFESOR PARA CADA UNA DE LAS CATEGORÍAS CREADAS
• CREAR UNA VISTA DE LA TABLA PROFESOR PARA CADA CATEGORÍA EXISTENTE, DE MODO QUE CADA VISTA CONTENGA
UNA CATEGORÍA DE PROFESORES (TITULAR, ASOCIADO)
• CREAR UNA FUNCIÓN QUE DEVUELVA EL ID DE UN DEPARTAMENTO CON BASE EN SU NOMBRE Y UNA PARA OBTENER EL
ID DE LA CATEGORÍA CON BASE EN SU NOMBRE */

/* • CREAR UN PROCEDIMIENTO ALMACENADO LLAMADO INSERTA_PROFESOR QUE RECIBA LOS
SIGUIENTES DATOS DE UN PROFESOR Y QUE LOS INSERTE EN LA BD:
• NUM_ECO
• NOMBRE
• EDAD
• NOMBRE_DEPARTAMENTO
• NOMBRE_CATEGORIA */


-- sesion 27
/* • TOMANDO SU BASE DE DATOS PROFESOR:
1. INSERTE AL MENOS DOS PROFESORES UTILIZANDO SU PROCEDIMIENTO ALMACENADO
INTENTE QUE SU PROCEDIMIENTO UTILICE LAS FUNCIONES DEFINIDAS PARA OBTENER EL ID DE LA
CATEGORÍA Y EL ID DEL DEPARTAMENTO ¿QUÉ RESULTADO OBTUVO? ¿ES POSIBLE? */

/* • TOMANDO SU BASE DE DATOS PROFESOR:
1. INSERTE AL MENOS DOS CONGRESOS CON SEDE EN MÉXICO
2. GENERE LA VISTA DE TODAS LOS CONGRESOS REALIZADAS EN MÉXICO, LA CUAL SE LLAMARÁ
MEX_CONG
3. GENERE LA VISTA DE TODOS LOS CONGRESOS QUE EMPIEZAN CON UNA VOCAL, LLAMADA
CONG_VOCAL
4. GENERE UN PROCEDIMIENTO ALMACENADO QUE PERMITA INSERTAR UN REGISTRO EN LA TABLA
DEPARTAMENTO, PASANDO COMO ARGUMENTO EL NOMBRE DEL DEPARTAMENTO  */


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







