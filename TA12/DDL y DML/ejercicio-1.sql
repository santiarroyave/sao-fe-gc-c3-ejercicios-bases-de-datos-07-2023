create database ex1;
use ex1;

CREATE TABLE Personas (
    cod_socio int auto_increment primary key,
    dni VARCHAR(10) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    direccion VARCHAR(200),
    telefono VARCHAR(20)
);

CREATE TABLE Libros (
    isbn varchar(30) PRIMARY KEY,
    editorial VARCHAR(100) NOT NULL,
    titulo VARCHAR(200) NOT NULL,
    ano_escritura int
);

CREATE TABLE Autores (
    id int auto_increment PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE autores_libros (
    autor int,
    libro varchar(30),
    PRIMARY KEY (autor, libro),
    FOREIGN KEY (autor) REFERENCES Autores(id)
    on delete cascade
    on update cascade,
    FOREIGN KEY (libro) REFERENCES Libros(isbn)
    on delete cascade
    on update cascade
);

CREATE TABLE Volumenes (
    id int auto_increment PRIMARY KEY,
    deteriorado BOOLEAN,
    libro varchar(30),
    FOREIGN KEY (libro) REFERENCES Libros(isbn)
    on delete cascade
    on update cascade
);

CREATE TABLE Prestamos (
    id int auto_increment PRIMARY KEY,
    fecha_real DATE,
    fecha_prestamo DATE,
    persona int,
    volumen int,
    FOREIGN KEY (persona) REFERENCES Personas(cod_socio)
    on delete cascade
    on update cascade,
    FOREIGN KEY (volumen) REFERENCES Volumenes(id)
    on delete cascade
    on update cascade
);

-- Inserción de datos en la tabla Personas
INSERT INTO Personas (cod_socio, dni, nombre, apellidos, direccion, telefono)
VALUES (1, '12345678A', 'Juan', 'Perez', 'Calle Mayor 123', '555-1234');

-- Inserción de datos en la tabla Libros
INSERT INTO Libros (isbn, editorial, titulo, ano_escritura)
VALUES ('978-0123456789', 'Editorial X', 'Libro de Prueba', 2023);

-- Inserción de datos en la tabla Autores
INSERT INTO Autores (id, nombre)
VALUES (1, 'Autor Prueba');

-- Inserción de datos en la tabla autores_libros
INSERT INTO autores_libros (autor, libro)
VALUES (1, '978-0123456789');

-- Inserción de datos en la tabla Volumenes
INSERT INTO Volumenes (id, deteriorado, libro)
VALUES (1, FALSE, '978-0123456789');

-- Inserción de datos en la tabla Prestamos
INSERT INTO Prestamos (id, fecha_real, fecha_prestamo, persona, volumen)
VALUES (1, '2023-07-28', '2023-07-20', 1, 1);

-- Modificación de un préstamo
UPDATE Prestamos
SET fecha_real = '2023-07-28'
WHERE id = 1;

-- Eliminación de un autor y su relación en autores_libros
DELETE FROM autores_libros
WHERE autor = 1;

DELETE FROM Autores
WHERE id = 1;
