<#import "templ_manager.ftl" as m>
<@m.pages>
<link rel="stylesheet" href="/css/manager-products.css">

<div class="manager-container">
    <h2>Управління товарами</h2>
    <!-- 1) Перелік усіх товарів -->
    <div class="card mb-4 p-4">
        <h4>Всі товари</h4>
        <div class="table-responsive mt-3">
            <table class="table table-bordered table-hover align-middle mb-0">
                <thead class="table-light">
                <tr>
                    <th>ID</th>
                    <th>Назва</th>
                    <th>Опис</th>
                    <th>Ціна</th>
                    <th>Зображення</th>
                    <th>Категорія</th>
                </tr>
                </thead>
                <tbody>
                <#if products?has_content>
                <#list products as product>
                <tr>
                    <td>${product.id}</td>
                    <td>${product.name}</td>
                    <td>${product.description}</td>
                    <td>${product.price?string["#,##0.00"]} грн</td>
                    <td>
                        <img src="${product.image}" alt="${product.name}" class="thumb-img">
                    </td>
                    <td>
                        <#if product.category??>${product.category.name}<#else>—</#if>
                    </td>
                </tr>
                </#list>
                <#else>
                <tr>
                    <td colspan="6" class="text-center py-3">Товари відсутні</td>
                </tr>
            </#if>
            </tbody>
            </table>
        </div>
    </div>

    <!-- 2) Форма додавання нового товару -->
    <div class="card mb-4 p-4">
        <h4>Додати новий товар</h4>
        <form action="/saveNewProducts" method="post" class="row g-3 mt-2">
            <div class="col-md-4">
                <label for="name" class="form-label">Назва</label>
                <input type="text" id="name" name="name" class="form-control" placeholder="Введіть назву" required>
            </div>
            <div class="col-md-4">
                <label for="description" class="form-label">Опис</label>
                <input type="text" id="description" name="description" class="form-control" placeholder="Короткий опис" required>
            </div>
            <div class="col-md-4">
                <label for="price" class="form-label">Ціна</label>
                <input type="number" id="price" name="price" class="form-control" placeholder="Вкажіть ціну" required>
            </div>
            <div class="col-md-4">
                <label for="image" class="form-label">URL зображення</label>
                <input type="text" id="image" name="image" class="form-control" placeholder="/static/images/..." required>
            </div>
            <div class="col-md-4">
                <label for="category" class="form-label">Категорія</label>
                <select id="category" name="category" class="form-select" required>
                    <#if categories?has_content>
                    <#list categories as cat>
                    <option value="${cat.id}">${cat.name}</option>
                </#list>
                <#else>
                <option disabled>Немає категорій</option>
            </#if>
            </select>
    </div>
    <div class="col-12 text-end">
        <button type="submit" class="btn btn-primary">Додати товар</button>
    </div>
    </form>
</div>

<!-- 3) Таблиця оновлення та видалення товарів -->
<div class="card mb-4 p-4">
    <h4>Оновити / Видалити товари</h4>
    <div class="table-responsive mt-3">
        <table class="table table-striped align-middle mb-0">
            <thead class="table-light">
            <tr>
                <th>Назва</th>
                <th>Опис</th>
                <th>Ціна</th>
                <th>URL зображення</th>
                <th>Категорія</th>
                <th>Оновити</th>
                <th>Видалити</th>
            </tr>
            </thead>
            <tbody>
            <#if products?has_content>
            <#list products as product>
            <tr>
                <form method="post">
                    <input type="hidden" name="id1" value="${product.id}">
                    <td>
                        <input type="text" name="name1" value="${product.name}" class="form-control form-control-sm" required>
                    </td>
                    <td>
                        <input type="text" name="description1" value="${product.description}" class="form-control form-control-sm" required>
                    </td>
                    <td>
                        <input type="number" name="price1" value="${product.price}" class="form-control form-control-sm" required>
                    </td>
                    <td>
                        <input type="text" name="image1" value="${product.image}" class="form-control form-control-sm" required>
                    </td>
                    <td>
                        <select name="categories" class="form-select form-select-sm">
                            <#list categories as cat>
                            <option value="${cat.id}"
                            <#if product.category?? && (cat.id == product.category.id)>selected</#if>>
                        ${cat.name}
                        </option>
                    </#list>
                    </select>
                    </td>
                    <td>
                        <button type="submit" formaction="/updateProduct" class="btn btn-success btn-sm">Update</button>
                    </td>
                    <td>
                        <button type="submit" formaction="/deleteProduct" class="btn btn-danger btn-sm">Delete</button>
                    </td>
                </form>
            </tr>
            </#list>
            <#else>
            <tr>
                <td colspan="7" class="text-center py-3">Товари відсутні</td>
            </tr>
        </#if>
        </tbody>
        </table>
    </div>
</div>

</div>
</@m.pages>
