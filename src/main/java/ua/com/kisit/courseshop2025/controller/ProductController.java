package ua.com.kisit.courseshop2025.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import ua.com.kisit.courseshop2025.service.ProductService;

import java.util.List;

@Controller
public class ProductController {
    //конструктор
    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    //список товарів. отримання і відображенння
    @GetMapping("/products")
    public String listProducts(Model model) {
        model.addAttribute("products", productService.getAllProducts());
        return "products";
    }


    //перенаправлення на відгук
    @GetMapping("/products/{id}")
    public String redirectToReviews(@PathVariable("id") Long id) {
        return "redirect:/reviews/product-details?productId=" + id;
    }

}











//    @GetMapping("/products/{id}")
//    public String viewProduct(@PathVariable("id") Long id, Model model) {
//        model.addAttribute("productId", id);
//        model.addAttribute("product", productService.getProductById(id));
//        return "product-details";
//    }