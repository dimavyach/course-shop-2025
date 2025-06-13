package ua.com.kisit.onlineshop2025.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.kisit.onlineshop2025.entity.Categories;

public interface CategoryRepository extends JpaRepository<Categories, Long>
{
    Categories findByName(String name);
}
