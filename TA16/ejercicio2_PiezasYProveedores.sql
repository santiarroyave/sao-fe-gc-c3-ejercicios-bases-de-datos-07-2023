CREATE DATABASE ejercicio8_PiezasYProveedores;
USE ejercicio8_PiezasYProveedores;

CREATE TABLE Piezas (
    codigo INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Proveedores (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Suministra (
    codigo_pieza INT,
    id_proveedor INT,
    precio INT,
    PRIMARY KEY (codigo_pieza, id_proveedor),
    FOREIGN KEY (codigo_pieza) REFERENCES Piezas(codigo)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- inserts

INSERT INTO Piezas (codigo, nombre) VALUES
(1, 'Tornillo'),
(2, 'Tuerca'),
(3, 'Arandela'),
(4, 'Perno'),
(5, 'Abrazadera'),
(6, 'Resorte'),
(7, 'Eje'),
(8, 'Enganche'),
(9, 'Cadena'),
(10, 'Cable');

INSERT INTO Proveedores (id, nombre) VALUES
(1, 'Proveedor1'),
(2, 'Proveedor2'),
(3, 'Proveedor3'),
(4, 'Proveedor4'),
(5, 'Proveedor5'),
(6, 'Proveedor6'),
(7, 'Proveedor7'),
(8, 'Proveedor8'),
(9, 'Proveedor9'),
(10, 'Proveedor10');

INSERT INTO Suministra (codigo_pieza, id_proveedor, precio) VALUES
(1, 1, 100),
(1, 2, 110),
(2, 3, 80),
(2, 4, 85),
(3, 5, 50),
(3, 6, 60),
(4, 7, 120),
(4, 8, 130),
(5, 9, 70),
(5, 10, 75);

-- delete y update tabla piezas
DELETE FROM Piezas WHERE codigo = 2;
UPDATE Piezas SET nombre = 'TornilloNuevo' WHERE codigo = 1;

-- delete y update tabla Suministra
DELETE FROM Proveedores WHERE id = 9;
UPDATE Proveedores SET nombre = 'Julio' WHERE id = 1;

