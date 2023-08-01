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

INSERT INTO Cientifico (dni, nombre) VALUES
('11111111', 'Cientifico1'),
('22222222', 'Cientifico2'),
('33333333', 'Cientifico3'),
('44444444', 'Cientifico4'),
('55555555', 'Cientifico5'),
('66666666', 'Cientifico6'),
('77777777', 'Cientifico7'),
('88888888', 'Cientifico8'),
('99999999', 'Cientifico9'),
('12345678', 'Cientifico10');

INSERT INTO Proyecto (id, nombre, horas) VALUES
('P001', 'Proyecto1', 100),
('P002', 'Proyecto2', 150),
('P003', 'Proyecto3', 200),
('P004', 'Proyecto4', 180),
('P005', 'Proyecto5', 120),
('P006', 'Proyecto6', 250),
('P007', 'Proyecto7', 300),
('P008', 'Proyecto8', 140),
('P009', 'Proyecto9', 160),
('P010', 'Proyecto10', 190);

INSERT INTO Asignacion (cientifico, proyecto) VALUES
('11111111', 'P001'),
('22222222', 'P002'),
('33333333', 'P003'),
('44444444', 'P004'),
('55555555', 'P005'),
('66666666', 'P006'),
('77777777', 'P007'),
('88888888', 'P008'),
('99999999', 'P009'),
('12345678', 'P010');

-- delete y update tabla cientifico
DELETE FROM Cientifico WHERE dni = '12345678';
UPDATE Cientifico SET nombre = 'Heimerdinger' WHERE dni = '11111111';

-- delete y update tabla Proyecto
DELETE FROM Proyecto WHERE id = 'P010';
UPDATE Proyecto SET nombre = 'X' WHERE id = 'P001';