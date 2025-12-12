DROP DATABASE IF EXISTS actividad;

CREATE DATABASE IF NOT EXISTS actividad;

USE actividad;

-- tabla actividad

DROP TABLE IF EXISTS actividad;
CREATE TABLE IF NOT EXISTS actividad (
id smallint primary key auto_increment,
actividad varchar(90) unique not null
);

-- tabla participante

DROP TABLE IF EXISTS participante;
CREATE TABLE IF NOT EXISTS participante (
id smallint primary key auto_increment,
dni varchar(9) unique not null,
od_participante varchar(50) not null,
tipo enum('S','NS') not null,
od_socio varchar(50),
od_no_socio varchar(50)
);

-- tabla participa (interrelación)

DROP TABLE IF EXISTS participa;
CREATE TABLE IF NOT EXISTS participa (
actividad smallint,
participante smallint,
fecha date
);

-- PRIMARY KEY AND FOREIGN KEYS

ALTER TABLE participa ADD CONSTRAINT pk_participa PRIMARY KEY(actividad,participante,fecha);
ALTER TABLE participa ADD CONSTRAINT fk_participa_actividad FOREIGN KEY (actividad) REFERENCES actividad(id) ON UPDATE CASCADE;
ALTER TABLE participa ADD CONSTRAINT fk_participa_participante FOREIGN KEY (participante) REFERENCES participante(id) ON UPDATE CASCADE;

-- CHECKEO DE DATOS SOCIO Y NO SOCIO

ALTER TABLE participante ADD CONSTRAINT ck_socio_no_socio CHECK (
(tipo='S' and od_socio IS NOT NULL and od_no_socio IS NULL) or
(tipo='NS' and od_socio IS NULL and od_no_socio IS NOT NULL));


