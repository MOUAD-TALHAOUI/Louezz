package com.louezz.Louezz_api.Requests;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;

public record CarRequest(
        Long id,
        @NotNull(message = "100")
        @NotEmpty(message = "100")
        String model,
        @NotNull(message = "101")
        @NotEmpty(message = "101")
        String make,
        int year,
        @NotNull(message = "102")
        @NotEmpty(message = "102")
        String fuel_type,
        @NotNull(message = "103")
        @NotEmpty(message = "103")
        String carPicture,
        boolean isAvailable){ 
}
