<#import "templ_manager.ftl" as m>
<@m.pages>
<link rel="stylesheet" href="/css/manager-category.css">

<div class="category-list card mb-4 p-4">
    <h4>Всі категорії</h4>
    <div class="table-responsive">
        <table class="table table-bordered table-hover align-middle mb-0">
            <thead class="table-light">
            <tr>
                <th>ID</th>
                <th>Назва</th>
                <th>Опис</th>
                <th>Зображення</th>
            </tr>
            </thead>
            <tbody>
            <#if categories?has_content>
            <#list categories as c>
            <tr>
                <td>${c.id}</td>
                <td>${c.name}</td>
                <td>${c.description}</td>
                <td>
                    <img src="${c.images}" alt="${c.name}" class="img-thumbnail" style="max-width: 100px;">
                </td>
            </tr>
            </#list>
            <#else>
            <tr>
                <td colspan="4" class="text-center py-3">Категорії відсутні</td>
            </tr>
        </#if>
        </tbody>
        </table>
    </div>
</div>

<!-- Форма додавання нової категорії -->
    <div class="manager-form card mb-5 p-4">
        <h4>Додати нову категорію</h4>
        <form method="post" action="/saveNewCategory">
            <div class="row g-3">
                <div class="col-md-4">
                    <label for="name" class="form-label">Назва</label>
                    <input type="text" id="name" name="name" class="form-control" placeholder="Введіть назву" required>
                </div>
                <div class="col-md-4">
                    <label for="description" class="form-label">Опис</label>
                    <input type="text" id="description" name="description" class="form-control" placeholder="Введіть опис" required>
                </div>
                <div class="col-md-4">
                    <label for="image" class="form-label">URL зображення</label>
                    <input type="text" id="image" name="image" class="form-control" placeholder="/static/images/..." required>
                </div>
            </div>
            <div class="text-end mt-3">
                <button type="submit" class="btn btn-primary">Додати категорію</button>
            </div>
        </form>
    </div>

    <!-- Список і редагування категорій -->
    <div class="manager-table card p-4">
        <h4>Список категорій</h4>
        <div class="table-responsive mt-3">
            <table class="table table-striped table-hover align-middle">
                <thead class="table-light">
                <tr>
                    <th>ID</th>
                    <th>Назва</th>
                    <th>Опис</th>
                    <th>URL зображення</th>
                    <th>Оновити</th>
                    <th>Видалити</th>
                </tr>
                </thead>
                <tbody>
                <#if categories?has_content>
                <#list categories as category>
                <tr>
                    <form method="post">
                        <input type="hidden" name="id" value="${category.id}"/>
                        <td>${category.id}</td>
                        <td>
                            <input type="text" name="name" value="${category.name}" class="form-control form-control-sm" required>
                        </td>
                        <td>
                            <input type="text" name="description" value="${category.description}" class="form-control form-control-sm" required>
                        </td>
                        <td>
                            <input type="text" name="image" value="${category.images}" class="form-control form-control-sm" required>
                        </td>
                        <td>
                            <button type="submit" formaction="/updateCategory" class="btn btn-success btn-sm">Update</button>
                        </td>
                        <td>
                            <button type="submit" formaction="/deleteCategory" class="btn btn-danger btn-sm">Delete</button>
                        </td>
                    </form>
                </tr>
                </#list>
                <#else>
                <tr><td colspan="6" class="text-center py-3">Категорії не знайдено</td></tr>
            </#if>
            </tbody>
            </table>
        </div>
    </div>

</div>
</@m.pages>
