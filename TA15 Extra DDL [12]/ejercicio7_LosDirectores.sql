CREATE DATABASE ejercicio7_LosDirectores;
USE ejercicio7_LosDirectores;

CREATE TABLE Despacho (
    numero INT PRIMARY KEY,
    capacidad INT
);

CREATE TABLE Director (
    dni VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    dni_jefe VARCHAR(10),
    numero_despacho INT,
    FOREIGN KEY (dni_jefe) REFERENCES Director(dni)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
    FOREIGN KEY (numero_despacho) REFERENCES Despacho(numero)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
