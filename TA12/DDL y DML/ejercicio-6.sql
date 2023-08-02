CREATE DATABASE ejercicio6;
USE ejercicio6;

CREATE TABLE Socio (
	dni VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(100),
    codigo_socio INT UNIQUE NOT NULL,
    direccion VARCHAR(95),
    telefono VARCHAR(15)
);

CREATE TABLE Prestamo (
	id INT auto_increment PRIMARY KEY,
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE NOT NULL,
    fecha_tope DATE NOT NULL
);

CREATE TABLE Socios_prestamo (
	dni_socio VARCHAR(10),
    id_prestamo INT,
    
    PRIMARY KEY(dni_socio, id_prestamo),
    FOREIGN KEY (dni_socio) REFERENCES Socio(dni),
    FOREIGN KEY (id_prestamo) REFERENCES Prestamo(id)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE Autor(
	id INT auto_increment PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    pais VARCHAR(30)
);

CREATE TABLE Pelicula(
	codigo INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    año INT,
    resumen VARCHAR(500),
    deteriorado BOOLEAN NOT NULL,
    comentario VARCHAR(200),
    id_autor INT,
    duracion INT,
    
    FOREIGN KEY (id_autor) REFERENCES Autor(id)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE Musica(
	codigo INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    año INT,
    resumen VARCHAR(500),
    deteriorado BOOLEAN NOT NULL,
    comentario VARCHAR(200),
    id_autor INT,
    num_canciones INT,
    
    FOREIGN KEY (id_autor) REFERENCES Autor(id)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE Libro(
	codigo INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    año INT,
    resumen VARCHAR(500),
    deteriorado BOOLEAN NOT NULL,
    comentario VARCHAR(200),
    id_autor INT,
    numero_paginas INT,
    
    FOREIGN KEY (id_autor) REFERENCES Autor(id)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE Prestamo_pelicula(
	id_prestamo INT,
    codigo_pelicula INT,
    
    FOREIGN KEY (id_prestamo) REFERENCES Prestamo(id),
    FOREIGN KEY (codigo_pelicula) REFERENCES Pelicula(codigo)
	ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE Prestamo_libro(
	id_prestamo INT,
    codigo_libro INT,
    
    FOREIGN KEY (id_prestamo) REFERENCES Prestamo(id),
    FOREIGN KEY (codigo_libro) REFERENCES Libro(codigo)
	ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE Prestamo_musica(
	id_prestamo INT,
    codigo_musica INT,
    
    FOREIGN KEY (id_prestamo) REFERENCES Prestamo(id),
    FOREIGN KEY (codigo_musica) REFERENCES Musica(codigo)
	ON DELETE cascade
    ON UPDATE cascade
);

-- inserts 

INSERT INTO Socio (dni, nombre, apellidos, codigo_socio, direccion, telefono)
VALUES ('11111111A', 'Juan', 'Pérez García', 1001, 'Calle Mayor 123', '+34 123456789');

INSERT INTO Socio (dni, nombre, apellidos, codigo_socio, direccion, telefono)
VALUES ('22222222B', 'María', 'López Martínez', 1002, 'Avenida del Sol 45', '+34 987654321');

INSERT INTO Socio (dni, nombre, apellidos, codigo_socio, direccion, telefono)
VALUES ('33333333C', 'Pedro', 'González Ramírez', 1003, 'Plaza Central 7', '+34 555555555');

INSERT INTO Prestamo (fecha_prestamo, fecha_devolucion, fecha_tope)
VALUES ('2023-07-28', '2023-08-10', '2023-08-11');

INSERT INTO Prestamo (fecha_prestamo, fecha_devolucion, fecha_tope)
VALUES ('2023-07-29', '2023-08-05', '2023-08-08');

INSERT INTO Prestamo (fecha_prestamo, fecha_devolucion, fecha_tope)
VALUES ('2023-07-30', '2023-08-06', '2023-08-09');

INSERT INTO Socios_prestamo (dni_socio, id_prestamo)
VALUES ('11111111A', 1);

INSERT INTO Socios_prestamo (dni_socio, id_prestamo)
VALUES ('22222222B', 2);

INSERT INTO Socios_prestamo (dni_socio, id_prestamo)
VALUES ('33333333C', 3);

INSERT INTO Autor (nombre, pais)
VALUES ('J.K. Rowling', 'Reino Unido');

INSERT INTO Autor (nombre, pais)
VALUES ('Gabriel García Márquez', 'Colombia');

INSERT INTO Autor (nombre, pais)
VALUES ('Stephen King', 'Estados Unidos');

INSERT INTO Pelicula (codigo, nombre, año, resumen, deteriorado, comentario, id_autor, duracion)
VALUES (10001, 'Harry Potter y la piedra filosofal', 2001, 'Un joven mago descubre su destino en una escuela de magia.', 0, 'Buena película para toda la familia.', 1, 152);

INSERT INTO Pelicula (codigo, nombre, año, resumen, deteriorado, comentario, id_autor, duracion)
VALUES (10002, 'El amor en los tiempos del cólera', 2007, 'Una historia de amor a lo largo de varias décadas.', 0, 'Adaptación cinematográfica de la famosa novela.', 2, 142);

INSERT INTO Pelicula (codigo, nombre, año, resumen, deteriorado, comentario, id_autor, duracion)
VALUES (10003, 'El resplandor', 1980, 'Un escritor y su familia se hospedan en un hotel embrujado.', 1, 'Una de las mejores películas de terror.', 3, 146);

INSERT INTO Musica (codigo, nombre, año, resumen, deteriorado, comentario, id_autor, num_canciones)
VALUES (20001, 'Thriller', 1982, 'Álbum icónico de Michael Jackson con varios éxitos.', 0, 'Uno de los discos más vendidos de la historia.', 3, 9);

INSERT INTO Musica (codigo, nombre, año, resumen, deteriorado, comentario, id_autor, num_canciones)
VALUES (20002, 'Sgt. Pepper''s Lonely Hearts Club Band', 1967, 'Álbum influyente de The Beatles que marcó época.', 0, 'Una obra maestra del rock.', 2, 13);

INSERT INTO Musica (codigo, nombre, año, resumen, deteriorado, comentario, id_autor, num_canciones)
VALUES (20003, 'Back in Black', 1980, 'El regreso triunfal de AC/DC tras la muerte de su vocalista.', 1, 'Uno de los mejores discos de hard rock.', 3, 10);

INSERT INTO Libro (codigo, nombre, año, resumen, deteriorado, comentario, id_autor, numero_paginas)
VALUES (30001, 'Harry Potter y la cámara secreta', 1998, 'El segundo año de Harry Potter en Hogwarts.', 0, 'Continuación de la exitosa saga.', 1, 256);

INSERT INTO Libro (codigo, nombre, año, resumen, deteriorado, comentario, id_autor, numero_paginas)
VALUES (30002, 'Cien años de soledad', 1967, 'La saga de la familia Buendía en Macondo.', 0, 'Una obra maestra de la literatura latinoamericana.', 2, 432);

INSERT INTO Libro (codigo, nombre, año, resumen, deteriorado, comentario, id_autor, numero_paginas)
VALUES (30003, 'It', 1986, 'El aterrador payaso Pennywise aterroriza a un pueblo.', 1, 'Una novela clásica de Stephen King.', 3, 1138);

INSERT INTO Prestamo_pelicula (id_prestamo, codigo_pelicula)
VALUES (1, 10001);

INSERT INTO Prestamo_pelicula (id_prestamo, codigo_pelicula)
VALUES (2, 10002);

INSERT INTO Prestamo_pelicula (id_prestamo, codigo_pelicula)
VALUES (3, 10003);

INSERT INTO Prestamo_libro (id_prestamo, codigo_libro)
VALUES (1, 30001);

INSERT INTO Prestamo_libro (id_prestamo, codigo_libro)
VALUES (2, 30002);

INSERT INTO Prestamo_libro (id_prestamo, codigo_libro)
VALUES (3, 30003);

INSERT INTO Prestamo_musica (id_prestamo, codigo_musica)
VALUES (1, 20001);

INSERT INTO Prestamo_musica (id_prestamo, codigo_musica)
VALUES (2, 20002);

INSERT INTO Prestamo_musica (id_prestamo, codigo_musica)
VALUES (3, 20003);


UPDATE Socio
SET nombre = "Jose"
WHERE dni="11111111A";

DELETE FROM Libro WHERE codigo=30003;













