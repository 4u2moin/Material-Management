package com.assesment.materialmanagement.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.*;

import java.time.OffsetDateTime;
import java.util.UUID;

@Entity
@Table(name = "material_type", schema = "mdm_schema")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MaterialType {
    @Id
    @Column(name = "material_type_id")
    private UUID materialTypeId;

    @Column(name = "external_id", nullable = false, unique = true)
    private String externalId;

    @Column(name = "material_type_name", nullable = false, length = 100)
    private String materialTypeName;

    @Column(name = "material_type_desc")
    private String materialTypeDesc;

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
