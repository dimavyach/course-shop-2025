package ua.com.kisit.courseshop2025.service;

import org.springframework.stereotype.Service;
import ua.com.kisit.courseshop2025.controller.UserController;
import ua.com.kisit.courseshop2025.entity.Clients;
import ua.com.kisit.courseshop2025.entity.Orders;
import ua.com.kisit.courseshop2025.repository.OrderRepository;

import java.math.BigDecimal;
import java.util.List;

@Service
public class OrderService
{
    private final OrderRepository orderRepository;
    public OrderService(OrderRepository orderRepository)
    {
        this.orderRepository = orderRepository;
    }
    public Orders save(Orders order)
    { //запис замовлення в бд
        return orderRepository.save(order);
    }
    public List<Orders> findOrdersByClient(Clients client)
    {
        return orderRepository.findAllByClient(client);
    }
    public double calculateTotalForOrder(Orders order) {
        if (order.getProductsHasOrders() == null) return 0.0;

        return order.getProductsHasOrders().stream()
                .map(p -> p.getProduct().getPrice().multiply(BigDecimal.valueOf(p.getQuantity())))
                .reduce(BigDecimal.ZERO, BigDecimal::add)
                .doubleValue();
    }




}
