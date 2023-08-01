create database ex4;
use ex4;

create table departamento(
	codigo int auto_increment primary key,
    nombre nvarchar(100),
    presupuesto int
);

create table empleado(
	dni varchar(8) primary key,
    nombre nvarchar(100),
    apellidos nvarchar(255),
    departamento int null,
    foreign key(departamento) references departamento(codigo)
    on delete cascade
    on update cascade
);
