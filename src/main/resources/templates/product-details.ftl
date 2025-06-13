<#import "customer/home.ftl" as p>
<@p.pages>

<link rel="stylesheet" href="/css/product-details.css">

<div class="product-container">
    <div class="product-card">
        <div class="product-image-block">
            <img src="${product.image?replace('/static','')}"
                 alt="${product.name}"
                 class="product-img"/>
        </div>

        <div class="product-info-block">
            <h2>${product.name}</h2>
            <p class="product-category">Категорія: ${product.categories.name}</p>
            <p class="product-description">${product.description}</p>
            <p class="product-price">Ціна: <strong>${product.price?c}</strong> грн</p>

            <form method="post" action="/addToCart" class="add-form">
                <input type="hidden" name="id" value="${product.id}">
                <label for="quantity">Кількість:</label>
                <div class="quantity-wrapper">
                    <button type="button" class="btn-quantity" onclick="decrementQuantity()">-</button>
                    <input type="number" id="quantity" name="quantity" value="1" min="1" max="1000">
                    <button type="button" class="btn-quantity" onclick="incrementQuantity()">+</button>
                </div>
                <button type="submit" class="btn add">Додати в кошик</button>
                <a href="/category/${product.categories.id}" class="btn back">← Назад</a>
            </form>
        </div>
    </div>

    <div class="reviews-section">
        <h3>Відгуки</h3>

        <#if reviews?? && reviews?size gt 0>
            <#list reviews as review>
                <div class="review-card">
                    <p><strong>${review.author}</strong> — <em>${review.formattedDate! "Дата невідома"}</em></p>
                    <p class="review-text">${review.content}</p>
                    <p class="review-rating">Оцінка: <strong>${review.rating}/5</strong></p>
                </div>
            </#list>
        <#else>
            <p class="no-reviews">Поки що немає відгуків. Станьте першим!</p>
        </#if>

        <div class="review-form">
            <h4>Залишити відгук</h4>
            <form action="/products/${product.id}/reviews" method="post">
                <!-- Поля вводу для відгуку -->
                <input type="text" name="author" placeholder="Ваше ім'я" required>
                <textarea name="content" placeholder="Ваш відгук..." required></textarea>
                <input type="number" name="rating" min="1" max="5" required>
                <button type="submit" class="btn submit-review">Надіслати</button>
            </form>
        </div>
    </div>
</div>

<script>
    function incrementQuantity() {
        document.getElementById('quantity').stepUp();
    }
    function decrementQuantity() {
        document.getElementById('quantity').stepDown();
    }
</script>

</@p.pages>
