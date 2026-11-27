-- =============================================================================
-- PROYECTO DE BASE DE DATOS (SBD1) - GRUPO 7
-- SCRIPT 01: ESTRUCTURA FÍSICA DE LA BASE DE DATOS (DDL)
-- Motor: Oracle Database 21c Express Edition (XE)
-- Descripción: Creación de tablas (E, S, E/S), restricciones, secuencias,
--              índices y vistas según el Modelo E-R Ideal.
-- =============================================================================


-- =============================================================================
-- SECCIÓN 1: ONASSIS TORREALBA
-- =============================================================================

-- [Registrar aquí las sentencias CREATE TABLE, ALTER TABLE, CREATE SEQUENCE,
--  CREATE INDEX y CREATE VIEW correspondientes a Onassis Torrealba]




-- =============================================================================
-- SECCIÓN 2: CRISTIAN TERÁN
-- =============================================================================

-- [Registrar aquí las sentencias CREATE TABLE, ALTER TABLE, CREATE SEQUENCE,
--  CREATE INDEX y CREATE VIEW correspondientes a Cristian Terán]

--CREATE TABLES
create table PAISES(
    id number(2) primary key ,
    nombre varchar2(15) not null,
    region_tour varchar2(15) not null,
    nacionalidad varchar2(15) not null,
    continente varchar2(15) not null,
    constraint list_region check(region_tour in ('EUR', 'AMO', 'ANZP', 'AS', 'MCSA', 'USACC')),
    constraint list_continente check(continente in ('EU', 'AS', 'OC', 'AM', 'AF'))
);

create table CLIENTES(
    id_general number(2) primary key,
    nombre varchar2(15) not null,
    documento number(10) not null unique,
    cliente varchar2(10) not null,
    primer_apellido varchar2(20),
    segundo_apellido varchar2(20),
    constraint tipo_clte check(cliente in ('NATURAL', 'JURIDICO'))
);

create table VIAJEROS(
    id_general number(2) primary key,
    primer_nombre varchar2(30) not null,
    primer_apellido varchar2(30) not null,
    segundo_apellido varchar2(30) not null,
    genero varchar2(1) not null,
    segundo_nombre varchar2(30),
    fecha_nacimiento date default sysdate not null,
    constraint list_genero check (genero in('F', 'M'))
);

create table CIUDADES(
    id number(2) primary key,
    id_pais number(2) not null,
    nombre varchar2(15) not null,
    descrip_turist varchar2(30) not null,
    constraint fk_pais foreign key (id_pais) references PAISES (id)
);

create table PASAPORTES(
    id_viajero number(2) not null,
    id_pais number(2) not null,
    numero number(10) not null,
    constraint pk_pasaporte primary key (id_viajero, id_pais),
    constraint fk_viajero foreign key (id_viajero) references VIAJEROS(id_general),
    constraint fk_pasaport_pais foreign key (id_pais) references PAISES (id)
);

--SEQUENCES
create sequence seq_paises
increment by 1
start with 1;

create sequence seq_clientes
increment by 1
start with 1;

create sequence seq_viajeros
increment by 1
start with 1;

create sequence seq_ciudades
increment by 1
start with 1;

--INDEX
create index idx_ciudades_pais on CIUDADES(id_pais);
create index idx_pasaport_pais on PASAPORTES(id_pais);
create index idx_pasaport_vjro on PASAPORTES(id_viajero);