package com.louezz.Louezz_api.Services;


import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.louezz.Louezz_api.Common.PageResponse;
import com.louezz.Louezz_api.Entities.Car;
import com.louezz.Louezz_api.Entities.CarTransactionHistory;
import com.louezz.Louezz_api.Entities.User;
import com.louezz.Louezz_api.Exceptions.OperationNotPermittedException;
import com.louezz.Louezz_api.Repositories.CarRepository;
import com.louezz.Louezz_api.Repositories.CarTransactionHistoryRepository;
import com.louezz.Louezz_api.Requests.CarRequest;
import com.louezz.Louezz_api.Responses.BorrowedCarResponse;
import com.louezz.Louezz_api.Responses.CarResponse;
import com.louezz.Louezz_api.file.FileStorageService;
import com.louezz.Louezz_api.mapper.CarMapper;

import java.util.List;
import java.util.Objects;
import static com.louezz.Louezz_api.Sepecifications.CarSepecification.withOwnerId;



@Service
@RequiredArgsConstructor
@Transactional
public class CarService {

    private final CarRepository carRepository;
    private final CarMapper carMapper;
    private final CarTransactionHistoryRepository transactionHistoryRepository;
    private final FileStorageService fileStorageService;

    public Long save(CarRequest request, Authentication connectedUser) {
        User user = ((User) connectedUser.getPrincipal());
        Car car = carMapper.toCar(request);
        car.setOwner(user);
        return carRepository.save(car).getId();
    }

    public CarResponse findById(Long carId) {
        return carRepository.findById(carId)
                .map(carMapper::toCarResponse)
                .orElseThrow(() -> new EntityNotFoundException("No car found with ID:: " + carId));
    }

    public PageResponse<CarResponse> findAllCars(int page, int size, Authentication connectedUser) {
        User user = ((User) connectedUser.getPrincipal());
        Pageable pageable = PageRequest.of(page, size, Sort.by("createdDate").descending());
        Page<Car> cars = carRepository.findAllDisplayableCars(pageable, user.getId());
        List<CarResponse> carsResponse = cars.stream()
                .map(carMapper::toCarResponse)
                .toList();
        return new PageResponse<>(
                carsResponse,
                cars.getNumber(),
                cars.getSize(),
                cars.getTotalElements(),
                cars.getTotalPages(),
                cars.isFirst(),
                cars.isLast()
        );
    }

    public PageResponse<CarResponse> findAllCarsByOwner(int page, int size, Authentication connectedUser) {
        User user = ((User) connectedUser.getPrincipal());
        Pageable pageable = PageRequest.of(page, size, Sort.by("createdDate").descending());
        Page<Car> cars = carRepository.findAll(withOwnerId(user.getId()), pageable);
        List<CarResponse> carsResponse = cars.stream()
                .map(carMapper::toCarResponse)
                .toList();
        return new PageResponse<>(
                carsResponse,
                cars.getNumber(),
                cars.getSize(),
                cars.getTotalElements(),
                cars.getTotalPages(),
                cars.isFirst(),
                cars.isLast()
        );
    }

    public Long updateAvalibilityStatus(Long carId, Authentication connectedUser) {
        Car car = carRepository.findById(carId)
                .orElseThrow(() -> new EntityNotFoundException("No car found with ID:: " + carId));
        User user = ((User) connectedUser.getPrincipal());
        if (!Objects.equals(car.getOwner().getId(), user.getId())) {
            throw new OperationNotPermittedException("You cannot update others cars shareable status");
        }
        car.setAvailable(!car.isAvailable());
        carRepository.save(car);
        return carId;
    }

    public Long borrowCar(Long carId, Authentication connectedUser) {
        Car car = carRepository.findById(carId)
                .orElseThrow(() -> new EntityNotFoundException("No car found with ID:: " + carId));
        if (!car.isAvailable()) {
            throw new OperationNotPermittedException("The requested car cannot be borrowed since it is archived or not shareable");
        }
        User user = ((User) connectedUser.getPrincipal());
        if (Objects.equals(car.getOwner().getId(), user.getId())) {
            throw new OperationNotPermittedException("You cannot borrow your own car");
        }
        final boolean isAlreadyBorrowedByUser = transactionHistoryRepository.isAlreadyBorrowedByUser(carId, user.getId());
        if (isAlreadyBorrowedByUser) {
            throw new OperationNotPermittedException("You already borrowed this car and it is still not returned or the return is not approved by the owner");
        }

        final boolean isAlreadyBorrowedByOtherUser = transactionHistoryRepository.isAlreadyBorrowed(carId);
        if (isAlreadyBorrowedByOtherUser) {
            throw new OperationNotPermittedException("Te requested car is already borrowed");
        }

        CarTransactionHistory carTransactionHistory = CarTransactionHistory.builder()
                .user(user)
                .car(car)
                .returned(false)
                .returnApproved(false)
                .build();
        return transactionHistoryRepository.save(carTransactionHistory).getId();

    }

