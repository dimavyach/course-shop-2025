package ua.com.kisit.courseshop2025.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.kisit.courseshop2025.entity.Reviews;

import java.util.List;

public interface ReviewRepository extends JpaRepository<Reviews, Long>
{
    List<Reviews> findByProductId(Long productId);
}
