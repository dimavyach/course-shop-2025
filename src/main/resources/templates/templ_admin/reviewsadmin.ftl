<#import "templ_admin.ftl" as m>
<@m.pages>
    <h2 class="mt-4">Список відгуків</h2>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Продукт</th>
            <th>Автор</th>
            <th>Рейтинг</th>
            <th>Коментар</th>
            <th>Дата</th>
        </tr>
        </thead>
        <tbody>
        <#list reviews as review>
            <tr>
                <td>${review.id}</td>
                <td>${review.product.name}</td>
                <td>${review.author}</td>
                <td>${review.rating}</td>
                <td>${review.content}</td>
                <td>${review.createdAt}</td>
            </tr>
        </#list>
        </tbody>
    </table>
</@m.pages>