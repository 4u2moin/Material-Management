package com.assesment.materialmanagement.repository;

import com.assesment.materialmanagement.model.MaterialVendor;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface MaterialVendorRepository extends JpaRepository<MaterialVendor, UUID> {
}
