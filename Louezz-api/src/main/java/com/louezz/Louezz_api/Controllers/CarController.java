package com.louezz.Louezz_api.Controllers;


import com.louezz.Louezz_api.Common.PageResponse;
import com.louezz.Louezz_api.Requests.CarRequest;
import com.louezz.Louezz_api.Responses.BorrowedCarResponse;
import com.louezz.Louezz_api.Responses.CarResponse;
import com.louezz.Louezz_api.Services.CarService;

import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("cars")
@RequiredArgsConstructor
@Tag(name = "Car")
public class CarController {

    private final CarService service;

    @PostMapping
    public ResponseEntity<Long> saveCar(
            @Valid @RequestBody CarRequest request,
            Authentication connectedUser
    ) {
        return ResponseEntity.ok(service.save(request, connectedUser));
    }

    @GetMapping("/{car-id}")
    public ResponseEntity<CarResponse> findCarById(
            @PathVariable("car-id") Long carId
    ) {
        return ResponseEntity.ok(service.findById(carId));
    }

    @GetMapping
    public ResponseEntity<PageResponse<CarResponse>> findAllCars(
            @RequestParam(name = "page", defaultValue = "0", required = false) int page,
            @RequestParam(name = "size", defaultValue = "10", required = false) int size,
            Authentication connectedUser
    ) {
        return ResponseEntity.ok(service.findAllCars(page, size, connectedUser));
    }

    @GetMapping("/owner")
    public ResponseEntity<PageResponse<CarResponse>> findAllCarsByOwner(
            @RequestParam(name = "page", defaultValue = "0", required = false) int page,
            @RequestParam(name = "size", defaultValue = "10", required = false) int size,
            Authentication connectedUser
    ) {
        return ResponseEntity.ok(service.findAllCarsByOwner(page, size, connectedUser));
    }

    @GetMapping("/borrowed")
    public ResponseEntity<PageResponse<BorrowedCarResponse>> findAllBorrowedCars(
            @RequestParam(name = "page", defaultValue = "0", required = false) int page,
            @RequestParam(name = "size", defaultValue = "10", required = false) int size,
            Authentication connectedUser
    ) {
        return ResponseEntity.ok(service.findAllBorrowedCars(page, size, connectedUser));
    }

    @GetMapping("/returned")
    public ResponseEntity<PageResponse<BorrowedCarResponse>> findAllReturnedCars(
            @RequestParam(name = "page", defaultValue = "0", required = false) int page,
            @RequestParam(name = "size", defaultValue = "10", required = false) int size,
            Authentication connectedUser
    ) {
        return ResponseEntity.ok(service.findAllReturnedCars(page, size, connectedUser));
    }

    @PatchMapping("/avalaible/{car-id}")
    public ResponseEntity<Long> updateAvailibilityStatus(
            @PathVariable("car-id") Long carId,
            Authentication connectedUser
    ) {
        return ResponseEntity.ok(service.updateAvalibilityStatus(carId, connectedUser));
    }



    @PostMapping("borrow/{car-id}")
    public ResponseEntity<Long> borrowCar(
            @PathVariable("car-id") Long carId,
            Authentication connectedUser
    ) {
        return ResponseEntity.ok(service.borrowCar(carId, connectedUser));
    }

    @PatchMapping("borrow/return/{car-id}")
    public ResponseEntity<Long> returnBorrowCar(
            @PathVariable("car-id") Long carId,
            Authentication connectedUser
    ) {
        return ResponseEntity.ok(service.returnBorrowedCar(carId, connectedUser));
    }

    @PatchMapping("borrow/return/approve/{car-id}")
    public ResponseEntity<Long> approveReturnBorrowCar(
            @PathVariable("car-id") Long carId,
            Authentication connectedUser
    ) {
        return ResponseEntity.ok(service.approveReturnBorrowedCar(carId, connectedUser));
    }

    @PostMapping(value = "/cover/{car-id}", consumes = "multipart/form-data")
    public ResponseEntity<?> uploadCarCoverPicture(
            @PathVariable("car-id") Long carId,
            @Parameter()
            @RequestPart("file") MultipartFile file,
            Authentication connectedUser
    ) {
        service.uploadCarCoverPicture(file, connectedUser, carId);
        return ResponseEntity.accepted().build();
    }
}
