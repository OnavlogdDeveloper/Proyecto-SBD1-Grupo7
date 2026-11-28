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

-- 1. AGENCIAS_VIAJES
CREATE TABLE AGENCIAS_VIAJES (
  id                  NUMBER        NOT NULL,
  nombre              VARCHAR2(100) NOT NULL,
  pagina_web          VARCHAR2(150) NOT NULL,
  mision_descripcion  VARCHAR2(500) NOT NULL,
  CONSTRAINT pk_agencias_viajes PRIMARY KEY (id)
);

-- 2. PROVEEDORES
CREATE TABLE PROVEEDORES (
  id_empresa  NUMBER        NOT NULL,
  rif         NUMBER        NOT NULL,
  nombre      VARCHAR2(100) NOT NULL,
  tipo        VARCHAR2(30)  NOT NULL,
  CONSTRAINT pk_proveedores PRIMARY KEY (id_empresa),
  CONSTRAINT uq_prov_rif    UNIQUE (rif),
  CONSTRAINT chk_prov_tipo  CHECK (tipo IN ('líneas_aéreas', 'cruceros', 'alquiler_de_vehículo', 'hoteles'))
);

-- 3. ASESOR_VIAJES
CREATE TABLE ASESOR_VIAJES (
  id             NUMBER       NOT NULL,
  doc_identidad  NUMBER       NOT NULL,
  nombre         VARCHAR2(50) NOT NULL,
  apellido       VARCHAR2(50) NOT NULL,
  CONSTRAINT pk_asesor_viajes     PRIMARY KEY (id),
  CONSTRAINT uq_asesor_doc_ident  UNIQUE (doc_identidad)
);

-- 4. AREAS_INTERES
CREATE TABLE AREAS_INTERES (
  id           NUMBER        NOT NULL,
  nombre       VARCHAR2(100) NOT NULL,
  descripcion  VARCHAR2(500) NOT NULL,
  CONSTRAINT pk_areas_interes PRIMARY KEY (id)
);

-- 5. SOCIOS_NEGOCIO (RI-08, RI-10)
CREATE TABLE SOCIOS_NEGOCIO (
  fecha_inicio  DATE   NOT NULL,
  id_agencia    NUMBER NOT NULL,
  id_socio      NUMBER NOT NULL,
  fecha_fin     DATE,
  CONSTRAINT pk_socios_negocio PRIMARY KEY (fecha_inicio, id_agencia, id_socio),
  CONSTRAINT fk_soc_agencia    FOREIGN KEY (id_agencia) REFERENCES AGENCIAS_VIAJES (id),
  CONSTRAINT fk_soc_socio      FOREIGN KEY (id_socio)   REFERENCES AGENCIAS_VIAJES (id),
  CONSTRAINT chk_soc_fechas    CHECK (fecha_fin IS NULL OR fecha_fin > fecha_inicio),
  CONSTRAINT chk_soc_orden     CHECK (id_agencia > id_socio)
);

-- 6. AGENCIAS_PROVEEDORES (RI-08)
CREATE TABLE AGENCIAS_PROVEEDORES (
  fecha_inicio       DATE   NOT NULL,
  id_agencia_viajes  NUMBER NOT NULL,
  id_proveedor       NUMBER NOT NULL,
  fecha_fin          DATE,
  CONSTRAINT pk_agencias_proveedores PRIMARY KEY (fecha_inicio, id_agencia_viajes, id_proveedor),
  CONSTRAINT fk_agprov_agencia       FOREIGN KEY (id_agencia_viajes) REFERENCES AGENCIAS_VIAJES (id),
  CONSTRAINT fk_agprov_proveedor     FOREIGN KEY (id_proveedor)      REFERENCES PROVEEDORES (id_empresa),
  CONSTRAINT chk_agprov_fechas       CHECK (fecha_fin IS NULL OR fecha_fin > fecha_inicio)
);

-- 7. AGENCIAS_ASESORES (RI-08)
CREATE TABLE AGENCIAS_ASESORES (
  fecha_inicio       DATE   NOT NULL,
  id_agencia_viajes  NUMBER NOT NULL,
  id_asesor_viajes   NUMBER NOT NULL,
  fecha_fin          DATE,
  CONSTRAINT pk_agencias_asesores PRIMARY KEY (fecha_inicio, id_agencia_viajes, id_asesor_viajes),
  CONSTRAINT fk_agases_agencia    FOREIGN KEY (id_agencia_viajes) REFERENCES AGENCIAS_VIAJES (id),
  CONSTRAINT fk_agases_asesor     FOREIGN KEY (id_asesor_viajes)  REFERENCES ASESOR_VIAJES (id),
  CONSTRAINT chk_agases_fechas    CHECK (fecha_fin IS NULL OR fecha_fin > fecha_inicio)
);

