<#import "customer/home.ftl" as p>
<@p.pages>

<link rel="stylesheet" href="/css/profile.css">

<div class="profile-container">
    <div class="profile-box">
        <h2>Мій профіль</h2>
        <div class="logout-button-container">
            <a href="/logout" class="btn btn-logout">Вийти з особистого кабінету</a>
        </div>
        <div class="admin-links">

            <#if isAdmin>
                <a href="/admin" class="btn btn-admin">Адмін-панель</a>
            </#if>

            <#if isManager>
                <a href="/manager/products" class="btn btn-manager">
                    Панель менеджера
                </a>
            </#if>

        </div>


        <ul class="profile-info">
            <li><strong>Ім’я:</strong> ${client.firstName!'-'}</li>
            <li><strong>Прізвище:</strong> ${client.lastName!'-'}</li>
            <li><strong>Телефон:</strong> ${client.phone!'-'}</li>
            <li><strong>Email:</strong> ${client.email!'-'}</li>
            <li><strong>Вік:</strong> ${client.age!'-'}</li>
        </ul>
    </div>

    <div class="orders-box">
        <h2>Мої замовлення</h2>

        <#if orderViews?? && (orderViews?size > 0)>
            <table class="orders-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Дата</th>
                        <th>Сума</th>
                        <th>Статус</th>
                    </tr>
                </thead>
                <tbody>
                    <#list orderViews as view>
                        <tr>
                            <td>${view.order.id}</td>
                            <td>
                                <#if view.order.dateCreated??>
                                    ${view.order.dateCreated?string("dd.MM.yyyy")}
                                <#else>-</#if>
                            </td>
                            <td>${view.total?string["#,##0.00"]} грн</td>
                            <td>${view.order.statusOrder!'-'}</td>
                        </tr>
                    </#list>
                </tbody>
            </table>
        <#else>
            <p class="no-orders">У вас ще немає замовлень.</p>
        </#if>
    </div>
</div>

</@p.pages>
