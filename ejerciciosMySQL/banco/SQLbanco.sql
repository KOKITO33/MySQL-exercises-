DROP DATABASE IF EXISTS banco;
CREATE DATABASE IF NOT EXISTS banco;

USE banco;

-- tabla sucursal

CREATE TABLE IF NOT EXISTS sucursal (
idsucursal integer primary key auto_increment,
responsable varchar(50) unique not null,
od_sucursal varchar(45)
);

-- tabla tipo_cuenta

CREATE TABLE IF NOT EXISTS tipo_cuenta (
idtipo integer primary key auto_increment,
tipo varchar(20) unique not null
);

-- tabla cuenta

CREATE TABLE IF NOT EXISTS cuenta (
iban varchar(24) primary key,
idsucursal int,
idtipo int,
saldo decimal(10,2) not null,
fecha_apertura date not null,
--  FOREIGN KEY id sucursal
CONSTRAINT fk_cuenta_sucursal
FOREIGN KEY (idsucursal)
REFERENCES sucursal(idsucursal),
-- FOREIGN KEY id tipo_cuenta
CONSTRAINT fk_cuenta_tipo_cuenta
FOREIGN KEY (idtipo)
REFERENCES tipo_cuenta(idtipo),
-- CHECK saldo 
CONSTRAINT ck_saldo
CHECK (saldo >= 0)
);

-- tabla cliente

CREATE TABLE IF NOT EXISTS cliente (
idcliente integer primary key auto_increment,
dni varchar(9) unique not null,
od_cliente varchar(45)
);

-- tabla cuenta_cliente 

CREATE TABLE IF NOT EXISTS cuenta_cliente (
iban varchar(24),
idcliente integer,
privilegio varchar(30),
-- MULTI PK iban id cliente and privilegio
CONSTRAINT pk_cuenta_cliente
PRIMARY KEY (iban,idcliente,privilegio),
-- FK iban 
CONSTRAINT fk_cuenta_cliente_cuenta
FOREIGN KEY (iban)
REFERENCES cuenta(iban)
ON DELETE CASCADE,
-- FK id cliente
CONSTRAINT fk_cuenta_cliente_cliente
FOREIGN KEY (idcliente)
REFERENCES cliente(idcliente)
ON DELETE CASCADE
);