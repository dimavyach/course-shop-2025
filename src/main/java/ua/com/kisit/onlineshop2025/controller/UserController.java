package ua.com.kisit.onlineshop2025.controller;

import jakarta.validation.Valid;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ua.com.kisit.onlineshop2025.entity.Clients;
import ua.com.kisit.onlineshop2025.entity.Roles;
import ua.com.kisit.onlineshop2025.entity.Users;
import ua.com.kisit.onlineshop2025.service.ClientsService;
import ua.com.kisit.onlineshop2025.service.UserService;

import java.util.Collections;

@Controller
public class UserController {
    private final UserService userService;
    private final ClientsService clientsService;
    public UserController(UserService userService, ClientsService clientsService) {
        this.userService = userService;
        this.clientsService = clientsService;
    }

    @GetMapping("/login")
    public String getPageLogin()
    {
        return "login";
    }

    @GetMapping("/registration")
    public String getPageRegistration(Model model,
                                      @RequestParam(name = "err", defaultValue = " ") String error)
    {
        model.addAttribute("users", new Users());
        model.addAttribute("clients", new Clients());
        model.addAttribute("error", error);

        return "registration";
    }
    @PostMapping("/registration")
    public String registration(@Valid Users users,
                               BindingResult bindingResult1,
                               @Valid Clients clients,
                               BindingResult bindingResult2,
                               RedirectAttributes redirectAttributes)
    {

        if (bindingResult1.hasErrors()) {
            redirectAttributes.addAttribute("err","");
            return "registration";
        }

        if (bindingResult2.hasErrors()) {
            redirectAttributes.addAttribute("err","");
            return "registration";
        }

        if(userService.getUserByUsername(users.getUsername())){
            redirectAttributes.addAttribute("err",
                    "Користувач існує у системі");
            return "/registration";
        }

        users.setPassword(new BCryptPasswordEncoder().encode(users.getPassword()));
        Users user = userService.saveNewUserToDB(users);
        clients.setUser(user);
        user.setRoleset(Collections.singleton(new Roles(1L, "role_user")));

        clientsService.saveNewClients(clients);

        return "redirect:/login";
    }
    @GetMapping("/403")
    public String get403()
    {
        return "e403";
    }
}