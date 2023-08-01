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
