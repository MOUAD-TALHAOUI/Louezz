package com.louezz.Louezz_api.Repositories;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.louezz.Louezz_api.Entities.CarTransactionHistory;

import java.util.Optional;

public interface CarTransactionHistoryRepository extends JpaRepository<CarTransactionHistory, Long> {
    @Query("""
            SELECT
            (COUNT (*) > 0) AS isBorrowed
            FROM CarTransactionHistory carTransactionHistory
            WHERE carTransactionHistory.user.id = :userId
            AND carTransactionHistory.car.id = :carId
            AND carTransactionHistory.returnApproved = false
            """)
    boolean isAlreadyBorrowedByUser(@Param("carId") Long carId, @Param("userId") Long userId);

    @Query("""
            SELECT
            (COUNT (*) > 0) AS isBorrowed
            FROM CarTransactionHistory carTransactionHistory
            WHERE carTransactionHistory.car.id = :carId
            AND carTransactionHistory.returnApproved = false
            """)
    boolean isAlreadyBorrowed(@Param("carId") Long carId);

    @Query("""
            SELECT transaction
            FROM CarTransactionHistory  transaction
            WHERE transaction.user.id = :userId
            AND transaction.car.id = :carId
            AND transaction.returned = false
            AND transaction.returnApproved = false
            """)
    Optional<CarTransactionHistory> findByCarIdAndUserId(@Param("carId") Long carId, @Param("userId") Long userId);

    @Query("""
            SELECT transaction
            FROM CarTransactionHistory  transaction
            WHERE transaction.car.owner.id = :userId
            AND transaction.car.id = :carId
            AND transaction.returned = true
            AND transaction.returnApproved = false
            """)
    Optional<CarTransactionHistory> findByCarIdAndOwnerId(@Param("carId") Long carId, @Param("userId") Long userId);

    @Query("""
            SELECT history
            FROM CarTransactionHistory history
            WHERE history.user.id = :userId
            """)
    Page<CarTransactionHistory> findAllBorrowedCars(Pageable pageable, Long userId);
    @Query("""
            SELECT history
            FROM CarTransactionHistory history
            WHERE history.car.owner.id = :userId
            """)
    Page<CarTransactionHistory> findAllReturnedCars(Pageable pageable, Long userId);
}