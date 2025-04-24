<#import "customer/home.ftl" as p>
<#import "/spring.ftl" as s>

<@p.pages>

<link rel="stylesheet" href="/css/register.css">

<div class="register-wrapper">
    <form method="post" action="/registration" class="register-form">
        <h2 class="register-title">Реєстрація нового користувача</h2>

        <@s.bind "users"/>
        <div class="form-group">
            <label for="username">Логін</label>
            <@s.formInput "users.username" 'placeholder="Введіть логін" id="username"'/>
            <@s.showErrors "<div class='error'>${error}</div>"/>
        </div>

        <div class="form-group">
            <label for="password">Пароль</label>
            <@s.formInput "users.password" 'placeholder="Введіть пароль" id="password" type="password"'/>
            <@s.showErrors "<div class='error'>${error}</div>"/>
        </div>

        <@s.bind "clients"/>
        <div class="form-group">
            <label for="firstName">Ім’я</label>
            <@s.formInput "clients.firstName" 'placeholder="Ваше ім\'я" id="firstName"'/>
            <@s.showErrors "<div class='error'>${error}</div>"/>
        </div>

        <div class="form-group">
            <label for="lastName">Прізвище</label>
            <@s.formInput "clients.lastName" 'placeholder="Ваше прізвище" id="lastName"'/>
            <@s.showErrors "<div class='error'>${error}</div>"/>
        </div>

        <div class="form-group">
            <label for="phone">Телефон</label>
            <@s.formInput "clients.phone" 'placeholder="Ваш телефон" id="phone"'/>
            <@s.showErrors "<div class='error'>${error}</div>"/>
        </div>

        <div class="form-group">
            <label for="email">Електронна пошта</label>
            <@s.formInput "clients.email" 'placeholder="Ваш email" id="email"'/>
            <@s.showErrors "<div class='error'>${error}</div>"/>
        </div>

        <div class="form-group">
            <label for="age">Вік</label>
            <@s.formInput "clients.age" 'placeholder="Ваш вік" id="age" type="number"'/>
            <@s.showErrors "<div class='error'>${error}</div>"/>
        </div>

        <button type="submit" class="btn-register">Зареєструватися</button>
    </form>
</div>

</@p.pages>


<#--<@p.pages>-->

<#--<h3> Форма реєстрації нового користувача </h3>-->

<#--<form method="post" action="/registration">-->

<#--    <@s.bind "users"/>-->



<#--    <label for="username">Username</label><br>-->
<#--    <@s.formInput "users.username" 'placeholder="username" id="username"'/><br>-->
<#--    <@s.showErrors "<br>"/>-->
<#--    <#if error??>${error}</#if>-->

<#--    <br>-->

<#--    <label for="password">Password</label><br>-->
<#--    <@s.formInput "users.password" 'placeholder="password" id="password"'/><br>-->
<#--    <@s.showErrors "<br>"/>-->
<#--    <br>-->

<#--    <@s.bind "clients"/>-->

<#--    <label for="firstName">First Name</label><br>-->
<#--    <@s.formInput "clients.firstName" 'placeholder="firstName" id="firstName"'/><br>-->
<#--    <@s.showErrors "<br>"/>-->
<#--    <br>-->

<#--    <label for="lastName">Last Name</label><br>-->
<#--    <@s.formInput "clients.lastName" 'placeholder="lastName" id="lastName"'/><br>-->
<#--    <@s.showErrors "<br>"/>-->
<#--    <br>-->

<#--    <label for="phone">Phone</label><br>-->
<#--    <@s.formInput "clients.phone" 'placeholder="phone" id="phone"'/><br>-->
<#--    <@s.showErrors "<br>"/>-->
<#--    <br>-->

<#--    <label for="email">Email</label><br>-->
<#--    <@s.formInput "clients.email" 'placeholder="email" id="email"'/><br>-->
<#--    <@s.showErrors "<br>"/>-->
<#--    <br>-->

<#--    <label for="age">Age</label><br>-->
<#--    <@s.formInput "clients.age" 'placeholder="age" id="age" type="number"'/><br>-->
<#--    <@s.showErrors "<br>"/>-->
<#--    <br>-->


<#--    <input type="submit" value="Add New User">-->

<#--</form>-->

<#--</@p.pages>-->