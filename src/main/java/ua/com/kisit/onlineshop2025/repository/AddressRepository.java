package ua.com.kisit.onlineshop2025.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.kisit.onlineshop2025.entity.Address;
import ua.com.kisit.onlineshop2025.entity.Clients;

public interface AddressRepository extends JpaRepository<Address, Long>
{
    void deleteAllByClientes(Clients client);
}

