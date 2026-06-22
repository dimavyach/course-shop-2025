package ua.com.kisit.onlineshop2025.controller;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ua.com.kisit.onlineshop2025.entity.Orders;
import ua.com.kisit.onlineshop2025.entity.Roles;
import ua.com.kisit.onlineshop2025.entity.Users;
import ua.com.kisit.onlineshop2025.repository.RolesRepository;
import ua.com.kisit.onlineshop2025.service.AdminUserCleanupService;
import ua.com.kisit.onlineshop2025.service.OrderService;
import ua.com.kisit.onlineshop2025.service.ReviewService;
import ua.com.kisit.onlineshop2025.service.UserService;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@Controller
@RequestMapping("/admin")
public class AdminController {
    private static final List<String> ORDER_STATUSES = List.of(
            "Нове замовлення",
            "В обробці",
            "Очікує оплату",
            "Оплачено",
            "Відправлено",
            "Виконано",
            "Скасовано"
    );

    private final UserService userService;
    private final OrderService orderService;
    private final ReviewService reviewService;
    private final PasswordEncoder passwordEncoder;
    private final RolesRepository rolesRepository;
    private final AdminUserCleanupService adminUserCleanupService;

    public AdminController(UserService userService,
                           OrderService orderService,
                           ReviewService reviewService,
                           PasswordEncoder passwordEncoder,
                           RolesRepository rolesRepository,
                           AdminUserCleanupService adminUserCleanupService) {
        this.userService = userService;
        this.orderService = orderService;
        this.reviewService = reviewService;
        this.passwordEncoder = passwordEncoder;
        this.rolesRepository = rolesRepository;
        this.adminUserCleanupService = adminUserCleanupService;
    }

    @GetMapping
    public String adminIndex() {
        return "redirect:/admin/users";
    }

    @GetMapping("/users")
    public String users(Model model) {
        model.addAttribute("users", userService.findAll());
        model.addAttribute("roles", rolesRepository.findAll());
        return "templ_admin/users";
    }

    @GetMapping("/orders")
    public String orders(Model model) {
        model.addAttribute("orders", orderService.findAll());
        model.addAttribute("orderStatuses", ORDER_STATUSES);
        return "templ_admin/orders";
    }

    @GetMapping("/reviews")
    public String reviews(Model model) {
        model.addAttribute("reviews", reviewService.findAll());
        return "templ_admin/reviewsadmin";
    }

    @PostMapping("/users/update")
    public String updateUser(@RequestParam Long id,
                             @RequestParam String username,
                             @RequestParam(required = false) String password,
                             @RequestParam(required = false) List<Long> roleIds,
                             Authentication authentication,
                             RedirectAttributes redirectAttributes) {
        Optional<Users> optionalUser = userService.findById(id);
        if (optionalUser.isEmpty()) {
            redirectAttributes.addFlashAttribute("adminError", "Користувача не знайдено.");
            return "redirect:/admin/users";
        }

        String cleanUsername = username == null ? "" : username.trim();
        if (!cleanUsername.matches("^[A-Za-z0-9_]{3,50}$")) {
            redirectAttributes.addFlashAttribute("adminError", "Логін має містити 3-50 латинських символів, цифр або _.");
            return "redirect:/admin/users";
        }

        Users existing = userService.findByUsername(cleanUsername);
        if (existing != null && !existing.getId().equals(id)) {
            redirectAttributes.addFlashAttribute("adminError", "Такий логін вже зайнятий.");
            return "redirect:/admin/users";
        }

        if (roleIds == null || roleIds.isEmpty()) {
            redirectAttributes.addFlashAttribute("adminError", "Користувач має мати хоча б одну роль.");
            return "redirect:/admin/users";
        }

        Set<Roles> selectedRoles = new HashSet<>();
        rolesRepository.findAllById(roleIds).forEach(selectedRoles::add);
        if (selectedRoles.size() != roleIds.size()) {
            redirectAttributes.addFlashAttribute("adminError", "Одна з вибраних ролей не знайдена.");
            return "redirect:/admin/users";
        }

        Users user = optionalUser.get();
        boolean removesOwnAdminRole = authentication != null
                && user.getUsername().equals(authentication.getName())
                && selectedRoles.stream().noneMatch(role -> "role_admin".equals(role.getName()));
        if (removesOwnAdminRole) {
            redirectAttributes.addFlashAttribute("adminError", "Не можна зняти роль адміністратора зі свого акаунта.");
            return "redirect:/admin/users";
        }

        user.setUsername(cleanUsername);
        user.setRoleset(selectedRoles);
        if (password != null && !password.isBlank()) {
            if (password.length() < 6 || password.length() > 100) {
                redirectAttributes.addFlashAttribute("adminError", "Пароль має містити від 6 до 100 символів.");
                return "redirect:/admin/users";
            }
            user.setPassword(passwordEncoder.encode(password));
        }

        userService.save(user);
        redirectAttributes.addFlashAttribute("adminMessage", "Користувача оновлено.");
        return "redirect:/admin/users";
    }

