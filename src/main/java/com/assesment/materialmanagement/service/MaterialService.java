package com.assesment.materialmanagement.service;

import com.assesment.materialmanagement.dto.MaterialRequestDTO;
import com.assesment.materialmanagement.dto.MaterialResponseDTO;

import java.util.List;
import java.util.UUID;

public interface MaterialService {
    List<MaterialResponseDTO> getAllActiveMaterials(int page, int size);
    public List<MaterialResponseDTO> getAllActiveMaterials(int page, int size,
                                                           String materialName,
                                                           String typeName,
                                                           String manufacturerName,
                                                           String vendorName);
    MaterialResponseDTO getById(UUID id);
    MaterialResponseDTO create(MaterialRequestDTO dto, UUID createdBy);
    MaterialResponseDTO update(UUID id, MaterialRequestDTO dto, UUID updatedBy);
    void softDelete(UUID id, UUID deletedBy);
    public List<MaterialResponseDTO> searchMaterials(String keyword, int page, int size);
}
