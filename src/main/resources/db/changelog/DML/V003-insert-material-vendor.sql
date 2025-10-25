-- Enable UUID extension (run once if not done)
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- ========================================
-- Insert Material Vendors (idempotent)
-- ========================================
DO $$
BEGIN
    -- 1
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_vendor WHERE external_id = 'EXT-VEND-001') THEN
        INSERT INTO mdm_schema.material_vendor (
            material_vendor_id,
            external_id,
            material_vendor_name,
            material_vendor_contact_person,
            material_vendor_contact_number,
            material_vendor_email,
            material_vendor_gst,
            material_vendor_desc,
            is_active,
            created_by,
            created_on,
            updated_by,
            updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-VEND-001', 'Global Trade Supplies', 'Rohit Sharma', '+91-9876543210',
            'rohit@globaltrade.com', '27GT1234F1Z5', 'Wholesale supplier of industrial materials',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 2
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_vendor WHERE external_id = 'EXT-VEND-002') THEN
        INSERT INTO mdm_schema.material_vendor (
            material_vendor_id,
            external_id,
            material_vendor_name,
            material_vendor_contact_person,
            material_vendor_contact_number,
            material_vendor_email,
            material_vendor_gst,
            material_vendor_desc,
            is_active,
            created_by,
            created_on,
            updated_by,
            updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-VEND-002', 'Omkar Industrial Solutions', 'Priya Desai', '+91-9876123450',
            'priya@omkarind.com', '27OM1234F1Z5', 'Specialized in hardware tools and accessories',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 3
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_vendor WHERE external_id = 'EXT-VEND-003') THEN
        INSERT INTO mdm_schema.material_vendor (
            material_vendor_id,
            external_id,
            material_vendor_name,
            material_vendor_contact_person,
            material_vendor_contact_number,
            material_vendor_email,
            material_vendor_gst,
            material_vendor_desc,
            is_active,
            created_by,
            created_on,
            updated_by,
            updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-VEND-003', 'Techno Metals Pvt Ltd', 'Suresh Patil', '+91-9988776655',
            'suresh@technometals.com', '27TM1234F1Z5', 'Supplier of stainless steel and iron products',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 4
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_vendor WHERE external_id = 'EXT-VEND-004') THEN
        INSERT INTO mdm_schema.material_vendor (
            material_vendor_id,
            external_id,
            material_vendor_name,
            material_vendor_contact_person,
            material_vendor_contact_number,
            material_vendor_email,
            material_vendor_gst,
            material_vendor_desc,
            is_active,
            created_by,
            created_on,
            updated_by,
            updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-VEND-004', 'Modern Construction Supply', 'Aarti Mehta', '+91-9988771122',
            'aarti@moderncon.com', '27MC1234F1Z5', 'Construction and civil engineering materials vendor',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 5
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_vendor WHERE external_id = 'EXT-VEND-005') THEN
        INSERT INTO mdm_schema.material_vendor (
            material_vendor_id,
            external_id,
            material_vendor_name,
            material_vendor_contact_person,
            material_vendor_contact_number,
            material_vendor_email,
            material_vendor_gst,
            material_vendor_desc,
            is_active,
            created_by,
            created_on,
            updated_by,
            updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-VEND-005', 'Sunrise Polymers', 'Ravi Kumar', '+91-9123456789',
            'ravi@sunpoly.com', '27SP1234F1Z5', 'Supplier of plastic granules and resins',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 6
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_vendor WHERE external_id = 'EXT-VEND-006') THEN
        INSERT INTO mdm_schema.material_vendor (
            material_vendor_id,
            external_id,
            material_vendor_name,
            material_vendor_contact_person,
            material_vendor_contact_number,
            material_vendor_email,
            material_vendor_gst,
            material_vendor_desc,
            is_active,
            created_by,
            created_on,
            updated_by,
            updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-VEND-006', 'Elite Electricals', 'Sneha Joshi', '+91-9988123456',
            'sneha@eliteelec.com', '27EE1234F1Z5', 'Electrical fittings and cables distributor',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 7
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_vendor WHERE external_id = 'EXT-VEND-007') THEN
        INSERT INTO mdm_schema.material_vendor (
            material_vendor_id,
            external_id,
            material_vendor_name,
            material_vendor_contact_person,
            material_vendor_contact_number,
            material_vendor_email,
            material_vendor_gst,
            material_vendor_desc,
            is_active,
            created_by,
            created_on,
            updated_by,
            updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-VEND-007', 'Apex Hardware Traders', 'Vikram Singh', '+91-9911223344',
            'vikram@apexhardware.com', '27AH1234F1Z5', 'Tools, fasteners, and construction fittings vendor',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 8
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_vendor WHERE external_id = 'EXT-VEND-008') THEN
        INSERT INTO mdm_schema.material_vendor (
            material_vendor_id,
            external_id,
            material_vendor_name,
            material_vendor_contact_person,
            material_vendor_contact_number,
            material_vendor_email,
            material_vendor_gst,
            material_vendor_desc,
            is_active,
            created_by,
            created_on,
            updated_by,
            updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-VEND-008', 'Shree Cement Suppliers', 'Anjali Nair', '+91-9090909090',
            'anjali@shreecement.com', '27SC1234F1Z5', 'Cement and construction material provider',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 9
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_vendor WHERE external_id = 'EXT-VEND-009') THEN
        INSERT INTO mdm_schema.material_vendor (
            material_vendor_id,
            external_id,
            material_vendor_name,
            material_vendor_contact_person,
            material_vendor_contact_number,
            material_vendor_email,
            material_vendor_gst,
            material_vendor_desc,
            is_active,
            created_by,
            created_on,
            updated_by,
            updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-VEND-009', 'GreenWood Timber Traders', 'Harish Yadav', '+91-9876501234',
            'harish@greenwood.com', '27GW1234F1Z5', 'Supplier of timber and wooden sheets',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 10
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_vendor WHERE external_id = 'EXT-VEND-010') THEN
        INSERT INTO mdm_schema.material_vendor (
            material_vendor_id,
            external_id,
            material_vendor_name,
            material_vendor_contact_person,
            material_vendor_contact_number,
            material_vendor_email,
            material_vendor_gst,
            material_vendor_desc,
            is_active,
            created_by,
            created_on,
            updated_by,
            updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-VEND-010', 'Prime Lubricants', 'Neha Sharma', '+91-9765432109',
            'neha@primelubricants.com', '27PL1234F1Z5', 'Industrial oils, greases, and lubricants supplier',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 11
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_vendor WHERE external_id = 'EXT-VEND-011') THEN
        INSERT INTO mdm_schema.material_vendor (
            material_vendor_id,
            external_id,
            material_vendor_name,
            material_vendor_contact_person,
            material_vendor_contact_number,
            material_vendor_email,
            material_vendor_gst,
            material_vendor_desc,
            is_active,
            created_by,
            created_on,
            updated_by,
            updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-VEND-011', 'Mangal Steel Corporation', 'Deepak Verma', '+91-9812345678',
            'deepak@mangalsteel.com', '27MS1234F1Z5', 'Steel rods, bars, and structural materials vendor',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 12
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_vendor WHERE external_id = 'EXT-VEND-012') THEN
        INSERT INTO mdm_schema.material_vendor (
            material_vendor_id,
            external_id,
            material_vendor_name,
            material_vendor_contact_person,
            material_vendor_contact_number,
            material_vendor_email,
            material_vendor_gst,
            material_vendor_desc,
            is_active,
            created_by,
            created_on,
            updated_by,
            updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-VEND-012', 'Urban Paints Co.', 'Shruti Gupta', '+91-9823456789',
            'shruti@urbanpaints.com', '27UP1234F1Z5', 'Paints, coatings, and color chemicals supplier',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 13
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_vendor WHERE external_id = 'EXT-VEND-013') THEN
        INSERT INTO mdm_schema.material_vendor (
            material_vendor_id,
            external_id,
            material_vendor_name,
            material_vendor_contact_person,
            material_vendor_contact_number,
            material_vendor_email,
            material_vendor_gst,
            material_vendor_desc,
            is_active,
            created_by,
            created_on,
            updated_by,
            updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-VEND-013', 'Supreme Safety Gear', 'Manoj Jain', '+91-9898123456',
            'manoj@supremesafety.com', '27SS1234F1Z5', 'Provider of industrial safety equipment and uniforms',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 14
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_vendor WHERE external_id = 'EXT-VEND-014') THEN
        INSERT INTO mdm_schema.material_vendor (
            material_vendor_id,
            external_id,
            material_vendor_name,
            material_vendor_contact_person,
            material_vendor_contact_number,
            material_vendor_email,
            material_vendor_gst,
            material_vendor_desc,
            is_active,
            created_by,
            created_on,
            updated_by,
            updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-VEND-014', 'Galaxy Fasteners Pvt Ltd', 'Kavita Rao', '+91-9755555555',
            'kavita@galaxyfasteners.com', '27GF1234F1Z5', 'Bolts, nuts, and industrial fasteners supplier',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

    -- 15
    IF NOT EXISTS (SELECT 1 FROM mdm_schema.material_vendor WHERE external_id = 'EXT-VEND-015') THEN
        INSERT INTO mdm_schema.material_vendor (
            material_vendor_id,
            external_id,
            material_vendor_name,
            material_vendor_contact_person,
            material_vendor_contact_number,
            material_vendor_email,
            material_vendor_gst,
            material_vendor_desc,
            is_active,
            created_by,
            created_on,
            updated_by,
            updated_on
        ) VALUES (
            gen_random_uuid(), 'EXT-VEND-015', 'Evergreen Chemicals', 'Aman Trivedi', '+91-9644444444',
            'aman@evergreenchem.com', '27EC1234F1Z5', 'Supplier of industrial and cleaning chemicals',
            TRUE, '11111111-2222-3333-4444-555555555555', NOW(),
            '11111111-2222-3333-4444-555555555555', NOW()
        );
    END IF;

END $$;
