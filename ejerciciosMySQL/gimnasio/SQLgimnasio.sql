create database if not exists gimnasio;
use gimnasio;

create table if not exists socio (
idsocio integer primary key auto_increment,
dni varchar(9) unique not null,
nombre varchar(50) not null,
telefono varchar(15)
);

create table if not exists actividad (
idactividad integer primary key auto_increment,
nombre varchar(40) unique not null,
duracion_min integer,
aforo_max integer,
CONSTRAINT ck_duracion
CHECK (duracion_min > 0),
CONSTRAINT ck_aforo
CHECK (aforo_max >= 5)
);

create table if not exists inscripcion (
idsocio integer,
idactividad integer,
fecha date not null,
constraint pk_inscripcion
primary key(idsocio,idactividad),
constraint fk_inscripcion_socio
foreign key (idsocio)
references socio(idsocio)
on delete cascade,
constraint fk_inscripcion_actividad
foreign key (idactividad)
references actividad(idactividad)
on delete cascade
);

create table if not exists monitor (
idmonitor integer primary key auto_increment,
dni varchar(9) unique not null,
nombre varchar(50) not null,
idactividad integer,
constraint fk_monitor_actividad 
foreign key (idactividad)
references actividad(idactividad)
on delete set null
);