package com.louezz.Louezz_api.mapper;

import org.springframework.stereotype.Service;

import com.louezz.Louezz_api.Entities.Car;
import com.louezz.Louezz_api.Entities.Feedback;
import com.louezz.Louezz_api.Requests.FeedbackRequest;
import com.louezz.Louezz_api.Responses.FeedbackResponse;

import java.util.Objects;

@Service
public class FeedbackMapper {
    public Feedback toFeedback(FeedbackRequest request) {
        return Feedback.builder()
                .note(request.note())
                .comment(request.comment())
                .car(Car.builder()
                        .id(request.carId())
                        .isAvailable(false) // Not required and has no impact :: just to satisfy lombok
                        .build()
                )
                .build();
    }

    public FeedbackResponse toFeedbackResponse(Feedback feedback, Long id) {
        return FeedbackResponse.builder()
                .note(feedback.getNote())
                .comment(feedback.getComment())
                .ownFeedback(Objects.equals(feedback.getCreatedBy(), id))
                .build();
    }
}
