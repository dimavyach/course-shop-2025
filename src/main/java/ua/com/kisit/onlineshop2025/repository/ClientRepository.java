package ua.com.kisit.onlineshop2025.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.kisit.onlineshop2025.entity.Clients;

public interface ClientRepository extends JpaRepository<Clients, Long>
{
    Clients findByUser_Id(Long userId);
}
