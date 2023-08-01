CREATE DATABASE ejercicio10_GrandesAlmacenes;
USE ejercicio10_GrandesAlmacenes;

CREATE TABLE Cajero (
    codigo INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

CREATE TABLE Producto (
    codigo INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Maquina_registradora (
    codigo INT PRIMARY KEY,
    piso INT NOT NULL
);

CREATE TABLE Venta (
    codigo_cajero INT,
    codigo_maquina INT,
    codigo_producto INT,
    PRIMARY KEY (codigo_cajero, codigo_maquina, codigo_producto),
    FOREIGN KEY (codigo_cajero) REFERENCES Cajero(codigo)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (codigo_maquina) REFERENCES Maquina_registradora(codigo)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (codigo_producto) REFERENCES Producto(codigo)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- inserts

INSERT INTO Cajero (codigo, nombre) VALUES
(1, 'Cajero1'),
(2, 'Cajero2'),
(3, 'Cajero3'),
(4, 'Cajero4'),
(5, 'Cajero5'),
(6, 'Cajero6'),
(7, 'Cajero7'),
(8, 'Cajero8'),
(9, 'Cajero9'),
(10, 'Cajero10');

INSERT INTO Producto (codigo, nombre, precio) VALUES
(1, 'Producto1', 10.50),
(2, 'Producto2', 5.75),
(3, 'Producto3', 8.99),
(4, 'Producto4', 15.25),
(5, 'Producto5', 12.80),
(6, 'Producto6', 9.50),
(7, 'Producto7', 7.30),
(8, 'Producto8', 6.45),
(9, 'Producto9', 11.20),
(10, 'Producto10', 14.60);

INSERT INTO Maquina_registradora (codigo, piso) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 1),
(6, 2),
(7, 3),
(8, 3),
(9, 1),
(10, 2);

INSERT INTO Venta (codigo_cajero, codigo_maquina, codigo_producto) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);

-- delete y update en todas las tablas
DELETE FROM Cajero WHERE codigo = 10;
UPDATE Cajero SET nombre = 'Bob Esponja' WHERE codigo = 1;

DELETE FROM Producto WHERE codigo = 10;
UPDATE Producto SET nombre = 'Agua', precio = 20.99 WHERE codigo = 1;

DELETE FROM Maquina_registradora WHERE codigo = 10;
UPDATE Maquina_registradora SET piso = 3 WHERE codigo = 1;

DELETE FROM Venta WHERE codigo_cajero = 10 AND codigo_maquina = 10 AND codigo_producto = 10;
UPDATE Venta SET codigo_cajero = 1, codigo_maquina = 6, codigo_producto = 9 WHERE codigo_cajero = 1 AND codigo_maquina = 1 AND codigo_producto = 1;