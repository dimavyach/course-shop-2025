
<#import "customer/home.ftl" as p>

<#--<@p.pages>-->
<#--    <div class="login-form">-->
<#--        <h2 class="text-center text-primary">Форма аутентифікації</h2>-->
<#--        <hr>-->
<#--        <form action="/login" method="post" class="form">-->
<#--            <div class="form-group">-->
<#--                <label for="username">Логін користувача</label>-->
<#--                <input type="text" name="username" placeholder="Введіть логін користувача" id="username" class="form-control">-->
<#--            </div>-->

<#--            <div class="form-group mt-3">-->
<#--                <label for="password">Пароль</label>-->
<#--                <input type="password" name="password" id="password" placeholder="Введіть пароль" class="form-control">-->
<#--            </div>-->

<#--            <div class="text-center mt-4">-->
<#--                <button type="submit" class="btn btn-success">Увійти</button>-->
<#--            </div>-->

<#--            <div class="text-center mt-3">-->
<#--                <a href="/registration" class="btn btn-link">Перейти на сторінку реєстрації</a>-->
<#--            </div>-->
<#--        </form>-->
<#--    </div>-->
<#--</@p.pages>-->


<#import "customer/home.ftl" as p>
<@p.pages>

<link rel="stylesheet" href="/css/login.css">

<div class="login-wrapper">
    <form action="/login" method="post" class="login-form">
        <h2 class="login-title">Вхід до акаунту</h2>

        <div class="login-input-group">
            <label for="username">Логін</label>
            <input type="text" name="username" id="username" placeholder="Введіть логін" required>
        </div>

        <div class="login-input-group">
            <label for="password">Пароль</label>
            <input type="password" name="password" id="password" placeholder="Введіть пароль" required>
        </div>

        <div class="login-remember">
            <label><input type="checkbox" name="remember-me"> Запам’ятати мене</label>
            <a href="#" class="forgot-link">Забули пароль?</a>
        </div>

        <button type="submit" class="btn-login">Увійти</button>

        <p class="register-link">Ще немає акаунта? <a href="/registration">Зареєструватися</a></p>
    </form>
</div>

</@p.pages>
