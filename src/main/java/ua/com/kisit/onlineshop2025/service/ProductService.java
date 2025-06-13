package ua.com.kisit.onlineshop2025.service;

import org.springframework.stereotype.Service;
import ua.com.kisit.onlineshop2025.entity.Categories;
import ua.com.kisit.onlineshop2025.entity.Products;
import ua.com.kisit.onlineshop2025.entity.Reviews;
import ua.com.kisit.onlineshop2025.repository.CategoryRepository;
import ua.com.kisit.onlineshop2025.repository.ProductRepository;

import java.util.List;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    public ProductService(ProductRepository productRepository)
    {
        this.productRepository = productRepository;
    }

    public List<Products> getListProductsByCategory(Categories category){
        return productRepository.findByCategories(category);
    }

    public List<Products> getAllProducts() {
        return productRepository.findAll();
    }

    public Products getProductById(Long id) {
        return productRepository.findById(id).orElse(null);
    }

    public List<Products> findAll() {
        return productRepository.findAll();
    }

    public Products save(Products product) {
        return productRepository.save(product);
    }

    public void delete(Products product) {
        productRepository.deleteById(product.getId());
    }

    public void deleteAll(Long id) {
        productRepository.deleteAll();
    }
}
