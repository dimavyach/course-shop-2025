package ua.com.kisit.onlineshop2025.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ManagerRedirectController {

    @GetMapping({"/saveNewCategory", "/updateCategory", "/deleteCategory"})
    public String redirectCategoryActions() {
        return "redirect:/manager/categories";
    }

    @GetMapping({"/saveNewProducts", "/updateProduct", "/deleteProduct"})
    public String redirectProductActions() {
        return "redirect:/manager/products";
    }
}
