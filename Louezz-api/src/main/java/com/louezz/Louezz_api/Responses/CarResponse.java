package com.louezz.Louezz_api.Responses;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CarResponse {

    private Long id;
    private String model;
    private String make;
    private int year;
    private String fuel_type;
    private String owner;
    private byte[] carPicture;
    private double rate;
    private boolean isAvailable;

}
