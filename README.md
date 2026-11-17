# Portal Central del Proyecto de Base de Datos — Grupo 7 (SBD1)

Repositorio centralizado para la gestión, control de versiones de comandos SQL y portal de acceso a las herramientas y artefactos del proyecto de **Sistemas de Bases de Datos (Semestre 202715)**, orientado a la organización de agencias de viajes.

**Integrantes del Grupo 7:**
- **Onassis Torrealba**
- **Christian Terán**

**Profesora:** Lúcia Cardoso

---

## 1. Portal de Herramientas del Ecosistema

A continuación se listan las herramientas que conforman el ecosistema tecnológico unificado del Grupo 7 junto con sus enlaces oficiales de descarga, documentación y recursos:

### 1.1. Manejador de Base de Datos: Oracle Database 21c Express Edition (XE)
*(Nota operativa: El acceso a los portales de Oracle desde Venezuela requiere conexión VPN activa).*
- [Portal Oficial de Oracle Corporation](https://www.oracle.com/)
- [Descargar Oracle Database 21c Express Edition (XE)](https://www.oracle.com/database/technologies/xe-downloads.html)
- [Documentación Técnica Oficial de Oracle 21c](https://docs.oracle.com/en/database/oracle/oracle-database/21/)
- [Guía de Instalación de Oracle XE 21c para Windows](https://docs.oracle.com/en/database/oracle/oracle-database/21/xeinw/)
- [Descarga de Controladores JDBC para Oracle (ojdbc8 / ojdbc11)](https://www.oracle.com/database/technologies/appdev/jdbc-downloads.html)

### 1.2. Entorno de Desarrollo y Administración (IDE): JetBrains DataGrip (v2026.2)
- [Página Oficial de JetBrains DataGrip](https://www.jetbrains.com/datagrip/)
- [Descargar JetBrains DataGrip (Última Versión Estable)](https://www.jetbrains.com/datagrip/download/)
- [Gestor de Actualizaciones Automáticas (JetBrains Toolbox App)](https://www.jetbrains.com/toolbox-app/)
- [Documentación Técnica Oficial de DataGrip](https://www.jetbrains.com/help/datagrip/)
- [Guía Oficial de Conexión de DataGrip con Oracle Database](https://www.jetbrains.com/help/datagrip/connecting-to-oracle-database.html)
- [Licencias Académicas Gratuitas (JetBrains Educational Pack)](https://www.jetbrains.com/community/education/)

### 1.3. Generador de Reportes: Jaspersoft Studio Professional 9.0.3
- [Portal Oficial de TIBCO Jaspersoft Business Intelligence](https://www.jaspersoft.com/)
- [Comunidad Oficial y Descargas de Jaspersoft Studio](https://community.jaspersoft.com/project/jaspersoft-studio)
- [Documentación Oficial (TIBCO Jaspersoft Studio User Guide)](https://community.jaspersoft.com/documentation)
- [Repositorio Oficial del Motor JasperReports en GitHub](https://github.com/TIBCOSoftware/jasperreports)

### 1.4. Asistente de IA y Soporte Documental: Google Gemini & Google Workspace
- [Aplicación Web Oficial de Google Gemini](https://gemini.google.com/)
- [Portal de Información y Modelos (Google DeepMind - Gemini)](https://deepmind.google/technologies/gemini/)
- [Integración con Google Workspace](https://workspace.google.com/solutions/ai/)
- [Documentación Técnica y Guías de Google AI](https://ai.google.dev/docs)

### 1.5. Control de Versiones: GitHub y Git
- [Portal Oficial de GitHub](https://github.com/)
- [Documentación Oficial de GitHub (Español)](https://docs.github.com/es)
- [Descarga Oficial de Git (Git SCM)](https://git-scm.com/downloads)
- [Cliente Gráfico Oficial (GitHub Desktop)](https://desktop.github.com/)
- [GitHub Student Developer Pack](https://education.github.com/pack)

---

## 2. Portal de Artefactos y Documentación del Proyecto (Google Drive)

**Carpeta Central en Google Drive:** [DriveGrupo7BD](https://drive.google.com/drive/folders/1pNTw8RYkS0tX6eVReZhHlQfLRxvV-AIr)

| Artefacto / Documento | Descripción | Enlace en Google Drive / Docs |
| :--- | :--- | :--- |
| **Ecosistema del Grupo 7** | Especificación técnica, arquitectura y comportamiento de las herramientas del proyecto. | [Abrir en Google Docs](https://docs.google.com/document/d/1jEYxsCQ18kRJlLdVEHM3p4QCsgNE9CyKi-74JiFkyWo/edit) |
| **Reglas de Integridad del Caso de Estudio** | Especificación y justificación técnica de las reglas de integridad explícitas (RI-01 a RI-05). | [Abrir en Google Docs](https://docs.google.com/document/d/1PHqwM5ADqrMSK8wqpV2XIH1y8ON6d7U--ep2rhxuF80/edit) |
| **Enunciado del Caso de Estudio (Transcripción)** | Transcripción íntegra en Google Docs del enunciado *Caso de Estudio 1 – Viajes y Turismo*. | [Abrir en Google Docs](https://docs.google.com/document/d/15XiShZHlyQUcwnQYJ4ythWBxyPeO_9c_xpRKJWuP30g/edit) |
| **Modelo Entidad-Relación (`ERSBDI.pdf`)** | Esquema conceptual definitivo de las agencias de viajes (Tablas E, S y E/S). | [Ver PDF en Google Drive](https://drive.google.com/file/d/1DRl0XuzpjhKS64cTTQkFimgDkqyJ_byO/view) |
| **Especificaciones del Caso de Estudio** | Lineamientos generales y entregas evaluadas del semestre 202715 (`EspecificacionesCasoEstudioSBD1.pdf`). | [Ver PDF en Google Drive](https://drive.google.com/file/d/1v7Qx2kTgTaoweDW08Wvu8AOiHgQw0Ldw/view) |

---

## 3. Estructura de Scripts SQL

Todos los comandos SQL realizados en la base de datos Oracle XE 21c se registran en la carpeta [`scripts/`](./scripts/), organizados por fase de implementación y divididos internamente en secciones de código para **Onassis Torrealba** y **Christian Terán**:

- [`scripts/01_ddl_estructura.sql`](./scripts/01_ddl_estructura.sql): Creación de la estructura física según el modelo E-R ideal (tablas clasificadas en Entrada `E`, Salida `S` y Entrada/Salida `E/S`, restricciones de integridad `PK`/`FK`/`CHECK`, secuencias, índices y vistas).
- [`scripts/02_dml_inserts.sql`](./scripts/02_dml_inserts.sql): Sentencias `INSERT` con los lotes de registros de prueba y de negocio (mínimo 10 registros reales, de calidad y no repetidos por cada tabla de entrada).
- [`scripts/03_plsql_programas_triggers.sql`](./scripts/03_plsql_programas_triggers.sql): Codificación de objetos programables en PL/SQL (triggers, procedimientos almacenados, funciones y cursores `SYS_REFCURSOR` para reportes) encargados de automatizar las reglas de integridad explícitas.
- [`scripts/04_seguridad_logica.sql`](./scripts/04_seguridad_logica.sql): Diseño e implementación del esquema de seguridad lógica (creación de roles, cuentas de usuario, privilegios de sistema y privilegios sobre objetos).
- [`scripts/05_consultas_y_bitacora.sql`](./scripts/05_consultas_y_bitacora.sql): Registro histórico y bitácora de consultas SQL de verificación, pruebas y consultas ejecutadas en el motor de base de datos.
