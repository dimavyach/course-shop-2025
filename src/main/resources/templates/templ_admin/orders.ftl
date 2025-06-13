<#import "templ_admin.ftl" as m>
<@m.pages>
    <h2 class="mt-4">Список замовлень</h2>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Клієнт</th>
            <th>Статус</th>
            <th>Дата</th>
        </tr>
        </thead>
        <tbody>
        <#list orders as order>
            <tr>
                <td>${order.id}</td>
                <td>${order.client.firstName} ${order.client.lastName}</td>
                <td>${order.statusOrder}</td>
                <td>${order.dateCreated?string("yyyy-MM-dd HH:mm")}</td>
            </tr>
        </#list>
        </tbody>
    </table>
</@m.pages>