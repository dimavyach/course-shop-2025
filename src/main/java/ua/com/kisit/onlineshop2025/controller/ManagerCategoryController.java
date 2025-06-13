package ua.com.kisit.onlineshop2025.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ua.com.kisit.onlineshop2025.entity.Categories;
import ua.com.kisit.onlineshop2025.service.CategoryService;

@Controller
@RequestMapping("/manager/categories")
public class ManagerCategoryController {

    private final CategoryService categoryService;

    public ManagerCategoryController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    // Показати всі категорії у менеджерській секції

    @GetMapping
    public String getPageCategories(Model model) {
        model.addAttribute("categories", categoryService.getAllCategories());
        return "templ_manager/categories";  // ваш шаблон для списку категорій
    }

    // Збереження нової категорії
    @PostMapping("/saveNewCategory")
    public String saveNewCategory(
            @RequestParam("name") String name,
            @RequestParam("description") String description,
            @RequestParam("image") String images)
    {
        Categories category = new Categories();
        category.setName(name);
        category.setDescription(description);
        category.setImages(images);

        categoryService.saveCategory(category);
        return "redirect:/manager/categories";
    }

    // Оновлення існуючої категорії
    @PostMapping("/updateCategory")
    public String updateCategory(
            @RequestParam("id") Long id,                   // приймаємо лише ID
            @RequestParam("name") String name,
            @RequestParam("description") String description,
            @RequestParam("image") String images)
    {
        // дістати об’єкт за ID
        Categories category = categoryService.findCategoryById(id);
        // оновити його поля
        category.setName(name);
        category.setDescription(description);
        category.setImages(images);
        // зберегти
        categoryService.saveCategory(category);

        return "redirect:/manager/categories";
    }

    // Видалення категорії
    @PostMapping("/deleteCategory")
    public String deleteCategory(
            @RequestParam("id") Long id)                // теж приймаємо лише ID
    {
        categoryService.deleteCategoryById(id);
        return "redirect:/manager/categories";
    }
}
