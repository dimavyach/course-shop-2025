package ua.com.kisit.courseshop2025.dto;

import ua.com.kisit.courseshop2025.entity.Orders;

//Data Transfer Object, передача даних між шарами
public class OrderView
{
    private Orders order;
    private double total;

    public OrderView(Orders order, double total) {
        this.order = order;
        this.total = total;
    }

    public Orders getOrder() {
        return order;
    }

    public double getTotal() {
        return total;
    }
}
