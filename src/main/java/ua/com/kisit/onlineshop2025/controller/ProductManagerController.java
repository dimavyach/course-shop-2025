package ua.com.kisit.onlineshop2025.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ua.com.kisit.onlineshop2025.entity.Categories;
import ua.com.kisit.onlineshop2025.entity.Products;
import ua.com.kisit.onlineshop2025.service.CategoryService;
import ua.com.kisit.onlineshop2025.service.ProductService;

import java.math.BigDecimal;
@Controller
@RequestMapping("/manager/products")
public class ProductManagerController {
    private final ProductService productService;
    private final CategoryService categoryService;

    public ProductManagerController(ProductService productService, CategoryService categoryService) {
        this.productService = productService;
        this.categoryService = categoryService;
    }


    @GetMapping
    public String productsPage(Model model) {

        model.addAttribute("products", productService.findAll());
        model.addAttribute("categories", categoryService.findAllCategories());

        return "templ_manager/products";
    }

    @PostMapping("/saveNewProducts")
    public String saveNewProducts(
            @RequestParam(name = "name") String name,
            @RequestParam(name = "description") String description,
            @RequestParam(name = "image") String image,
            @RequestParam(name = "price") double price,
            @RequestParam(name = "category") Categories category)
    {
        Products product = new Products();
        product.setName(name);
        product.setDescription(description);
        product.setImage(image);
        product.setPrice(BigDecimal.valueOf(price));
        product.setCategories(category);

        productService.save(product);

        return "redirect:/manager/products";
    }

    @PostMapping("/updateProduct")
    public String updateProduct(
            @RequestParam(name = "id1") Products product,
            @RequestParam(name = "name1") String name,
            @RequestParam(name = "description1") String description,
            @RequestParam(name = "image1") String image,
            @RequestParam(name = "price1") double price,
            @RequestParam(name = "categories") Categories category)
    {
        product.setName(name);
        product.setDescription(description);
        product.setImage(image);
        product.setPrice(BigDecimal.valueOf(price));
        product.setCategories(category);

        productService.save(product);

        return "redirect:/manager/products";
    }


    @PostMapping("/deleteProduct")
    public String deleteProduct(@RequestParam(name = "id2") Products product)
    {
        productService.delete(product);
        return "redirect:/manager/products";
    }
}
