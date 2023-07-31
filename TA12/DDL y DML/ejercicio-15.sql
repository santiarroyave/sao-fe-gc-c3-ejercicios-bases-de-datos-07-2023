CREATE DATABASE ex15;
use ex15;
create table plato(
	id int auto_increment primary key,
    nombre varchar(25),
    descripcion varchar(25)
);

INSERT INTO plato (nombre, descripcion) VALUES
('Plato 1', 'Descripción del Plato 1'),
('Plato 2', 'Descripción del Plato 2'),
('Plato 3', 'Descripción del Plato 3');


create table primero(
	id int primary key,
    FOREIGN KEY(id) REFERENCES plato(id)
    ON DELETE cascade
    ON UPDATE cascade
);

INSERT INTO primero (id) VALUES (1);


create table segundo(
	id int primary key,
    FOREIGN KEY(id) REFERENCES plato(id)
    ON DELETE cascade
    ON UPDATE cascade
);

INSERT INTO segundo (id) VALUES (2);


create table postre(
	id int primary key,
    FOREIGN KEY(id) REFERENCES plato(id)
    ON DELETE cascade
    ON UPDATE cascade
);

INSERT INTO postre (id) VALUES (3);


create table menu(
	id int auto_increment primary key,
    hora varchar(10)
);

INSERT INTO menu (hora) VALUES ('12:00 PM'), ('7:00 PM');


create table fechas(
	fecha date primary key,
    temperatura int
);

INSERT INTO fechas (fecha, temperatura) VALUES
('2023-07-26', 28),
('2023-07-27', 30),
('2023-07-28', 26);


create table menu_plato(
	menu int,
    plato int,
    primary key(menu,plato),
    foreign key(menu) references menu(id)
    on delete cascade
    on update cascade,
    foreign key(plato) references plato(id)
    on delete cascade
    on update cascade
);

INSERT INTO menu_plato (menu, plato) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2);

create table menu_fecha(
	menu int,
    fecha date,
    num_personas int,
    primary key(menu,fecha),
    foreign key(menu) references menu(id)
    on delete cascade
    on update cascade,
    foreign key(fecha) references fechas(fecha)
    on delete cascade
    on update cascade
);

INSERT INTO menu_fecha (menu, fecha, num_personas) VALUES
(1, '2023-07-26', 4),
(1, '2023-07-27', 6),
(1, '2023-07-28', 3),
(2, '2023-07-26', 5),
(2, '2023-07-27', 8);


create table plato_fecha(
	plato int,
    fecha date,
    primary key(plato,fecha),
    foreign key(plato) references plato(id)
    on delete cascade
    on update cascade,
    foreign key(fecha) references fechas(fecha)
    on delete cascade
    on update cascade
);

INSERT INTO plato_fecha (plato, fecha) VALUES
(1, '2023-07-26'),
(2, '2023-07-26'),
(3, '2023-07-26'),
(1, '2023-07-27'),
(2, '2023-07-27');

-- Supongamos que queremos cambiar la descripción del 'Plato 1'.
UPDATE plato SET descripcion = 'Nueva descripción' WHERE id = 1;
-- Supongamos que queremos eliminar el plato asociado al 'primero' con ID = 1.
DELETE FROM primero WHERE id = 1;
-- Supongamos que queremos cambiar la hora del 'menu' con ID = 2.
UPDATE menu SET hora = '8:30 PM' WHERE id = 2;
-- Supongamos que queremos eliminar la fecha '2023-07-28' de la tabla 'fechas'.
DELETE FROM fechas WHERE fecha = '2023-07-28';
-- Supongamos que queremos cambiar el número de personas para el 'menu' con ID = 1 y fecha '2023-07-26'.
UPDATE menu_fecha SET num_personas = 5 WHERE menu = 1 AND fecha = '2023-07-26';
-- Supongamos que queremos eliminar la relación entre el 'plato' con ID = 1 y la fecha '2023-07-26'.
DELETE FROM plato_fecha WHERE plato = 1 AND fecha = '2023-07-26';
