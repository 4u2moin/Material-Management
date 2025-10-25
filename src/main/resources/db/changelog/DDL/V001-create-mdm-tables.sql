-- ==========================================================
-- SCHEMA CREATION
-- ==========================================================
CREATE SCHEMA IF NOT EXISTS mdm_schema;
CREATE SCHEMA IF NOT EXISTS sequences;

-- ==========================================================
-- SEQUENCES
-- ==========================================================
CREATE SEQUENCE IF NOT EXISTS sequences.unit_of_measurement_externalid_seq START 1;
CREATE SEQUENCE IF NOT EXISTS sequences.material_type_externalid_seq START 1;
CREATE SEQUENCE IF NOT EXISTS sequences.material_manufacturer_externalid_seq START 1;
CREATE SEQUENCE IF NOT EXISTS sequences.material_vendor_externalid_seq START 1;
CREATE SEQUENCE IF NOT EXISTS sequences.material_externalid_seq START 1;

-- ==========================================================
-- TABLE: UNIT OF MEASUREMENT
-- ==========================================================
CREATE TABLE IF NOT EXISTS mdm_schema.unit_of_measurement (
    uom_id uuid DEFAULT gen_random_uuid() NOT NULL,
    external_id varchar(50) DEFAULT (
        'UOM-' || EXTRACT(YEAR FROM CURRENT_TIMESTAMP)::text || '-' ||
        lpad(nextval('sequences.unit_of_measurement_externalid_seq')::text, 4, '0')
    ) NOT NULL,
    uom_name varchar(100) NOT NULL,
    uom_symbol varchar(20) NOT NULL,
    uom_desc varchar(255),
    is_active boolean DEFAULT true NOT NULL,
    created_by uuid NOT NULL,
    created_on timestamp DEFAULT now() NOT NULL,
    updated_by uuid,
    updated_on timestamp DEFAULT now() NOT NULL,
    CONSTRAINT uom_pkey PRIMARY KEY (uom_id),
    CONSTRAINT unit_of_measurement_external_id_key UNIQUE (external_id)
);

-- ==========================================================
-- TABLE: MATERIAL TYPE
-- ==========================================================
CREATE TABLE IF NOT EXISTS mdm_schema.material_type (
    material_type_id uuid DEFAULT gen_random_uuid() NOT NULL,
    external_id varchar(50) DEFAULT (
        'TYPE-' || EXTRACT(YEAR FROM CURRENT_TIMESTAMP)::text || '-' ||
        lpad(nextval('sequences.material_type_externalid_seq')::text, 4, '0')
    ) NOT NULL,
    material_type_name varchar(100) NOT NULL,
    material_type_desc varchar(255),
    is_active boolean DEFAULT true NOT NULL,
    created_by uuid NOT NULL,
    created_on timestamp DEFAULT now() NOT NULL,
    updated_by uuid,
    updated_on timestamp DEFAULT now() NOT NULL,
    CONSTRAINT material_type_pkey PRIMARY KEY (material_type_id),
    CONSTRAINT material_type_external_id_key UNIQUE (external_id)
);

-- ==========================================================
-- TABLE: MATERIAL MANUFACTURER
-- ==========================================================
CREATE TABLE IF NOT EXISTS mdm_schema.material_manufacturer (
    material_manufacturer_id uuid DEFAULT gen_random_uuid() NOT NULL,
    external_id varchar(50) DEFAULT (
        'MFR-' || EXTRACT(YEAR FROM CURRENT_TIMESTAMP)::text || '-' ||
        lpad(nextval('sequences.material_manufacturer_externalid_seq')::text, 4, '0')
    ) NOT NULL,
    material_manufacturer_name varchar(100) NOT NULL,
    material_manufacturer_desc varchar(255),
    is_active boolean DEFAULT true NOT NULL,
    created_by uuid NOT NULL,
    created_on timestamp DEFAULT now() NOT NULL,
    updated_by uuid,
    updated_on timestamp DEFAULT now() NOT NULL,
    CONSTRAINT material_manufacturer_pkey PRIMARY KEY (material_manufacturer_id),
    CONSTRAINT material_manufacturer_external_id_key UNIQUE (external_id)
);

-- ==========================================================
-- TABLE: MATERIAL VENDOR
-- ==========================================================
CREATE TABLE IF NOT EXISTS mdm_schema.material_vendor (
    material_vendor_id uuid DEFAULT gen_random_uuid() NOT NULL,
    external_id varchar(50) DEFAULT (
        'VND-' || EXTRACT(YEAR FROM CURRENT_TIMESTAMP)::text || '-' ||
        lpad(nextval('sequences.material_vendor_externalid_seq')::text, 4, '0')
    ) NOT NULL,
    material_vendor_name varchar(100) NOT NULL,
    material_vendor_desc varchar(255),
    is_active boolean DEFAULT true NOT NULL,
    created_by uuid NOT NULL,
    created_on timestamp DEFAULT now() NOT NULL,
    updated_by uuid,
    updated_on timestamp DEFAULT now() NOT NULL,
    CONSTRAINT material_vendor_pkey PRIMARY KEY (material_vendor_id),
    CONSTRAINT material_vendor_external_id_key UNIQUE (external_id)
);

-- ==========================================================
-- TABLE: MATERIAL
-- ==========================================================
CREATE TABLE IF NOT EXISTS mdm_schema.material (
    material_id uuid DEFAULT gen_random_uuid() NOT NULL,
    external_id varchar(50) DEFAULT (
        'MAT-' || EXTRACT(YEAR FROM CURRENT_TIMESTAMP)::text || '-' ||
        lpad(nextval('sequences.material_externalid_seq')::text, 4, '0')
    ) NOT NULL,
    material_name varchar(100) NOT NULL,
    material_rate_per_pack numeric(18,3) NOT NULL,
    material_pack_size numeric(18,3) NOT NULL,
    material_uom_id uuid NOT NULL,
    material_type_id uuid,
    material_manufacturer_id uuid,
    material_vendor_id uuid,
    material_desc varchar(255),
    is_active boolean DEFAULT true NOT NULL,
    created_by uuid NOT NULL,
    created_on timestamp DEFAULT now() NOT NULL,
    updated_by uuid,
    updated_on timestamp DEFAULT now() NOT NULL,
    CONSTRAINT material_pkey PRIMARY KEY (material_id),
    CONSTRAINT material_external_id_key UNIQUE (external_id),
    CONSTRAINT fk_material_uom FOREIGN KEY (material_uom_id)
        REFERENCES mdm_schema.unit_of_measurement (uom_id),
    CONSTRAINT fk_material_type FOREIGN KEY (material_type_id)
        REFERENCES mdm_schema.material_type (material_type_id),
    CONSTRAINT fk_material_manufacturer FOREIGN KEY (material_manufacturer_id)
        REFERENCES mdm_schema.material_manufacturer (material_manufacturer_id),
    CONSTRAINT fk_material_vendor FOREIGN KEY (material_vendor_id)
        REFERENCES mdm_schema.material_vendor (material_vendor_id)
);
