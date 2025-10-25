package com.assesment.materialmanagement.dto;


import lombok.*;
import java.math.BigDecimal;
import java.time.OffsetDateTime;
import java.util.UUID;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MaterialResponseDTO {
    private UUID materialId;
    private String externalId;
    private String materialName;
    private BigDecimal materialRatePerPack;
    private BigDecimal materialPackSize;
    private String materialDesc;


    private UomDTO uom;
    private MaterialTypeDTO type;
    private ManufacturerDTO manufacturer;
    private VendorDTO vendor;


    private Boolean isActive;
    private UUID createdBy;
    private OffsetDateTime createdOn;
    private UUID updatedBy;
    private OffsetDateTime updatedOn;
}