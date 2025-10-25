-- Enable UUID extension (run once if not done)
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- ========================================
-- Insert Material Types (idempotent)
-- ========================================
DO $$
BEGIN
    -- 1
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_type WHERE external_id = 'EXT-TYPE-001') THEN
        INSERT INTO mdm_schema.material_type (
            material_type_id, external_id, material_type_name, material_type_desc,
            is_active, created_by, created_on, updated_by, updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-TYPE-001', 'Steel', 'High-grade steel used in construction and fabrication.',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 2
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_type WHERE external_id = 'EXT-TYPE-002') THEN
        INSERT INTO mdm_schema.material_type (
            material_type_id, external_id, material_type_name, material_type_desc,
            is_active, created_by, created_on, updated_by, updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-TYPE-002', 'Cement', 'Various grades of cement used for structural purposes.',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 3
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_type WHERE external_id = 'EXT-TYPE-003') THEN
        INSERT INTO mdm_schema.material_type (
            material_type_id, external_id, material_type_name, material_type_desc,
            is_active, created_by, created_on, updated_by, updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-TYPE-003', 'Plastic', 'Plastic materials and polymer-based construction components.',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 4
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_type WHERE external_id = 'EXT-TYPE-004') THEN
        INSERT INTO mdm_schema.material_type (
            material_type_id, external_id, material_type_name, material_type_desc,
            is_active, created_by, created_on, updated_by, updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-TYPE-004', 'Paint', 'Decorative and industrial coating materials.',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 5
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_type WHERE external_id = 'EXT-TYPE-005') THEN
        INSERT INTO mdm_schema.material_type (
            material_type_id, external_id, material_type_name, material_type_desc,
            is_active, created_by, created_on, updated_by, updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-TYPE-005', 'Timber', 'Natural and treated wood materials used in furniture and construction.',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 6
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_type WHERE external_id = 'EXT-TYPE-006') THEN
        INSERT INTO mdm_schema.material_type (
            material_type_id, external_id, material_type_name, material_type_desc,
            is_active, created_by, created_on, updated_by, updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-TYPE-006', 'Glass', 'Tempered and laminated glass materials for architectural use.',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 7
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_type WHERE external_id = 'EXT-TYPE-007') THEN
        INSERT INTO mdm_schema.material_type (
            material_type_id, external_id, material_type_name, material_type_desc,
            is_active, created_by, created_on, updated_by, updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-TYPE-007', 'Electrical', 'Electrical cables, switches, and circuit components.',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 8
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_type WHERE external_id = 'EXT-TYPE-008') THEN
        INSERT INTO mdm_schema.material_type (
            material_type_id, external_id, material_type_name, material_type_desc,
            is_active, created_by, created_on, updated_by, updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-TYPE-008', 'Plumbing', 'Pipes, fittings, and fixtures for water and drainage systems.',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 9
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_type WHERE external_id = 'EXT-TYPE-009') THEN
        INSERT INTO mdm_schema.material_type (
            material_type_id, external_id, material_type_name, material_type_desc,
            is_active, created_by, created_on, updated_by, updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-TYPE-009', 'Concrete', 'Ready-mix and pre-cast concrete products.',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 10
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_type WHERE external_id = 'EXT-TYPE-010') THEN
        INSERT INTO mdm_schema.material_type (
            material_type_id, external_id, material_type_name, material_type_desc,
            is_active, created_by, created_on, updated_by, updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-TYPE-010', 'Ceramic', 'Ceramic tiles, sanitary ware, and decorative products.',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 11
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_type WHERE external_id = 'EXT-TYPE-011') THEN
        INSERT INTO mdm_schema.material_type (
            material_type_id, external_id, material_type_name, material_type_desc,
            is_active, created_by, created_on, updated_by, updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-TYPE-011', 'Chemical', 'Construction-grade and industrial chemicals.',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 12
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_type WHERE external_id = 'EXT-TYPE-012') THEN
        INSERT INTO mdm_schema.material_type (
            material_type_id, external_id, material_type_name, material_type_desc,
            is_active, created_by, created_on, updated_by, updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-TYPE-012', 'Stone', 'Granite, marble, and natural stone materials.',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 13
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_type WHERE external_id = 'EXT-TYPE-013') THEN
        INSERT INTO mdm_schema.material_type (
            material_type_id, external_id, material_type_name, material_type_desc,
            is_active, created_by, created_on, updated_by, updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-TYPE-013', 'Aluminium', 'Aluminium sheets, sections, and fabrication materials.',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 14
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_type WHERE external_id = 'EXT-TYPE-014') THEN
        INSERT INTO mdm_schema.material_type (
            material_type_id, external_id, material_type_name, material_type_desc,
            is_active, created_by, created_on, updated_by, updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-TYPE-014', 'Hardware', 'Nuts, bolts, fasteners, and mechanical tools.',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 15
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_type WHERE external_id = 'EXT-TYPE-015') THEN
        INSERT INTO mdm_schema.material_type (
            material_type_id, external_id, material_type_name, material_type_desc,
            is_active, created_by, created_on, updated_by, updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-TYPE-015', 'Insulation', 'Thermal and sound insulation materials for buildings.',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

END $$;
