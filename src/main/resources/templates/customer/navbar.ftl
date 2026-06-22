<nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom shadow-sm">
    <div class="container-fluid px-4">

        <a class="navbar-brand fw-bold" href="/">
            OnlineShop
        </a>

        <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse" data-bs-target="#mainNav"
                aria-controls="mainNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="mainNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="/">Головна</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/delivery">Доставка</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/payment">Оплата</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/about-us">Про нас</a>
                </li>
            </ul>

            <ul class="navbar-nav ms-auto mb-2 mb-lg-0 align-items-center gap-2">
                <li class="nav-item">
                    <a class="nav-link cart-link" href="/cart">
                        <span class="cart-icon">Кошик</span>
                        <#if cartItemCount?? && cartItemCount gt 0>
                            <span class="cart-badge">${cartItemCount}</span>
                        </#if>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="btn btn-primary btn-sm px-3" href="/profile">Кабінет</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
