
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


<@p.pages>
    <head>
        <link rel="stylesheet" type="text/css" href="/css/login.css">
    </head>
    <div class="wrapper">
        <form action="/login" method="post" class="form">
            <h2 class="text-center text-primary">Форма входу</h2>
            <hr>

            <div class="input-box">
                <input type="text" name="username" placeholder="Логін користувача" required class="form-control">
                <i class="bx bxs-user"></i>
            </div>

            <div class="input-box">
                <input type="password" name="password" placeholder="Пароль" required class="form-control">
                <i class="bx bxs-lock-alt"></i>
            </div>

            <div class="remember-forgot">
                <label><input type="checkbox" name="remember-me"> Запам'ятати мене</label>
                <a href="#">Забули пароль?</a>
            </div>

            <button type="submit" class="btn btn-success w-100 mt-3">Увійти</button>

            <div class="text-center mt-3">
                <p>Немає акаунта? <a href="/registration">Зареєструватись</a></p>
            </div>
        </form>
    </div>
</@p.pages>