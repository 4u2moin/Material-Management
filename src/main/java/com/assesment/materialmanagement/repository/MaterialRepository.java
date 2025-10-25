package com.assesment.materialmanagement.repository;

import com.assesment.materialmanagement.model.Material;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface MaterialRepository extends JpaRepository<Material, UUID> {
    @Query("select m from Material m where lower(m.materialName) = lower(:name) and m.isActive = true")
    Optional<Material> findActiveByNameIgnoreCase(@Param("name") String name);
    List<Material> findAllByIsActiveTrue(Pageable pageable);
    @Query("SELECT m.externalId FROM Material m WHERE m.externalId LIKE ?1% ORDER BY m.externalId DESC limit 1")
    String findLastExternalId(String prefix);
    @Query("SELECT m FROM Material m " +
            "WHERE m.isActive = true " +
            "AND (:materialName IS NULL OR LOWER(m.materialName) LIKE LOWER(CONCAT('%', :materialName, '%'))) " +
            "AND (:typeName IS NULL OR LOWER(m.type.materialTypeName) LIKE LOWER(CONCAT('%', :typeName, '%'))) " +
            "AND (:manufacturerName IS NULL OR LOWER(m.manufacturer.materialManufacturerName) LIKE LOWER(CONCAT('%', :manufacturerName, '%'))) " +
            "AND (:vendorName IS NULL OR LOWER(m.vendor.materialVendorName) LIKE LOWER(CONCAT('%', :vendorName, '%')))")
    List<Material> findAllByFilters(@Param("materialName") String materialName,
                                    @Param("typeName") String typeName,
                                    @Param("manufacturerName") String manufacturerName,
                                    @Param("vendorName") String vendorName,
                                    Pageable pageable);
}
