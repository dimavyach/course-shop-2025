<#macro pages>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/customerhome.css">
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>

</#macro>