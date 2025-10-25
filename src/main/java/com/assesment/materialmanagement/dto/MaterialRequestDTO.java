package com.assesment.materialmanagement.dto;


import jakarta.validation.constraints.*;
import lombok.*;


import java.math.BigDecimal;
import java.util.UUID;
@Data
public class MaterialRequestDTO {
    @NotBlank(message = "Material name is required")
    private String materialName;


    @NotNull
    @DecimalMin(value = "0.000", inclusive = false, message = "Material rate must be greater than 0")
    private BigDecimal materialRatePerPack;


    @NotNull
    @DecimalMin(value = "0.000", inclusive = false, message = "Material pack size must be greater than 0")
    private BigDecimal materialPackSize;


    @NotNull(message = "materialUomId is required")
    private UUID materialUomId;

    @NotNull(message = "materialTypeId is required")
    private UUID materialTypeId;

    @NotNull(message = "materialManufacturerId is required")
    private UUID materialManufacturerId;
    @NotNull(message = "materialVendorId is required")
    private UUID materialVendorId;


    private String materialDesc;
}