package com.assesment.materialmanagement.adapter;

import com.assesment.materialmanagement.dto.*;
import com.assesment.materialmanagement.model.*;
import com.assesment.materialmanagement.repository.*;
import com.assesment.materialmanagement.exception.ResourceNotFoundException;
import com.assesment.materialmanagement.util.ExternalIdUtil;
import org.springframework.stereotype.Component;

import java.time.OffsetDateTime;
import java.util.UUID;

@Component
public class MaterialAdapter {

    private final UomRepository uomRepository;
    private final MaterialTypeRepository typeRepository;
    private final MaterialManufacturerRepository manufacturerRepository;
    private final MaterialVendorRepository vendorRepository;

    public MaterialAdapter(UomRepository uomRepository,
                           MaterialTypeRepository typeRepository,
                           MaterialManufacturerRepository manufacturerRepository,
                           MaterialVendorRepository vendorRepository) {
        this.uomRepository = uomRepository;
        this.typeRepository = typeRepository;
        this.manufacturerRepository = manufacturerRepository;
        this.vendorRepository = vendorRepository;
    }

    // Convert Request DTO to Entity
    public Material toEntity(MaterialRequestDTO dto, UUID createdBy) {
        UnitOfMeasurement uom = uomRepository.findById(dto.getMaterialUomId())
                .orElseThrow(() -> new ResourceNotFoundException("UOM not found with id: " + dto.getMaterialUomId()));

        Material material = new Material();
        material.setMaterialId(UUID.randomUUID());
        material.setExternalId(ExternalIdUtil.generateExternalId("MAT"));
        material.setMaterialName(dto.getMaterialName());
        material.setMaterialRatePerPack(dto.getMaterialRatePerPack());
        material.setMaterialPackSize(dto.getMaterialPackSize());
        material.setMaterialDesc(dto.getMaterialDesc());
        material.setUom(uom);
        material.setIsActive(true);
        material.setCreatedBy(createdBy);
        material.setUpdatedBy(createdBy);
        material.setCreatedOn(OffsetDateTime.now());
        material.setUpdatedOn(OffsetDateTime.now());

        if (dto.getMaterialTypeId() != null) {
            material.setType(typeRepository.findById(dto.getMaterialTypeId())
                    .orElseThrow(() -> new ResourceNotFoundException("MaterialType not found with id: " + dto.getMaterialTypeId())));
        }
        if (dto.getMaterialManufacturerId() != null) {
            material.setManufacturer(manufacturerRepository.findById(dto.getMaterialManufacturerId())
                    .orElseThrow(() -> new ResourceNotFoundException("Manufacturer not found with id: " + dto.getMaterialManufacturerId())));
        }
        if (dto.getMaterialVendorId() != null) {
            material.setVendor(vendorRepository.findById(dto.getMaterialVendorId())
                    .orElseThrow(() -> new ResourceNotFoundException("Vendor not found with id: " + dto.getMaterialVendorId())));
        }

        return material;
    }

    // Update Entity from DTO
    public void updateEntity(Material existing, MaterialRequestDTO dto, UUID updatedBy) {
        UnitOfMeasurement uom = uomRepository.findById(dto.getMaterialUomId())
                .orElseThrow(() -> new ResourceNotFoundException("UOM not found with id: " + dto.getMaterialUomId()));

        existing.setMaterialName(dto.getMaterialName());
        existing.setMaterialRatePerPack(dto.getMaterialRatePerPack());
        existing.setMaterialPackSize(dto.getMaterialPackSize());
        existing.setMaterialDesc(dto.getMaterialDesc());
        existing.setUom(uom);
        existing.setUpdatedBy(updatedBy);
        existing.setUpdatedOn(OffsetDateTime.now());

        if (dto.getMaterialTypeId() != null) {
            existing.setType(typeRepository.findById(dto.getMaterialTypeId()).orElse(null));
        } else {
            existing.setType(null);
        }

        if (dto.getMaterialManufacturerId() != null) {
            existing.setManufacturer(manufacturerRepository.findById(dto.getMaterialManufacturerId()).orElse(null));
        } else {
            existing.setManufacturer(null);
        }

        if (dto.getMaterialVendorId() != null) {
            existing.setVendor(vendorRepository.findById(dto.getMaterialVendorId()).orElse(null));
        } else {
            existing.setVendor(null);
        }
    }

    // Convert Entity to Response DTO
    public MaterialResponseDTO toDto(Material m) {
        MaterialResponseDTO dto = new MaterialResponseDTO();
        dto.setMaterialId(m.getMaterialId());
        dto.setExternalId(m.getExternalId());
        dto.setMaterialName(m.getMaterialName());
        dto.setMaterialRatePerPack(m.getMaterialRatePerPack());
        dto.setMaterialPackSize(m.getMaterialPackSize());
        dto.setMaterialDesc(m.getMaterialDesc());
        dto.setIsActive(m.getIsActive());
        dto.setCreatedBy(m.getCreatedBy());
        dto.setCreatedOn(m.getCreatedOn());
        dto.setUpdatedBy(m.getUpdatedBy());
        dto.setUpdatedOn(m.getUpdatedOn());

        if (m.getUom() != null) {
            UomDTO u = new UomDTO();
            u.setUomId(m.getUom().getUomId());
            u.setUomName(m.getUom().getUomName());
            u.setUomSymbol(m.getUom().getUomSymbol());
            dto.setUom(u);
        }

        if (m.getType() != null) {
            MaterialTypeDTO t = new MaterialTypeDTO();
            t.setMaterialTypeId(m.getType().getMaterialTypeId());
            t.setMaterialTypeName(m.getType().getMaterialTypeName());
            t.setMaterialTypeDesc(m.getType().getMaterialTypeDesc());
            dto.setType(t);
        }

        if (m.getManufacturer() != null) {
            ManufacturerDTO mm = new ManufacturerDTO();
            mm.setMaterialManufacturerId(m.getManufacturer().getMaterialManufacturerId());
            mm.setMaterialManufacturerName(m.getManufacturer().getMaterialManufacturerName());
            mm.setMaterialManufacturerContactPerson(m.getManufacturer().getMaterialManufacturerContactPerson());
            mm.setMaterialManufacturerContactNumber(m.getManufacturer().getMaterialManufacturerContactNumber());
            mm.setMaterialManufacturerEmail(m.getManufacturer().getMaterialManufacturerEmail());
            dto.setManufacturer(mm);
        }

        if (m.getVendor() != null) {
            VendorDTO vv = new VendorDTO();
            vv.setMaterialVendorId(m.getVendor().getMaterialVendorId());
            vv.setMaterialVendorName(m.getVendor().getMaterialVendorName());
            vv.setMaterialVendorContactPerson(m.getVendor().getMaterialVendorContactPerson());
            vv.setMaterialVendorContactNumber(m.getVendor().getMaterialVendorContactNumber());
            vv.setMaterialVendorEmail(m.getVendor().getMaterialVendorEmail());
            dto.setVendor(vv);
        }

        return dto;
    }
}
