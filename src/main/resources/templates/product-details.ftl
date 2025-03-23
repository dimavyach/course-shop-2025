<!DOCTYPE html>
<html lang="eu">
<head>
    <meta charset="UTF-8">
    <title>${product.name}</title>
    <link rel="stylesheet" href="/css/style.css">
    <style>
        .product-details {
            display: flex;
            align-items: center;
            gap: 30px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            background: #f9f9f9;
        }
        .product-image {
            max-width: 300px;
            border-radius: 10px;
        }
        .product-info {
            font-size: 1.2em;
        }
        .product-info p {
            margin-bottom: 10px;
        }
        .btn {
            padding: 2px 7px; /*кнопки*/
            font-size: 1.2em;
            border-radius: 5px;
            text-decoration: none;
            margin-top: 10px;
        }
        .btn-success {

            background-color: #28a745;
            color: #fff;
        }
        .btn-primary {
            background-color: #007bff;
            color: #000000;
        }
        .button-group {
            display: flex;
            gap: 20px;
        }
    </style>
</head>
<body>
<header>
    <h1 class="text-center">${product.name}</h1>
</header>
<div class="content">
    <div class="product-details">
        <img src="${product.image}" alt="${product.name}" class="product-image"/>
        <div class="product-info">
            <p><strong>Description:</strong> ${product.description}</p>
            <p><strong>Price:</strong> ${product.price}</p>
            <p><strong>Category:</strong> ${product.categories.name}</p>
            <form method="post" action="/addToCart">
                <input type="hidden" name="id" value="${product.id}">
                <label>Кількість:</label>
                <div class="quantity-wrapper">
                    <button type="button" class="btn-quantity" onclick="decrementQuantity()">-</button>
                    <input id="quantity" type="number" name="quantity" value="1" min="1" max="1000" step="1" class="input-quantity">
                    <button type="button" class="btn-quantity" onclick="incrementQuantity()">+</button>
                </div>
                <div class="button-group">
                    <button class="btn btn-success">Add To Cart</button>
                    <a href="/category/1" class="btn btn-primary">Back to Catalog</a>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>

<head>
    <title>Product Details</title>
    <link rel="stylesheet" type="text/css" href="/css/styles.css">
</head>

<div class="reviews-container">
    <h3>Reviews</h3>
    <#if reviews?? && reviews?size gt 0>
        <#list reviews as review>
            <div class="review-item">
                <span class="review-author">${review.author}</span> -
                <span class="review-date">${review.formattedDate! "Date not available"}</span>
                <p class="review-content">${review.content}</p>
                <p>Rating: <strong>${review.rating}/5</strong></p>
            </div>
        </#list>
    <#else>
        <p>No reviews yet. Be the first to leave a review!</p>
    </#if>

    <div class="review-form">
        <h4>Add a review</h4>
        <form action="/reviews/add" method="post">
            <input type="hidden" name="productId" value="${productId}">
            <input type="text" name="author" placeholder="Your name" required>
            <textarea name="content" placeholder="Write your review" required></textarea>
            <input type="number" name="rating" min="1" max="5" required>
            <button type="submit">Submit Review</button>
        </form>
    </div>
</div>


<script>
    function incrementQuantity() {
        document.getElementById('quantity').stepUp();
    }
    function decrementQuantity() {
        document.getElementById('quantity').stepDown();
    }
</script>

<#--http://localhost:8081/reviews/product-details?productId=1-->
<#--http://localhost:8081/products/1-->