<#import "customer/home.ftl" as p>
<#import "/spring.ftl" as s>

<@p.pages>
<div class="register-wrapper">
    <section class="register-panel">
        <div class="register-intro">
            <span class="register-kicker">новий акаунт</span>
            <h1>Створіть профіль покупця</h1>
            <p>Після реєстрації ви зможете швидше оформлювати замовлення, бачити свої дані профілю та користуватися кошиком без зайвих кроків.</p>
        </div>

        <form method="post" action="/registration" class="register-form" novalidate>
            <div class="register-form-header">
                <h2>Реєстрація</h2>
                <p>Усі поля обов'язкові для заповнення.</p>
            </div>

            <@s.bind "users.username"/>
            <div class="form-group">
                <label for="username">Логін</label>
                <@s.formInput "users.username" 'placeholder="Наприклад user_2025" id="username" required minlength="3" maxlength="50" autocomplete="username" data-rule="login"'/>
                <span class="field-hint">3-50 символів: латинські літери, цифри або _</span>
                <span class="field-live-message" data-message-for="username"></span>
                <@s.showErrors "<br>" "error"/>
            </div>

            <@s.bind "users.password"/>
            <div class="form-group">
                <label for="password">Пароль</label>
                <@s.formInput "users.password" 'placeholder="Мінімум 6 символів" id="password" type="password" required minlength="6" maxlength="100" autocomplete="new-password" data-rule="password"'/>
                <div class="password-strength" aria-hidden="true">
                    <span></span>
                </div>
                <div class="password-strength-text" id="passwordStrengthText">Надійність пароля: не вказано</div>
                <span class="field-hint">Краще використати великі й малі літери, цифри та символи.</span>
                <span class="field-live-message" data-message-for="password"></span>
                <@s.showErrors "<br>" "error"/>
            </div>

            <div class="register-fields-grid">
                <@s.bind "clients.firstName"/>
                <div class="form-group">
                    <label for="firstName">Ім'я</label>
                    <@s.formInput "clients.firstName" 'placeholder="Ваше ім’я" id="firstName" required minlength="2" maxlength="50" autocomplete="given-name" data-rule="name"'/>
                    <span class="field-live-message" data-message-for="firstName"></span>
                    <@s.showErrors "<br>" "error"/>
                </div>

                <@s.bind "clients.lastName"/>
                <div class="form-group">
                    <label for="lastName">Прізвище</label>
                    <@s.formInput "clients.lastName" 'placeholder="Ваше прізвище" id="lastName" required minlength="2" maxlength="50" autocomplete="family-name" data-rule="name"'/>
                    <span class="field-live-message" data-message-for="lastName"></span>
                    <@s.showErrors "<br>" "error"/>
                </div>
            </div>

            <@s.bind "clients.phone"/>
            <div class="form-group">
                <label for="phone">Телефон</label>
                <@s.formInput "clients.phone" 'placeholder="+380XXXXXXXXX" id="phone" required autocomplete="tel" inputmode="tel" data-rule="phone"'/>
                <span class="field-hint">10-15 цифр, можна з + на початку.</span>
                <span class="field-live-message" data-message-for="phone"></span>
                <@s.showErrors "<br>" "error"/>
            </div>

            <@s.bind "clients.email"/>
            <div class="form-group">
                <label for="email">Електронна пошта</label>
                <@s.formInput "clients.email" 'placeholder="name@example.com" id="email" type="email" required maxlength="100" autocomplete="email" inputmode="email" data-rule="email"'/>
                <span class="field-hint">Обов'язково має бути @ і домен, наприклад gmail.com.</span>
                <span class="field-live-message" data-message-for="email"></span>
                <@s.showErrors "<br>" "error"/>
            </div>

            <@s.bind "clients.age"/>
            <div class="form-group">
                <label for="age">Вік</label>
                <@s.formInput "clients.age" 'placeholder="Ваш вік" id="age" type="number" required min="14" max="120" inputmode="numeric" data-rule="age"'/>
                <span class="field-live-message" data-message-for="age"></span>
                <@s.showErrors "<br>" "error"/>
            </div>

            <button type="submit" class="btn-register">Зареєструватися</button>
            <p class="register-login-link">Вже є акаунт? <a href="/login">Увійти</a></p>
        </form>
    </section>
