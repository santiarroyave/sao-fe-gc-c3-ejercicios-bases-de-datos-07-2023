create database ex1;
use ex1;

create table estaciones(
	id int auto_increment primary key,
    latitud float,
    longitud float,
    altitud float
);

create table muestras(
	id int primary key,
	fecha date,
    temp_min int,
    temp_max int,
    precipitaciones int,
    humedad_min int,
    vel_viento_min int,
    vel_viento_max int,
    foreign key(id) references estaciones(id)
    on delete cascade
    on update cascade
);
