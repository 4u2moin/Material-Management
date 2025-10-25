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
public class ManufacturerDTO {
    private UUID materialManufacturerId;
    private String materialManufacturerName;
    private String materialManufacturerContactPerson;
    private String materialManufacturerContactNumber;
    private String materialManufacturerEmail;
}
