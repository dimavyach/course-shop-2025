<#import "templ_admin.ftl" as m>
<@m.pages>
    <h2 class="mt-4">Список користувачів</h2>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Логін</th>
            <th>Ролі</th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <td>${user.id}</td>
                <td>${user.username}</td>
                <td>
                    <#list user.roleset as role>
                        ${role.name}<#if role_has_next>, </#if>
                    </#list>
                </td>
            </tr>
        </#list>
        </tbody>
    </table>
</@m.pages>