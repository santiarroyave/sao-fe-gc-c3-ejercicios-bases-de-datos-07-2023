-- EJERCICIO 2

CREATE DATABASE ex2;
USE ex2;

CREATE TABLE libro(
	clave_libro int,
    titulo varchar(60),
    idioma varchar(15),
    formato varchar(15),
    clave_editorial smallint,
    primary key(clave_libro)
);

CREATE TABLE tema(
	clave_tema smallint,
    nombre varchar(40),
    primary key(clave_tema)
);

CREATE TABLE autor(
	clave_autor int,
    nombre varchar(60),
    primary key(clave_autor)
);

CREATE TABLE editorial(
	clave_editorial smallint,
    nombre varchar(60),
    direccion varchar(60),
    telefono varchar(15),
    primary key(clave_editorial)
);

CREATE TABLE ejemplar(
	clave_ejemplar int,
    clave_libro int,
    numero_orden smallint,
    edicion smallint,
    ubicacion varchar(15),
    categoria char,
    primary key(clave_ejemplar),
    foreign key(clave_libro) references libro(clave_libro) on update cascade on delete cascade
);

CREATE TABLE socio(
	clave_socio int,
    nombre varchar(60),
    direccion varchar(60),
    telefono varchar(15),
    categoria char,
    PRIMARY KEY(clave_socio)
);

CREATE TABLE prestamo(
	clave_socio int,
    clave_ejemplar int,
    numero_orden smallint,
    fecha_prestamo date,
    fecha_devolucion date,
    notas blob,
    PRIMARY KEY(clave_socio, clave_ejemplar, numero_orden),
    FOREIGN KEY(clave_socio) references socio(clave_socio) on update cascade on delete cascade,
    FOREIGN KEY(clave_ejemplar) references ejemplar(clave_ejemplar) on update cascade on delete cascade
);

CREATE TABLE trata_sobre(
	clave_libro int,
    clave_tema smallint,
    PRIMARY KEY(clave_libro, clave_tema),
    FOREIGN KEY(clave_libro) references libro(clave_libro) on update cascade on delete cascade,
    FOREIGN KEY(clave_tema) references tema(clave_tema) on update cascade on delete cascade
);

CREATE TABLE escrito_por(
	clave_libro int,
    clave_autor int,
    PRIMARY KEY(clave_libro, clave_autor),
    FOREIGN KEY(clave_libro) references libro(clave_libro) on update cascade on delete cascade,
    FOREIGN KEY(clave_autor) references autor(clave_autor) on update cascade on delete cascade
);