    public Long returnBorrowedCar(Long carId, Authentication connectedUser) {
        Car car = carRepository.findById(carId)
                .orElseThrow(() -> new EntityNotFoundException("No car found with ID:: " + carId));
        if (!car.isAvailable()) {
            throw new OperationNotPermittedException("The requested car is archived or not shareable");
        }
        User user = ((User) connectedUser.getPrincipal());
        if (Objects.equals(car.getOwner().getId(), user.getId())) {
            throw new OperationNotPermittedException("You cannot borrow or return your own car");
        }

        CarTransactionHistory carTransactionHistory = transactionHistoryRepository.findByCarIdAndUserId(carId, user.getId())
                .orElseThrow(() -> new OperationNotPermittedException("You did not borrow this car"));

        carTransactionHistory.setReturned(true);
        return transactionHistoryRepository.save(carTransactionHistory).getId();
    }

    public Long approveReturnBorrowedCar(Long carId, Authentication connectedUser) {
        Car car = carRepository.findById(carId)
                .orElseThrow(() -> new EntityNotFoundException("No car found with ID:: " + carId));
        if (car.isAvailable()) {
            throw new OperationNotPermittedException("The requested car is archived or not shareable");
        }
        User user = ((User) connectedUser.getPrincipal());
        if (!Objects.equals(car.getOwner().getId(), user.getId())) {
            throw new OperationNotPermittedException("You cannot approve the return of a car you do not own");
        }

        CarTransactionHistory carTransactionHistory = transactionHistoryRepository.findByCarIdAndOwnerId(carId, user.getId())
                .orElseThrow(() -> new OperationNotPermittedException("The car is not returned yet. You cannot approve its return"));

        carTransactionHistory.setReturnApproved(true);
        return transactionHistoryRepository.save(carTransactionHistory).getId();
    }

    public void uploadCarCoverPicture(MultipartFile file, Authentication connectedUser, Long carId) {
        Car car = carRepository.findById(carId)
                .orElseThrow(() -> new EntityNotFoundException("No car found with ID:: " + carId));
        User user = ((User) connectedUser.getPrincipal());
        var profilePicture = fileStorageService.saveFile(file, carId, user.getId());
        car.setCarPicture(profilePicture);
        carRepository.save(car);
    }

    public PageResponse<BorrowedCarResponse> findAllBorrowedCars(int page, int size, Authentication connectedUser) {
        User user = ((User) connectedUser.getPrincipal());
        Pageable pageable = PageRequest.of(page, size, Sort.by("createdDate").descending());
        Page<CarTransactionHistory> allBorrowedCars = transactionHistoryRepository.findAllBorrowedCars(pageable, user.getId());
        List<BorrowedCarResponse> carsResponse = allBorrowedCars.stream()
                .map(carMapper::toBorrowedCarResponse)
                .toList();
        return new PageResponse<>(
                carsResponse,
                allBorrowedCars.getNumber(),
                allBorrowedCars.getSize(),
                allBorrowedCars.getTotalElements(),
                allBorrowedCars.getTotalPages(),
                allBorrowedCars.isFirst(),
                allBorrowedCars.isLast()
        );
    }

    public PageResponse<BorrowedCarResponse> findAllReturnedCars(int page, int size, Authentication connectedUser) {
        User user = ((User) connectedUser.getPrincipal());
        Pageable pageable = PageRequest.of(page, size, Sort.by("createdDate").descending());
        Page<CarTransactionHistory> allBorrowedCars = transactionHistoryRepository.findAllReturnedCars(pageable, user.getId());
        List<BorrowedCarResponse> carsResponse = allBorrowedCars.stream()
                .map(carMapper::toBorrowedCarResponse)
                .toList();
        return new PageResponse<>(
                carsResponse,
                allBorrowedCars.getNumber(),
                allBorrowedCars.getSize(),
                allBorrowedCars.getTotalElements(),
                allBorrowedCars.getTotalPages(),
                allBorrowedCars.isFirst(),
                allBorrowedCars.isLast()
        );
    }
}
