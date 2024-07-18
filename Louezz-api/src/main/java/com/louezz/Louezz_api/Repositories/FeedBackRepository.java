package com.louezz.Louezz_api.Repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.louezz.Louezz_api.Entities.Feedback;

public interface FeedBackRepository extends JpaRepository<Feedback, Long> {
    @Query("""
            SELECT feedback
            FROM Feedback  feedback
            WHERE feedback.car.id = :carId
""")
    Page<Feedback> findAllByCarId(@Param("carId") Long carId, Pageable pageable);
}
