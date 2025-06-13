package ua.com.kisit.onlineshop2025.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MVCConfig implements WebMvcConfigurer {

    //метод налаштування ресурсів
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry reg) {
        reg
                .addResourceHandler("/static/**")
                .addResourceLocations("classpath:/static/");
    }
}
