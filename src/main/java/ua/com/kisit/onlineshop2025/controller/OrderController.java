package ua.com.kisit.onlineshop2025.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ua.com.kisit.onlineshop2025.bl.Cart;
import ua.com.kisit.onlineshop2025.bl.ItemCart;
import ua.com.kisit.onlineshop2025.dto.OrderView;
import ua.com.kisit.onlineshop2025.entity.*;
import ua.com.kisit.onlineshop2025.repository.UserRepository;
import ua.com.kisit.onlineshop2025.service.ClientsService;
import ua.com.kisit.onlineshop2025.service.OrderService;
import ua.com.kisit.onlineshop2025.service.ProductHasOrderService;
import ua.com.kisit.onlineshop2025.service.UserService;

import java.util.*;

@Controller
public class OrderController {

    private final ClientsService clientsService;
    private final ProductHasOrderService productHasOrderService;
    private final OrderService orderService;
    private final UserRepository userRepository;

    public OrderController(ClientsService clientsService, ProductHasOrderService productHasOrderService, OrderService orderService, UserRepository userRepository) {
        this.clientsService = clientsService;
        this.productHasOrderService = productHasOrderService;
        this.orderService = orderService;
        this.userRepository = userRepository;
    }

    //перевірка користувача, перевірка кошика
    @GetMapping("/order")
    public String getOrder(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        //Object user = session.getAttribute("user");
        SecurityContext context = SecurityContextHolder.getContext();
        Users user = (Users) context.getAuthentication().getPrincipal();

        if (user == null) {
            return "redirect:/login";
        }

        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            return "redirect:/";
        }

        model.addAttribute("cart", cart.getCart());
        model.addAttribute("totalValue", cart.getTotalValue());
        model.addAttribute("el", cart.getSumElInCart());

        Users user1 = userRepository.findByUsername(user.getUsername());
        model.addAttribute("client", clientsService.findById(user1.getId()) );

        return "order";
    }

    //замовлення.
    @PostMapping("/buy")
    public String getPageBuy(@RequestParam(name = "delivery") Delivery delivery,
            @RequestParam(name = "payment") Payment payment,
            HttpServletRequest request,
            RedirectAttributes redirectAttributes){
        HttpSession session = request.getSession();
        //перевірка наявності користувача
        //Object user = session.getAttribute("user");
        SecurityContext context = SecurityContextHolder.getContext();
        Users user = (Users) context.getAuthentication().getPrincipal();

        if (user == null) {
            return "redirect:/login";
        }
        //перевірка кошика
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            return "redirect:/";
        }

        Users user1 = userRepository.findByUsername(user.getUsername());
        Clients client = clientsService.findById(user1.getId());

        Orders order = new Orders();
        order.setDelivery(delivery);
        order.setPayment(payment);
        order.setClient(client);
        order.setStatusOrder("Нове замовлення");
        order.setDateCreated(new Date());

        Orders orderId = orderService.save(order);

        //звязування продукції за замовленням
        for (ItemCart el : cart.getCart())
        {
            productHasOrderService.saveNewProductHasOrder(orderId, el.getProduct(), el.getQuantity());
        }

        redirectAttributes.addAttribute("total", cart.getTotalValue());

        cart.deleteAllItemFromCart();
        cart.setSumElInCart(0);
        cart.setTotalValue(0);
        session.setAttribute("cart", cart);

        redirectAttributes.addAttribute("orderId", orderId.getId());


        return "redirect:/thank";
    }


    @GetMapping("/thank")
    public String getPageThank( @RequestParam(name = "orderId", defaultValue = "") Long orderId,
                                @RequestParam(name = "total", defaultValue = "") Double total,
                                Model model ){

        model.addAttribute("orderId", orderId);
        model.addAttribute("total", total);

        return "thank";
    }
    @GetMapping("/profile")
    public String getProfile(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Object user = session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        Clients client = clientsService.findById((Long) user);
        List<Orders> orders = orderService.findOrdersByClient(client);

        List<OrderView> orderViews = new ArrayList<>();
        for (Orders order : orders) {
            double total = orderService.calculateTotalForOrder(order);
            orderViews.add(new OrderView(order, total));
        }

        model.addAttribute("client", client);
        model.addAttribute("orderViews", orderViews);

        return "profile";
    }
}
