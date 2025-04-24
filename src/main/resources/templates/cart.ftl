<#import "customer/home.ftl" as p>
<@p.pages>
<head>
        <link rel="stylesheet" href="/css/main.css">
</head>
    <div class="cart-container">
        <h2>Кошик</h2>

        <#if cart?has_content>
            <div class="cart-grid">
                <#list cart as item>
                    <div class="cart-item">
                        <img class="product-image" src="${item.product.image}" alt="${item.product.name}">
                        <div class="product-info">
                            <h3>${item.product.name}</h3>
                            <p>Ціна: ${item.product.price} ₴</p>
                            <p>Разом: ${item.product.price * item.quantity} ₴</p>

                            <form class="cart-form" method="post" action="/updateItemInCart">
                                <input type="number" name="quantity" value="${item.quantity}" min="1" max="100" />
                                <input type="hidden" name="id" value="${item.product.id}" />
                                <button class="btn update" type="submit">Оновити</button>
                            </form>

                            <form method="post" action="/deleteItemFromCart">
                                <input type="hidden" name="id" value="${item.product.id}" />
                                <button class="btn delete" type="submit">Видалити</button>
                            </form>
                        </div>
                    </div>
                </#list>
            </div>

            <div class="cart-summary">
                <p>Загальна кількість товарів: <strong>${el}</strong></p>
                <p><strong>Загальна сума: ${totalValue} ₴</strong></p>
                <form method="get" action="/order">
                    <button class="btn checkout" type="submit">Оформити замовлення</button>
                </form>
            </div>
        <#else>
            <div class="cart-summary">
                <p>Кошик порожній</p>
                <div style="margin-top: 1rem;">
                    <a href="/" class="btn checkout">Повернутися на головну</a>
                </div>
            </div>
        </#if>
    </div>
</@p.pages>

