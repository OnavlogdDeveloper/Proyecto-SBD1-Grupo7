-- =============================================================================
-- PROYECTO DE BASE DE DATOS (SBD1) - GRUPO 7
-- SCRIPT 02: CARGA DE DATOS EN TABLAS DE ENTRADA (DML - INSERTS)
-- Motor: Oracle Database 21c Express Edition (XE)
-- Descripción: Inserción de lotes de datos de prueba y de negocio (mínimo 10
--              registros de calidad y no repetidos por tabla de entrada).
-- =============================================================================


-- =============================================================================
-- SECCIÓN 1: ONASSIS TORREALBA
-- =============================================================================

-- [Registrar aquí las sentencias INSERT y COMMIT correspondientes
--  a Onassis Torrealba]




-- =============================================================================
-- SECCIÓN 2: CRISTIAN TERÁN
-- =============================================================================

-- [Registrar aquí las sentencias INSERT y COMMIT correspondientes
--  a Cristian Terán]

--INSERT's PAISES
insert into PAISES (id, nombre, region_tour, nacionalidad, continente)
values (seq_paises.nextval, 'Italia', 'EUR', 'Italiana', 'EU');

insert into PAISES (id, nombre, region_tour, nacionalidad, continente)
values (seq_paises.nextval, 'España', 'EUR', 'Española', 'EU');

insert into PAISES (id, nombre, region_tour, nacionalidad, continente)
values (seq_paises.nextval, 'Francia', 'EUR', 'Francesa', 'EU');

insert into PAISES (id, nombre, region_tour, nacionalidad, continente)
values (seq_paises.nextval, 'Reino Unido', 'EUR', 'Británica', 'EU');

insert into PAISES (id, nombre, region_tour, nacionalidad, continente)
values (seq_paises.nextval, 'Egipto', 'AMO', 'Egipcia', 'AF');

insert into PAISES (id, nombre, region_tour, nacionalidad, continente)
values (seq_paises.nextval, 'Emiratos Árabes', 'AMO', 'Emiratí', 'AS');

insert into PAISES (id, nombre, region_tour, nacionalidad, continente)
values (seq_paises.nextval, 'Australia', 'ANZP', 'Australiana', 'OC');

insert into PAISES (id, nombre, region_tour, nacionalidad, continente)
values (seq_paises.nextval, 'Japón', 'AS', 'Japonesa', 'AS');

insert into PAISES (id, nombre, region_tour, nacionalidad, continente)
values (seq_paises.nextval, 'Venezuela', 'MCSA', 'Venezolana', 'AM');

insert into PAISES (id, nombre, region_tour, nacionalidad, continente)
values (seq_paises.nextval, 'México', 'MCSA', 'Mexicana', 'AM');
COMMIT;


-- INSERT's CLIENTES
INSERT INTO CLIENTES (id_general, nombre, documento, cliente, primer_apellido, segundo_apellido)
VALUES (seq_clientes.nextval, 'María', 20123456, 'NATURAL', 'Fernández', 'Gómez');

INSERT INTO CLIENTES (id_general, nombre, documento, cliente, primer_apellido, segundo_apellido)
VALUES (seq_clientes.nextval, 'Andrés', 15987654, 'NATURAL', 'Silva', 'Pérez');

INSERT INTO CLIENTES (id_general, nombre, documento, cliente, primer_apellido, segundo_apellido)
VALUES (seq_clientes.nextval, 'Luis', 12345678, 'NATURAL', 'Herrera', 'Díaz');

INSERT INTO CLIENTES (id_general, nombre, documento, cliente, primer_apellido, segundo_apellido)
VALUES (seq_clientes.nextval, 'Sofía', 26789012, 'NATURAL', 'Navarro', 'Vargas');

INSERT INTO CLIENTES (id_general, nombre, documento, cliente, primer_apellido, segundo_apellido)
VALUES (seq_clientes.nextval, 'John', 45892310, 'NATURAL', 'Smith', NULL);

INSERT INTO CLIENTES (id_general, nombre, documento, cliente, primer_apellido, segundo_apellido)
VALUES (seq_clientes.nextval, 'Emily', 52147896, 'NATURAL', 'Johnson', NULL);

INSERT INTO CLIENTES (id_general, nombre, documento, cliente, primer_apellido, segundo_apellido)
VALUES (seq_clientes.nextval, 'TechGlobal CA', 301234567, 'JURIDICO', NULL, NULL);

INSERT INTO CLIENTES (id_general, nombre, documento, cliente, primer_apellido, segundo_apellido)
VALUES (seq_clientes.nextval, 'Inversiones Sol', 309876543, 'JURIDICO', NULL, NULL);

INSERT INTO CLIENTES (id_general, nombre, documento, cliente, primer_apellido, segundo_apellido)
VALUES (seq_clientes.nextval, 'Grupo Andino SA', 314567890, 'JURIDICO', NULL, NULL);

INSERT INTO CLIENTES (id_general, nombre, documento, cliente, primer_apellido, segundo_apellido)
VALUES (seq_clientes.nextval, 'Constructora Sur', 318765432, 'JURIDICO', NULL, NULL);
COMMIT;

--INSERT's VIAJEROS
INSERT INTO VIAJEROS (id_general, primer_nombre, primer_apellido, segundo_apellido, genero, segundo_nombre, fecha_nacimiento)
VALUES (seq_viajeros.nextval, 'Diego', 'Ramírez', 'Ortega', 'M', 'Sebastián', DATE '1994-04-25');

INSERT INTO VIAJEROS (id_general, primer_nombre, primer_apellido, segundo_apellido, genero, segundo_nombre, fecha_nacimiento)
VALUES (seq_viajeros.nextval, 'Camila', 'Torres', 'Blanco', 'F', 'Victoria', DATE '1990-08-19');

