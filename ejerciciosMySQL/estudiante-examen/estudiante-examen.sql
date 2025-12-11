create database if not exists dbexamen;

use dbexamen;

create table if not exists estudiante (
matricula integer primary key auto_increment,
dni varchar(9) unique not null,
nombre varchar(20) not null,
apellidos varchar(35) not null,
fecha date
);

create table if not exists examen (
matricula integer,
modulo varchar(10),
fecha date,
nota decimal(4,2),

constraint pk_examen
primary key(matricula,modulo,fecha),

constraint fk_examen_estudiante
foreign key (matricula)
references estudiante(matricula)
on update cascade
on delete cascade,

constraint ck_nota
check(nota between 0 and 10)
);
