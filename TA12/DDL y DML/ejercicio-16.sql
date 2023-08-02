create database ex16;
use ex16;

create table usuarios(
	id int auto_increment primary key,
    nombre varchar(50),
    email varchar(50),
    contrasena varchar(512)
);

create table tweets(
	id int auto_increment primary key,
    multimedia varchar(100),
	tweet varchar(200)
);

create table seguidores(
	seguido int,
    seguidor int,
    foreign key(seguido) references usuarios(id)
    on delete cascade
    on update cascade,
    foreign key(seguidor) references usuarios(id)
    on delete cascade
    on update cascade
);

create table usuario_tweet(
	usuario int,
    tweet int,
    foreign key(usuario) references usuarios(id)
    on delete cascade
    on update cascade,
    foreign key(tweet) references tweets(id)
    on delete cascade
    on update cascade
);



INSERT INTO usuarios (nombre, email, contrasena) VALUES
('Usuario1', 'usuario1@example.com', 'contrasena123'),
('Usuario2', 'usuario2@example.com', 'clave456'),
('Usuario3', 'usuario3@example.com', 'pass789'),
('Usuario4', 'usuario4@example.com', '123456')
;

INSERT INTO tweets (multimedia, tweet) VALUES
('imagen1.jpg', 'Este es el primer tweet.'),
('video1.mp4', 'Compartiendo un video interesante.'),
(NULL, 'Un tweet sin multimedia.'),
('imagen2.png', '¡Seguimos compartiendo contenido!');

INSERT INTO seguidores (seguido, seguidor) VALUES
(1, 2),
(1, 3);

INSERT INTO seguidores (seguido, seguidor) VALUES
(2, 1);

INSERT INTO seguidores (seguido, seguidor) VALUES
(3, 1);


INSERT INTO usuario_tweet (usuario, tweet) VALUES
(1, 1),
(1, 3);

INSERT INTO usuario_tweet (usuario, tweet) VALUES
(2, 2),
(2, 4);

INSERT INTO usuario_tweet (usuario, tweet) VALUES
(3, 3),
(3, 4);



-- Actualizacion de registros
UPDATE usuarios
SET nombre = 'Usuario5'
WHERE id = 4;

-- Eliminando registro
DELETE FROM usuarios WHERE id=4;


