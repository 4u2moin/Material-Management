package com.assesment.materialmanagement.controller;

import com.assesment.materialmanagement.dto.MaterialRequestDTO;
import com.assesment.materialmanagement.dto.MaterialResponseDTO;
import com.assesment.materialmanagement.service.MaterialService;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.UUID;
@Tag(name = "Material API", description = "APIs for managing materials")
@RestController
@RequestMapping("/api/materials")
public class MaterialController {

    private final MaterialService materialService;

    public MaterialController(MaterialService materialService) {
        this.materialService = materialService;
    }

    @GetMapping
    public ResponseEntity<List<MaterialResponseDTO>> getAll(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(required = false) String materialName,
            @RequestParam(required = false) String typeName,
            @RequestParam(required = false) String manufacturerName,
            @RequestParam(required = false) String vendorName
    ) {
        return ResponseEntity.ok(
                materialService.getAllActiveMaterials(page, size, materialName, typeName, manufacturerName, vendorName)
        );
    }

    @GetMapping("/{id}")
    public ResponseEntity<MaterialResponseDTO> getById(@PathVariable UUID id) {
        return ResponseEntity.ok(materialService.getById(id));
    }

    @PostMapping
    public ResponseEntity<MaterialResponseDTO> create(@Valid @RequestBody MaterialRequestDTO dto) {
        //createdBy as user id is getting from header ..here use just for demo
        UUID createdBy = UUID.fromString("00000000-0000-0000-0000-000000000001");
        MaterialResponseDTO created = materialService.create(dto, createdBy);
        return new ResponseEntity<>(created, HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    public ResponseEntity<MaterialResponseDTO> update(@PathVariable UUID id, @Valid @RequestBody MaterialRequestDTO dto) {
        //updatedBy as user id is getting from header ..here use just for demo
        UUID updatedBy = UUID.fromString("00000000-0000-0000-0000-000000000002");
        return ResponseEntity.ok(materialService.update(id, dto, updatedBy));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> delete(@PathVariable UUID id) {
        //deletedBy as user id is getting from header ..here use just for demo
        UUID deletedBy = UUID.fromString("00000000-0000-0000-0000-000000000003");
        materialService.softDelete(id, deletedBy);
        return ResponseEntity.ok(Map.of("message", "Material deleted successfully", "materialId", id));
    }
    @GetMapping("/search")
    public ResponseEntity<List<MaterialResponseDTO>> searchMaterials(
            @RequestParam(required = false) String keyword,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size
    ) {
        List<MaterialResponseDTO> result = materialService.searchMaterials(keyword, page, size);
        return ResponseEntity.ok(result);
    }
}