-- 8. PAQUETE_TURISTICO (RI-07)
CREATE TABLE PAQUETE_TURISTICO (
  id                   NUMBER        NOT NULL,
  id_agencia_viajes    NUMBER        NOT NULL,
  nombre               VARCHAR2(100) NOT NULL,
  descripcion          VARCHAR2(500) NOT NULL,
  cantidad_personas    NUMBER,
  duracion_total_dias  NUMBER        NOT NULL,
  CONSTRAINT pk_paquete_turistico PRIMARY KEY (id, id_agencia_viajes),
  CONSTRAINT fk_paq_agencia       FOREIGN KEY (id_agencia_viajes) REFERENCES AGENCIAS_VIAJES (id),
  CONSTRAINT chk_paq_cant_pers    CHECK (cantidad_personas IS NULL OR cantidad_personas > 0),
  CONSTRAINT chk_paq_duracion     CHECK (duracion_total_dias > 0)
);

-- 9. ESPECIALIZACION_DETALLE
CREATE TABLE ESPECIALIZACION_DETALLE (
  id                    NUMBER NOT NULL,
  id_especializacion    NUMBER NOT NULL,
  id_agencia_viajes     NUMBER,
  id_paquete_turistico  NUMBER,
  id_asesor_viajes      NUMBER,
  comentarios           VARCHAR2(300),
  CONSTRAINT pk_especializacion_detalle PRIMARY KEY (id, id_especializacion),
  CONSTRAINT fk_espdet_especializacion  FOREIGN KEY (id_especializacion) REFERENCES AREAS_INTERES (id),
  CONSTRAINT fk_espdet_agencia          FOREIGN KEY (id_agencia_viajes)  REFERENCES AGENCIAS_VIAJES (id),
  CONSTRAINT fk_espdet_paquete          FOREIGN KEY (id_paquete_turistico, id_agencia_viajes)
                                        REFERENCES PAQUETE_TURISTICO (id, id_agencia_viajes),
  CONSTRAINT fk_espdet_asesor           FOREIGN KEY (id_asesor_viajes)   REFERENCES ASESOR_VIAJES (id),
  CONSTRAINT chk_espdet_paq_ag          CHECK (id_paquete_turistico IS NULL OR id_agencia_viajes IS NOT NULL)
);

-- 10. CALENDARIO_ANUAL
CREATE TABLE CALENDARIO_ANUAL (
  fecha_salida       DATE          NOT NULL,
  id_paq_turist      NUMBER        NOT NULL,
  id_agencia_viajes  NUMBER        NOT NULL,
  descripcion        VARCHAR2(500),
  CONSTRAINT pk_calendario_anual PRIMARY KEY (fecha_salida, id_paq_turist, id_agencia_viajes),
  CONSTRAINT fk_cal_paquete      FOREIGN KEY (id_paq_turist, id_agencia_viajes)
                                 REFERENCES PAQUETE_TURISTICO (id, id_agencia_viajes)
);

-- 11. HIST_PRECIOS (RI-07, RI-08, RI-09)
CREATE TABLE HIST_PRECIOS (
  fecha_inicio       DATE         NOT NULL,
  id_paq_turist      NUMBER       NOT NULL,
  id_agencia_viajes  NUMBER       NOT NULL,
  fecha_fin          DATE,
  cost_base_dia      NUMBER(10,2) NOT NULL,
  CONSTRAINT pk_hist_precios  PRIMARY KEY (fecha_inicio, id_paq_turist, id_agencia_viajes),
  CONSTRAINT fk_hist_paquete  FOREIGN KEY (id_paq_turist, id_agencia_viajes)
                              REFERENCES PAQUETE_TURISTICO (id, id_agencia_viajes),
  CONSTRAINT chk_hist_fechas  CHECK (fecha_fin IS NULL OR fecha_fin > fecha_inicio),
  CONSTRAINT chk_hist_costo   CHECK (cost_base_dia > 0)
);

-- RI-09 (parcial declarativo): garantiza como máximo una tarifa activa (fecha_fin IS NULL) por paquete
CREATE UNIQUE INDEX uq_hist_precio_activo
  ON HIST_PRECIOS (
    CASE WHEN fecha_fin IS NULL THEN id_paq_turist     END,
    CASE WHEN fecha_fin IS NULL THEN id_agencia_viajes END
  );

-- 12. DET_SERVICIOS (RI-06)
CREATE TABLE DET_SERVICIOS (
  id                 NUMBER        NOT NULL,
  id_paq_turist      NUMBER        NOT NULL,
  id_agencia_viajes  NUMBER        NOT NULL,
  tipo_servicio      VARCHAR2(20)  NOT NULL,
  comida             CHAR(1),
  descripcion        VARCHAR2(500) NOT NULL,
  CONSTRAINT pk_det_servicios  PRIMARY KEY (id, id_paq_turist, id_agencia_viajes),
  CONSTRAINT fk_detserv_paq    FOREIGN KEY (id_paq_turist, id_agencia_viajes)
                               REFERENCES PAQUETE_TURISTICO (id, id_agencia_viajes),
  CONSTRAINT chk_detserv_tipo  CHECK (tipo_servicio IN ('BOLETOS', 'ALQ_CARROS', 'ALOJAMIENTO')),
  CONSTRAINT chk_detserv_com   CHECK (comida IS NULL OR comida IN ('S', 'N'))
);
-- =============================================================================
-- SECCIÓN 2: CRISTIAN TERÁN
-- =============================================================================

-- [Registrar aquí las sentencias CREATE TABLE, ALTER TABLE, CREATE SEQUENCE,
--  CREATE INDEX y CREATE VIEW correspondientes a Cristian Terán]

