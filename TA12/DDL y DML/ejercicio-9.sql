CREATE DATABASE ejercicio9;
USE ejercicio9;

CREATE TABLE Persona (
    id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    correo VARCHAR(100),
    edad INT,
    sexo VARCHAR(10)
);

CREATE TABLE Receta (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tiempo INT,
    preparacion TEXT,
    fecha DATE,
    id_persona_FK INT,
    FOREIGN KEY (id_persona_FK) REFERENCES Persona(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE Cocinero (
    id_persona_FK INT,
    id_receta_FK INT,
    fecha DATE,
    PRIMARY KEY (id_persona_FK, id_receta_FK),
    FOREIGN KEY (id_persona_FK) REFERENCES Persona(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (id_receta_FK) REFERENCES Receta(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE Grupo_alimentario (
    id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Ingrediente (
    id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    id_grupo_alimentario_FK INT,
    FOREIGN KEY (id_grupo_alimentario_FK) REFERENCES Grupo_alimentario(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE Contiene (
    id_receta_FK INT,
    id_ingrediente_FK INT,
    cantidad INT,
    PRIMARY KEY (id_receta_FK, id_ingrediente_FK),
    FOREIGN KEY (id_receta_FK) REFERENCES Receta(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (id_ingrediente_FK) REFERENCES Ingrediente(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);



-- Agregando datos a Persona
INSERT INTO Persona (id, nombre, apellidos, correo, edad, sexo)
	VALUES (1, 'Marta', 'Gomez', 'marta@ejercicio9.com', 26, 'Femenino');
INSERT INTO Persona (id, nombre, apellidos, correo, edad, sexo)
	VALUES (2, 'Alex', 'Paris', 'alex@ejercicio9.com', 30, 'Masculino');

-- Agregando datos a Receta
INSERT INTO Receta (id, nombre, tiempo, preparacion, fecha, id_persona_FK)
	VALUES (1001, 'Tarta de Manzana', 60, '1. Precalentar el horno a 180°C.\n2. Pelar y cortar las manzanas...\n', '2023-08-01', 1);

-- Agregando datos a Cocinero
INSERT INTO Cocinero (id_persona_FK, id_receta_FK, fecha)
VALUES (1, 1001, '2023-08-01');

-- Agregando datos a Grupo_alimentario
INSERT INTO Grupo_alimentario (id, nombre)
VALUES (1, 'Frutas');

-- Agregando datos a Ingrediente
INSERT INTO Ingrediente (id, nombre, id_grupo_alimentario_FK)
VALUES (1, 'Manzana', 1);

-- Agregando datos a Contiene
INSERT INTO Contiene (id_receta_FK, id_ingrediente_FK, cantidad)
VALUES (1001, 1, 4);


-- Actualizando datos
UPDATE Persona
SET edad=33
WHERE id=2;

-- Borrando datos
DELETE FROM Persona where id=2;


