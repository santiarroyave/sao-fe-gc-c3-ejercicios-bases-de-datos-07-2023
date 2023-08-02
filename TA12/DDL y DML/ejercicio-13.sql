CREATE DATABASE ejercicio13;
USE ejercicio13;

CREATE TABLE Cocinero (
    dni VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    telefono_fijo VARCHAR(15),
    num_ss INT,
    telefono_movil VARCHAR(15),
    años_servicio INT
);

CREATE TABLE Pinches_cocina (
    dni VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    telefono_fijo VARCHAR(15),
    num_ss INT,
    telefono_movil VARCHAR(15),
    fecha_nacimiento DATE,
    dni_encargado VARCHAR(10),
    FOREIGN KEY (dni_encargado) REFERENCES Cocinero(dni)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

CREATE TABLE Plato (
    id INT PRIMARY KEY,
    plato VARCHAR(100) NOT NULL,
    tipo VARCHAR(50)
);

CREATE TABLE Cocineros_Plato (
    dni_cocinero VARCHAR(10),
    id_plato INT,
    PRIMARY KEY (dni_cocinero, id_plato),
    FOREIGN KEY (dni_cocinero) REFERENCES Cocinero(dni)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (id_plato) REFERENCES Plato(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE Almacen (
    numero INT PRIMARY KEY,
    nombre VARCHAR(50),
    direccion VARCHAR(100),
    descripcion VARCHAR(200)
);

CREATE TABLE Estanteria (
    n_almacen INT,
    letras VARCHAR(10),
    tamaño INT,
    PRIMARY KEY (n_almacen, letras, tamaño),
    FOREIGN KEY (n_almacen) REFERENCES Almacen(numero)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE Ingrediente (
    id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    n_almacen INT,
    letra_estanteria VARCHAR(10),
    tamaño_estanteria INT,
    FOREIGN KEY (n_almacen, letra_estanteria, tamaño_estanteria) REFERENCES Estanteria(n_almacen, letras, tamaño)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);



-- Agregando datos a Cocinero
INSERT INTO Cocinero (dni, nombre, apellidos, telefono_fijo, num_ss, telefono_movil, años_servicio)
	VALUES ('1234567890', 'Maxi', 'Perez Alonso', '977 000 001', 123456, '666 000 001', 10);

-- Agregando datos a Pinches_cocina
INSERT INTO Pinches_cocina (dni, nombre, apellidos, telefono_fijo, num_ss, telefono_movil, fecha_nacimiento, dni_encargado)
	VALUES ('9876543210', 'Pedro', 'Lopez Ramirez', '977 000 002', 654321, '666 000 002', '2000-01-15', '1234567890');
INSERT INTO Pinches_cocina (dni, nombre, apellidos, telefono_fijo, num_ss, telefono_movil, fecha_nacimiento, dni_encargado)
	VALUES ('9996543210', 'Laura', 'Perez', '977 000 003', 554433, '666 000 003', '2000-01-15', '1234567890');

-- Agregando datos a Plato
INSERT INTO Plato (id, plato, tipo)
	VALUES (1, 'Paella', 'Principal');

-- Agregando datos a Cocineros_Plato
INSERT INTO Cocineros_Plato (dni_cocinero, id_plato)
	VALUES ('1234567890', 1);

-- Agregando datos a Almacen
INSERT INTO Almacen (numero, nombre, direccion, descripcion)
	VALUES (1, 'Almacen 3', 'Calle Asturias 123', 'Almacen de ingredientes frescos');

-- Agregando datos a Estanteria
INSERT INTO Estanteria (n_almacen, letras, tamaño)
	VALUES (1, 'A', 5);

-- Agregando datos a Ingrediente
INSERT INTO Ingrediente (id, nombre, n_almacen, letra_estanteria, tamaño_estanteria)
	VALUES (1, 'Arroz', 1, 'A', 5);



-- Actualizando datos
UPDATE Almacen
SET descripcion="Almacen principal"
WHERE numero=1;

-- Eliminando datos
DELETE FROM Pinches_cocina WHERE dni="9996543210";


