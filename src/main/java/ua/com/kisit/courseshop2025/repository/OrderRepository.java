package ua.com.kisit.courseshop2025.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.kisit.courseshop2025.entity.Clients;
import ua.com.kisit.courseshop2025.entity.Orders;
import java.util.List;

public interface OrderRepository extends JpaRepository<Orders, Long>
{
    List<Orders> findAllByClient(Clients client);
}
