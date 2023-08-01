CREATE DATABASE Ejercicio9_LosCientificos;
USE Ejercicio9_LosCientificos;

CREATE TABLE Cientifico (
    dni VARCHAR(8) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Proyecto (
    id CHAR(4) PRIMARY KEY,
    nombre VARCHAR(300) NOT NULL,
    horas INT
);

CREATE TABLE Asignacion (
    cientifico VARCHAR(8),
    proyecto CHAR(4),
    PRIMARY KEY (cientifico, proyecto),
    FOREIGN KEY (cientifico) REFERENCES Cientifico(dni)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (proyecto) REFERENCES Proyecto(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
