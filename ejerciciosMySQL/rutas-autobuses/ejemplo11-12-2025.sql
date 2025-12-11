CREATE database IF NOT EXISTS rutas;

USE rutas;

CREATE TABLE IF NOT EXISTS ruta (
idruta smallint primary key auto_increment,
ruta varchar(50) unique not null
);

CREATE TABLE IF NOT EXISTS poblacion (
idpoblacion smallint primary key auto_increment,
poblacion varchar(90) unique not null
);

CREATE TABLE IF NOT EXISTS pasa_por (
ruta varchar(50),
poblacion varchar(90),
dia char(1),
hora time,

CONSTRAINT pk_pasa_por
PRIMARY KEY(ruta,poblacion,dia,hora),

CONSTRAINT fk_pasa_por_ruta
FOREIGN KEY(ruta)
REFERENCES ruta(ruta)
ON UPDATE CASCADE,

CONSTRAINT fk_pasa_por_poblacion
FOREIGN KEY(poblacion)
REFERENCES poblacion(poblacion)
ON UPDATE CASCADE,

CONSTRAINT ck_dia
CHECK(dia IN('L','M','X','J','V','S','D'))
);

/*
Ejercicio de modificación de contenido de una tabla
Modifying a table's content exercise
*/

ALTER TABLE ruta ADD distancia varchar(50) not null;

ALTER TABLE ruta MODIFY distancia smallint not null;

ALTER TABLE ruta ADD CONSTRAINT ck_distancia CHECK(distancia > 0);

ALTER TABLE ruta DROP constraint ck_distancia;

ALTER TABLE ruta CHANGE distancia km smallint not null;

ALTER TABLE ruta ADD CONSTRAINT ck_km CHECK(km > 0);
