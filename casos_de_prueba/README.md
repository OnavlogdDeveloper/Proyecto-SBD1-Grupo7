# Casos de Prueba — Proyecto de Base de Datos (Grupo 7)

Carpeta destinada al registro, documentación y ejecución de los **casos de prueba** sobre la base de datos transaccional del caso de estudio **Viajes y Turismo** en **Oracle Database 21c Express Edition (XE)** mediante **JetBrains DataGrip**.

## Estructura de Scripts de Prueba

- [`01_casos_de_prueba_ddl_dml.sql`](./01_casos_de_prueba_ddl_dml.sql): Pruebas de integridad estructural (PK, FK, `CHECK`, `UNIQUE`), verificación de carga mínima de 10 registros reales por tabla de entrada (`RI-05`) y pruebas negativas de inserción/actualización.
- [`02_casos_de_prueba_plsql_seguridad.sql`](./02_casos_de_prueba_plsql_seguridad.sql): Pruebas funcionales de triggers, procedimientos almacenados, funciones (`RI-01` a `RI-04`), cursores para reportes (`SYS_REFCURSOR`) y pruebas de permisos/roles de seguridad lógica.

## Convención de Registro

Cada caso de prueba debe documentarse indicando:
1. **ID del Caso de Prueba** (ej. `CP-01`).
2. **Objetivo / Regla de Integridad evaluada** (`RI-01`..`RI-05`, DDL, DML o Seguridad Lógica).
3. **Sentencia SQL / Bloque PL/SQL de prueba**.
4. **Resultado esperado** (éxito con `COMMIT` o rechazo controlado con código `ORA-xxxxx` / `ROLLBACK`).
