create database ex3;
use ex3;

CREATE TABLE Localidades (
    id int auto_increment PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    poblacion int
);

CREATE TABLE Provincias (
    codigo_postal int PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    poblacion int,
    superficie int,
    id_capital int,
    FOREIGN KEY (id_capital) REFERENCES Localidades(id)
    on delete cascade
    on update cascade
);

CREATE TABLE Pertenencia_localidad_provincia (
    id_localidad int,
    codigo_postal_provincia int,
    PRIMARY KEY (id_localidad, codigo_postal_provincia),
    FOREIGN KEY (id_localidad) REFERENCES Localidades(id)
    on delete cascade
    on update cascade,
    FOREIGN KEY (codigo_postal_provincia) REFERENCES Provincias(codigo_postal)
    on delete cascade
    on update cascade
);

CREATE TABLE Comunidades_autonomas (
    id int auto_increment PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    poblacion int,
    superficie int,
    id_capital int,
    FOREIGN KEY (id_capital) REFERENCES Localidades(id)
    on delete cascade
    on update cascade
);

CREATE TABLE Pertenencia_provincia_CA (
    codigo_postal_provincia int,
    id_CA int,
    PRIMARY KEY (codigo_postal_provincia, id_CA),
    FOREIGN KEY (codigo_postal_provincia) REFERENCES Provincias(codigo_postal)
    on delete cascade
    on update cascade,
    FOREIGN KEY (id_CA) REFERENCES Comunidades_autonomas(id)
    on delete cascade
    on update cascade
);

-- Inserción de datos en la tabla Localidades
INSERT INTO Localidades (id, nombre, poblacion)
VALUES (1, 'Localidad 1', 10000);

-- Inserción de datos en la tabla Provincias
INSERT INTO Provincias (codigo_postal, nombre, poblacion, superficie, id_capital)
VALUES (12345, 'Provincia 1', 500000, 10000, 1);

-- Inserción de datos en la tabla Pertenencia_localidad_provincia
INSERT INTO Pertenencia_localidad_provincia (id_localidad, codigo_postal_provincia)
VALUES (1, 12345);

-- Inserción de datos en la tabla Comunidades_autonomas
INSERT INTO Comunidades_autonomas (id, nombre, poblacion, superficie, id_capital)
VALUES (101, 'Comunidad Autónoma 1', 1000000, 50000, 1);

-- Inserción de datos en la tabla Pertenencia_provincia_CA
INSERT INTO Pertenencia_provincia_CA (codigo_postal_provincia, id_CA)
VALUES (12345, 101);

-- Actualizar el nombre de la localidad con ID 1
UPDATE Localidades
SET nombre = 'Nueva Localidad'
WHERE id = 1;

-- Eliminar la provincia con código postal 12345 y su pertenencia en Pertenencia_localidad_provincia
DELETE FROM Pertenencia_localidad_provincia WHERE codigo_postal_provincia = 12345;
DELETE FROM Provincias WHERE codigo_postal = 12345;
