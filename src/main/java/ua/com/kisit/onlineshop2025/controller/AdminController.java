package ua.com.kisit.onlineshop2025.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import ua.com.kisit.onlineshop2025.service.OrderService;
import ua.com.kisit.onlineshop2025.service.ReviewService;
import ua.com.kisit.onlineshop2025.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {
    private final UserService userService;
    private final OrderService orderService;
    private final ReviewService reviewService;

    public AdminController(UserService userService,
                           OrderService orderService,
                           ReviewService reviewService) {
        this.userService = userService;
        this.orderService = orderService;
        this.reviewService = reviewService;
    }

    // Главная админ-панели, перенаправляет на список пользователей
    @GetMapping
    public String adminIndex() {
        return "redirect:/admin/users";
    }

    // Список пользователей
    @GetMapping("/users")
    public String users(Model model) {
        model.addAttribute("users", userService.findAll());
        return "templ_admin/users";
    }

    // Список заказов
    @GetMapping("/orders")
    public String orders(Model model) {
        model.addAttribute("orders", orderService.findAll());
        return "templ_admin/orders";
    }

    // Список отзывов
    @GetMapping("/reviews")
    public String reviews(Model model) {
        model.addAttribute("reviews", reviewService.findAll());
        return "templ_admin/reviewsadmin";
    }
}