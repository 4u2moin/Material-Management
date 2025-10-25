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
public class UomDTO {
    private UUID uomId;
    private String uomName;
    private String uomSymbol;
}
