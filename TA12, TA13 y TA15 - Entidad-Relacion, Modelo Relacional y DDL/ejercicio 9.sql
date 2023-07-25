DROP DATABASE recetas;
CREATE DATABASE recetas;

USE recetas;

CREATE TABLE persona(   
	id int auto_increment,
    nombre varchar(30) NOT NULL,
    apellidos varchar(40),
    correo varchar(40) NOT NULL,
    edad int,
    sexo varchar(20),
    primary key(id)
);

CREATE TABLE receta(
	id int auto_increment,
    nombre varchar(40),
    tiempo int,
    preparacion varchar(400),
    fecha_creacion date,
    id_creador int,
    primary key(id),
    foreign key(id_creador) references persona(id)
    on update cascade 
    on delete cascade
);

CREATE TABLE cocinero(
	id_persona int,
    id_receta int,
    fecha date,
    foreign key(id_persona) references persona(id)
    on update cascade 
    on delete cascade,
    foreign key(id_receta) references receta(id)
	on update cascade 
    on delete cascade
);

CREATE TABLE grupo_alimentario(
	id int,
    nombre varchar(20),
    primary key(id)
);

CREATE TABLE ingrediente(
	id int auto_increment,
    nombre varchar(30),
    id_grupo_alimentario int,
    primary key(id),
    foreign key(id_grupo_alimentario) references grupo_alimentario(id)
    on update cascade 
    on delete cascade
);

CREATE TABLE contiene(
	id_receta int,
    id_ingrediente int,
    cantidad int,
    primary key(id_receta, id_ingrediente),
    foreign key(id_receta) references receta(id)
    on update cascade 
    on delete cascade,
    foreign key(id_ingrediente) references ingrediente(id)
    on update cascade 
    on delete cascade
);


SHOW tables;