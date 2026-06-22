package ua.com.kisit.onlineshop2025.controller;

import jakarta.validation.Valid;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import ua.com.kisit.onlineshop2025.entity.Clients;
import ua.com.kisit.onlineshop2025.entity.Roles;
import ua.com.kisit.onlineshop2025.entity.Users;
import ua.com.kisit.onlineshop2025.repository.RolesRepository;
import ua.com.kisit.onlineshop2025.service.ClientsService;
import ua.com.kisit.onlineshop2025.service.UserService;

import java.util.Collections;

@Controller
public class UserController {
    private static final String DEFAULT_USER_ROLE = "role_user";

    private final UserService userService;
    private final ClientsService clientsService;
    private final RolesRepository rolesRepository;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService,
                          ClientsService clientsService,
                          RolesRepository rolesRepository,
                          PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.clientsService = clientsService;
        this.rolesRepository = rolesRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/login")
    public String getPageLogin() {
        return "login";
    }

    @GetMapping("/registration")
    public String getPageRegistration(Model model) {
        model.addAttribute("users", new Users());
        model.addAttribute("clients", new Clients());
        return "registration";
    }

    @PostMapping("/registration")
    public String registration(@Valid @ModelAttribute("users") Users users,
                               BindingResult usersBindingResult,
                               @Valid @ModelAttribute("clients") Clients clients,
                               BindingResult clientsBindingResult) {
        normalizeRegistrationData(users, clients);

        if (!usersBindingResult.hasFieldErrors("username")
                && userService.getUserByUsername(users.getUsername())) {
            usersBindingResult.rejectValue("username", "duplicate", "Користувач із таким логіном вже існує");
        }

        if (usersBindingResult.hasErrors() || clientsBindingResult.hasErrors()) {
            return "registration";
        }

        Roles userRole = rolesRepository.findByName(DEFAULT_USER_ROLE)
                .orElseGet(() -> rolesRepository.save(new Roles(null, DEFAULT_USER_ROLE)));

        users.setPassword(passwordEncoder.encode(users.getPassword()));
        users.setRoleset(Collections.singleton(userRole));

        Users user = userService.saveNewUserToDB(users);
        clients.setUser(user);
        clientsService.saveNewClients(clients);

        return "redirect:/login";
    }

    @GetMapping("/403")
    public String get403() {
        return "e403";
    }

    private void normalizeRegistrationData(Users users, Clients clients) {
        users.setUsername(trimToEmpty(users.getUsername()));
        clients.setFirstName(trimToEmpty(clients.getFirstName()));
        clients.setLastName(trimToEmpty(clients.getLastName()));
        clients.setEmail(trimToEmpty(clients.getEmail()).toLowerCase());
        clients.setPhone(trimToEmpty(clients.getPhone()).replace(" ", ""));
    }

    private String trimToEmpty(String value) {
        return value == null ? "" : value.trim();
    }
}
