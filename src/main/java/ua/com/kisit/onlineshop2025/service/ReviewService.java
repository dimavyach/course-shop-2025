package ua.com.kisit.onlineshop2025.service;

import org.springframework.stereotype.Service;
import ua.com.kisit.onlineshop2025.entity.Reviews;
import ua.com.kisit.onlineshop2025.repository.ReviewRepository;

import java.util.List;
@Service
public class ReviewService {
    private final ReviewRepository reviewRepository;

    public ReviewService(ReviewRepository reviewRepository) {
        this.reviewRepository = reviewRepository;
    }

    //отримання відгуків
    public List<Reviews> getReviewsByProductId(Long productId) {
        return reviewRepository.findByProductId(productId);
    }

    public void addReview(Reviews review) {
        reviewRepository.save(review);
    }

    public List<Reviews> findAll() {
        return reviewRepository.findAll();
    }
}
