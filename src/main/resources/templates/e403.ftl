<#import "templ_manager/templ_manager.ftl" as m>
<@m.pages>
    <link rel="stylesheet" href="/css/access-denied.css">

    <div class="access-denied-container">
        <div class="card text-center p-4">
            <!-- Якщо у вас підключені Bootstrap Icons -->
            <i class="bi bi-exclamation-triangle-fill error-icon"></i>
            <h2 class="error-title">Доступ заборонено</h2>
            <p class="error-message">У вас немає прав для перегляду цього ресурсу.</p>
            <div class="action-buttons">
                <a href="/" class="btn btn-primary">На головну</a>
                <a href="javascript:history.back()" class="btn btn-secondary">Повернутися</a>
            </div>
        </div>
    </div>
</@m.pages>
