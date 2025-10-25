package com.assesment.materialmanagement.repository;

import com.assesment.materialmanagement.model.MaterialType;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface MaterialTypeRepository extends JpaRepository<MaterialType, UUID> {
}
