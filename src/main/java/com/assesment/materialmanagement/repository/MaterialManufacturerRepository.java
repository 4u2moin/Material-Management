package com.assesment.materialmanagement.repository;

import com.assesment.materialmanagement.model.MaterialManufacturer;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface MaterialManufacturerRepository extends JpaRepository<MaterialManufacturer, UUID> {
}
