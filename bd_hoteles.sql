drop database if exists bd_hoteles;
create database bd_hoteles;
use bd_hoteles;

create table proveedor(
id_proveedor int not null auto_increment,
nombre varchar(20) not null,
telefono int not null,
primary key (id_proveedor)
);

create table hoteles(
id_hoteles int not null auto_increment,
id_proveedor int not null,
direccion varchar(30) not null,
numero_estrellas int not null,
telefono int not null,
primary key (id_hoteles)
);

create table empleados(
DNI varchar(9) unique not null,
nombre varchar(20) not null,
apellidos varchar(20) not null,
ocupacion varchar(20) not null,
primary key (DNI)
);

create table cocina(
id_cocina int not null auto_increment,
tipo_cocina varchar(20) not null,
menu varchar(20) not null,
primary key (id_cocina)
);

create table hoteles_empleados(
id_hoteles int not null,
DNI varchar(9) unique not null,
primary key(id_hoteles, DNI)
);

alter table hoteles_empleados
add constraint FK_hoteles foreign key (id_hoteles) references hoteles(id_hoteles),
add constraint FK_empleados foreign key (DNI) references empleados(DNI);

create table hoteles_cocina(
id_hoteles int not null,
id_cocina int not null,
primary key(id_hoteles, id_cocina)
);

alter table hoteles_cocina
add constraint FK_hoteles2 foreign key (id_hoteles) references hoteles(id_hoteles),
add constraint FK_cocina foreign key (id_cocina) references cocina(id_cocina);

create table reserva(
id_reserva int not null auto_increment,
extras varchar(50),
precio decimal not null,
primary key(id_reserva)
);

create table habitaciones(
id_habitacion int not null,
id_reserva int not null,
precio decimal not null,
tipo_de_habitacion varchar(50) not null,
descripcion varchar(1000) not null,
primary key(id_habitacion)
);

create table hoteles_habitaciones(
id_habitacion int not null,
id_hoteles int not null,
primary key(id_hoteles,id_habitacion)
);

 alter table habitaciones
 add constraint FK_reserva foreign key(id_reserva) references reserva(id_reserva);
 
 alter table hoteles_habitaciones
  add constraint FK_habitacion2 foreign key(id_habitacion) references habitaciones(id_habitacion),
  add constraint FK_hoteles3 foreign key(id_hoteles) references hoteles(id_hoteles);
  
create table producto(
id_producto int not null auto_increment,
id_proveedor int not null,
precio decimal not null,
cantidad int not null,
nombre varchar(20) not null,
primary key (id_producto)
);

create table cliente(
dni varchar(9) unique not null,
id_reserva int not null,
apellidos varchar(50) not null,
nombre varchar(20) not null,
telefono int not null,
primary key (dni)
);

alter table hoteles
add constraint FK_proveedor foreign key (id_proveedor) references proveedor(id_proveedor);

alter table producto
add constraint FK_proveedor2 foreign key (id_proveedor) references proveedor(id_proveedor);

alter table cliente
add constraint FK_reserva2 foreign key (id_reserva) references reserva(id_reserva);

insert into proveedor values(1, 'Recursos S.L.', 666112233);
insert into proveedor values(2, 'Recursos 2 S.L.', 666112244);
insert into proveedor values(3, 'Recursos 3 S.L.', 666112255);
insert into proveedor values(4, 'Recursos 4 S.L.', 666112266);
insert into proveedor values(5, 'Chanchullos Paco', 666112277);

insert into hoteles values(1, 1, 'calle primera 1', 5, 666554411);
insert into hoteles values(2, 2, 'calle segunda 2', 4, 666554422);
insert into hoteles values(3, 3, 'calle tercera 3', 1, 666554433);
insert into hoteles values(4, 4, 'calle cuarta 4', 5, 666554444);
insert into hoteles values(5, 5, 'calle quinta 5', 4, 666554455);

insert into empleados values('45782564J', 'Paco', 'Gonzalez', 'Recepcionista');
insert into empleados values('45786534L', 'Manuel', 'Perez', 'Cocinero');
insert into empleados values('45712344J', 'Ricardo', 'Golfo', 'Gerente');
insert into empleados values('45786865K', 'Amanda', 'Olmo', 'Limpiadora');
insert into empleados values('45786124L', 'Angel', 'Garcia', 'Limpiador');

insert into cocina values(1, 'hindu', 'menu extra picante');
insert into cocina values(2, 'francesa', 'menu garçon');
insert into cocina values(3, 'española', 'menu sevillano');
insert into cocina values(4, 'mexicana', 'menu andale');
insert into cocina values(5, 'japonesa', 'menu anime');

insert into hoteles_empleados values(1, '45782564J');
insert into hoteles_empleados values(2, '45786534L');
insert into hoteles_empleados values(3, '45712344J');
insert into hoteles_empleados values(4, '45786865K');
insert into hoteles_empleados values(5, '45786124L');

insert into hoteles_cocina values(1, 1);
insert into hoteles_cocina values(2, 2);
insert into hoteles_cocina values(3, 3);
insert into hoteles_cocina values(4, 4);
insert into hoteles_cocina values(5, 5);

insert into reserva values (1, 'acua gym', 300);
insert into reserva values (2, 'zoo', 150);
insert into reserva values (3, 'padel', 200);
insert into reserva values (4, 'gym', 400);
insert into reserva values (5, 'paracaidismo', 500);

insert into cliente values ('45128865B',1,'diaz', 'zebenzui', 666521287);
insert into cliente values ('45888865X',2,'jimenez', 'aythami', 555698741);
insert into cliente values ('54728865Y',3, 'parral','nadia', 333256980);
insert into cliente values ('45128999S',4, 'vega', 'luis', 666520641);
insert into cliente values ('56222589V', 5, 'casiano','ayaya', 356875200);

insert into habitaciones values(1, 1, 100, 'normal','como todas');
insert into habitaciones values(2, 2, 100, 'normal', 'de toa la via');
insert into habitaciones values(3, 3, 100, 'normal', 'como toas');
insert into habitaciones values(4, 4, 360, 'delux', 'super chachi');
insert into habitaciones values(5, 5, 250, 'luxo', 'flipante');

insert into hoteles_habitaciones values(1, 1);
insert into hoteles_habitaciones values(2, 2);
insert into hoteles_habitaciones values(3, 3);
insert into hoteles_habitaciones values(4, 4);
insert into hoteles_habitaciones values(5, 5);

insert into producto values(1, 1, 400, 10, 'Sillas');
insert into producto values(2, 2, 40, 2, 'Mesitas de café');
insert into producto values(3, 3, 1400, 4, 'Ordenadores');
insert into producto values(4, 4, 200, 5, 'Vajillas');
insert into producto values(5, 5, 200, 10, 'Sábanas');



