package com.louezz.Louezz_api.Repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import com.louezz.Louezz_api.Entities.Car;

public interface CarRepository extends JpaRepository<Car, Long>, JpaSpecificationExecutor<Car> {
    @Query("""
            SELECT car
            FROM Car car
            Where car.isAvailable = true
            AND car.owner.id != :userId
            """)
    Page<Car> findAllDisplayableCars(Pageable pageable, Long userId);
}
