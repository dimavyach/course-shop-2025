package ua.com.kisit.onlineshop2025.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ua.com.kisit.onlineshop2025.service.ProductService;




@Controller

public class ProductController {
    //конструктор
    private final ProductService productService;

    public ProductController(ProductService productService)
    {
        this.productService = productService;
    }
    //список товарів. отримання і відображенння
    @GetMapping("/products")
    public String listProducts(Model model)
    {
        model.addAttribute("products", productService.getAllProducts());
        return "products";
    }

    //перенаправлення на відгук
    @GetMapping("/products/{id}")
    public String redirectToReviews(@PathVariable("id") Long id)
    {
        return "redirect:/product-details?productId=" + id;
    }

}