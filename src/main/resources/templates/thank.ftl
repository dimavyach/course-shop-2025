<#import  "customer/home.ftl" as p>

<@p.pages>
    <div class="order-confirmation">
        <h2 class="text-success text-center">Дякуємо за купівлю у інтернет-магазині!</h2>
        <hr>
        <div class="order-details text-center">
            <p><strong>Номер Вашого замовлення:</strong> <span class="order-id">${orderId}</span></p>
            <p><strong>Вартість покупки:</strong> <span class="order-total">${total}</span> грн</p>
        </div>
        <div class="text-center mt-3">
            <a href="/" class="btn btn-primary">На головну</a>
        </div>
    </div>
</@p.pages>