create database ex11;
use ex11;

CREATE TABLE Paises (
    id int auto_increment PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    extension int,
    poblacion int
);

CREATE TABLE Accidentes_geograficos (
    id int auto_increment PRIMARY KEY,
    pos_h int,
    pos_v int,
    nombre VARCHAR(100)
);

CREATE TABLE Rios (
    id int auto_increment PRIMARY KEY,
    longitud int,
    accidente_geografico int,
    FOREIGN KEY (accidente_geografico) REFERENCES Accidentes_geograficos(id)
    on delete cascade
    on update cascade
);

CREATE TABLE Montanas (
    id int auto_increment PRIMARY KEY,
    altura int,
    accidente_geografico int,
    FOREIGN KEY (accidente_geografico) REFERENCES Accidentes_geograficos(id)
    on delete cascade
    on update cascade
);

CREATE TABLE Lagos (
    id int auto_increment PRIMARY KEY,
    extension int,
    accidente_geografico int,
    FOREIGN KEY (accidente_geografico) REFERENCES Accidentes_geograficos(id)
    on delete cascade
    on update cascade
);

CREATE TABLE Localidades (
    id int auto_increment PRIMARY KEY,
    nombre VARCHAR(100),
    pais int,
    FOREIGN KEY (pais) REFERENCES Paises(id)
    on delete cascade
    on update cascade
);

CREATE TABLE Paises_accidentesgeograficos (
    pais int,
    accidente_geografico int,
    PRIMARY KEY (pais, accidente_geografico),
    FOREIGN KEY (pais) REFERENCES Paises(id)
    on delete cascade
    on update cascade,
    FOREIGN KEY (accidente_geografico) REFERENCES Accidentes_geograficos(id)
    on delete cascade
    on update cascade
);

CREATE TABLE Localidades_rios (
    localidad int,
    rio int,
    PRIMARY KEY (localidad, rio),
    FOREIGN KEY (localidad) REFERENCES Localidades(id)
    on delete cascade
    on update cascade,
    FOREIGN KEY (rio) REFERENCES Rios(id)
    on delete cascade
    on update cascade
);

-- Inserción de datos en la tabla Paises
INSERT INTO Paises (id, nombre, extension, poblacion)
VALUES (1, 'España', 505990, 47000000),
       (2, 'Francia', 643801, 67000000);

-- Inserción de datos en la tabla Accidentes_geograficos
INSERT INTO Accidentes_geograficos (id, pos_h, pos_v, nombre)
VALUES (101, 40, 3, 'Accidente 1'),
       (102, 45, 2, 'Accidente 2');

-- Inserción de datos en la tabla Rios
INSERT INTO Rios (id, longitud, accidente_geografico)
VALUES (201, 1000, 101),
       (202, 800, 102);

-- Inserción de datos en la tabla Montañas
INSERT INTO Montanas (id, altura, accidente_geografico)
VALUES (301, 3000, 101),
       (302, 2500, 102);

-- Inserción de datos en la tabla Lagos
INSERT INTO Lagos (id, extension, accidente_geografico)
VALUES (401, 200, 101),
       (402, 150, 102);

-- Inserción de datos en la tabla Localidades
INSERT INTO Localidades (id, nombre, pais)
VALUES (501, 'Madrid', 1),
       (502, 'París', 2);

-- Inserción de datos en la tabla Paises_accidentesgeograficos
INSERT INTO Paises_accidentesgeograficos (pais, accidente_geografico)
VALUES (1, 101),
       (2, 102);

-- Inserción de datos en la tabla Localidades_rios
INSERT INTO Localidades_rios (localidad, rio)
VALUES (501, 201),
       (502, 202);

-- Ejemplo de UPDATE: Actualizar el nombre de un país en la tabla Paises
UPDATE Paises
SET nombre = 'Nuevo País'
WHERE id = 2;

-- Ejemplo de DELETE: Eliminar una montaña y sus referencias en la tabla Montañas y Paises_accidentesgeograficos
DELETE FROM Paises_accidentesgeograficos WHERE accidente_geografico = 102;
DELETE FROM Montanas WHERE id = 302;
