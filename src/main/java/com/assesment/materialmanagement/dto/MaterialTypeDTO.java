package com.assesment.materialmanagement.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MaterialTypeDTO {
    private UUID materialTypeId;
    private String materialTypeName;
    private String materialTypeDesc;
}
