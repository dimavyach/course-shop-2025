<#macro pages>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>

<div class="my-class"></div>

<div class="container-fluid">
    <div class="row">
        <div class="col">
            <#include "navbar.ftl"/>
        </div>
    </div>

    <div class="row">

        <div class="col-md-3">
            <#include "leftmenu.ftl">
        </div>

        <div class="col-md-9">
            <#nested />
        </div>
    </div>

    <div class="row">
        <div class="col">
           <#include "footer.ftl"/>
        </div>
    </div>

<#--    <div class="row">-->
<#--        <div class="col-6">Java</div>-->
<#--        <div class="col-4">C#</div>-->
<#--        <div class="col-2">C++</div>-->
<#--    </div>-->
<#--    <div class="row">-->
<#--        <div class="col-6">-->
<#--            6-->
<#--        </div>-->
<#--        <div class="col-6">-->
<#--            6-->
<#--        </div>-->
<#--    </div>-->
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<#--<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"-->
<#--        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"-->
<#--        crossorigin="anonymous"></script>-->
<#--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"-->
<#--        integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"-->
<#--        crossorigin="anonymous"></script>-->

</body>
</html>

</#macro>