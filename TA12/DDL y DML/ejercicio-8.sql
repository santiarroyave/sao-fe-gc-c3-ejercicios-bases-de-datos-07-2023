CREATE DATABASE ejercicio8;
USE ejercicio8;

CREATE TABLE Cliente (
    dni VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    direccion VARCHAR(100),
    telefono VARCHAR(15)
);

CREATE TABLE Aeropuerto (
    id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    localidad VARCHAR(100)
);

CREATE TABLE Avion (
    id INT PRIMARY KEY,
    num_plazas INT
);

CREATE TABLE Vuelo (
    id INT PRIMARY KEY,
    fecha DATE,
    hora_salida TIME,
    horaLlegada TIME,
    aeropuerto_salida_id INT,
    aeropuerto_entrada_id INT,
    id_avion INT,
    FOREIGN KEY (aeropuerto_salida_id) REFERENCES Aeropuerto(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (aeropuerto_entrada_id) REFERENCES Aeropuerto(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (id_avion) REFERENCES Avion(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE Reserva (
    dni_cliente VARCHAR(10),
    id_vuelo INT,
    numero_reserva INT,
    plazas INT,
    PRIMARY KEY (dni_cliente, id_vuelo),
    FOREIGN KEY (dni_cliente) REFERENCES Cliente(dni)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (id_vuelo) REFERENCES Vuelo(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE Asiento (
    fila INT,
    columna INT,
    planta INT,
    id_avion INT,
    PRIMARY KEY (fila, columna, planta, id_avion),
    FOREIGN KEY (id_avion) REFERENCES Avion(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE Tarjetas_embarque (
    id INT PRIMARY KEY,
    dni_cliente VARCHAR(10),
    fila INT,
    columna INT,
    planta INT,
    id_avion INT,
    FOREIGN KEY (dni_cliente) REFERENCES Cliente(dni)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (fila, columna, planta, id_avion) REFERENCES Asiento(fila, columna, planta, id_avion)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);



-- Agregando datos a Cliente
INSERT INTO Cliente(dni, nombre, apellidos, direccion, telefono)
	VALUES("39900001A", "Paco", "Mendez", "Calle victoria 4", "666 000 001");
INSERT INTO Cliente (dni, nombre, apellidos, direccion, telefono)
	VALUES ('1234567890', 'Juan', 'Perez Gonzalez', 'Calle Principal 123', '555-1234');
INSERT INTO Cliente (dni, nombre, apellidos, direccion, telefono)
	VALUES ('39900002B', 'Pedro', 'Palomares', 'Calle triniti', '666 000 003');

-- Agregando datos a Aeropuerto
INSERT INTO Aeropuerto(id, nombre, localidad)
	VALUES(1, "Aeropuerto de madrid", "Madrid");
INSERT INTO Aeropuerto (id, nombre, localidad)
	VALUES (2, 'Aeropuerto de portugal', 'Oporto');

-- Agregando datos a Avion
INSERT INTO Avion (id, num_plazas)
	VALUES (101, 150);

-- Agregando datos a Vuelo
INSERT INTO Vuelo (id, fecha, hora_salida, horaLlegada, aeropuerto_salida_id, aeropuerto_entrada_id, id_avion)
	VALUES (1001, '2023-08-01', '12:00:00', '14:30:00', 1, 2, 101);

-- Agregando datos a Reserva
INSERT INTO Reserva (dni_cliente, id_vuelo, numero_reserva, plazas)
	VALUES ('1234567890', 1001, 1, 2);

-- Agregando datos a Asiento
INSERT INTO Asiento (fila, columna, planta, id_avion)
	VALUES (1, 2, 1, 101);

-- Agregando datos a Tarjetas_embarque
INSERT INTO Tarjetas_embarque (id, dni_cliente, fila, columna, planta, id_avion)
	VALUES (1, '1234567890', 1, 2, 1, 101);



-- Actualizando datos
UPDATE Cliente
SET telefono="666 000 002"
WHERE dni="1234567890";

-- Borrando datos
DELETE FROM Cliente WHERE dni="39900002B";









