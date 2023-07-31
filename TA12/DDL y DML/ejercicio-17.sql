CREATE DATABASE ex17;
USE ex17;

CREATE TABLE horario(
	hora varchar(10),
    dia varchar(15),
    PRIMARY KEY(hora, dia)
);

CREATE TABLE aula(
	codigo int,
    nombre varchar(20),
    numero_aula int,
    tamano int,
    PRIMARY KEY(codigo)
);

CREATE TABLE asignatura(
	codigo_instituto int,
    codigo_europeo int,
    nombre varchar(20),
    PRIMARY KEY(codigo_instituto)
);

CREATE TABLE ocupacion(
	hora varchar(10),
    dia varchar(15),
    codigo_aula int,
    codigo_asignatura int,
    PRIMARY KEY(hora, dia, codigo_aula, codigo_asignatura),
    FOREIGN KEY(hora, dia) references horario(hora, dia) on update cascade on delete cascade,
    FOREIGN KEY(codigo_aula) references aula(codigo) on update cascade on delete cascade,
    FOREIGN KEY(codigo_asignatura) references asignatura(codigo_instituto) on update cascade on delete cascade
);

CREATE TABLE requerimiento_asignatura(
	id_asignatura int,
    id_asignatura_requerida int,
    PRIMARY KEY(id_asignatura, id_asignatura_requerida),
    FOREIGN KEY(id_asignatura) references asignatura(codigo_instituto) on update cascade on delete cascade,
    FOREIGN KEY(id_asignatura_requerida) references asignatura(codigo_instituto) on update cascade on delete cascade
);

CREATE TABLE profesor(
	codigo int,
    nombre varchar(20),
    apellidos varchar(20),
    telefono varchar(15),
    direccion varchar(40),
    PRIMARY KEY(codigo)
);

CREATE TABLE ciclo(
	codigo int,
    nombre varchar(20),
    nivel int,
    PRIMARY KEY(codigo)
);

CREATE TABLE curso(
	año int,
    codigo_ciclo int,
    PRIMARY KEY(año, codigo_ciclo),
    FOREIGN KEY(codigo_ciclo) references ciclo(codigo)on update cascade on delete cascade
);

CREATE TABLE antiguedad(
	codigo_asignatura int,
    codigo_profesor int,
    antiguedad int,
    PRIMARY KEY(codigo_asignatura, codigo_profesor),
    FOREIGN KEY(codigo_asignatura) references asignatura(codigo_instituto)on update cascade on delete cascade,
    FOREIGN KEY(codigo_profesor) references profesor(codigo)on update cascade on delete cascade
);

CREATE TABLE profesor_asignatura_curso(
	codigo_profesor int,
    codigo_asignatura int,
    codigo_curso int,
    año int,
    PRIMARY KEY(codigo_profesor, codigo_asignatura, codigo_curso, año),
    FOREIGN KEY(codigo_profesor) references profesor(codigo)on update cascade on delete cascade,
    FOREIGN KEY(codigo_asignatura) references asignatura(codigo_instituto)on update cascade on delete cascade,
    FOREIGN KEY(codigo_curso, año) references curso(codigo_ciclo, año)on update cascade on delete cascade
);

CREATE TABLE tutoria(
	codigo_curso int,
    año int,
    codigo_profesor int,
    antiguedad int,
    PRIMARY KEY(codigo_curso, año, codigo_profesor),
    FOREIGN KEY(codigo_curso, año) references curso(codigo_ciclo, año)on update cascade on delete cascade,
    FOREIGN KEY(codigo_profesor) references profesor(codigo)on update cascade on delete cascade
);

CREATE TABLE asignatura_ciclo(
	codigo_asignatura int,
    codigo_ciclo int,
    PRIMARY KEY(codigo_asignatura, codigo_ciclo),
    FOREIGN KEY(codigo_asignatura) references asignatura(codigo_instituto)on update cascade on delete cascade,
    FOREIGN KEY(codigo_ciclo) references ciclo(codigo)on update cascade on delete cascade
);



-- Inserción de datos en la tabla horario
INSERT INTO horario (hora, dia)
VALUES ("10:58h", "Miercoles");

-- Inserción de datos en la tabla aula
INSERT INTO aula (codigo, nombre, numero_aula, tamano)
VALUES (33, "Economía", 55, 30);

-- Inserción de datos en la tabla asignatura
INSERT INTO asignatura(codigo_instituto, codigo_europeo, nombre)
VALUES (1, 34, "Filosofia");
INSERT INTO asignatura(codigo_instituto, codigo_europeo, nombre)
VALUES (2, 34, "Matemáticas");
INSERT INTO asignatura(codigo_instituto, codigo_europeo, nombre)
VALUES (3, 36, "Religion");

-- Inserción de datos en la tabla ocupacion
INSERT INTO ocupacion(hora, dia, codigo_aula, codigo_asignatura)
VALUES("10:58h", "Miercoles", 33, 1);

-- Inserción de datos en la tabla requerimiento_asignatura
INSERT INTO requerimiento_asignatura (id_asignatura, id_asignatura_requerida)
VALUES (1, 2);

-- Inserción de datos en la tabla profesor
INSERT INTO profesor (codigo, nombre, apellidos, telefono, direccion)
VALUES (555, "Pedro", "Meloza", "698 765 342", "Calle Real 123");

-- Inserción de datos en la tabla ciclo
INSERT INTO ciclo (codigo, nombre, nivel)
VALUES (1, "DAM", 2);

-- Inserción de datos en la tabla curso
INSERT INTO curso (año, codigo_ciclo)
VALUES (2023, 1);

-- Inserción de datos en la tabla antiguedad
INSERT INTO antiguedad (codigo_asignatura, codigo_profesor, antiguedad)
VALUES (2, 555, 4);

-- Inserción de datos en la tabla profesor_asignatura_curso
INSERT INTO profesor_asignatura_curso(codigo_profesor, codigo_asignatura, codigo_curso, año) 
VALUES(555, 2, 1, 2023);

-- Inserción de datos en la tabla tutoria
INSERT INTO tutoria (codigo_curso, año, codigo_profesor, antiguedad)
VALUES (1, 2023, 555, 4);

-- Inserción de datos en la tabla asignatura_ciclo
INSERT INTO asignatura_ciclo (codigo_asignatura, codigo_ciclo)
VALUES (1, 1);



-- Actualizacion direccion profesor
UPDATE profesor
SET direccion = "Calle Real 456"
WHERE codigo = 555;

-- Eliminar asignatura
DELETE FROM asignatura WHERE codigo_instituto=3;
