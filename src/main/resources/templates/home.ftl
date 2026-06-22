<#import "customer/home.ftl" as p>
<@p.pages>

    <div class="shop-page">

        <div class="hero-banner rounded-3 p-5 mb-5">
            <h1 class="fw-bold mb-2">Ласкаво просимо до OnlineShop</h1>
            <p class="text-muted mb-0">Смартфони, планшети та аксесуари — все в одному місці</p>
        </div>

        <h2 class="fw-semibold mb-4">Категорії товарів</h2>

        <div class="category-grid">
            <#if categories??>
                <#list categories as category>
                    <a href="/category/${category.id}" class="category-card-link">
                        <div class="category-card">
                            <div class="category-img-wrapper">
                                <img src="${category.images?replace('/static','')}"
                                     class="category-img"
                                     alt="${category.name}">
                            </div>
                            <div class="category-card-body">
                                <h5 class="category-card-title">${category.name}</h5>
                                <p class="category-card-desc" title="${category.description}">${category.description}</p>
                            </div>
                        </div>
                    </a>
                </#list>
            </#if>
        </div>

    </div>

</@p.pages>
