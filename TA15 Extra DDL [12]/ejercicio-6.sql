create database ex6;
use ex6;

create table peliculas(
	codigo int,
    nombre nvarchar(100),
    calificacion_edad int,
    PRIMARY KEY(codigo)
);

create table salas(
	codigo int auto_increment,
    nombre nvarchar(100),
    pelicula int,
    PRIMARY KEY(codigo, nombre),
    FOREIGN KEY(pelicula) references peliculas(codigo) on update cascade on delete cascade
);


