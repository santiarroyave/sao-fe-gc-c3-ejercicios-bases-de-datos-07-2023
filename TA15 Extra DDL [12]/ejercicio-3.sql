create database ex3;
use ex3;

create table fabricante(
	codigo int auto_increment primary key,
    nombre varchar(100)
);

create table articulo(
	codigo int auto_increment primary key,
    nombre varchar(100),
    precio int,
    fabricante int null,
    foreign key(fabricante) references fabricante(codigo)
    on delete cascade
    on update cascade
);
