create database ex14;
use ex14;

CREATE TABLE Superusuarios (
    id int auto_increment PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    foto VARCHAR(200),
    contraseña VARCHAR(100) NOT NULL
);

CREATE TABLE Usuarios (
    email VARCHAR(100) PRIMARY KEY,
    direccion VARCHAR(200),
    superusuario int,
    FOREIGN KEY (superusuario) REFERENCES Superusuarios(id)
    on delete cascade
    on update cascade
);

CREATE TABLE Telefonos (
    id int auto_increment PRIMARY KEY,
    numero VARCHAR(20),
    usuario VARCHAR(100),
    FOREIGN KEY (usuario) REFERENCES Usuarios(email)
    on delete cascade
    on update cascade
);

CREATE TABLE Contactos (
    id int auto_increment PRIMARY KEY,
    comentario VARCHAR(200),
    usuario VARCHAR(100),
    FOREIGN KEY (usuario) REFERENCES Usuarios(email)
    on delete cascade
    on update cascade
);

CREATE TABLE Grupos (
    id int auto_increment PRIMARY KEY,
    nombre VARCHAR(100),
    usuario VARCHAR(100),
    FOREIGN KEY (usuario) REFERENCES Usuarios(email)
    on delete cascade
    on update cascade
);

CREATE TABLE RedComentarios (
    id int auto_increment PRIMARY KEY,
    texto VARCHAR(200),
    imagen VARCHAR(200)
);

CREATE TABLE Grupos_contactos (
    grupo int,
    contacto int,
    PRIMARY KEY (grupo, contacto),
    FOREIGN KEY (grupo) REFERENCES Grupos(id)
    on delete cascade
    on update cascade,
    FOREIGN KEY (contacto) REFERENCES Contactos(id)
    on delete cascade
    on update cascade
);

CREATE TABLE Usuarios_redcomentarios (
    usuario VARCHAR(100),
    red_comentario int,
    PRIMARY KEY (usuario, red_comentario),
    FOREIGN KEY (usuario) REFERENCES Usuarios(email)
    on delete cascade
    on update cascade,
    FOREIGN KEY (red_comentario) REFERENCES RedComentarios(id)
    on delete cascade
    on update cascade
);

CREATE TABLE Redcomentarios_grupos (
    red_comentario int,
    grupo int,
    PRIMARY KEY (red_comentario, grupo),
    FOREIGN KEY (red_comentario) REFERENCES RedComentarios(id)
    on delete cascade
    on update cascade,
    FOREIGN KEY (grupo) REFERENCES Grupos(id)
    on delete cascade
    on update cascade
);

CREATE TABLE Redcomentarios_contactos (
    red_comentario int,
    comentario int,
    PRIMARY KEY (red_comentario, comentario),
    FOREIGN KEY (red_comentario) REFERENCES RedComentarios(id)
    on delete cascade
    on update cascade,
    FOREIGN KEY (comentario) REFERENCES Contactos(id)
    on delete cascade
    on update cascade
);

CREATE TABLE Usuarios_bloqueados (
    bloqueante VARCHAR(100),
    bloqueado VARCHAR(100),
    PRIMARY KEY (bloqueante, bloqueado),
    FOREIGN KEY (bloqueante) REFERENCES Usuarios(email)
    on delete cascade
    on update cascade,
    FOREIGN KEY (bloqueado) REFERENCES Usuarios(email)
    on delete cascade
    on update cascade
);

-- Inserción de datos en la tabla Superusuarios
INSERT INTO Superusuarios (id, nombre, apellidos, foto, contraseña)
VALUES (1, 'Superusuario 1', 'Apellido 1', 'foto1.jpg', 'contraseña1'),
       (2, 'Superusuario 2', 'Apellido 2', 'foto2.jpg', 'contraseña2');

-- Inserción de datos en la tabla Usuarios
INSERT INTO Usuarios (email, direccion, superusuario)
VALUES ('usuario1@example.com', 'Calle Mayor 123', 1),
       ('usuario2@example.com', 'Avenida Principal 456', 2);

-- Inserción de datos en la tabla Telefonos
INSERT INTO Telefonos (id, numero, usuario)
VALUES (101, '987654321', 'usuario1@example.com'),
       (102, '654321987', 'usuario2@example.com');

-- Inserción de datos en la tabla Contactos
INSERT INTO Contactos (id, comentario, usuario)
VALUES (201, 'Contacto 1', 'usuario1@example.com'),
       (202, 'Contacto 2', 'usuario2@example.com');

-- Inserción de datos en la tabla Grupos
INSERT INTO Grupos (id, nombre, usuario)
VALUES (301, 'Grupo 1', 'usuario1@example.com'),
       (302, 'Grupo 2', 'usuario2@example.com');

-- Inserción de datos en la tabla RedComentarios
INSERT INTO RedComentarios (id, texto, imagen)
VALUES (401, 'Comentario 1', 'imagen1.jpg'),
       (402, 'Comentario 2', 'imagen2.jpg');

-- Inserción de datos en la tabla Grupos_contactos
INSERT INTO Grupos_contactos (grupo, contacto)
VALUES (301, 201),
       (302, 202);

-- Inserción de datos en la tabla Usuarios_redcomentarios
INSERT INTO Usuarios_redcomentarios (usuario, red_comentario)
VALUES ('usuario1@example.com', 401),
       ('usuario2@example.com', 402);

-- Inserción de datos en la tabla Redcomentarios_grupos
INSERT INTO Redcomentarios_grupos (red_comentario, grupo)
VALUES (401, 301),
       (402, 302);

-- Inserción de datos en la tabla Redcomentarios_contactos
INSERT INTO Redcomentarios_contactos (red_comentario, comentario)
VALUES (401, 201),
       (402, 202);

-- Inserción de datos en la tabla Usuarios_bloqueados
INSERT INTO Usuarios_bloqueados (bloqueante, bloqueado)
VALUES ('usuario1@example.com', 'usuario2@example.com');

-- Ejemplo de UPDATE: Actualizar el nombre de un superusuario en la tabla Superusuarios
UPDATE Superusuarios
SET nombre = 'Nuevo Superusuario'
WHERE id = 2;

-- Ejemplo de DELETE: Eliminar un grupo y sus referencias en las tablas Grupos, Grupos_contactos y Redcomentarios_grupos
DELETE FROM Redcomentarios_grupos WHERE grupo = 302;
DELETE FROM Grupos_contactos WHERE grupo = 302;
DELETE FROM Grupos WHERE id = 302;
