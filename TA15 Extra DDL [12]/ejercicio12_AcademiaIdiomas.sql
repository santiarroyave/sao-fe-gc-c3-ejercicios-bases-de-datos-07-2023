CREATE DATABASE ejercicio12_AcademiaIdiomas;
USE ejercicio12_AcademiaIdiomas;

CREATE TABLE Profesor (
    dni VARCHAR(8) PRIMARY KEY,
    nombre VARCHAR(50) UNIQUE,
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50),
    direccion VARCHAR(100),
    titulo VARCHAR(100),
    salario FLOAT NOT NULL
);

CREATE TABLE Curso (
    Nombre_curso VARCHAR(50) UNIQUE,
    cod_curso INT PRIMARY KEY,
    dni_profesor VARCHAR(8),
    maximo_alumnos INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    num_horas INT NOT NULL,
    UNIQUE (Nombre_curso, dni_profesor),
    FOREIGN KEY (dni_profesor) REFERENCES Profesor(dni)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT COMPROVAR_FECHA CHECK (fecha_inicio < fecha_fin)
);

CREATE TABLE Alumno (
    dni VARCHAR(8) PRIMARY KEY,
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50),
    direccion VARCHAR(100),
    sexo CHAR(1) CHECK (sexo IN ('H', 'M')),
    fecha_nacimiento DATE,
    curso INT NOT NULL,
    FOREIGN KEY (curso) REFERENCES Curso(cod_curso)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