</div>

<script>
    const fieldPatterns = {
        username: "[A-Za-z0-9_]{3,50}",
        firstName: "[A-Za-zА-Яа-яІіЇїЄєҐґ '-]{2,50}",
        lastName: "[A-Za-zА-Яа-яІіЇїЄєҐґ '-]{2,50}",
        phone: "\\+?[0-9]{10,15}",
        email: "^[^\\s@]+@[^\\s@]+\\.[^\\s@]{2,}$"
    };

    Object.entries(fieldPatterns).forEach(([id, pattern]) => {
        const input = document.getElementById(id);
        if (input) {
            input.setAttribute("pattern", pattern);
        }
    });

    const validationMessages = {
        login: {
            valid: "Логін виглядає коректно.",
            invalid: "Логін: 3-50 латинських символів, цифр або _."
        },
        password: {
            valid: "Пароль підходить.",
            invalid: "Пароль має містити мінімум 6 символів."
        },
        name: {
            valid: "Поле заповнено коректно.",
            invalid: "Використовуйте літери, пробіл, дефіс або апостроф."
        },
        phone: {
            valid: "Телефон виглядає коректно.",
            invalid: "Вкажіть 10-15 цифр, можна з + на початку."
        },
        email: {
            valid: "Пошта виглядає коректно.",
            invalid: "Пошта має містити @ і домен, наприклад name@example.com."
        },
        age: {
            valid: "Вік підходить.",
            invalid: "Вік має бути від 14 до 120 років."
        }
    };

    function getPasswordStrength(password) {
        let score = 0;
        if (password.length >= 6) score++;
        if (password.length >= 10) score++;
        if (/[a-z]/.test(password) && /[A-Z]/.test(password)) score++;
        if (/\d/.test(password)) score++;
        if (/[^A-Za-z0-9]/.test(password)) score++;
        return Math.min(score, 5);
    }

    function updatePasswordStrength(passwordInput) {
        const bar = document.querySelector(".password-strength span");
        const text = document.getElementById("passwordStrengthText");
        const score = getPasswordStrength(passwordInput.value);
        const labels = ["не вказано", "дуже слабкий", "слабкий", "нормальний", "надійний", "дуже надійний"];

        bar.className = "";
        bar.classList.add("strength-" + score);
        text.textContent = "Надійність пароля: " + labels[score];
    }

    function updateFieldState(input, forceMessage) {
        const rule = input.dataset.rule;
        const message = document.querySelector('[data-message-for="' + input.id + '"]');
        if (!message || !rule) return;

        const hasValue = input.value.trim().length > 0;
        const isInitialAgeValue = input.id === "age" && input.value === "0" && !forceMessage;
        if (!hasValue || isInitialAgeValue) {
            input.classList.remove("is-valid", "is-invalid");
            message.textContent = "";
            return;
        }

        const valid = input.checkValidity();
        input.classList.toggle("is-valid", valid);
        input.classList.toggle("is-invalid", !valid);
        message.textContent = valid ? validationMessages[rule].valid : validationMessages[rule].invalid;
        message.classList.toggle("is-valid", valid);
        message.classList.toggle("is-invalid", !valid);
    }

    document.querySelectorAll(".register-form input").forEach((input) => {
        input.addEventListener("input", () => {
            updateFieldState(input, false);
            if (input.id === "password") {
                updatePasswordStrength(input);
            }
        });

        if (input.id === "password") {
            updatePasswordStrength(input);
        }
    });

    document.querySelector(".register-form").addEventListener("submit", (event) => {
        const inputs = [...document.querySelectorAll(".register-form input")];
        inputs.forEach((input) => updateFieldState(input, true));

        const firstInvalid = inputs.find((input) => !input.checkValidity());
        if (firstInvalid) {
            event.preventDefault();
            firstInvalid.focus();
        }
    });
</script>
</@p.pages>
