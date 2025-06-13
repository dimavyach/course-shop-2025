package ua.com.kisit.onlineshop2025.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ua.com.kisit.onlineshop2025.entity.Products;
import ua.com.kisit.onlineshop2025.entity.Reviews;
import ua.com.kisit.onlineshop2025.service.ProductService;
import ua.com.kisit.onlineshop2025.service.ReviewService;

import java.time.format.DateTimeFormatter;
import java.util.List;

@Controller
public class ReviewController {
    //конструктор
    private final ReviewService reviewService;
    private final ProductService productService;

    public ReviewController(ReviewService reviewService, ProductService productService) {
        this.reviewService = reviewService;
        this.productService = productService;
    }

    @PostMapping("/products/{productId}/reviews")
    public String addReview(@PathVariable Long productId,
                        @ModelAttribute Reviews review) {
        //перевірка передачі productid
        if (productId == null) {
            return "redirect:/products?error=missingProductId";
        }
        //пошук товару за productid
        Products product = productService.getProductById(productId);
        if (product == null) {
            return "redirect:/products?error=productNotFound";
        }

        //привязка відгуку до товару та збереження у базу
        review.setProduct(product);
        reviewService.addReview(review);
        return "redirect:/product-details?productId=" + productId;
    }

    @GetMapping("/product-details")
    public String showProductDetails(@RequestParam(name = "productId", required = false) Long productId, Model model) {
        if (productId == null) {
            model.addAttribute("error", "Product ID is missing.");
            return "product-details";
        }

        Products product = productService.getProductById(productId);
        if (product == null) {
            model.addAttribute("error", "Product not found.");
            return "product-details";
        }

        //отримання списку відгуків за товаром, форматування дати, передача даних
        List<Reviews> reviews = reviewService.getReviewsByProductId(productId);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        for (Reviews review : reviews) {
            if (review.getCreatedAt() != null) {
                review.setFormattedDate(review.getCreatedAt().format(formatter));
            } else {
                review.setFormattedDate("Unknown date");
            }
        }

        model.addAttribute("product", product);
        model.addAttribute("reviews", reviews);
        model.addAttribute("productId", productId);
        return "product-details";
    }






















//    private final ReviewService reviewService;
//    private final ProductService productService;
//
//    public ReviewController(ReviewService reviewService, ProductService productService) {
//        this.reviewService = reviewService;
//        this.productService = productService;
//    }
//
//    @PostMapping("/add")
//    public String addReview(@ModelAttribute Reviews review, @RequestParam("productId") Long productId) {
//        if (productId == null) {
//            return "redirect:/products?error=missingProductId";
//        }
//
//        Products product = productService.getProductById(productId);
//        if (product == null) {
//            return "redirect:/products?error=productNotFound";
//        }
//
//        review.setProduct(product);
//        reviewService.addReview(review);
//        return "redirect:/products/" + productId;
//    }
//
//    @GetMapping("/product-details")
//    public String showProductDetails(@RequestParam(name = "productId", required = false) Long productId, Model model) {
//        //перевірка наявності productId
//        if (productId == null) {
//            model.addAttribute("error", "Product ID is missing.");
//            return "product-details";
//        }
//
//        //отримає продукт за айді, якщо відсутній - помилка
//        Products product = productService.getProductById(productId);
//        if (product == null) {
//            model.addAttribute("error", "Product not found.");
//            return "product-details";
//        }
//
//        //отримання списку відгуків за продуктайді
//        List<Reviews> reviews = reviewService.getReviewsByProductId(productId);
//        model.addAttribute("product", product);
//        model.addAttribute("reviews", reviews);
//        model.addAttribute("productId", productId);
//        return "product-details";
//
//
//
//    }


    //відображення у консоль
//        if (productId == null) {
//            model.addAttribute("error", "Product ID is missing.");
//            return "product-details";
//        }
//
//        Products product = productService.getProductById(productId);
//        if (product == null) {
//            model.addAttribute("error", "Product not found.");
//            return "product-details";
//        }
//        List<Reviews> reviews = reviewService.getReviewsByProductId(productId);
//        System.out.println("Found reviews: " + reviews.size());
//        for (Reviews review : reviews) {
//            System.out.println("Review by: " + review.getAuthor() + ", Content: " + review.getContent());
//        }
//
//        model.addAttribute("product", product);
//        model.addAttribute("reviews", reviews);
//        model.addAttribute("productId", productId);
//        return "product-details";
//    }


//    public String viewProduct(@PathVariable("id") Long id, Model model) {
//        Products product = productService.getProductById(id);
//        if (product == null) {
//            model.addAttribute("error", "Product not found.");
//            return "product-details";
//        }
//
//        List<Reviews> reviews = reviewService.getReviewsByProductId(id);
//        model.addAttribute("productId", id);
//        model.addAttribute("product", product);
//        model.addAttribute("reviews", reviews);
//        return "product-details";
//    }
}