create database ex10;
use ex10;

CREATE TABLE Jugadores (
    id int auto_increment PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nacionalidad VARCHAR(100),
    posicion VARCHAR(50),
    edad int
);

CREATE TABLE Equipos (
    id int auto_increment PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    estadio VARCHAR(200),
    ciudad VARCHAR(100)
);

CREATE TABLE Ligas (
    id int auto_increment PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    pais VARCHAR(100),
    fecha_inicio DATE,
    fecha_fin DATE
);

CREATE TABLE Temporadas (
    id int auto_increment PRIMARY KEY,
    ano int
);

CREATE TABLE Partidos (
    id int auto_increment PRIMARY KEY,
    fecha DATE,
    estadio VARCHAR(200),
    resultado VARCHAR(50),
    temporada int,
    FOREIGN KEY (temporada) REFERENCES Temporadas(id)
);

CREATE TABLE jugadores_equipos_ligas (
    jugador int,
    equipo int,
    liga int,
    PRIMARY KEY (jugador, equipo, liga),
    FOREIGN KEY (jugador) REFERENCES Jugadores(id)
    on delete cascade
    on update cascade,
    FOREIGN KEY (equipo) REFERENCES Equipos(id)
    on delete cascade
    on update cascade,
    FOREIGN KEY (liga) REFERENCES Ligas(id)
    on delete cascade
    on update cascade
);

CREATE TABLE ligas_temporadas (
    liga int,
    temporada int,
    PRIMARY KEY (liga, temporada),
    FOREIGN KEY (liga) REFERENCES Ligas(id)
    on delete cascade
    on update cascade,
    FOREIGN KEY (temporada) REFERENCES Temporadas(id)
    on delete cascade
    on update cascade
);

CREATE TABLE equipos_partidos (
    equipo int,
    partido int,
    PRIMARY KEY (equipo, partido),
    FOREIGN KEY (equipo) REFERENCES Equipos(id)
    on delete cascade
    on update cascade,
    FOREIGN KEY (partido) REFERENCES Partidos(id)
    on delete cascade
    on update cascade
);

-- Inserción de datos en la tabla Jugadores
INSERT INTO Jugadores (id, nombre, nacionalidad, posicion, edad)
VALUES (1, 'Jugador 1', 'Español', 'Delantero', 25),
       (2, 'Jugador 2', 'Francés', 'Defensa', 28);

-- Inserción de datos en la tabla Equipos
INSERT INTO Equipos (id, nombre, estadio, ciudad)
VALUES (101, 'Equipo 1', 'Estadio 1', 'Ciudad 1'),
       (102, 'Equipo 2', 'Estadio 2', 'Ciudad 2');

-- Inserción de datos en la tabla Ligas
INSERT INTO Ligas (id, nombre, pais, fecha_inicio, fecha_fin)
VALUES (201, 'Liga 1', 'España', '2023-01-01', '2023-12-31'),
       (202, 'Liga 2', 'Francia', '2023-02-01', '2023-12-31');

-- Inserción de datos en la tabla Temporadas
INSERT INTO Temporadas (id, ano)
VALUES (301, 2023),
       (302, 2024);

-- Inserción de datos en la tabla Partidos
INSERT INTO Partidos (id, fecha, estadio, resultado, temporada)
VALUES (401, '2023-07-01', 'Estadio 1', '2-1', 301),
       (402, '2023-07-15', 'Estadio 2', '0-0', 301);

-- Inserción de datos en la tabla jugadores_equipos_ligas
INSERT INTO jugadores_equipos_ligas (jugador, equipo, liga)
VALUES (1, 101, 201),
       (2, 102, 202);

-- Inserción de datos en la tabla ligas_temporadas
INSERT INTO ligas_temporadas (liga, temporada)
VALUES (201, 301),
       (202, 302);

-- Inserción de datos en la tabla equipos_partidos
INSERT INTO equipos_partidos (equipo, partido)
VALUES (101, 401),
       (102, 402);

-- Ejemplo de UPDATE: Actualizar el nombre de un equipo en la tabla Equipos
UPDATE Equipos
SET nombre = 'Nuevo Equipo'
WHERE id = 102;

-- Ejemplo de DELETE: Eliminar un jugador y sus referencias en la tabla jugadores_equipos_ligas
DELETE FROM jugadores_equipos_ligas WHERE jugador = 2;
DELETE FROM Jugadores WHERE id = 2;
