package com.assesment.materialmanagement.service.impl;

import com.assesment.materialmanagement.adapter.MaterialAdapter;
import com.assesment.materialmanagement.dto.MaterialRequestDTO;
import com.assesment.materialmanagement.dto.MaterialResponseDTO;
import com.assesment.materialmanagement.exception.ResourceNotFoundException;
import com.assesment.materialmanagement.model.Material;
import com.assesment.materialmanagement.repository.MaterialRepository;
import com.assesment.materialmanagement.repository.MaterialRepositoryCustom;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.*;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.math.BigDecimal;
import java.time.OffsetDateTime;
import java.util.*;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

class MaterialServiceImplTest {

    @Mock
    private MaterialRepository materialRepository;

    @Mock
    private MaterialRepositoryCustom materialRepositoryCustom;

    @Mock
    private MaterialAdapter adapter;

    @InjectMocks
    private MaterialServiceImpl materialService;

    private MaterialRequestDTO requestDTO;
    private Material material;
    private MaterialResponseDTO responseDTO;
    private UUID materialId;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);

        materialId = UUID.randomUUID();

        requestDTO = new MaterialRequestDTO();
        requestDTO.setMaterialName("Cement");
        requestDTO.setMaterialRatePerPack(BigDecimal.valueOf(500));
        requestDTO.setMaterialPackSize(BigDecimal.valueOf(50));
        requestDTO.setMaterialUomId(UUID.randomUUID());
        requestDTO.setMaterialTypeId(UUID.randomUUID());
        requestDTO.setMaterialManufacturerId(UUID.randomUUID());
        requestDTO.setMaterialVendorId(UUID.randomUUID());
        requestDTO.setMaterialDesc("High quality cement");

        material = Material.builder()
                .materialId(materialId)
                .materialName("Cement")
                .materialRatePerPack(BigDecimal.valueOf(500))
                .materialPackSize(BigDecimal.valueOf(50))
                .isActive(true)
                .createdBy(UUID.randomUUID())
                .createdOn(OffsetDateTime.now())
                .updatedOn(OffsetDateTime.now())
                .build();

        responseDTO = MaterialResponseDTO.builder()
                .materialId(materialId)
                .materialName("Cement")
                .materialRatePerPack(BigDecimal.valueOf(500))
                .materialPackSize(BigDecimal.valueOf(50))
                .isActive(true)
                .build();
    }

    @Test
    void testGetAllActiveMaterials() {
        Pageable pageable = PageRequest.of(0, 10);
        when(materialRepository.findAllByIsActiveTrue(pageable)).thenReturn(List.of(material));
        when(adapter.toDto(material)).thenReturn(responseDTO);

        var result = materialService.getAllActiveMaterials(0, 10);

        assertEquals(1, result.size());
        assertEquals("Cement", result.get(0).getMaterialName());
        verify(materialRepository, times(1)).findAllByIsActiveTrue(pageable);
    }

    @Test
    void testGetAllActiveMaterialsWithFilters() {
        Pageable pageable = PageRequest.of(0, 10);
        when(materialRepositoryCustom.findAllByDynamicFilters("Cement", "type", "manufacturer", "vendor", pageable))
                .thenReturn(List.of(material));
        when(adapter.toDto(material)).thenReturn(responseDTO);

        var result = materialService.getAllActiveMaterials(0, 10, "Cement", "type", "manufacturer", "vendor");

        assertEquals(1, result.size());
        assertEquals("Cement", result.get(0).getMaterialName());
        verify(materialRepositoryCustom, times(1))
                .findAllByDynamicFilters("Cement", "type", "manufacturer", "vendor", pageable);
    }

    @Test
    void testGetById_Found() {
        when(materialRepository.findById(materialId)).thenReturn(Optional.of(material));
        when(adapter.toDto(material)).thenReturn(responseDTO);

        var result = materialService.getById(materialId);

        assertEquals("Cement", result.getMaterialName());
        verify(materialRepository, times(1)).findById(materialId);
    }

    @Test
    void testGetById_NotFound() {
        when(materialRepository.findById(materialId)).thenReturn(Optional.empty());

        assertThrows(ResourceNotFoundException.class, () -> materialService.getById(materialId));
    }

    @Test
    void testCreate_Success() {
        when(materialRepository.findActiveByNameIgnoreCase("Cement")).thenReturn(Optional.empty());
        when(adapter.toEntity(requestDTO, materialId)).thenReturn(material);
        when(materialRepository.save(material)).thenReturn(material);
        when(adapter.toDto(material)).thenReturn(responseDTO);

        var result = materialService.create(requestDTO, materialId);

        assertEquals("Cement", result.getMaterialName());
        verify(materialRepository, times(1)).save(material);
    }

    @Test
    void testCreate_DuplicateName() {
        when(materialRepository.findActiveByNameIgnoreCase("Cement")).thenReturn(Optional.of(material));

        assertThrows(IllegalArgumentException.class, () -> materialService.create(requestDTO, materialId));
    }

    @Test
    void testUpdate_Success() {
        when(materialRepository.findById(materialId)).thenReturn(Optional.of(material));
        when(materialRepository.findActiveByNameIgnoreCase("Cement")).thenReturn(Optional.of(material));
        doNothing().when(adapter).updateEntity(material, requestDTO, materialId);
        when(materialRepository.save(material)).thenReturn(material);
        when(adapter.toDto(material)).thenReturn(responseDTO);

        var result = materialService.update(materialId, requestDTO, materialId);

        assertEquals("Cement", result.getMaterialName());
    }

    @Test
    void testUpdate_NotFound() {
        when(materialRepository.findById(materialId)).thenReturn(Optional.empty());

        assertThrows(ResourceNotFoundException.class, () -> materialService.update(materialId, requestDTO, materialId));
    }

    @Test
    void testSoftDelete() {
        when(materialRepository.findById(materialId)).thenReturn(Optional.of(material));
        when(materialRepository.save(material)).thenReturn(material);

        materialService.softDelete(materialId, materialId);

        assertFalse(material.getIsActive());
        verify(materialRepository, times(1)).save(material);
    }

    @Test
    void testSoftDelete_NotFound() {
        when(materialRepository.findById(materialId)).thenReturn(Optional.empty());

        assertThrows(ResourceNotFoundException.class, () -> materialService.softDelete(materialId, materialId));
    }

    @Test
    void testSearchMaterials() {
        Pageable pageable = PageRequest.of(0, 10);
        when(materialRepositoryCustom.searchByKeyword("Cement", pageable)).thenReturn(List.of(material));
        when(adapter.toDto(material)).thenReturn(responseDTO);

        var result = materialService.searchMaterials("Cement", 0, 10);

        assertEquals(1, result.size());
        assertEquals("Cement", result.get(0).getMaterialName());
        verify(materialRepositoryCustom, times(1)).searchByKeyword("Cement", pageable);
    }
}
