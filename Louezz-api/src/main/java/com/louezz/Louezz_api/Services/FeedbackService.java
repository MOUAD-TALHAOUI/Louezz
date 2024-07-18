package com.louezz.Louezz_api.Services;


import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.louezz.Louezz_api.Common.PageResponse;
import com.louezz.Louezz_api.Entities.Car;
import com.louezz.Louezz_api.Entities.Feedback;
import com.louezz.Louezz_api.Entities.User;
import com.louezz.Louezz_api.Exceptions.OperationNotPermittedException;
import com.louezz.Louezz_api.Repositories.CarRepository;
import com.louezz.Louezz_api.Repositories.FeedBackRepository;
import com.louezz.Louezz_api.Requests.FeedbackRequest;
import com.louezz.Louezz_api.Responses.FeedbackResponse;
import com.louezz.Louezz_api.mapper.FeedbackMapper;

import java.util.List;
import java.util.Objects;

@Service
@RequiredArgsConstructor
public class FeedbackService {

    private final FeedBackRepository feedBackRepository;
    private final CarRepository carRepository;
    private final FeedbackMapper feedbackMapper;

    public Long save(FeedbackRequest request, Authentication connectedUser) {
        Car car = carRepository.findById(request.carId())
                .orElseThrow(() -> new EntityNotFoundException("No car found with ID:: " + request.carId()));
        if (!car.isAvailable()) {
            throw new OperationNotPermittedException("You cannot give a feedback for and archived or not shareable car");
        }
        User user = ((User) connectedUser.getPrincipal());
        if (Objects.equals(car.getOwner().getId(), user.getId())) {
            throw new OperationNotPermittedException("You cannot give feedback to your own car");
        }
        Feedback feedback = feedbackMapper.toFeedback(request);
        return feedBackRepository.save(feedback).getId();
    }

    @Transactional
    public PageResponse<FeedbackResponse> findAllFeedbacksByCar(Long carId, int page, int size, Authentication connectedUser) {
        Pageable pageable = PageRequest.of(page, size);
        User user = ((User) connectedUser.getPrincipal());
        Page<Feedback> feedbacks = feedBackRepository.findAllByCarId(carId, pageable);
        List<FeedbackResponse> feedbackResponses = feedbacks.stream()
                .map(f -> feedbackMapper.toFeedbackResponse(f, user.getId()))
                .toList();
        return new PageResponse<>(
                feedbackResponses,
                feedbacks.getNumber(),
                feedbacks.getSize(),
                feedbacks.getTotalElements(),
                feedbacks.getTotalPages(),
                feedbacks.isFirst(),
                feedbacks.isLast()
        );

    }
}
