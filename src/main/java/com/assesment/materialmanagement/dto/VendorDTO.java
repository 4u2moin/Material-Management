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
public class VendorDTO {
    private UUID materialVendorId;
    private String materialVendorName;
    private String materialVendorContactPerson;
    private String materialVendorContactNumber;
    private String materialVendorEmail;
}
