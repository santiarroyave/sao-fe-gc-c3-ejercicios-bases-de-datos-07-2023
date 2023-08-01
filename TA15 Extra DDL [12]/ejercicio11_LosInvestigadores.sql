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
