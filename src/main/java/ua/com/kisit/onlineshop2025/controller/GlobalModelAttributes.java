package ua.com.kisit.onlineshop2025.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import ua.com.kisit.onlineshop2025.bl.Cart;

@ControllerAdvice
public class GlobalModelAttributes {

    @ModelAttribute("cartItemCount")
    public int cartItemCount(HttpSession session) {
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            return 0;
        }

        return cart.getSumElInCart();
    }
}
