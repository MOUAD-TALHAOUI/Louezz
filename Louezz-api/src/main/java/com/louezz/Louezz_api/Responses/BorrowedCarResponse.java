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
public class BorrowedCarResponse {

    private Long id;
    private String model;
    private String make;
    private int year;
    private String fuel_type;
    private double rate;
    private boolean returned;
    private boolean returnApproved;
}
