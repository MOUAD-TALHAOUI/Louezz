package com.louezz.Louezz_api.Sepecifications;

import org.springframework.data.jpa.domain.Specification;

import com.louezz.Louezz_api.Entities.Car;

public class CarSepecification {
    public static Specification<Car> withOwnerId(Long ownerId) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.equal(root.get("owner").get("id"), ownerId);
    }
}
