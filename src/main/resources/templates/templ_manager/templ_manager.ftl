<#macro pages>
<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Панель менеджера</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/shop.css?v=4">
</head>
<body class="admin-body">

<div class="admin-layout">
    <aside class="admin-sidebar">
        <a class="admin-brand" href="/">OnlineShop</a>

        <div class="admin-nav-group">
            <p class="admin-nav-title">Менеджер</p>
            <a href="/manager/products" class="admin-nav-link">Товари</a>
            <a href="/manager/categories" class="admin-nav-link">Категорії</a>
        </div>

        <div class="admin-nav-group">
            <p class="admin-nav-title">Адміністратор</p>
            <a href="/admin/users" class="admin-nav-link">Користувачі</a>
            <a href="/admin/orders" class="admin-nav-link">Замовлення</a>
            <a href="/admin/reviews" class="admin-nav-link">Відгуки</a>
        </div>

        <div class="admin-nav-group admin-nav-bottom">
            <a href="/" class="admin-nav-link">До магазину</a>
            <a href="/profile" class="admin-nav-link">Профіль</a>
        </div>
    </aside>

    <div class="admin-main">
        <header class="admin-topbar">
            <div>
                <p class="admin-kicker">Панель керування</p>
                <h1>Менеджер</h1>
            </div>
            <a href="/admin/orders" class="btn btn-primary btn-sm">Перейти до адміна</a>
        </header>

        <main class="admin-content">
            <#nested/>
        </main>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
</body>
</html>
</#macro>
