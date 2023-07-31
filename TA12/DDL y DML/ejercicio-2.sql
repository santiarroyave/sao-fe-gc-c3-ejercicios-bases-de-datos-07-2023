create database ex2;
use ex2;

CREATE TABLE Empresa (
    cif VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    direccion VARCHAR(200)
);

CREATE TABLE Alumno (
    dni VARCHAR(20) PRIMARY KEY,
    direccion VARCHAR(200),
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    edad int,
    empresa VARCHAR(20),
    FOREIGN KEY (empresa) REFERENCES Empresa(cif)
    on delete cascade
    on update cascade
);

CREATE TABLE Curso (
    codigo_curso int auto_increment PRIMARY KEY,
    programa VARCHAR(200),
    horas DATE,
    titulo VARCHAR(200),
    editorial VARCHAR(100),
    ISBN VARCHAR(20)
);

CREATE TABLE Asistencia (
    dni_alumno_FK VARCHAR(20),
    codigo_curso_FK int,
    nota int,
    PRIMARY KEY (dni_alumno_FK, codigo_curso_FK),
    FOREIGN KEY (dni_alumno_FK) REFERENCES Alumno(dni)
    on delete cascade
    on update cascade,
    FOREIGN KEY (codigo_curso_FK) REFERENCES Curso(codigo_curso)
    on delete cascade
    on update cascade
);

CREATE TABLE Profesor (
    dni VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    direccion VARCHAR(200),
    telefono VARCHAR(20)
);

CREATE TABLE Imparte (
    num_curso int auto_increment,
    dni_profesor_FK VARCHAR(20),
    codigo_curso_FK int,
    fecha_inicio DATE,
    fecha_final DATE,
    primary key(num_curso),
    FOREIGN KEY (dni_profesor_FK) REFERENCES Profesor(dni)
    on delete cascade
    on update cascade,
    FOREIGN KEY (codigo_curso_FK) REFERENCES Curso(codigo_curso)
    on delete cascade
    on update cascade
);

-- Inserción de datos en la tabla Empresa
INSERT INTO Empresa (cif, nombre, telefono, direccion)
VALUES ('A12345678', 'Empresa 1', '555-1234', 'Calle Principal 123');

-- Inserción de datos en la tabla Alumno
INSERT INTO Alumno (dni, direccion, nombre, telefono, edad, empresa)
VALUES ('11111111A', 'Calle Secundaria 456', 'Juan Pérez', '555-5678', 25, 'A12345678');

-- Inserción de datos en la tabla Curso
INSERT INTO Curso (programa, horas, titulo, editorial, ISBN)
VALUES ('Programa Curso 1', '2023-07-28', 'Título del Curso 1', 'Editorial X', '978-0123456789');

-- Inserción de datos en la tabla Asistencia
INSERT INTO Asistencia (dni_alumno_FK, codigo_curso_FK, nota)
VALUES ('11111111A', 1, 8);

-- Inserción de datos en la tabla Profesor
INSERT INTO Profesor (dni, nombre, apellidos, direccion, telefono)
VALUES ('22222222B', 'Profesor', 'García', 'Calle Maestra 789', '555-9876');

-- Inserción de datos en la tabla Imparte
INSERT INTO Imparte (dni_profesor_FK, codigo_curso_FK, fecha_inicio, fecha_final)
VALUES ('22222222B', 1, '2023-07-01', '2023-07-31');

-- Actualizar la edad del alumno con DNI '11111111A'
UPDATE Alumno
SET edad = 26
WHERE dni = '11111111A';

-- Eliminar la empresa con CIF 'A12345678'
DELETE FROM Empresa WHERE cif = 'A12345678';

-- Asignar al profesor con DNI '33333333C' al curso con código 1 en la tabla Imparte
UPDATE Profesor
SET nombre = 'Nuevo nombre'
WHERE dni = '22222222B';
