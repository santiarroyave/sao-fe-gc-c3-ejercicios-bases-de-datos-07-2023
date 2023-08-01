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
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

-- inserts

INSERT INTO Despacho (numero, capacidad) VALUES
(1, 5),
(2, 3),
(3, 4),
(4, 6),
(5, 2),
(6, 8),
(7, 4),
(8, 5),
(9, 7),
(10, 3);

INSERT INTO Director (dni, nombre, dni_jefe, numero_despacho) VALUES
('11111111A', 'Director1', NULL, 1),
('22222222B', 'Director2', '11111111A', 2),
('33333333C', 'Director3', '11111111A', 3),
('44444444D', 'Director4', '22222222B', 4),
('55555555E', 'Director5', '22222222B', 5),
('66666666F', 'Director6', '33333333C', 6),
('77777777G', 'Director7', '33333333C', 7),
('88888888H', 'Director8', '44444444D', 8),
('99999999I', 'Director9', '44444444D', 9),
('12345678J', 'Director10', '55555555E', 10);

-- delete y update en la tabla despacho
DELETE FROM Despacho WHERE numero = 9;
UPDATE Despacho SET capacidad = 10 WHERE numero = 4;

-- delete y update en la tabla director
DELETE FROM Director WHERE dni = '12345678J';
UPDATE Director SET nombre = 'Esutakio' WHERE dni = '11111111A';

