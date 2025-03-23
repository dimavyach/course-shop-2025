<#import "customer/home.ftl" as p>
<#import "/spring.ftl" as s>
<@p.pages>
    <head>
        <link rel="stylesheet" type="text/css" href="/css/register.css">
    </head>

    <div class="wrapper">
        <h2 class="text-center">Форма реєстрації</h2>
        <hr>

        <form method="post" action="/registration" class="form">
            <@s.bind "users"/>

            <div class="input-box">
                <label for="username">Логін</label>
                <@s.formInput "users.username" 'placeholder="Введіть ім\'я користувача" id="username" class="form-control"'/>
                <@s.showErrors "<br>"/>
            </div>

            <div class="input-box">
                <label for="password">Пароль</label>
                <@s.formInput "users.password" 'placeholder="Введіть пароль" id="password" type="password" class="form-control"'/>
                <@s.showErrors "<br>"/>
            </div>

            <@s.bind "clients"/>

            <div class="input-box">
                <label for="firstName">Ім'</label>
                <@s.formInput "clients.firstName" 'placeholder="Ваше ім\'я" id="firstName" class="form-control"'/>
                <@s.showErrors "<br>"/>
            </div>

            <div class="input-box">
                <label for="lastName">Прізвище</label>
                <@s.formInput "clients.lastName" 'placeholder="Ваше прізвище" id="lastName" class="form-control"'/>
                <@s.showErrors "<br>"/>
            </div>

            <div class="input-box">
                <label for="phone">Номер телефону</label>
                <@s.formInput "clients.phone" 'placeholder="Ваш телефон" id="phone" class="form-control"'/>
                <@s.showErrors "<br>"/>
            </div>

            <div class="input-box">
                <label for="email">Пошта</label>
                <@s.formInput "clients.email" 'placeholder="Ваш email" id="email" class="form-control"'/>
                <@s.showErrors "<br>"/>
            </div>

            <div class="input-box">
                <label for="age">Вік</label>
                <@s.formInput "clients.age" 'placeholder="Ваш вік" id="age" type="number" class="form-control"'/>
                <@s.showErrors "<br>"/>
            </div>

            <button type="submit" class="btn btn-success w-100">Зареєструватися</button>
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