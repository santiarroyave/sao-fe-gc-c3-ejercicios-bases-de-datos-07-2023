CREATE DATABASE ex18;
USE ex18;

CREATE TABLE usuarios(
	dni varchar(9),
    tel_fijo int,
    movil int,
    nombre varchar(20),
    apellidos varchar(40),
    PRIMARY KEY(dni)
);

CREATE TABLE inmuebles(
	id int auto_increment,
    metros int,
    direccion varchar(40),
    descripcion varchar(100),
    PRIMARY KEY(id)
);

CREATE TABLE pisos(
	id int,
    PRIMARY KEY(id),
    FOREIGN KEY(id) references inmuebles(id) on update cascade on delete cascade
);

CREATE TABLE locales(
	id int,
    uso varchar(30),
    servicio varchar(40),
    PRIMARY KEY(id),
    FOREIGN KEY(id) references inmuebles(id) on update cascade on delete cascade
);

CREATE TABLE garajes(
	id int,
    numero varchar(10),
    planta varchar(20),
    PRIMARY KEY(id),
    FOREIGN KEY(id) references inmuebles(id) on update cascade on delete cascade
);

CREATE TABLE pagos(
	id int auto_increment,
    fecha date,
    cuota int,
    PRIMARY KEY(id)
);

CREATE TABLE compra_inmueble(
	id int auto_increment,
    id_inmueble int,
    dni_usuario varchar(9),
    fecha date,
    valor int,
    PRIMARY KEY(id),
    FOREIGN KEY(id_inmueble) references inmuebles(id) on update cascade on delete cascade,
	FOREIGN KEY(dni_usuario) references usuarios(dni) on update cascade on delete cascade
);

CREATE TABLE alquiler_inmueble(
    num_alquiler int auto_increment,
    agente varchar(20),
    id_inmueble int,
    dni_propietario varchar(9),
	dni_inquilino varchar(9),
    id_pago int,
    PRIMARY KEY(num_alquiler),
    FOREIGN KEY(id_inmueble) references inmuebles(id) on update cascade on delete cascade,
    FOREIGN KEY(dni_propietario) references usuarios(dni) on update cascade on delete cascade,
    FOREIGN KEY(dni_inquilino) references usuarios(dni) on update cascade on delete cascade,
    FOREIGN KEY(id_pago) references pagos(id) on update cascade on delete cascade
);
    
-- Agregando datos a Usuarios
INSERT INTO usuarios (dni, tel_fijo, movil, nombre, apellidos)
	VALUES ("39900001A", 977000001, 666000001, "Marta", "Díaz");
INSERT INTO usuarios (dni, tel_fijo, movil, nombre, apellidos)
	VALUES ("39900002B", 977000002, 666000002, "Jorge", "Ramirez");
INSERT INTO usuarios (dni, tel_fijo, movil, nombre, apellidos)
	VALUES ("39900003C", 977000003, 666000003, "Lucía", "Mendez");
INSERT INTO usuarios (dni, tel_fijo, movil, nombre, apellidos)
	VALUES ("39900004D", 977000004, 666000004, "Paco", "Hurtado");

-- Agregando datos a Pisos
INSERT INTO inmuebles (metros, direccion, descripcion)
	VALUES (200, "Av. Principal 1", "Atico nuevo");
INSERT INTO pisos(id)
	values(LAST_INSERT_ID());
    
-- Agregando datos a Locales
INSERT INTO inmuebles (metros, direccion, descripcion)
	VALUES (150, "Av. Constitucion 3", "Local en buen estado");
INSERT INTO locales (id, uso, servicio)
	VALUES (LAST_INSERT_ID(), "Ventas", "Movil");
    
-- Agregando datos a Garajes
INSERT INTO inmuebles (metros, direccion, descripcion)
	VALUES (80, "Calle Garajes 22", "Garaje pequeño para dos coches");
INSERT INTO garajes(id, numero, planta)
	VALUES (LAST_INSERT_ID(), 1, 2);

-- Agregando datos a Pagos
INSERT INTO pagos (fecha, cuota)
	VALUES ("2023-08-01", 500);
INSERT INTO pagos (fecha, cuota)
	VALUES ("2023-07-14", 700);

-- Agregando datos a compra_inmueble
INSERT INTO compra_inmueble (id_inmueble, dni_usuario, fecha, valor)
	VALUES (1, "39900001A", "2023-05-14", 250000);

-- Agregando datos a alquiler_inmueble
INSERT INTO alquiler_inmueble (agente, id_inmueble, dni_propietario, dni_inquilino, id_pago)
	VALUES ("Teresa", 2, "39900002B", "39900003C", 2);
    


-- Actualizacion datos
UPDATE pagos
SET fecha="2023-07-15"
WHERE id=2;

-- Borrando usuario
DELETE FROM usuarios WHERE dni="39900004D";
    