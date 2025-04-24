<#import "customer/home.ftl" as p>
<@p.pages>

    <link rel="stylesheet" href="/css/category.css">

    <div class="category-container">
        <h2 class="section-title">${category}</h2>

        <div class="product-grid">
            <#if products??>
                <#list products as product>
                    <div class="product-card">
                        <a href="/products/${product.id}" class="product-link">
                            <img src="${product.image}" alt="${product.name}" class="product-img"/>

                            <div class="product-details">
                                <h3>${product.name}</h3>
                                <p class="product-cat">${product.categories.name}</p>
                                <p class="product-desc">${product.description}</p>
                                <p class="product-price">${product.price?c} грн</p>
                            </div>
                        </a>

                        <form method="post" action="/addToCart" class="product-form">
                            <input type="hidden" name="id" value="${product.id}"/>
                            <input type="number" name="quantity" value="1" min="1" max="1000"/>
                            <button type="submit" class="btn add">Додати в кошик</button>
                        </form>
                    </div>
                </#list>
            </#if>
        </div>
    </div>

</@p.pages>
