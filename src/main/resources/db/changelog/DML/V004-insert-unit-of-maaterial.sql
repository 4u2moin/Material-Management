-- ========================================
-- Liquibase SQL for UnitOfMeasurement inserts
-- ========================================

-- Enable UUID extension if not already enabled
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- 1
INSERT INTO mdm_schema.unit_of_measurement (
    uom_id, external_id, uom_name, uom_symbol, uom_desc,
    is_active, created_by, created_on, updated_by, updated_on
)
SELECT gen_random_uuid(), 'EXT-UOM-001', 'Kilogram', 'kg', 'Unit of mass',
       TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
       '11111111-2222-3333-4444-555555555555', NOW()
WHERE NOT EXISTS (SELECT 1 FROM mdm_schema.unit_of_measurement WHERE external_id='EXT-UOM-001');

-- 2
INSERT INTO mdm_schema.unit_of_measurement (
    uom_id, external_id, uom_name, uom_symbol, uom_desc,
    is_active, created_by, created_on, updated_by, updated_on
)
SELECT gen_random_uuid(), 'EXT-UOM-002', 'Gram', 'g', 'Unit of mass smaller than kilogram',
       TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
       '11111111-2222-3333-4444-555555555555', NOW()
WHERE NOT EXISTS (SELECT 1 FROM mdm_schema.unit_of_measurement WHERE external_id='EXT-UOM-002');

-- 3
INSERT INTO mdm_schema.unit_of_measurement (
    uom_id, external_id, uom_name, uom_symbol, uom_desc,
    is_active, created_by, created_on, updated_by, updated_on
)
SELECT gen_random_uuid(), 'EXT-UOM-003', 'Liter', 'L', 'Unit of volume for liquids',
       TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
       '11111111-2222-3333-4444-555555555555', NOW()
WHERE NOT EXISTS (SELECT 1 FROM mdm_schema.unit_of_measurement WHERE external_id='EXT-UOM-003');

-- 4
INSERT INTO mdm_schema.unit_of_measurement (
    uom_id, external_id, uom_name, uom_symbol, uom_desc,
    is_active, created_by, created_on, updated_by, updated_on
)
SELECT gen_random_uuid(), 'EXT-UOM-004', 'Milliliter', 'ml', 'Smaller unit of volume',
       TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
       '11111111-2222-3333-4444-555555555555', NOW()
WHERE NOT EXISTS (SELECT 1 FROM mdm_schema.unit_of_measurement WHERE external_id='EXT-UOM-004');

-- 5
INSERT INTO mdm_schema.unit_of_measurement (
    uom_id, external_id, uom_name, uom_symbol, uom_desc,
    is_active, created_by, created_on, updated_by, updated_on
)
SELECT gen_random_uuid(), 'EXT-UOM-005', 'Piece', 'pcs', 'Unit for counting individual items',
       TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
       '11111111-2222-3333-4444-555555555555', NOW()
WHERE NOT EXISTS (SELECT 1 FROM mdm_schema.unit_of_measurement WHERE external_id='EXT-UOM-005');

-- 6
INSERT INTO mdm_schema.unit_of_measurement (
    uom_id, external_id, uom_name, uom_symbol, uom_desc,
    is_active, created_by, created_on, updated_by, updated_on
)
SELECT gen_random_uuid(), 'EXT-UOM-006', 'Meter', 'm', 'Unit of length',
       TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
       '11111111-2222-3333-4444-555555555555', NOW()
WHERE NOT EXISTS (SELECT 1 FROM mdm_schema.unit_of_measurement WHERE external_id='EXT-UOM-006');

-- 7
INSERT INTO mdm_schema.unit_of_measurement (
    uom_id, external_id, uom_name, uom_symbol, uom_desc,
    is_active, created_by, created_on, updated_by, updated_on
)
SELECT gen_random_uuid(), 'EXT-UOM-007', 'Centimeter', 'cm', 'Smaller unit of length',
       TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
       '11111111-2222-3333-4444-555555555555', NOW()
WHERE NOT EXISTS (SELECT 1 FROM mdm_schema.unit_of_measurement WHERE external_id='EXT-UOM-007');

