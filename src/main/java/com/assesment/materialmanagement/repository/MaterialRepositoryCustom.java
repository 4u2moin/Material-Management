package com.assesment.materialmanagement.repository;

import com.assesment.materialmanagement.model.Material;
import jakarta.persistence.TypedQuery;
import org.springframework.stereotype.Repository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.*;
import org.springframework.data.domain.Pageable;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

@Repository
public class MaterialRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    public List<Material> findAllByDynamicFilters(String materialName,
                                                  String typeName,
                                                  String manufacturerName,
                                                  String vendorName,
                                                  Pageable pageable) {

        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<Material> cq = cb.createQuery(Material.class);
        Root<Material> material = cq.from(Material.class);

        List<Predicate> predicates = new ArrayList<>();

        // Only active materials
        predicates.add(cb.isTrue(material.get("isActive")));

        if (materialName != null && !materialName.isEmpty()) {
            predicates.add(cb.like(cb.lower(material.get("materialName")), "%" + materialName.toLowerCase() + "%"));
        }

        if (typeName != null && !typeName.isEmpty()) {
            Join<Object, Object> typeJoin = material.join("type", JoinType.LEFT);
            predicates.add(cb.like(cb.lower(typeJoin.get("materialTypeName")), "%" + typeName.toLowerCase() + "%"));
        }

        if (manufacturerName != null && !manufacturerName.isEmpty()) {
            Join<Object, Object> manufacturerJoin = material.join("manufacturer", JoinType.LEFT);
            predicates.add(cb.like(cb.lower(manufacturerJoin.get("materialManufacturerName")), "%" + manufacturerName.toLowerCase() + "%"));
        }

        if (vendorName != null && !vendorName.isEmpty()) {
            Join<Object, Object> vendorJoin = material.join("vendor", JoinType.LEFT);
            predicates.add(cb.like(cb.lower(vendorJoin.get("materialVendorName")), "%" + vendorName.toLowerCase() + "%"));
        }

        cq.where(predicates.toArray(new Predicate[0]));

        TypedQuery<Material> query = entityManager.createQuery(cq);

        // Apply pagination
        query.setFirstResult((int) pageable.getOffset());
        query.setMaxResults(pageable.getPageSize());

        return query.getResultList();
    }
    public List<Material> searchByKeyword(String keyword, Pageable pageable) {
        StringBuilder sb = new StringBuilder("SELECT m FROM Material m WHERE m.isActive = true");

        if (StringUtils.hasText(keyword)) {
            sb.append(" AND (")
                    .append("LOWER(m.materialName) LIKE LOWER(CONCAT('%', :keyword, '%')) ")
                    .append("OR LOWER(m.materialDesc) LIKE LOWER(CONCAT('%', :keyword, '%')) ")
                    .append("OR LOWER(m.type.materialTypeName) LIKE LOWER(CONCAT('%', :keyword, '%')) ")
                    .append("OR LOWER(m.manufacturer.materialManufacturerName) LIKE LOWER(CONCAT('%', :keyword, '%')) ")
                    .append("OR LOWER(m.vendor.materialVendorName) LIKE LOWER(CONCAT('%', :keyword, '%'))")
                    .append(")");
        }

        sb.append(" ORDER BY m.createdOn DESC");

        TypedQuery<Material> query = entityManager.createQuery(sb.toString(), Material.class);

        if (StringUtils.hasText(keyword)) {
            query.setParameter("keyword", keyword);
        }

        query.setFirstResult((int) pageable.getOffset());
        query.setMaxResults(pageable.getPageSize());

        return query.getResultList();
    }
}
