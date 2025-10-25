-- Enable UUID extension (run once if not done)
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- ========================================
-- Insert Material Manufacturers (idempotent)
-- ========================================
DO $$
BEGIN
    -- 1
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_manufacturer WHERE external_id = 'EXT-MANU-001') THEN
        INSERT INTO mdm_schema.material_manufacturer (
            material_manufacturer_id, external_id, material_manufacturer_name,
            material_manufacturer_contact_person, material_manufacturer_contact_number,
            material_manufacturer_email, material_manufacturer_gst, material_manufacturer_desc,
            is_active, created_by, created_on, updated_by, updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-MANU-001', 'ABC Manufacturing Pvt Ltd', 'John Doe', '+91-9876543210',
            'john.doe@abcmfg.com', '27ABCDE1234F1Z5', 'Leading manufacturer of construction materials.',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 2
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_manufacturer WHERE external_id = 'EXT-MANU-002') THEN
        INSERT INTO mdm_schema.material_manufacturer (
            material_manufacturer_id, external_id, material_manufacturer_name,
            material_manufacturer_contact_person, material_manufacturer_contact_number,
            material_manufacturer_email, material_manufacturer_gst, material_manufacturer_desc,
            is_active, created_by, created_on, updated_by, updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-MANU-002', 'XYZ Steels Ltd', 'Alice Smith', '+91-9898989898',
            'alice@xyzsteels.com', '27XYZAB1234L1Z9', 'Supplier of high-quality steel and iron components.',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 3
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_manufacturer WHERE external_id = 'EXT-MANU-003') THEN
        INSERT INTO mdm_schema.material_manufacturer (
            material_manufacturer_id, external_id, material_manufacturer_name,
            material_manufacturer_contact_person, material_manufacturer_contact_number,
            material_manufacturer_email, material_manufacturer_gst, material_manufacturer_desc,
            is_active, created_by, created_on, updated_by, updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-MANU-003', 'Sunshine Plastics', 'Ravi Kumar', '+91-9123456789',
            'ravi@sunplast.com', '27SUNPL1234M1Z7', 'Manufacturer of plastic molds and packaging materials.',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 4
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_manufacturer WHERE external_id = 'EXT-MANU-004') THEN
        INSERT INTO mdm_schema.material_manufacturer (
            material_manufacturer_id, external_id, material_manufacturer_name,
            material_manufacturer_contact_person, material_manufacturer_contact_number,
            material_manufacturer_email, material_manufacturer_gst, material_manufacturer_desc,
            is_active, created_by, created_on, updated_by, updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-MANU-004', 'Global Paints & Coatings', 'Meera Patel', '+91-9765432109',
            'meera.patel@globalpaints.com', '27GLBPC5678G1Z2', 'Producers of industrial and decorative paints and coatings.',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 5
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_manufacturer WHERE external_id = 'EXT-MANU-005') THEN
        INSERT INTO mdm_schema.material_manufacturer (
            material_manufacturer_id, external_id, material_manufacturer_name,
            material_manufacturer_contact_person, material_manufacturer_contact_number,
            material_manufacturer_email, material_manufacturer_gst, material_manufacturer_desc,
            is_active, created_by, created_on, updated_by, updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-MANU-005', 'Delta Cement Works', 'Suresh Iyer', '+91-9823456789',
            'suresh@deltacement.com', '27DELTC3456J1Z3', 'Manufacturer and distributor of high-strength cement products.',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 6
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_manufacturer WHERE external_id = 'EXT-MANU-006') THEN
        INSERT INTO mdm_schema.material_manufacturer (
            material_manufacturer_id, external_id, material_manufacturer_name,
            material_manufacturer_contact_person, material_manufacturer_contact_number,
            material_manufacturer_email, material_manufacturer_gst, material_manufacturer_desc,
            is_active, created_by, created_on, updated_by, updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-MANU-006', 'Evergreen Timber Supplies', 'Rahul Nair', '+91-9001122233',
            'rahul@evergreentimber.com', '27EVRTB5678K1Z1', 'Supplier of sustainable timber and wood products.',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 7
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_manufacturer WHERE external_id = 'EXT-MANU-007') THEN
        INSERT INTO mdm_schema.material_manufacturer (
            material_manufacturer_id, external_id, material_manufacturer_name,
            material_manufacturer_contact_person, material_manufacturer_contact_number,
            material_manufacturer_email, material_manufacturer_gst, material_manufacturer_desc,
            is_active, created_by, created_on, updated_by, updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-MANU-007', 'Prime Electricals', 'Anita Sharma', '+91-9090909090',
            'anita@primeelectricals.com', '27PRMEL6789G1Z2', 'Manufacturer of electrical fittings and wiring materials.',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 8
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_manufacturer WHERE external_id = 'EXT-MANU-008') THEN
        INSERT INTO mdm_schema.material_manufacturer (
            material_manufacturer_id, external_id, material_manufacturer_name,
            material_manufacturer_contact_person, material_manufacturer_contact_number,
            material_manufacturer_email, material_manufacturer_gst, material_manufacturer_desc,
            is_active, created_by, created_on, updated_by, updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-MANU-008', 'Modern Glass Works', 'Imran Shaikh', '+91-9812345678',
            'imran@modernglass.com', '27MDGLS1234H1Z9', 'Glass panels and tempered safety glass manufacturer.',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 9
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_manufacturer WHERE external_id = 'EXT-MANU-009') THEN
        INSERT INTO mdm_schema.material_manufacturer (
            material_manufacturer_id, external_id, material_manufacturer_name,
            material_manufacturer_contact_person, material_manufacturer_contact_number,
            material_manufacturer_email, material_manufacturer_gst, material_manufacturer_desc,
            is_active, created_by, created_on, updated_by, updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-MANU-009', 'Royal Bricks & Tiles', 'Deepa Joshi', '+91-9955664433',
            'deepa@royalbricks.com', '27RBTIL6789P1Z6', 'Supplier of high-quality bricks, tiles, and ceramics.',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 10
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_manufacturer WHERE external_id = 'EXT-MANU-010') THEN
        INSERT INTO mdm_schema.material_manufacturer (
            material_manufacturer_id, external_id, material_manufacturer_name,
            material_manufacturer_contact_person, material_manufacturer_contact_number,
            material_manufacturer_email, material_manufacturer_gst, material_manufacturer_desc,
            is_active, created_by, created_on, updated_by, updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-MANU-010', 'Aqua Pipes Pvt Ltd', 'Vikram Chauhan', '+91-8888888888',
            'vikram@aquapipes.com', '27AQPIP1234F1Z1', 'Manufacturers of PVC and HDPE pipes for water systems.',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 11
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_manufacturer WHERE external_id = 'EXT-MANU-011') THEN
        INSERT INTO mdm_schema.material_manufacturer (
            material_manufacturer_id, external_id, material_manufacturer_name,
            material_manufacturer_contact_person, material_manufacturer_contact_number,
            material_manufacturer_email, material_manufacturer_gst, material_manufacturer_desc,
            is_active, created_by, created_on, updated_by, updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-MANU-011', 'Bright Aluminium Works', 'Nidhi Desai', '+91-9933445566',
            'nidhi@brightaluminium.com', '27BRGAL6789K1Z2', 'Aluminium sections, doors, and window frames manufacturer.',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 12
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_manufacturer WHERE external_id = 'EXT-MANU-012') THEN
        INSERT INTO mdm_schema.material_manufacturer (
            material_manufacturer_id, external_id, material_manufacturer_name,
            material_manufacturer_contact_person, material_manufacturer_contact_number,
            material_manufacturer_email, material_manufacturer_gst, material_manufacturer_desc,
            is_active, created_by, created_on, updated_by, updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-MANU-012', 'GreenTech Chemicals', 'Ajay Verma', '+91-9977886655',
            'ajay@greentechchem.com', '27GRNCH5678M1Z4', 'Supplier of eco-friendly construction and cleaning chemicals.',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 13
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_manufacturer WHERE external_id = 'EXT-MANU-013') THEN
        INSERT INTO mdm_schema.material_manufacturer (
            material_manufacturer_id, external_id, material_manufacturer_name,
            material_manufacturer_contact_person, material_manufacturer_contact_number,
            material_manufacturer_email, material_manufacturer_gst, material_manufacturer_desc,
            is_active, created_by, created_on, updated_by, updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-MANU-013', 'Mega Concrete Solutions', 'Pooja Jain', '+91-9123456712',
            'pooja@megaconcrete.com', '27MGCON4567N1Z7', 'Ready-mix concrete and related construction materials supplier.',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 14
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_manufacturer WHERE external_id = 'EXT-MANU-014') THEN
        INSERT INTO mdm_schema.material_manufacturer (
            material_manufacturer_id, external_id, material_manufacturer_name,
            material_manufacturer_contact_person, material_manufacturer_contact_number,
            material_manufacturer_email, material_manufacturer_gst, material_manufacturer_desc,
            is_active, created_by, created_on, updated_by, updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-MANU-014', 'Smart Wires & Cables', 'Gaurav Mishra', '+91-9011223344',
            'gaurav@smartwires.com', '27SMTWC6789T1Z3', 'Manufacturers of copper and aluminum electrical cables.',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 15
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_manufacturer WHERE external_id = 'EXT-MANU-015') THEN
        INSERT INTO mdm_schema.material_manufacturer (
            material_manufacturer_id, external_id, material_manufacturer_name,
            material_manufacturer_contact_person, material_manufacturer_contact_number,
            material_manufacturer_email, material_manufacturer_gst, material_manufacturer_desc,
            is_active, created_by, created_on, updated_by, updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-MANU-015', 'BlueRock Granite Ltd', 'Sonal Mehta', '+91-9811122233',
            'sonal@bluerockgranite.com', '27BLRGR5678J1Z8', 'Supplier of granite, marble, and natural stone materials.',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

END $$;
