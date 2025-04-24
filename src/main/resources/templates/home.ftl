<#import "customer/home.ftl" as p>
<@p.pages>
<head>
        <link rel="stylesheet" href="/css/home.css">
</head>
    <div class="home-container">
        <section class="hero-section">
            <h1>Ласкаво просимо до нашого магазину!</h1>
            <p>Обирайте категорію, щоб знайти потрібні товари</p>
        </section>

        <h2 class="section-title">Категорії товарів</h2>

        <div class="category-grid">
            <#if categories??>
                <#list categories as category>
                    <div class="category-card">
                        <a href="/category/${category.id}">
                            <img src="${category.images}" alt="${category.name}">
                            <div class="category-info">
                                <h3>${category.name}</h3>
                                <p>${category.description}</p>
                            </div>
                        </a>
                    </div>
                </#list>
            </#if>
        </div>
    </div>
</@p.pages>
