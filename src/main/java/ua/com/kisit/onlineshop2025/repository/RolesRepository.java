package ua.com.kisit.onlineshop2025.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.kisit.onlineshop2025.entity.Roles;

import java.util.Optional;

public interface RolesRepository extends JpaRepository<Roles, Long>
{
    Optional<Roles> findByName(String name);
}
