<#import "customer/home.ftl" as p>
<@p.pages>

<link rel="stylesheet" href="/css/product-details.css?v=2">

<div class="product-details-page">
    <nav class="product-breadcrumb" aria-label="Навігація">
        <a href="/">Головна</a>
        <span>/</span>
        <a href="/category/${product.categories.id}">${product.categories.name}</a>
        <span>/</span>
        <span>${product.name}</span>
    </nav>

    <section class="product-overview">
        <div class="product-gallery">
            <div class="product-image-frame">
                <img src="${product.image?replace('/static','')}"
                     alt="${product.name}"
                     class="product-img">
            </div>
        </div>

        <div class="product-summary">
            <span class="product-category">${product.categories.name}</span>
            <h1>${product.name}</h1>
            <p class="product-description">${product.description}</p>

            <div class="product-meta">
                <div>
                    <span class="meta-label">Ціна</span>
                    <strong class="product-price">${product.price?c} грн</strong>
                </div>
                <div>
                    <span class="meta-label">Наявність</span>
                    <strong class="product-stock">готовий до замовлення</strong>
                </div>
            </div>

            <form method="post" action="/addToCart" class="purchase-panel">
                <input type="hidden" name="id" value="${product.id}">

                <label for="quantity">Кількість</label>
                <div class="purchase-row">
                    <div class="quantity-wrapper">
                        <button type="button" class="btn-quantity" onclick="decrementQuantity()" aria-label="Зменшити кількість">-</button>
                        <input type="number" id="quantity" name="quantity" value="1" min="1" max="1000">
                        <button type="button" class="btn-quantity" onclick="incrementQuantity()" aria-label="Збільшити кількість">+</button>
                    </div>

                    <button type="submit" class="product-action product-action-primary">Додати в кошик</button>
                </div>

                <a href="/category/${product.categories.id}" class="product-action product-action-secondary">Назад до категорії</a>
            </form>
        </div>
    </section>

    <section class="reviews-section">
        <div class="reviews-header">
            <div>
                <span class="section-kicker">думка покупців</span>
                <h2>Відгуки</h2>
            </div>
            <span class="reviews-count"><#if reviews??>${reviews?size}<#else>0</#if> відгуків</span>
        </div>

        <div class="reviews-layout">
            <div class="reviews-list">
                <#if reviews?? && reviews?size gt 0>
                    <#list reviews as review>
                        <#assign reviewAuthor = (review.author!"Гість")>
                        <article class="review-card">
                            <div class="review-card-header">
                                <div class="review-avatar"><#if reviewAuthor?has_content>${reviewAuthor?substring(0, 1)?upper_case}<#else>?</#if></div>
                                <div>
                                    <h3>${reviewAuthor}</h3>
                                    <p>${review.formattedDate!"Дата невідома"}</p>
                                </div>
                            </div>

                            <div class="review-stars" aria-label="Оцінка ${review.rating} з 5">
                                <#list 1..5 as star>
                                    <span class="<#if star <= review.rating>is-active</#if>">★</span>
                                </#list>
                            </div>

                            <p class="review-text">${review.content}</p>
                        </article>
                    </#list>
                <#else>
                    <div class="no-reviews">
                        <h3>Ще немає відгуків</h3>
                        <p>Будьте першим, хто поділиться враженням про цей товар.</p>
                    </div>
                </#if>
            </div>

            <aside class="review-form">
                <span class="section-kicker">оцінити товар</span>
                <h3>Залишити відгук</h3>

                <form action="/products/${product.id}/reviews" method="post">
                    <label>
                        Ваше ім'я
                        <input type="text" name="author" placeholder="Наприклад, Олександр" maxlength="60" required>
                    </label>

                    <label>
                        Коментар
                        <textarea name="content" placeholder="Що сподобалось, що варто знати іншим покупцям..." minlength="3" maxlength="1000" required></textarea>
                    </label>

                    <label>
                        Оцінка
                        <select name="rating" required>
                            <option value="5">5 - відмінно</option>
                            <option value="4">4 - добре</option>
                            <option value="3">3 - нормально</option>
                            <option value="2">2 - погано</option>
                            <option value="1">1 - жахливо</option>
                        </select>
                    </label>

                    <button type="submit" class="product-action product-action-primary">Надіслати відгук</button>
                </form>
            </aside>
        </div>
    </section>
</div>

<script>
    function incrementQuantity() {
        document.getElementById('quantity').stepUp();
    }

    function decrementQuantity() {
        const quantity = document.getElementById('quantity');
        if (Number(quantity.value) > Number(quantity.min)) {
            quantity.stepDown();
        }
    }
</script>

</@p.pages>
