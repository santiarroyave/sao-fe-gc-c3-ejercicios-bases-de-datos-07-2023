CREATE DATABASE ejercicio11_LosInvestigadores;
USE ejercicio11_LosInvestigadores;

CREATE TABLE Facultad (
    codigo INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Investigadores (
    dni VARCHAR(8) PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    facultad INT,
    FOREIGN KEY (facultad) REFERENCES Facultad(codigo)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

CREATE TABLE Equipos (
    num_serie CHAR(4) PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    facultad INT,
    FOREIGN KEY (facultad) REFERENCES Facultad(codigo)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

CREATE TABLE Reserva (
    dni_investigador VARCHAR(8),
    num_serie CHAR(4),
    comienzo DATE,
    fin DATE,
    PRIMARY KEY (dni_investigador, num_serie),
    FOREIGN KEY (dni_investigador) REFERENCES Investigadores(dni)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (num_serie) REFERENCES Equipos(num_serie)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

INSERT INTO Facultad (codigo, nombre) VALUES
(1, 'Facultad1'),
(2, 'Facultad2'),
(3, 'Facultad3'),
(4, 'Facultad4'),
(5, 'Facultad5'),
(6, 'Facultad6'),
(7, 'Facultad7'),
(8, 'Facultad8'),
(9, 'Facultad9'),
(10, 'Facultad10');

INSERT INTO Investigadores (dni, nombre, facultad) VALUES
('11111111', 'Investigador1', 1),
('22222222', 'Investigador2', 2),
('33333333', 'Investigador3', 3),
('44444444', 'Investigador4', 4),
('55555555', 'Investigador5', 5),
('66666666', 'Investigador6', 6),
('77777777', 'Investigador7', 7),
('88888888', 'Investigador8', 8),
('99999999', 'Investigador9', 9),
('12345678', 'Investigador10', 10);

INSERT INTO Equipos (num_serie, nombre, facultad) VALUES
('E001', 'Equipo1', 1),
('E002', 'Equipo2', 2),
('E003', 'Equipo3', 3),
('E004', 'Equipo4', 4),
('E005', 'Equipo5', 5),
('E006', 'Equipo6', 6),
('E007', 'Equipo7', 7),
('E008', 'Equipo8', 8),
('E009', 'Equipo9', 9),
('E010', 'Equipo10', 10);

INSERT INTO Reserva (dni_investigador, num_serie, comienzo, fin) VALUES
('11111111', 'E001', '2023-08-02', '2023-08-05'),
('22222222', 'E002', '2023-08-03', '2023-08-06'),
('33333333', 'E003', '2023-08-04', '2023-08-07'),
('44444444', 'E004', '2023-08-05', '2023-08-08'),
('55555555', 'E005', '2023-08-06', '2023-08-09'),
('66666666', 'E006', '2023-08-07', '2023-08-10'),
('77777777', 'E007', '2023-08-08', '2023-08-11'),
('88888888', 'E008', '2023-08-09', '2023-08-12'),
('99999999', 'E009', '2023-08-10', '2023-08-13'),
('12345678', 'E010', '2023-08-11', '2023-08-14');

-- updates y deletes en cada tabla 

UPDATE Facultad SET nombre = 'URV' WHERE codigo = 1;
DELETE FROM Facultad WHERE codigo = 10;

UPDATE Investigadores SET nombre = 'Mac Gregor', facultad = 2 WHERE dni = '11111111';
DELETE FROM Investigadores WHERE dni = '12345678';

UPDATE Equipos SET nombre = 'Equipo A', facultad = 3 WHERE num_serie = 'E001';
DELETE FROM Equipos WHERE num_serie = 'E010';

UPDATE Reserva SET comienzo = '2023-08-03', fin = '2023-08-06' WHERE dni_investigador = '11111111' AND num_serie = 'E001';
DELETE FROM Reserva WHERE dni_investigador = '12345678' AND num_serie = 'E010';

