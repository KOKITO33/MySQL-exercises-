CREATE DATABASE IF NOT EXISTS participantes;
USE participantes;

CREATE TABLE IF NOT EXISTS actividad (
id integer primary key auto_increment,
actividad varchar(40) unique not null,
od_actividad varchar(45)
);

CREATE TABLE IF NOT EXISTS participante (
id integer primary key auto_increment,
dni varchar(9) unique not null,
od_participante varchar(45) not null
);

CREATE TABLE IF NOT EXISTS participa (
actividad integer,
participante integer,
fecha date
);

CREATE TABLE IF NOT EXISTS socio (
participante integer,
od_socio varchar(45) not null
);

CREATE TABLE IF NOT EXISTS no_socio (
participante integer,
od_no_socio varchar(45) not null
);

ALTER TABLE participa ADD CONSTRAINT pk_participa PRIMARY KEY (actividad,participante,fecha);
ALTER TABLE participa ADD CONSTRAINT fk_participa_actividad FOREIGN KEY (actividad) REFERENCES actividad(id) ON UPDATE CASCADE;
ALTER TABLE participa ADD CONSTRAINT fk_participa_participante FOREIGN KEY (participante) REFERENCES participante(id) ON UPDATE CASCADE;

ALTER TABLE socio ADD CONSTRAINT fk_socio_participante FOREIGN KEY (participante) REFERENCES participante(id) ON UPDATE CASCADE;

ALTER TABLE no_socio ADD CONSTRAINT fk_no_socio_participante FOREIGN KEY (participante) REFERENCES participante(id) ON UPDATE CASCADE;