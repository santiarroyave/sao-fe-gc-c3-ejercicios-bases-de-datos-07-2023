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
