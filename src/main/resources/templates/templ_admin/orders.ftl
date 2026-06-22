<#import "templ_admin.ftl" as m>
<@m.pages>
    <section class="admin-card">
        <div class="admin-card-header">
            <h2>Замовлення</h2>
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
                    <th>Клієнт</th>
                    <th>Статус</th>
                    <th>Дата</th>
                    <th>Дії</th>
                </tr>
                </thead>
                <tbody>
                <#list orders as order>
                    <tr>
                        <td>${order.id}</td>
                        <td>
                            <#if order.client??>
                                ${order.client.firstName} ${order.client.lastName}
                            <#else>
                                -
                            </#if>
                        </td>
                        <td>
                            <form id="order-status-${order.id}" action="/admin/orders/updateStatus" method="post" class="admin-inline-form">
                                <input type="hidden" name="id" value="${order.id}">
                                <select name="statusOrder" required>
                                    <#list orderStatuses as status>
                                        <option value="${status}" <#if order.statusOrder?? && order.statusOrder == status>selected</#if>>
                                            ${status}
                                        </option>
                                    </#list>
                                </select>
                            </form>
                        </td>
                        <td>${order.dateCreated?string("yyyy-MM-dd HH:mm")}</td>
                        <td class="admin-actions">
                            <button form="order-status-${order.id}" type="submit" class="btn btn-primary btn-sm">Оновити</button>
                        </td>
                    </tr>
                </#list>
                </tbody>
            </table>
        </div>
    </section>
</@m.pages>
