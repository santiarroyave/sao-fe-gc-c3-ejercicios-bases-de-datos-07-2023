CREATE DATABASE ejercicio7;
USE ejercicio7;

CREATE TABLE Departamento (
    codigo INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Empleado (
    dni VARCHAR(10) PRIMARY KEY,
    num_ss INT NOT NULL,
    codigo_trabajador INT UNIQUE NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    direccion VARCHAR(95),
    telefono VARCHAR(15),
    codigo_departamento INT,
    FOREIGN KEY (codigo_departamento) REFERENCES Departamento(codigo)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE Departamento_empleado (
    dni_coordinador VARCHAR(10) PRIMARY KEY,
    codigo_departamento INT,
    FOREIGN KEY (dni_coordinador) REFERENCES Empleado(dni)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (codigo_departamento) REFERENCES Departamento(codigo)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE Contrato (
    id INT PRIMARY KEY,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    categoria VARCHAR(50)
);

CREATE TABLE Nomina (
    id INT PRIMARY KEY,
    fecha DATE NOT NULL,
    salario DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Contratacion (
    id_contrato INT,
    id_nomina INT,
    id_empleado VARCHAR(10),
    PRIMARY KEY (id_contrato, id_nomina, id_empleado),
    FOREIGN KEY (id_contrato) REFERENCES Contrato(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (id_nomina) REFERENCES Nomina(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (id_empleado) REFERENCES Empleado(dni)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

INSERT INTO Departamento (codigo, nombre)
VALUES (1, 'Recursos Humanos');

INSERT INTO Departamento (codigo, nombre)
VALUES (2, 'Finanzas');

INSERT INTO Departamento (codigo, nombre)
VALUES (3, 'Ventas');

INSERT INTO Empleado (dni, num_ss, codigo_trabajador, nombre, apellidos, direccion, telefono, codigo_departamento)
VALUES ('11111111A', 123456, 1001, 'Juan', 'González Pérez', 'Calle Mayor 123', '+34 123456789', 1);

INSERT INTO Empleado (dni, num_ss, codigo_trabajador, nombre, apellidos, direccion, telefono, codigo_departamento)
VALUES ('22222222B', 654321, 1002, 'María', 'López Martínez', 'Avenida del Sol 45', '+34 987654321', 2);

INSERT INTO Empleado (dni, num_ss, codigo_trabajador, nombre, apellidos, direccion, telefono, codigo_departamento)
VALUES ('33333333C', 789012, 1003, 'Pedro', 'Ramírez Gómez', 'Plaza Central 7', '+34 555555555', 3);

INSERT INTO Departamento_empleado (dni_coordinador, codigo_departamento)
VALUES ('11111111A', 1);

INSERT INTO Departamento_empleado (dni_coordinador, codigo_departamento)
VALUES ('22222222B', 2);

INSERT INTO Departamento_empleado (dni_coordinador, codigo_departamento)
VALUES ('33333333C', 3);

INSERT INTO Contrato (id, fecha_inicio, fecha_fin, categoria)
VALUES (1, '2023-07-01', '2024-06-30', 'Tiempo completo');

INSERT INTO Contrato (id, fecha_inicio, fecha_fin, categoria)
VALUES (2, '2023-07-15', '2024-07-14', 'Medio tiempo');

INSERT INTO Contrato (id, fecha_inicio, fecha_fin, categoria)
VALUES (3, '2023-08-01', '2024-07-31', 'Tiempo completo');

INSERT INTO Nomina (id, fecha, salario)
VALUES (1, '2023-07-31', 2500.00);

INSERT INTO Nomina (id, fecha, salario)
VALUES (2, '2023-07-31', 1800.00);

INSERT INTO Nomina (id, fecha, salario)
VALUES (3, '2023-08-31', 3000.00);

INSERT INTO Contratacion (id_contrato, id_nomina, id_empleado)
VALUES (1, 1, '11111111A');

INSERT INTO Contratacion (id_contrato, id_nomina, id_empleado)
VALUES (2, 2, '22222222B');

INSERT INTO Contratacion (id_contrato, id_nomina, id_empleado)
VALUES (3, 3, '33333333C');

-- ejemplo de delete. hacemso una transaccion para que los deletes se ejecuten conjuntamente y si hay un error poder tirar atras (ROLLBACK), o commit si ha salido como espravamos
START TRANSACTION;

DELETE FROM Contratacion WHERE id_empleado = '11111111A';
DELETE FROM Empleado WHERE dni = '11111111A';

-- cambiamos un empleado de departamento
START TRANSACTION;

UPDATE Empleado SET codigo_departamento = 2 WHERE dni = '22222222B';

COMMIT;
