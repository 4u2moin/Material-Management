package com.assesment.materialmanagement.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.*;

import java.time.OffsetDateTime;
import java.util.UUID;

@Entity
@Table(name = "material_vendor", schema = "mdm_schema")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MaterialVendor {
    @Id
    @Column(name = "material_vendor_id")
    private UUID materialVendorId;

    @Column(name = "external_id", nullable = false, unique = true)
    private String externalId;

    @Column(name = "material_vendor_name", nullable = false, length = 100)
    private String materialVendorName;

    @Column(name = "material_vendor_contact_person")
    private String materialVendorContactPerson;

    @Column(name = "material_vendor_contact_number")
    private String materialVendorContactNumber;

    @Column(name = "material_vendor_email")
    private String materialVendorEmail;

    @Column(name = "material_vendor_gst")
    private String materialVendorGst;

    @Column(name = "material_vendor_desc")
    private String materialVendorDesc;

    @Column(name = "is_active", nullable = false)
    private Boolean isActive = true;

    @Column(name = "created_by", nullable = false)
    private UUID createdBy;

    @Column(name = "created_on", nullable = false)
    private OffsetDateTime createdOn;

    @Column(name = "updated_by")
    private UUID updatedBy;

    @Column(name = "updated_on", nullable = false)
    private OffsetDateTime updatedOn;
}
