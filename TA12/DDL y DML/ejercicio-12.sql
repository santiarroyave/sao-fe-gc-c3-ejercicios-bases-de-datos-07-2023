create database ex12;
use ex12;

CREATE TABLE Empresas (
    CIF VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200),
    telefono VARCHAR(20),
    codigo_interno VARCHAR(50)
);

CREATE TABLE Proyectos (
    id int auto_increment PRIMARY KEY,
    fecha_inicio DATE,
    fecha_fin DATE,
    fecha_prevista DATE,
    empresa VARCHAR(20),
    FOREIGN KEY (empresa) REFERENCES Empresas(CIF)
    on delete cascade
    on update cascade
);

CREATE TABLE Trabajadores (
    codigo int auto_increment PRIMARY KEY,
    dni VARCHAR(20) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL
);

CREATE TABLE Profesiones (
    id int auto_increment PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Trabajadores_proyectos_profesiones (
    trabajador int,
    proyecto int,
    profesion int,
    horas int,
    PRIMARY KEY (trabajador, proyecto, profesion),
    FOREIGN KEY (trabajador) REFERENCES Trabajadores(codigo)
    on delete cascade
    on update cascade,
    FOREIGN KEY (proyecto) REFERENCES Proyectos(id)
    on delete cascade
    on update cascade,
    FOREIGN KEY (profesion) REFERENCES Profesiones(id)
    on delete cascade
    on update cascade
);

-- Inserción de datos en la tabla Empresas
INSERT INTO Empresas (CIF, nombre, direccion, telefono, codigo_interno)
VALUES ('12345678A', 'Empresa 1', 'Calle Mayor 123', '987654321', 'INT001'),
       ('87654321B', 'Empresa 2', 'Avenida Principal 456', '654321987', 'INT002');

-- Inserción de datos en la tabla Proyectos
INSERT INTO Proyectos (id, fecha_inicio, fecha_fin, fecha_prevista, empresa)
VALUES (1, '2023-01-01', '2023-12-31', '2023-06-30', '12345678A'),
       (2, '2023-02-01', '2023-11-30', '2023-08-31', '87654321B');

-- Inserción de datos en la tabla Trabajadores
INSERT INTO Trabajadores (codigo, dni, nombre, apellidos)
VALUES (101, '11111111A', 'Trabajador 1', 'Apellido 1'),
       (102, '22222222B', 'Trabajador 2', 'Apellido 2');

-- Inserción de datos en la tabla Profesiones
INSERT INTO Profesiones (id, nombre)
VALUES (201, 'Programador'),
       (202, 'Diseñador');

-- Inserción de datos en la tabla Trabajadores_proyectos_profesiones
INSERT INTO Trabajadores_proyectos_profesiones (trabajador, proyecto, profesion, horas)
VALUES (101, 1, 201, 160),
       (102, 2, 202, 120);

-- Ejemplo de UPDATE: Actualizar el nombre de una empresa en la tabla Empresas
UPDATE Empresas
SET nombre = 'Nueva Empresa'
WHERE CIF = '87654321B';

-- Ejemplo de DELETE: Eliminar un trabajador y sus referencias en la tabla Trabajadores_proyectos_profesiones
DELETE FROM Trabajadores_proyectos_profesiones WHERE trabajador = 102;
DELETE FROM Trabajadores WHERE codigo = 102;
