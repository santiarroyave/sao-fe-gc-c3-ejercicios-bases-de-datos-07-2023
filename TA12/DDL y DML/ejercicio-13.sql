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