INSERT INTO VIAJEROS (id_general, primer_nombre, primer_apellido, segundo_apellido, genero, segundo_nombre, fecha_nacimiento)
VALUES (seq_viajeros.nextval, 'Mateo', 'Rivas', 'Salazar', 'M', NULL, DATE '2012-06-05');

INSERT INTO VIAJEROS (id_general, primer_nombre, primer_apellido, segundo_apellido, genero, segundo_nombre, fecha_nacimiento)
VALUES (seq_viajeros.nextval, 'Lucía', 'Paredes', 'Acosta', 'F', 'Gabriela', DATE '1983-01-28');

INSERT INTO VIAJEROS (id_general, primer_nombre, primer_apellido, segundo_apellido, genero, segundo_nombre, fecha_nacimiento)
VALUES (seq_viajeros.nextval, 'Alejandro', 'Guerrero', 'Cárdenas', 'M', 'José', DATE '1987-03-11');

INSERT INTO VIAJEROS (id_general, primer_nombre, primer_apellido, segundo_apellido, genero, segundo_nombre, fecha_nacimiento)
VALUES (seq_viajeros.nextval, 'Natalia', 'Delgado', 'Serrano', 'F', 'Beatriz', DATE '1995-10-07');

INSERT INTO VIAJEROS (id_general, primer_nombre, primer_apellido, segundo_apellido, genero, segundo_nombre, fecha_nacimiento)
VALUES (seq_viajeros.nextval, 'Gabriel', 'Montoya', 'Castro', 'M', NULL, DATE '1976-12-19');

INSERT INTO VIAJEROS (id_general, primer_nombre, primer_apellido, segundo_apellido, genero, segundo_nombre, fecha_nacimiento)
VALUES (seq_viajeros.nextval, 'Daniela', 'Peña', 'Suárez', 'F', 'Carolina', DATE '1999-07-02');

INSERT INTO VIAJEROS (id_general, primer_nombre, primer_apellido, segundo_apellido, genero, segundo_nombre, fecha_nacimiento)
VALUES (seq_viajeros.nextval, 'Sebastián', 'Álvarez', 'Gil', 'M', 'Ignacio', DATE '1991-09-15');

INSERT INTO VIAJEROS (id_general, primer_nombre, primer_apellido, segundo_apellido, genero, segundo_nombre, fecha_nacimiento)
VALUES (seq_viajeros.nextval, 'Isabella', 'Reyes', 'Pacheco', 'F', NULL, DATE '2004-02-29');
COMMIT;

--INSERT's CIUDADES
INSERT INTO CIUDADES (id, id_pais, nombre, descrip_turist)
VALUES (seq_ciudades.nextval, 1, 'Florencia', 'Cuna del arte renacentista');

INSERT INTO CIUDADES (id, id_pais, nombre, descrip_turist)
VALUES (seq_ciudades.nextval, 2, 'Madrid', 'Capital cultural y museos');

INSERT INTO CIUDADES (id, id_pais, nombre, descrip_turist)
VALUES (seq_ciudades.nextval, 3, 'París', 'Ciudad luz y Torre Eiffel');

INSERT INTO CIUDADES (id, id_pais, nombre, descrip_turist)
VALUES (seq_ciudades.nextval, 5, 'El Cairo', 'Pirámides milenarias y Nilo');

INSERT INTO CIUDADES (id, id_pais, nombre, descrip_turist)
VALUES (seq_ciudades.nextval, 6, 'Dubái', 'Rascacielos y lujo moderno');


INSERT INTO CIUDADES (id, id_pais, nombre, descrip_turist)
VALUES (seq_ciudades.nextval, 7, 'Sídney', 'Bahía icónica y ópera');

INSERT INTO CIUDADES (id, id_pais, nombre, descrip_turist)
VALUES (seq_ciudades.nextval, 8, 'Tokio', 'Templos y tecnología moderna');

INSERT INTO CIUDADES (id, id_pais, nombre, descrip_turist)
VALUES (seq_ciudades.nextval, 9, 'Canaima', 'Salto Ángel y tepuyes');

INSERT INTO CIUDADES (id, id_pais, nombre, descrip_turist)
VALUES (seq_ciudades.nextval, 10, 'Cancún', 'Playas del Caribe y cultura');

INSERT INTO CIUDADES (id, id_pais, nombre, descrip_turist)
VALUES (seq_ciudades.nextval, 4, 'Nueva York', 'Rascacielos y Central Park');
COMMIT;

--INSERT's PASAPORTES
INSERT INTO PASAPORTES (id_viajero, id_pais, numero)
VALUES (1, 1, 845612901);

INSERT INTO PASAPORTES (id_viajero, id_pais, numero)
VALUES (2, 2, 901234512);

INSERT INTO PASAPORTES (id_viajero, id_pais, numero)
VALUES (3, 9, 112233423);

INSERT INTO PASAPORTES (id_viajero, id_pais, numero)
VALUES (4, 3, 556677834);

INSERT INTO PASAPORTES (id_viajero, id_pais, numero)
VALUES (5, 4, 998877645);

INSERT INTO PASAPORTES (id_viajero, id_pais, numero)
VALUES (6, 10, 443322156);

INSERT INTO PASAPORTES (id_viajero, id_pais, numero)
VALUES (7, 7, 776655467);

INSERT INTO PASAPORTES (id_viajero, id_pais, numero)
VALUES (8, 8, 334455678);

INSERT INTO PASAPORTES (id_viajero, id_pais, numero)
VALUES (9, 5, 667788989);

INSERT INTO PASAPORTES (id_viajero, id_pais, numero)
VALUES (10, 6, 221100990);
COMMIT;
