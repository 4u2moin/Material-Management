package com.assesment.materialmanagement.service.impl;

import com.assesment.materialmanagement.adapter.MaterialAdapter;
import com.assesment.materialmanagement.dto.*;
import com.assesment.materialmanagement.exception.ResourceNotFoundException;
import com.assesment.materialmanagement.model.Material;
import com.assesment.materialmanagement.repository.MaterialRepository;
import com.assesment.materialmanagement.repository.MaterialRepositoryCustom;
import com.assesment.materialmanagement.service.MaterialService;
import jakarta.transaction.Transactional;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@Transactional
public class MaterialServiceImpl implements MaterialService {

    private final MaterialRepository materialRepository;
    private final MaterialAdapter adapter;
    private final MaterialRepositoryCustom materialRepositoryCustom;

    public MaterialServiceImpl(MaterialRepository materialRepository, MaterialAdapter adapter, MaterialRepositoryCustom materialRepositoryCustom) {
        this.materialRepository = materialRepository;
        this.adapter = adapter;
        this.materialRepositoryCustom = materialRepositoryCustom;
    }

    @Override
    public List<MaterialResponseDTO> getAllActiveMaterials(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return materialRepository.findAllByIsActiveTrue(pageable).stream()
                .filter(Material::getIsActive)
                .map(adapter::toDto)
                .collect(Collectors.toList());
    }
    @Override
    public List<MaterialResponseDTO> getAllActiveMaterials(int page, int size,
                                                           String materialName,
                                                           String typeName,
                                                           String manufacturerName,
                                                           String vendorName) {

        Pageable pageable = PageRequest.of(page, size);

        return materialRepositoryCustom.findAllByDynamicFilters(materialName, typeName, manufacturerName, vendorName, pageable)
                .stream()
                .map(adapter::toDto)
                .collect(Collectors.toList());
    }

    @Override
    public MaterialResponseDTO getById(UUID id) {
        Material material = materialRepository.findById(id)
                .filter(Material::getIsActive)
                .orElseThrow(() -> new ResourceNotFoundException("Material not found with id: " + id));
        return adapter.toDto(material);
    }

    @Override
    public MaterialResponseDTO create(MaterialRequestDTO dto, UUID createdBy) {
        materialRepository.findActiveByNameIgnoreCase(dto.getMaterialName()).ifPresent(m -> {
            throw new IllegalArgumentException("Material with name '" + dto.getMaterialName() + "' already exists");
        });

        Material material = adapter.toEntity(dto, createdBy);
        Material saved = materialRepository.save(material);
        return adapter.toDto(saved);
    }

    @Override
    public MaterialResponseDTO update(UUID id, MaterialRequestDTO dto, UUID updatedBy) {
        Material existing = materialRepository.findById(id)
                .filter(Material::getIsActive)
                .orElseThrow(() -> new ResourceNotFoundException("Material not found with id: " + id));

        materialRepository.findActiveByNameIgnoreCase(dto.getMaterialName())
                .ifPresent(m -> {
                    if (!m.getMaterialId().equals(id)) {
                        throw new IllegalArgumentException("Material with name '" + dto.getMaterialName() + "' already exists");
                    }
                });

        adapter.updateEntity(existing, dto, updatedBy);
        Material saved = materialRepository.save(existing);
        return adapter.toDto(saved);
    }

    @Override
    public void softDelete(UUID id, UUID deletedBy) {
        Material existing = materialRepository.findById(id)
                .filter(Material::getIsActive)
                .orElseThrow(() -> new ResourceNotFoundException("Material not found with id: " + id));

        existing.setIsActive(false);
        existing.setUpdatedBy(deletedBy);
        materialRepository.save(existing);
    }
    @Override
    public List<MaterialResponseDTO> searchMaterials(String keyword, int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        List<Material> materials = materialRepositoryCustom.searchByKeyword(keyword, pageable);

        return materials.stream()
                .map(adapter::toDto)
                .collect(Collectors.toList());
    }
}