-- 8
INSERT INTO mdm_schema.unit_of_measurement (
    uom_id, external_id, uom_name, uom_symbol, uom_desc,
    is_active, created_by, created_on, updated_by, updated_on
)
SELECT gen_random_uuid(), 'EXT-UOM-008', 'Square Meter', 'm²', 'Unit of area',
       TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
       '11111111-2222-3333-4444-555555555555', NOW()
WHERE NOT EXISTS (SELECT 1 FROM mdm_schema.unit_of_measurement WHERE external_id='EXT-UOM-008');

-- 9
INSERT INTO mdm_schema.unit_of_measurement (
    uom_id, external_id, uom_name, uom_symbol, uom_desc,
    is_active, created_by, created_on, updated_by, updated_on
)
SELECT gen_random_uuid(), 'EXT-UOM-009', 'Cubic Meter', 'm³', 'Unit of volume for solids and liquids',
       TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
       '11111111-2222-3333-4444-555555555555', NOW()
WHERE NOT EXISTS (SELECT 1 FROM mdm_schema.unit_of_measurement WHERE external_id='EXT-UOM-009');

-- 10
INSERT INTO mdm_schema.unit_of_measurement (
    uom_id, external_id, uom_name, uom_symbol, uom_desc,
    is_active, created_by, created_on, updated_by, updated_on
)
SELECT gen_random_uuid(), 'EXT-UOM-010', 'Ton', 't', 'Unit of mass equal to 1000 kg',
       TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
       '11111111-2222-3333-4444-555555555555', NOW()
WHERE NOT EXISTS (SELECT 1 FROM mdm_schema.unit_of_measurement WHERE external_id='EXT-UOM-010');

-- 11
INSERT INTO mdm_schema.unit_of_measurement (
    uom_id, external_id, uom_name, uom_symbol, uom_desc,
    is_active, created_by, created_on, updated_by, updated_on
)
SELECT gen_random_uuid(), 'EXT-UOM-011', 'Millimeter', 'mm', 'Smallest unit of length in metric',
       TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
       '11111111-2222-3333-4444-555555555555', NOW()
WHERE NOT EXISTS (SELECT 1 FROM mdm_schema.unit_of_measurement WHERE external_id='EXT-UOM-011');

-- 12
INSERT INTO mdm_schema.unit_of_measurement (
    uom_id, external_id, uom_name, uom_symbol, uom_desc,
    is_active, created_by, created_on, updated_by, updated_on
)
SELECT gen_random_uuid(), 'EXT-UOM-012', 'Square Centimeter', 'cm²', 'Unit of area in centimeters',
       TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
       '11111111-2222-3333-4444-555555555555', NOW()
WHERE NOT EXISTS (SELECT 1 FROM mdm_schema.unit_of_measurement WHERE external_id='EXT-UOM-012');

-- 13
INSERT INTO mdm_schema.unit_of_measurement (
    uom_id, external_id, uom_name, uom_symbol, uom_desc,
    is_active, created_by, created_on, updated_by, updated_on
)
SELECT gen_random_uuid(), 'EXT-UOM-013', 'Cubic Centimeter', 'cm³', 'Unit of volume in centimeters',
       TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
       '11111111-2222-3333-4444-555555555555', NOW()
WHERE NOT EXISTS (SELECT 1 FROM mdm_schema.unit_of_measurement WHERE external_id='EXT-UOM-013');

-- 14
INSERT INTO mdm_schema.unit_of_measurement (
    uom_id, external_id, uom_name, uom_symbol, uom_desc,
    is_active, created_by, created_on, updated_by, updated_on
)
SELECT gen_random_uuid(), 'EXT-UOM-014', 'Box', 'box', 'Unit for packaging or grouped items',
       TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
       '11111111-2222-3333-4444-555555555555', NOW()
WHERE NOT EXISTS (SELECT 1 FROM mdm_schema.unit_of_measurement WHERE external_id='EXT-UOM-014');

-- 15
INSERT INTO mdm_schema.unit_of_measurement (
    uom_id, external_id, uom_name, uom_symbol, uom_desc,
    is_active, created_by, created_on, updated_by, updated_on
)
SELECT gen_random_uuid(), 'EXT-UOM-015', 'Bundle', 'bndl', 'Grouped set of items',
       TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
       '11111111-2222-3333-4444-555555555555', NOW()
WHERE NOT EXISTS (SELECT 1 FROM mdm_schema.unit_of_measurement WHERE external_id='EXT-UOM-015');
