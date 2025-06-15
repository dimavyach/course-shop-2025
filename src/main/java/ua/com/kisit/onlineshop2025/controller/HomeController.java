package ua.com.kisit.onlineshop2025.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ua.com.kisit.onlineshop2025.service.CategoryService;

@Controller
public class HomeController
{

    private final CategoryService categoryService;

    public HomeController(CategoryService categoryService)
    {
        this.categoryService = categoryService;
    }

    @GetMapping({"/","/home"})
    public String HomePage(Model model) {
        model.addAttribute("categories", categoryService.findAllCategories());

        return "home";
    }

    @GetMapping("/delivery")
    public String DeliveryPage() {
        return "delivery";
    }


    @GetMapping("/payment")
    public String PaymentPage() {
        return "payment";
    }


    @GetMapping("/about-us")
    public String AboutUsPage(Model model) {
        return "about-us";
    }

}
