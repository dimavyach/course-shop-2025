<#import "templ_admin.ftl" as m>
<@m.pages>
    <section class="admin-card">
        <div class="admin-card-header">
            <h2>Користувачі</h2>
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
                    <th>Логін</th>
                    <th>Новий пароль</th>
                    <th>Ролі</th>
                    <th>Дії</th>
                </tr>
                </thead>
                <tbody>
                <#list users as user>
                    <tr>
                        <td>${user.id}</td>
                        <td>
                            <form id="user-update-${user.id}" action="/admin/users/update" method="post" class="admin-inline-form">
                                <input type="hidden" name="id" value="${user.id}">
                                <input type="text"
                                       name="username"
                                       value="${user.username}"
                                       minlength="3"
                                       maxlength="50"
                                       pattern="[A-Za-z0-9_]+"
                                       required>
                            </form>
                        </td>
                        <td>
                            <input form="user-update-${user.id}"
                                   type="password"
                                   name="password"
                                   minlength="6"
                                   maxlength="100"
                                   placeholder="залишити без змін">
                        </td>
                        <td>
                            <#list roles as role>
                                <#assign roleChecked = false>
                                <#list user.roleset as userRole>
                                    <#if userRole.id == role.id>
                                        <#assign roleChecked = true>
                                    </#if>
                                </#list>
                                <label class="admin-role-option">
                                    <input form="user-update-${user.id}"
                                           type="checkbox"
                                           name="roleIds"
                                           value="${role.id}"
                                           <#if roleChecked>checked</#if>>
                                    <span>${role.name}</span>
                                </label>
                            </#list>
                        </td>
                        <td class="admin-actions">
                            <button form="user-update-${user.id}" type="submit" class="btn btn-primary btn-sm">Зберегти</button>
                            <form action="/admin/users/delete" method="post" class="admin-inline-form">
                                <input type="hidden" name="id" value="${user.id}">
                                <button type="submit"
                                        class="btn btn-outline-danger btn-sm"
                                        onclick="return confirm('Видалити користувача ${user.username?js_string}?')">
                                    Видалити
                                </button>
                            </form>
                            <form action="/admin/users/deleteFull" method="post" class="admin-inline-form">
                                <input type="hidden" name="id" value="${user.id}">
                                <button type="submit"
                                        class="btn btn-danger btn-sm"
                                        onclick="return confirm('Повністю видалити ${user.username?js_string}: акаунт, клієнта, адреси, замовлення, товари в замовленнях і відгуки?')">
                                    Повністю
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
