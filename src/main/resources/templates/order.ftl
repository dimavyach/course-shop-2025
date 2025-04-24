<#import "customer/home.ftl" as p>
<@p.pages>

<link rel="stylesheet" href="/css/order.css">

<div class="order-container">
    <h2>Оформлення замовлення</h2>

    <#if cart?? && cart?size gt 0>
        <div class="cart-list">
            <#list cart as item>
                <div class="cart-item">
                    <img src="${item.product.image}" alt="${item.product.name}" class="cart-image">
                    <div class="cart-details">
                        <h4>${item.product.name}</h4>
                        <p>Ціна: ${item.product.price?string["#,##0.00"]} грн</p>
                        <p>Кількість: ${item.quantity}</p>
                        <p>Разом: ${(item.product.price * item.quantity)?string["#,##0.00"]} грн</p>
                    </div>
                </div>
            </#list>
        </div>

        <div class="cart-summary">
            <p><strong>Загальна кількість товарів:</strong> ${el}</p>
            <p><strong>Загальна сума:</strong> ${totalValue?string["#,##0.00"]} грн</p>
        </div>

        <form method="post" action="/buy" class="buy-form">
            <div class="form-section">
                <label for="delivery">Виберіть спосіб доставки:</label>
                <select name="delivery" id="delivery" required>
                    <option value="1">Самовивіз</option>
                    <option value="2">Нова Пошта</option>
                    <option value="3">Кур'єр</option>
                </select>
            </div>

            <div class="form-section">
                <label for="payment">Виберіть спосіб оплати:</label>
                <select name="payment" id="payment" required>
                    <option value="1">Готівка</option>
                    <option value="2">Карта</option>
                    <option value="3">Безготівковий розрахунок</option>
                </select>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn-confirm">Підтвердити замовлення</button>
            </div>
        </form>

    <#else>
        <p class="no-items">Кошик порожній</p>
    </#if>
</div>

</@p.pages>
