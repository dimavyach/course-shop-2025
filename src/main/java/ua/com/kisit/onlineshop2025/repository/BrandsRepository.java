package ua.com.kisit.onlineshop2025.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.kisit.onlineshop2025.entity.Brands;

public interface BrandsRepository extends JpaRepository<Brands, Long>
{
    Brands findByName(String name);
}
