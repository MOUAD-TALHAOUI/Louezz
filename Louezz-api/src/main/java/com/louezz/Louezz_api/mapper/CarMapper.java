package com.louezz.Louezz_api.mapper;

import com.louezz.Louezz_api.file.*;
import com.louezz.Louezz_api.Entities.Car;
import com.louezz.Louezz_api.Entities.CarTransactionHistory;
import com.louezz.Louezz_api.Requests.CarRequest;
import com.louezz.Louezz_api.Responses.BorrowedCarResponse;
import com.louezz.Louezz_api.Responses.CarResponse;

import org.springframework.stereotype.Service;

@Service
public class CarMapper {
    public Car toCar(CarRequest request) {
        return Car.builder()
                .id(request.id())
                .model(request.model())
                .make(request.make())
                .year(request.year())
                .fuel_type(request.fuel_type())
                .isAvailable(request.isAvailable())
                .build();
    }

    public CarResponse toCarResponse(Car car) {
        return CarResponse.builder()
                .id(car.getId())
                .model(car.getModel())
                .make(car.getMake())
                .year(car.getYear())
                .fuel_type(car.getFuel_type())
                .rate(car.getRate())
                .isAvailable(car.isAvailable())
                .owner(car.getOwner().fullName())
                .carPicture(FileUtils.readFileFromLocation(car.getCarPicture()))
                .build();
    }

    public BorrowedCarResponse toBorrowedCarResponse(CarTransactionHistory history) {
        return BorrowedCarResponse.builder()
                .id(history.getCar().getId())
                .model(history.getCar().getModel())
                .make(history.getCar().getMake())
                .year(history.getCar().getYear())
                .rate(history.getCar().getRate())
                .returned(history.isReturned())
                .returnApproved(history.isReturnApproved())
                .build();
    }
}
