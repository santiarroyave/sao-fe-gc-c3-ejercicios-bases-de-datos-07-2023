create database ex5;
use ex5;

create table almacenes(
	codigo int auto_increment primary key,
    lugar nvarchar(100),
    capacidad int
);

create table cajas(
	num_ref varchar(5) primary key,
    contenido nvarchar(100),
    valor int,
    almacen int,
    foreign key(almacen) references almacenes(codigo)
    on delete cascade on update cascade
);
