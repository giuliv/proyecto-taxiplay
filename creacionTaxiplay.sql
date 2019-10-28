use master
go

create database taxiplay
go

use taxiplay
go


IF(OBJECT_ID('pasajero','U')) is not null
   DROP TABLE pasajero
GO
create table pasajero (
id_pasajero int identity(1,1) NOT NULL,
nombres varchar(80) not null,
apellidos varchar(80) not null,
telefono char(9) not null,
correo varchar(100) not null,
clave varchar(50) not null,
PRIMARY KEY (id_pasajero)
)


IF(OBJECT_ID('chofer','U')) is not null
   DROP TABLE chofer
GO
create table chofer (
id_chofer int identity(1,1) NOT NULL,
nombres varchar(80) not null,
apellidos varchar(80) not null,
dni char(8) not null,
telefono char(9) not null,
correo varchar(100) not null,
PRIMARY KEY (id_chofer)
)


IF(OBJECT_ID('vehiculo','U')) is not null
   DROP TABLE vehiculo
GO
create table vehiculo (
id_vehiculo int identity(1,1) NOT NULL,
placa CHAR(6) NOT NULL,
marca VARCHAR(30) NOT NULL,
modelo VARCHAR(30) NOT NULL,
color VARCHAR(30) NOT NULL,
capacidad INT NOT NULL,
id_chofer INT NOT NULL,
PRIMARY KEY (id_vehiculo)
)

--CREACION LLAVES FORANEAS vehiculo
ALTER TABLE vehiculo
add foreign key (id_chofer)
references chofer(id_chofer)
go


IF(OBJECT_ID('reserva','U')) is not null
   DROP TABLE reserva
GO
create table reserva (
id_reserva int identity(1,1) NOT NULL,
id_pasajero INT NOT NULL,
id_vehiculo INT NOT NULL,
direccion_partida VARCHAR(100) NOT NULL,
direccion_destino VARCHAR(100) NOT NULL,
fecha_inicio_viaje DATETIME NOT NULL,
fecha_fin_viaje DATETIME  NOT NULL,
latitud_inicial DECIMAL(18,15) NOT NULL,
latitud_final DECIMAL(18,15) NOT NULL,
longitud_inicial DECIMAL(18,15) NOT NULL,
longitud_final DECIMAL(18,15) NOT NULL,
distancia DECIMAL(10,6) NOT NULL,
total_pagar money NOT NULL,
metodo_pago VARCHAR(30) NOT NULL,
PRIMARY KEY (id_reserva)
)

--CREACION DE LLAVES FORANEAS DE RESERVA
ALTER TABLE reserva
add foreign key (id_vehiculo)
references vehiculo(id_vehiculo)
go

ALTER TABLE reserva
add foreign key (id_pasajero)
references pasajero(id_pasajero)
go


insert into pasajero (nombres, apellidos, telefono, correo, clave)
values
('Enrique','López','964276456','enrique@gmail.com','clave1'),
('Carola','Ruiz','965276444','carola@gmail.com','clave2')
go

insert into chofer (nombres, apellidos, dni, telefono, correo)
values
('Pablo','Lao','30744499','964822056','pablo@gmail.com'),
('Ana','Peralta','28740711','978476203','ana@gmail.com')
go

insert into vehiculo(placa,marca,modelo,color,capacidad,id_chofer)
values
('ABC123','Toyota','sedan','negro',5,1),
('FFG456','Nissan','NV200 EVALIA','azul',4,2)
go
