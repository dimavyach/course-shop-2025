<#import "templ_admin.ftl" as m>
<@m.pages>
    <section class="admin-card">
        <div class="admin-card-header">
            <h2>Відгуки</h2>
        </div>

        <#if adminMessage??>
            <div class="admin-alert admin-alert-success">${adminMessage}</div>
        </#if>
        <#if adminError??>
            <div class="admin-alert admin-alert-error">${adminError}</div>
        </#if>

        <div class="table-responsive">
            <table class="table table-striped table-hover align-middle mb-0 admin-edit-table">
                <thead class="table-light">
                <tr>
                    <th>ID</th>
                    <th>Продукт</th>
                    <th>Автор</th>
                    <th>Рейтинг</th>
                    <th>Коментар</th>
                    <th>Дата</th>
                    <th>Дії</th>
                </tr>
                </thead>
                <tbody>
                <#list reviews as review>
                    <tr>
                        <td>${review.id}</td>
                        <td>
                            <#if review.product??>
                                ${review.product.name}
                            <#else>
                                -
                            </#if>
                        </td>
                        <td>${review.author}</td>
                        <td>${review.rating}</td>
                        <td class="admin-review-text">${review.content}</td>
                        <td>${review.createdAt}</td>
                        <td class="admin-actions">
                            <form action="/admin/reviews/delete" method="post" class="admin-inline-form">
                                <input type="hidden" name="id" value="${review.id}">
                                <button type="submit"
                                        class="btn btn-outline-danger btn-sm"
                                        onclick="return confirm('Видалити цей відгук?')">
                                    Видалити
                                </button>
                            </form>
                        </td>
                    </tr>
                </#list>
                </tbody>
            </table>
        </div>
    </section>
</@m.pages>
