DROP DATABASE IF EXISTS videojuegos;
CREATE DATABASE IF NOT EXISTS videojuegos;

USE videojuegos;

CREATE TABLE IF NOT EXISTS desarrollador (
iddesarrollador integer primary key auto_increment,
nombre varchar(100) unique not null,
pais varchar(50)
);

CREATE TABLE IF NOT EXISTS juego (
idjuego integer primary key auto_increment,
titulo varchar(80) unique not null,
fecha_lanzamiento date,
desarrollador integer,
CONSTRAINT fk_juego_desarrollador
FOREIGN KEY (desarrollador)
REFERENCES desarrollador(iddesarrollador)
ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS dlc (
iddlc integer,
nombre varchar(100) unique not null,
idjuego integer,
CONSTRAINT fk_dlc_juego
FOREIGN KEY (idjuego)
REFERENCES juego(idjuego)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT pk_dlc
PRIMARY KEY (iddlc,idjuego)
);

CREATE TABLE IF NOT EXISTS cliente (
idcliente integer primary key auto_increment,
dni varchar(9) unique not null,
nombre varchar(60) not null
);

CREATE TABLE IF NOT EXISTS alquiler (
idcliente integer,
idjuego integer,
fecha_alquiler date not null,
dias int,
CONSTRAINT ck_dias
CHECK (dias > 0),
CONSTRAINT fk_alquiler_cliente
FOREIGN KEY (idcliente)
REFERENCES cliente(idcliente)
ON DELETE CASCADE,
CONSTRAINT fk_alquiler_juego
FOREIGN KEY (idjuego)
REFERENCES juego(idjuego)
ON DELETE RESTRICT,
CONSTRAINT pk_alquiler
PRIMARY KEY (idcliente,idjuego,fecha_alquiler)
);