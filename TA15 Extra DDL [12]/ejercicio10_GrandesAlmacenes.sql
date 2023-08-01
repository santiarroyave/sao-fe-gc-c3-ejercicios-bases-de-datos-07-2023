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
