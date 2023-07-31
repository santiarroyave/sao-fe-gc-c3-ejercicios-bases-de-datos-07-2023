create database ex4;
use ex4;

CREATE TABLE Bandos (
    id int auto_increment PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Guerras (
    id int auto_increment PRIMARY KEY,
    inicio int,
    fin int,
    nombre VARCHAR(100) NOT NULL,
    ganador int,
    FOREIGN KEY (ganador) REFERENCES Bandos(id)
    on delete cascade
    on update cascade
);

CREATE TABLE Participaciones (
    guerra int,
    bando int,
    PRIMARY KEY (guerra, bando),
    FOREIGN KEY (guerra) REFERENCES Guerras(id)
    on delete cascade
    on update cascade,
    FOREIGN KEY (bando) REFERENCES Bandos(id)
    on delete cascade
    on update cascade
);

CREATE TABLE Paises (
    id int auto_increment PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Bandos_paises (
    bando int,
    pais int,
    PRIMARY KEY (bando, pais),
    FOREIGN KEY (bando) REFERENCES Bandos(id)
    on delete cascade
    on update cascade,
    FOREIGN KEY (pais) REFERENCES Paises(id)
    on delete cascade
    on update cascade
);

CREATE TABLE Periodos_independencia (
    pais int,
    inicio int,
    fin int,
    PRIMARY KEY (pais, inicio),
    FOREIGN KEY (pais) REFERENCES Paises(id)
    on delete cascade
    on update cascade
);

-- Inserción de datos en la tabla Bandos
INSERT INTO Bandos (id, nombre)
VALUES (1, 'Bando 1'),
       (2, 'Bando 2');

-- Inserción de datos en la tabla Guerras
INSERT INTO Guerras (id, inicio, fin, nombre, ganador)
VALUES (1, 1900, 1910, 'Guerra 1', 1),
       (2, 1950, 1960, 'Guerra 2', 2);

-- Inserción de datos en la tabla Participaciones
INSERT INTO Participaciones (guerra, bando)
VALUES (1, 1),
       (1, 2),
       (2, 2);

-- Inserción de datos en la tabla Paises
INSERT INTO Paises (id, nombre)
VALUES (1, 'Pais 1'),
       (2, 'Pais 2');

-- Inserción de datos en la tabla Bandos_paises
INSERT INTO Bandos_paises (bando, pais)
VALUES (1, 1),
       (2, 2);

-- Inserción de datos en la tabla Periodos_independencia
INSERT INTO Periodos_independencia (pais, inicio, fin)
VALUES (1, 1800, 1900),
       (2, 1850, 1950);

-- Ejemplo de UPDATE: Actualizar el nombre de un bando en la tabla Bandos
UPDATE Bandos
SET nombre = 'Nuevo Bando'
WHERE id = 2;

-- Ejemplo de DELETE: Eliminar un país y sus periodos de independencia en las tablas Paises y Periodos_independencia
DELETE FROM Periodos_independencia WHERE pais = 2;
DELETE FROM Bandos_paises WHERE pais = 2;
DELETE FROM Paises WHERE id = 2;
