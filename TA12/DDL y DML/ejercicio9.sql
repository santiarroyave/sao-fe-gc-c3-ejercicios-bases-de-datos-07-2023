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
