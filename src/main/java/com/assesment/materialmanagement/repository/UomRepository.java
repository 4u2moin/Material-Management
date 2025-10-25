package com.assesment.materialmanagement.repository;

import com.assesment.materialmanagement.model.UnitOfMeasurement;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface UomRepository extends JpaRepository<UnitOfMeasurement, UUID> {
}
