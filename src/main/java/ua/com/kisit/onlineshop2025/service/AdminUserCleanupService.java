package ua.com.kisit.onlineshop2025.service;

import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;
import ua.com.kisit.onlineshop2025.entity.Clients;
import ua.com.kisit.onlineshop2025.entity.Orders;
import ua.com.kisit.onlineshop2025.entity.Users;
import ua.com.kisit.onlineshop2025.repository.AddressRepository;
import ua.com.kisit.onlineshop2025.repository.ClientRepository;
import ua.com.kisit.onlineshop2025.repository.OrderRepository;
import ua.com.kisit.onlineshop2025.repository.ProductHasOrderRepository;
import ua.com.kisit.onlineshop2025.repository.ReviewRepository;
import ua.com.kisit.onlineshop2025.repository.UserRepository;

import java.util.List;

@Service
public class AdminUserCleanupService {
    private final UserRepository userRepository;
    private final ClientRepository clientRepository;
    private final OrderRepository orderRepository;
    private final ProductHasOrderRepository productHasOrderRepository;
    private final AddressRepository addressRepository;
    private final ReviewRepository reviewRepository;

    public AdminUserCleanupService(UserRepository userRepository,
                                   ClientRepository clientRepository,
                                   OrderRepository orderRepository,
                                   ProductHasOrderRepository productHasOrderRepository,
                                   AddressRepository addressRepository,
                                   ReviewRepository reviewRepository) {
        this.userRepository = userRepository;
        this.clientRepository = clientRepository;
        this.orderRepository = orderRepository;
        this.productHasOrderRepository = productHasOrderRepository;
        this.addressRepository = addressRepository;
        this.reviewRepository = reviewRepository;
    }

    @Transactional
    public boolean deleteUserWithAllData(Long userId) {
        return userRepository.findById(userId)
                .map(user -> {
                    deleteReviewsByAuthor(user);
                    deleteClientData(user);
                    deleteUserAccount(user);
                    return true;
                })
                .orElse(false);
    }

    private void deleteReviewsByAuthor(Users user) {
        reviewRepository.deleteAllByAuthor(user.getUsername());
    }

    private void deleteClientData(Users user) {
        Clients client = clientRepository.findByUser_Id(user.getId());
        if (client == null) {
            return;
        }

        List<Orders> orders = orderRepository.findAllByClient(client);
        for (Orders order : orders) {
            productHasOrderRepository.deleteAllByOrder(order);
        }
        orderRepository.deleteAll(orders);

        addressRepository.deleteAllByClientes(client);
        clientRepository.delete(client);
    }

    private void deleteUserAccount(Users user) {
        user.getRoleset().clear();
        userRepository.saveAndFlush(user);
        userRepository.delete(user);
    }
}
