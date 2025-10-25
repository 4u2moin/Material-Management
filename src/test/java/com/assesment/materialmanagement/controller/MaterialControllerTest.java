package com.assesment.materialmanagement.controller;

import com.assesment.materialmanagement.dto.MaterialRequestDTO;
import com.assesment.materialmanagement.dto.MaterialResponseDTO;
import com.assesment.materialmanagement.service.MaterialService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentMatchers;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.http.ResponseEntity;

import java.math.BigDecimal;
import java.util.*;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;

class MaterialControllerTest {

    @Mock
    private MaterialService materialService;

    @InjectMocks
    private MaterialController materialController;

    private MaterialRequestDTO requestDTO;
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

        responseDTO = new MaterialResponseDTO();
        responseDTO.setMaterialId(materialId);
        responseDTO.setMaterialName(requestDTO.getMaterialName());
        responseDTO.setMaterialRatePerPack(requestDTO.getMaterialRatePerPack());
    }

    @Test
    void testGetAll() {
        List<MaterialResponseDTO> materials = List.of(responseDTO);
        when(materialService.getAllActiveMaterials(0, 10, null, null, null, null)).thenReturn(materials);

        ResponseEntity<List<MaterialResponseDTO>> response = materialController.getAll(0, 10, null, null, null, null);

        assertEquals(1, response.getBody().size());
        assertEquals(responseDTO.getMaterialName(), response.getBody().get(0).getMaterialName());
        verify(materialService, times(1)).getAllActiveMaterials(0, 10, null, null, null, null);
    }

    @Test
    void testGetById() {
        when(materialService.getById(materialId)).thenReturn(responseDTO);

        ResponseEntity<MaterialResponseDTO> response = materialController.getById(materialId);

        assertEquals(responseDTO.getMaterialName(), response.getBody().getMaterialName());
        verify(materialService, times(1)).getById(materialId);
    }

    @Test
    void testCreate() {
        when(materialService.create(ArgumentMatchers.any(MaterialRequestDTO.class), ArgumentMatchers.any(UUID.class)))
                .thenReturn(responseDTO);

        ResponseEntity<MaterialResponseDTO> response = materialController.create(requestDTO);

        assertEquals(responseDTO.getMaterialName(), response.getBody().getMaterialName());
        assertEquals(201, response.getStatusCodeValue());
        verify(materialService, times(1)).create(requestDTO, UUID.fromString("00000000-0000-0000-0000-000000000001"));
    }

    @Test
    void testUpdate() {
        when(materialService.update(ArgumentMatchers.eq(materialId), ArgumentMatchers.any(MaterialRequestDTO.class), ArgumentMatchers.any(UUID.class)))
                .thenReturn(responseDTO);

        ResponseEntity<MaterialResponseDTO> response = materialController.update(materialId, requestDTO);

        assertEquals(responseDTO.getMaterialName(), response.getBody().getMaterialName());
        verify(materialService, times(1)).update(materialId, requestDTO, UUID.fromString("00000000-0000-0000-0000-000000000002"));
    }

    @Test
    void testDelete() {
        doNothing().when(materialService).softDelete(materialId, UUID.fromString("00000000-0000-0000-0000-000000000003"));

        ResponseEntity<?> response = materialController.delete(materialId);

        assertEquals(200, response.getStatusCodeValue());
        Map<String, Object> body = (Map<String, Object>) response.getBody();
        assertEquals("Material deleted successfully", body.get("message"));
        assertEquals(materialId, body.get("materialId"));
        verify(materialService, times(1)).softDelete(materialId, UUID.fromString("00000000-0000-0000-0000-000000000003"));
    }

    @Test
    void testSearchMaterials() {
        List<MaterialResponseDTO> materials = List.of(responseDTO);
        when(materialService.searchMaterials("Cement", 0, 10)).thenReturn(materials);

        ResponseEntity<List<MaterialResponseDTO>> response = materialController.searchMaterials("Cement", 0, 10);

        assertEquals(1, response.getBody().size());
        assertEquals(responseDTO.getMaterialName(), response.getBody().get(0).getMaterialName());
        verify(materialService, times(1)).searchMaterials("Cement", 0, 10);
    }
}
