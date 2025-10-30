-- ============================================
-- SCRIPT COMPLETO DEL MODELO DE GESTIÓN DE RECLAMOS

-- ============================================

drop database if exists grupo19;

create database grupo19;

use grupo19;

drop table is exists grupo19.usuario;

create table grupo19.usuario (
    id_usuario int auto_increment not null,
    telefono integer,
    direccion varchar(255),
    constraint pk_usuario primary key (id_usuario)
);

drop if exists grupo19.motivo;

create table grupo19.motivo (
    codigo integer,
    descripcion varchar(255),
    constraint pk_motivo primary key (codigo)
);

drop table if exists grupo19.empresa;

create table grupo19.empresa (
    id_usuario int not null,
    cuit bigint unique,
    cap_instalada integer,
    constraint pk_empresa primary key (id_usuario),
    constraint fk_empresa_usuario foreign key (id_usuario) references usuario(id_usuario)
);

drop table if exists grupo19.persona;

create table grupo19.persona (
    id_usuario int not null,
    dni bigint unique,
    nombre varchar(50),
    apellido varchar(50),
    email varchar(50),
    f_dn date,
    constraint pk_persona primary key (id_usuario),
    constraint fk_persona_usuario foreign key (id_usuario) references usuario(id_usuario)
);

drop table if exists grupo19.empleado_mantenimiento;

create table grupo19.empleado_mantenimiento (
    id_usuario int not null,
    sueldo integer,
    constraint pk_empleado primary key (id_usuario),
    constraint fk_empleado_usuario foreign key (id_usuario) references usuario(id_usuario)
);

drop table if exists grupo19.reclamo;

create table grupo19.reclamo (
    nro_reclamo int auto_increment not null,
    id_usuario int,
    codigo integer,
    fecha_reclamo date,
    constraint pk_reclamo primary key (nro_reclamo),
    constraint fk_reclamo_usuario foreign key (id_usuario) references usuario(id_usuario) on delete cascade,
    constraint fk_reclamo_motivo foreign key (codigo) references motivo(codigo) on delete set null
);

drop table if exists grupo19.materiales;

create table grupo19.materiales (
    cod_material integer not null,
    descripcion varchar(255),
    constraint pk_material primary key (cod_material)
);

-- engine = InnoDB;
drop table if exists grupo19.llamada;

create table grupo19.llamada (
    nro_llamada int auto_increment not null,
    nro_reclamo int not null,
    fecha_llamada date,
    hora_llamada time,
    constraint pk_llamada primary key (nro_llamada, nro_reclamo),
    constraint fk_llamada_reclamo foreign key (nro_reclamo) references reclamo(nro_reclamo)
);

-- engine = InnoDB;
drop table if exists grupo19.deriva;

create table grupo19.deriva (
    id_usuario int not null,
    nro_reclamo int not null,
    constraint pk_deriva primary key (id_usuario, nro_reclamo),
    constraint fk_deriva_empleado foreign key (id_usuario) references empleado_mantenimiento(id_usuario),
    constraint fk_deriva_reclamo foreign key (nro_reclamo) references reclamo(nro_reclamo)
);

drop table if exists grupo19.uso;

create table grupo19.uso (
    nro_reclamo int,
    cod_material integer not null,
    cantidad integer,
    constraint pk_uso primary key (nro_reclamo, cod_material),
    constraint fk_uso_reclamo foreign key (nro_reclamo) references reclamo(nro_reclamo),
    constraint fk_uso_material foreign key (cod_material) references materiales(cod_material)
);