    @PostMapping("/users/delete")
    public String deleteUser(@RequestParam Long id,
                             Authentication authentication,
                             RedirectAttributes redirectAttributes) {
        Optional<Users> optionalUser = userService.findById(id);
        if (optionalUser.isEmpty()) {
            redirectAttributes.addFlashAttribute("adminError", "Користувача не знайдено.");
            return "redirect:/admin/users";
        }

        Users user = optionalUser.get();
        if (authentication != null && user.getUsername().equals(authentication.getName())) {
            redirectAttributes.addFlashAttribute("adminError", "Свій акаунт не можна видалити з адмін-панелі.");
            return "redirect:/admin/users";
        }

        try {
            userService.deleteById(id);
            redirectAttributes.addFlashAttribute("adminMessage", "Користувача видалено.");
        } catch (DataIntegrityViolationException exception) {
            redirectAttributes.addFlashAttribute("adminError", "Користувача не можна видалити, бо з ним пов'язані клієнтські дані або замовлення.");
        }

        return "redirect:/admin/users";
    }

    @PostMapping("/users/deleteFull")
    public String deleteUserWithAllData(@RequestParam Long id,
                                        Authentication authentication,
                                        RedirectAttributes redirectAttributes) {
        Optional<Users> optionalUser = userService.findById(id);
        if (optionalUser.isEmpty()) {
            redirectAttributes.addFlashAttribute("adminError", "Користувача не знайдено.");
            return "redirect:/admin/users";
        }

        Users user = optionalUser.get();
        if (authentication != null && user.getUsername().equals(authentication.getName())) {
            redirectAttributes.addFlashAttribute("adminError", "Свій акаунт не можна повністю видалити з адмін-панелі.");
            return "redirect:/admin/users";
        }

        try {
            adminUserCleanupService.deleteUserWithAllData(id);
            redirectAttributes.addFlashAttribute("adminMessage", "Користувача і всі пов'язані дані видалено.");
        } catch (DataIntegrityViolationException exception) {
            redirectAttributes.addFlashAttribute("adminError", "Не вдалося повністю видалити користувача через пов'язані дані.");
        }

        return "redirect:/admin/users";
    }

    @PostMapping("/orders/updateStatus")
    public String updateOrderStatus(@RequestParam Long id,
                                    @RequestParam String statusOrder,
                                    RedirectAttributes redirectAttributes) {
        if (!ORDER_STATUSES.contains(statusOrder)) {
            redirectAttributes.addFlashAttribute("adminError", "Невідомий статус замовлення.");
            return "redirect:/admin/orders";
        }

        Optional<Orders> optionalOrder = orderService.findById(id);
        if (optionalOrder.isEmpty()) {
            redirectAttributes.addFlashAttribute("adminError", "Замовлення не знайдено.");
            return "redirect:/admin/orders";
        }

        Orders order = optionalOrder.get();
        order.setStatusOrder(statusOrder);
        orderService.save(order);
        redirectAttributes.addFlashAttribute("adminMessage", "Статус замовлення оновлено.");
        return "redirect:/admin/orders";
    }

    @PostMapping("/reviews/delete")
    public String deleteReview(@RequestParam Long id,
                               RedirectAttributes redirectAttributes) {
        try {
            reviewService.deleteById(id);
            redirectAttributes.addFlashAttribute("adminMessage", "Відгук видалено.");
        } catch (DataIntegrityViolationException exception) {
            redirectAttributes.addFlashAttribute("adminError", "Не вдалося видалити відгук.");
        }

        return "redirect:/admin/reviews";
    }
}
