package com.assesment.materialmanagement.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.*;

import java.time.OffsetDateTime;
import java.util.UUID;

@Entity
@Table(name = "unit_of_measurement", schema = "mdm_schema")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UnitOfMeasurement {
    @Id
    @Column(name = "uom_id")
    private UUID uomId;

    @Column(name = "external_id", nullable = false, unique = true)
    private String externalId;

    @Column(name = "uom_name", nullable = false, length = 100)
    private String uomName;

    @Column(name = "uom_symbol", nullable = false, length = 20)
    private String uomSymbol;

    @Column(name = "uom_desc")
    private String uomDesc;

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
