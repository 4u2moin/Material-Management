package com.assesment.materialmanagement.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.OffsetDateTime;
import java.util.UUID;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "material", schema = "mdm_schema",
        uniqueConstraints = @UniqueConstraint(columnNames = {"external_id"}))
public class Material {

    @Id
    @Column(name = "material_id", nullable = false)
    private UUID materialId;

    @Column(name = "external_id", nullable = false, unique = true)
    private String externalId;

    @Column(name = "material_name", nullable = false, length = 100)
    private String materialName;

    @Column(name = "material_rate_per_pack", nullable = false, precision = 18, scale = 3)
    private BigDecimal materialRatePerPack;

    @Column(name = "material_pack_size", nullable = false, precision = 18, scale = 3)
    private BigDecimal materialPackSize;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "material_uom_id", nullable = false)
    private UnitOfMeasurement uom;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "material_type_id")
    private MaterialType type;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "material_manufacturer_id")
    private MaterialManufacturer manufacturer;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "material_vendor_id")
    private MaterialVendor vendor;

    @Column(name = "material_desc", length = 255)
    private String materialDesc;

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
