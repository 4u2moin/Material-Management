package com.assesment.materialmanagement.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.*;

import java.time.OffsetDateTime;
import java.util.UUID;

@Entity
@Table(name = "material_manufacturer", schema = "mdm_schema")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MaterialManufacturer {
    @Id
    @Column(name = "material_manufacturer_id")
    private UUID materialManufacturerId;

    @Column(name = "external_id", nullable = false, unique = true)
    private String externalId;

    @Column(name = "material_manufacturer_name", nullable = false, length = 100)
    private String materialManufacturerName;

    @Column(name = "material_manufacturer_contact_person")
    private String materialManufacturerContactPerson;

    @Column(name = "material_manufacturer_contact_number")
    private String materialManufacturerContactNumber;

    @Column(name = "material_manufacturer_email")
    private String materialManufacturerEmail;

    @Column(name = "material_manufacturer_gst")
    private String materialManufacturerGst;

    @Column(name = "material_manufacturer_desc")
    private String materialManufacturerDesc;

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
