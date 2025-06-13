package ua.com.kisit.onlineshop2025.service;

import org.springframework.stereotype.Service;
import ua.com.kisit.onlineshop2025.entity.Orders;
import ua.com.kisit.onlineshop2025.entity.Products;
import ua.com.kisit.onlineshop2025.entity.ProductsHasOrder;
import ua.com.kisit.onlineshop2025.repository.ProductHasOrderRepository;

@Service
public class ProductHasOrderService {

    private final ProductHasOrderRepository productHasOrderRepository;


    public ProductHasOrderService(ProductHasOrderRepository productHasOrderRepository) {
        this.productHasOrderRepository = productHasOrderRepository;
    }

    public void saveNewProductHasOrder(Orders order, Products product, int quantity) {
        //1 варіант створення обєкта setter
//        ProductsHasOrder productsHasOrder = new ProductsHasOrder();
//        productsHasOrder.setOrder(order);
//        productsHasOrder.setProduct(product);
//        productsHasOrder.setQuantity(quantity);
//
//        productHasOrderRepository.save(productsHasOrder);

       //2варіант створення обєкта
//        ProductsHasOrder productsHasOrder = new ProductsHasOrder(order, product, quantity);
        productHasOrderRepository.save(new ProductsHasOrder(order,product,quantity));
    }


}
