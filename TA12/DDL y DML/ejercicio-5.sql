CREATE DATABASE ex5;
USE ex5;

CREATE TABLE Pieza (
    tipo VARCHAR(100),
    descripcion VARCHAR(200),
    precio int,
    modelo VARCHAR(100),
    PRIMARY KEY (tipo)
);

CREATE TABLE Pieza_compuesta (
    pieza1 VARCHAR(100),
    pieza2 VARCHAR(100),
    PRIMARY KEY (pieza1, pieza2),
    FOREIGN KEY (pieza1) REFERENCES Pieza(tipo)
    on delete cascade
    on update cascade,
    FOREIGN KEY (pieza2) REFERENCES Pieza(tipo)
    on delete cascade
    on update cascade
);

CREATE TABLE Almacenes (
    num int auto_increment PRIMARY KEY,
    descripcion VARCHAR(200),
    direccion VARCHAR(200)
);

CREATE TABLE Estanterias (
    id int auto_increment PRIMARY KEY,
    nombre VARCHAR(100),
    id_almacen int,
    FOREIGN KEY (id_almacen) REFERENCES Almacenes(num)
    on delete cascade
    on update cascade
);

CREATE TABLE Pieza_estanteria (
    pieza VARCHAR(100),
    estanteria int,
    PRIMARY KEY (pieza, estanteria),
    FOREIGN KEY (pieza) REFERENCES Pieza(tipo)
    on delete cascade
    on update cascade,
    FOREIGN KEY (estanteria) REFERENCES Estanterias(id)
    on delete cascade
    on update cascade
);

-- Inserción de datos en la tabla Pieza
INSERT INTO Pieza (tipo, descripcion, precio, modelo)
VALUES ('Tuerca', 'Tuerca para ensamblaje', 0.50, 'ABC123'),
       ('Perno', 'Perno de acero', 0.75, 'XYZ456');

-- Inserción de datos en la tabla Pieza_compuesta
INSERT INTO Pieza_compuesta (pieza1, pieza2)
VALUES ('Tuerca', 'Perno');

-- Inserción de datos en la tabla Almacenes
INSERT INTO Almacenes (num, descripcion, direccion)
VALUES (1, 'Almacén principal', 'Calle Mayor 123'),
       (2, 'Almacén secundario', 'Calle Secundaria 456');

-- Inserción de datos en la tabla Estanterias
INSERT INTO Estanterias (id, nombre, id_almacen)
VALUES (101, 'Estantería 1', 1),
       (102, 'Estantería 2', 2);

-- Inserción de datos en la tabla Pieza_estanteria
INSERT INTO Pieza_estanteria (pieza, estanteria)
VALUES ('Tuerca', 101),
       ('Perno', 102);

-- Ejemplo de UPDATE: Actualizar el precio de una pieza en la tabla Pieza
UPDATE Pieza
SET precio = 1.00
WHERE tipo = 'Tuerca' AND modelo = 'ABC123';

-- Ejemplo de DELETE: Eliminar una pieza y sus referencias en la tabla Pieza_compuesta y Pieza_estanteria
DELETE FROM Pieza_estanteria WHERE pieza = 'Perno';
DELETE FROM Pieza_compuesta WHERE pieza1 = 'Tuerca' AND pieza2 = 'Tuerca';
DELETE FROM Pieza WHERE tipo = 'Tuerca' AND modelo = 'ABC123';
