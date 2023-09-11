<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="_csrf" content="${_csrf.token}">
    <meta name="_csrf_header" content="${_csrf.headerName}">
    <title>Complete Responsive Grocery Store Website</title>

    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>

    <!-- font awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700&display=swap');

        :root {
            --primary-color: #3bb77e;
            --secondary: #ffba43;
            --bg: #e2f9ee;
            --black: #1c2137;
            --white: #fff;
            --box-shadow: 0 .5rem 1rem rgba(0, 0, 0, 0.1);
        }

        * {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            outline: none;
            border: none;
            text-transform: capitalize;
            text-decoration: none;
            transition: .2s linear;
        }

        .pag {
            margin-left: 135px;
            text-decoration: none;
            color: white;
            font-size: 20px;
            background-color: #00a86b;
            padding: 5px;
            border-radius: 4px;
            margin-bottom: 300px;
        }

        html {
            font-size: 62.5%;
            overflow-x: hidden;
            scroll-padding-top: 9rem;
            scroll-behavior: smooth;
        }

        html::-webkit-scrollbar {
            width: .8rem;
        }

        html::-webkit-scrollbar-track {
            background: transparent;
        }

        html::-webkit-scrollbar-thumb {
            background: var(--primary-color);
            border-radius: 5rem;
        }

        section {
            padding: 2rem 7%;
        }

        .heading {
            text-align: center;
            padding: 1.2rem 0;
            margin-bottom: 3rem;
            color: var(--primary-color);
            text-transform: uppercase;
            font-size: 4rem;
        }

        .heading span {
            color: var(--secondary);
            text-transform: uppercase;
        }

        .btn {
            margin-top: 1rem;
            display: inline-block;
            padding: 1.3rem 3.5rem;
            font-size: 1.7rem;
            color: var(--white);
            border-radius: .5rem;
            background: var(--primary-color);
            cursor: pointer;
        }

        .btn:hover {
            color: var(--white);
            background: var(--secondary);
            box-shadow: var(--box-shadow);
        }


        .header {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
            background: var(--white);
            box-shadow: var(--box-shadow);
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 2rem 9%;

        }

        .header .logo {
            font-size: 2.5rem;
            font-weight: bolder;
            color: var(--black);
        }

        .header .logo i {
            color: var(--secondary);
            padding-right: .5rem;
        }

        .header .navbar a {
            font-size: 1.7rem;
            color: var(--black);
            margin: 0 1rem;
        }

        .header .navbar a:hover {
            color: var(--primary-color);
        }

        .header .icons div {
            font-size: 2.5rem;
            margin-left: 1.7rem;
            cursor: pointer;
            color: var(--black);
        }

        .header .icons div:hover {
            color: var(--primary-color);
        }

        #menu-btn {
            display: none;
        }

        /* shopping-cart */

        .header .shopping-cart {
            position: absolute;
            top: 115%;
            right: -105%;
            background: var(--white);
            border-radius: .5rem;
            box-shadow: var(--box-shadow);
            width: 35rem;
            padding: 2rem;
        }

        .header .shopping-cart.active {
            right: 2rem;
            transition: .4s linear;
        }

        .header .shopping-cart .box {
            display: flex;
            align-items: center;
            gap: 1.5rem;
            margin-bottom: 1.5rem;
            position: relative;
        }

        .header .shopping-cart .box .fa-times {
            position: absolute;
            top: 50%;
            right: 2rem;
            transform: translateY(-50%);
            font-size: 2rem;
            color: var(--primary-color);
            cursor: pointer;
        }

        .header .shopping-cart .box .fa-times:hover {
            color: var(--secondary);
        }

        .header .shopping-cart .box img {
            height: 8rem;
        }

        .header .shopping-cart .box .content h3 {
            font-size: 1.7rem;
            padding-bottom: .5rem;
            color: var(--black);
        }

        .header .shopping-cart .box .content h3:hover {
            color: var(--secondary);
        }

        .header .shopping-cart .box .content .price {
            font-size: 1.5rem;
            color: var(--black);
        }

        .header .shopping-cart .total {
            color: var(--black);
            font-size: 2.2rem;
            text-align: center;
        }

        .header .shopping-cart .total span {
            color: var(--black);
            font-weight: lighter;
        }

        .header .shopping-cart .btn {
            text-align: center;
            width: 100%;
        }

        .banner-container {
            margin-top: 60px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(30rem, 1fr));
            gap: 1.5rem;
            padding-top: 5rem;
        }

        .banner-container .banner {
            position: relative;
            height: 25rem;
            overflow: hidden;
            border-radius: .5rem;
            box-shadow: var(--box-shadow);
        }

        .banner-container .banner img {
            height: 100%;
            width: 125%;
            object-fit: cover;
        }

        .comment-container {
            max-width: 100%;
            margin: 20px auto;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            overflow-y: scroll;
            max-height: 400px;
        }

        .comment {
            padding: 15px;
            border-bottom: 1px solid #ccc;
        }

        .comment:last-child {
            border-bottom: none;
        }

        .comment .username {
            font-weight: bold;
            color: #007BFF;
        }

        .comment .timestamp {
            color: #777;
            font-size: 0.8em;
        }

        .comment .text {
            margin-top: 5px;
            font-size: larger;
        }

        .banner-container .banner .content {
            position: absolute;
            top: 50%;
            left: 2rem;
            transform: translateY(-50%);
        }

        .banner-container .banner .content span {
            color: #666;
            font-size: 1.5rem;
        }

        .banner-container .banner .content h3 {
            font-size: 2.8rem;
            padding-top: .5rem;
            color: var(--black);
        }

        .banner-container .banner .content .btn {
            padding: .8rem 2.5rem;
        }

        .product .box-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(30rem, 1fr));
            gap: 2rem;
        }

        .product .box-container .box {
            text-align: center;
            background: var(--white);
            border-radius: .5rem;
            box-shadow: var(--box-shadow);
            position: relative;
            overflow: hidden;
        }

        .product .box-container .box .image {
            height: 35rem;
            width: 100%;
            padding: 1.1rem;
        }

        .product .box-container .box .image img {
            height: 100%;
            width: 100%;
            border-radius: .5rem;
            object-fit: cover;
        }

        .product .box-container .box .content {
            padding: 2rem;
            padding-top: 0;
        }

        .product .box-container .box .content h3 {
            color: var(--black);
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }

        .product .box-container .box .content .price {
            display: inline-block;
            font-size: 2.5rem;
            color: var(--primary-color);
        }

        .product .box-container .box .content .stars {
            padding: 1rem 0;
        }

        .product .box-container .box .content .stars i {
            font-size: 1.7rem;
            color: var(--secondary);
        }

        .product .box-container .box .content .fa-shopping-cart {
            text-align: center;
            height: 4.5rem;
            width: 10rem;
            line-height: 4.5rem;
            border-radius: .5rem;
            background: none;
            cursor: pointer;
            font-size: 2rem;
            color: var(--primary-color);
            border: .1rem solid var(--primary-color);
            margin-left: .5rem;
            margin-top: 7px;
        }

        .product .box-container .box .content .fa-shopping-cart:hover,
        .product .box-container .box .content .fa-heart:hover,
        .product .box-container .box .content .fa-eye:hover {
            color: var(--white);
            background: var(--primary-color);
            box-shadow: var(--box-shadow);
            transition: .4s linear;
        }

        /* end */

        /* about */

        .about .row {
            display: flex;
            align-items: center;
            flex-wrap: wrap;
            gap: 2rem;
        }

        .about .row .content {
            flex: 1 1 50rem;
        }

        .about .row .content h3 {
            color: var(--black);
            font-size: 3.5rem;
            line-height: 1.5;
            padding-top: 1rem;
        }

        .about .row .content .divider {
            background: var(--secondary);
            height: .3rem;
            display: inline-block;
            width: 20%;
        }

        .about .row .content p {
            font-size: 1.4rem;
            padding: 1rem 0;
            color: #666;
            line-height: 2;
        }

        .about .row .image {
            flex: 1 1 30rem;
        }

        .about .row .image img {
            width: 100%;
            height: 100%;
        }

        /* end */

        /* review */

        .review .slide {
            padding: 1.5rem;
            box-shadow: var(--box-shadow);
            border: .1rem solid rgba(0, 0, 0, 0.2);
            border-radius: .5rem;
            position: relative;
        }

        .review .slide p {
            text-align: center;
            padding-bottom: .5rem;
            font-size: 1.5rem;
            line-height: 1.8;
            color: #666;
        }

        .review .slide .fa-quote-right {
            position: absolute;
            bottom: 3rem;
            right: 3rem;
            font-size: 6rem;
            color: var(--secondary);
        }

        .review .slide .user {
            display: flex;
            gap: 1.5rem;
            align-items: center;
            background: var(--bg);
            padding: 1rem 1.5rem;
            border-radius: .5rem;
        }

        .review .slide .user img {
            height: 7rem;
            width: 7rem;
            border-radius: 15%;
            object-fit: cover;
        }

        .review .slide .user h3 {
            color: var(--black);
            font-size: 2rem;
            padding-bottom: .5rem;
        }

        .review .slide .user i {
            font-size: 1.3rem;
            color: var(--primary-color);
        }

        .blog {
            margin-top: 90px;
        }

        .blog .box-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(30rem, 1fr));
            gap: 1.5rem;
        }

        .blog .box-container .box {
            box-shadow: var(--box-shadow);
        }

        .blog .box-container .box .image {
            height: 25rem;
            width: 100%;
            overflow: hidden;
        }

        .blog .box-container .box .image img {
            height: 100%;
            width: 100%;
            object-fit: cover;
        }

        .blog .box-container .box:hover .image img {
            transform: scale(1.1);
        }

        .blog .box-container .box .content {
            padding: 2rem;
        }

        .blog .box-container .box .content .icons {
            margin-bottom: 1rem;
        }

        .blog .box-container .box .content .icons a {
            font-size: 1.4rem;
            color: var(--primary-color);
        }

        .blog .box-container .box .content .icons a:hover {
            color: var(--secondary);
        }

        .blog .box-container .box .content .icons a i {
            padding-right: .5rem;
        }

        .blog .box-container .box .content h3 {
            font-size: 2.5rem;
            color: var(--black);
        }

        .blog .box-container .box .content p {
            font-size: 1.5rem;
            color: var(--black);
            line-height: 2;
            padding: 1rem 0;
        }

        .contact .row {
            display: flex;
            flex-wrap: wrap;
            gap: 1.5rem;
        }

        .contact .row .image {
            flex: 1 1 30rem;
        }

        .contact .row .image img {
            height: 100%;
            width: 100%;
            object-fit: cover;
        }

        .contact .row form {
            flex: 1 1 50rem;
            padding: 5rem;
            padding-top: 10rem;
        }

        .contact .row form .inputBox {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
        }

        .contact .row form .inputBox input,
        .contact .row form textarea {
            padding: 1rem;
            margin: 1rem 0;
            font-size: 1.7rem;
            color: #666;
            text-transform: capitalize;
            border: .1rem solid transparent;
            background: var(--bg);
            border-bottom-color: var(--primary-color);
            border-radius: .5rem .5rem 0 0;
            width: 49%;
        }

        .contact .row form .inputBox input:focus,
        .contact .row form textarea:focus {
            border-top-color: var(--primary-color);
            border-right-color: var(--primary-color);
            border-left-color: var(--primary-color);
        }

        .contact .row form textarea {
            width: 100%;
            resize: none;
            height: 15rem;
        }

        .footer {
            background: var(--bg);
            text-align: center;
        }

        .footer .box-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(30rem, 1fr));
            gap: 2rem;
        }

        .footer .box-container .box h3 {
            font-size: 2.2rem;
            text-transform: capitalize;
            color: var(--primary-color);
            padding: 1rem 0;
        }

        .footer .box-container .box p {
            font-size: 1.5rem;
            line-height: 2;
            color: var(--black);
            padding: 1rem 0;
        }

        .footer .box-container .box .share {
            margin-top: 1rem;
        }

        .footer .box-container .box .share a {
            height: 4.5rem;
            width: 4.5rem;
            line-height: 4.5rem;
            border-radius: 10%;
            font-size: 1.7rem;
            background: var(--primary-color);
            color: var(--white);
            margin-right: .3rem;
            text-align: center;
        }

        .footer .box-container .box .share a:hover {
            background: var(--secondary);
        }

        .footer .box-container .box .link {
            font-size: 1.7rem;
            line-height: 2;
            color: var(--primary-color);
            padding: .5rem 0;
            display: block;
        }

        .footer .box-container .box .link:hover {
            color: var(--secondary);
        }

        .footer .credit {
            text-align: center;
            margin-top: 3rem;
            padding-top: 3rem;
            font-size: 2rem;
            text-transform: capitalize;
            color: var(--primary-color);
            border-top: .1rem solid var(--black);
        }

        .footer .credit span {
            color: var(--secondary);
        }


        @media (max-width: 991px) {

            html {
                font-size: 55%;
            }

            .header {
                padding: 2rem 3rem;
            }

            section {
                padding: 2rem;
            }

        }

        @media (max-width: 768px) {


            .header .navbar {
                position: absolute;
                top: 110%;
                right: -110%;
                width: 30rem;
                box-shadow: var(--box-shadow);
                border-radius: .5rem;
                background: var(--white);
            }

            .header .navbar.active {
                right: 2rem;
                transition: .4s linear;
            }

            .header .navbar a {
                font-size: 2rem;
                margin: 2rem 2.5rem;
                display: block;
            }

            .home .content h3 {
                font-size: 4.5rem;
            }

            .about .row .image img {
                width: 100%;
                height: 50%;
            }

        }

        @media (max-width: 450px) {
            html {
                font-size: 50%;
            }

            .home .content h3 {
                font-size: 3.5rem;
            }
        }

        .log {
            display: flex;
            gap: 15px;
            font-size: 20px;
        }


        .j {
            padding: 1.2rem 0;
            color: var(--black);
            text-transform: uppercase;
            font-size: 2rem;
            text-decoration: none;
            margin-right: 3px;
        }

        .j:hover {
            color: #3bb77e;
        }

        .fn {
            height: 50px;
            margin-bottom: 5px;
        }

        .icons {
            display: flex;
        }
    </style>

</head>
<body>

<header class="header">
    <a href="#" class="logo"> <i class="fas fa-shopping-cart"></i> Grocery </a>

    <nav class="navbar">
        <a href="/">home</a>
        <#if username??><a href="/profile">profile</a></#if>
    </nav>

    <#if username??>
        <div class="log">
            <a class="j" href="/logout">
                <div>log out</div>
            </a>
        </div>
    <#else>
        <div class="log">
            <a class="j" href="/login">
                <div>sign in</div>
            </a>
            <a class="j" href="/register">
                <div>sign up</div>
            </a>
        </div>
    </#if>
</header>


<section class="blog" id="blog">
    <h1 class="heading">${restaurant.name} </h1>
    <div class="box-container">
        <div class="box">
            <div class="image">
                <img src="https://as1.ftcdn.net/v2/jpg/02/52/38/80/1000_F_252388016_KjPnB9vglSCuUJAumCDNbmMzGdzPAucK.jpg"
                     alt="">
            </div>
            <div class="content">
                <div class="icons">
                    <a href="#"> <i class="fas fa-user"></i> ${restaurant.getUser().accountName} </a>
                </div>
                <h3>About us</h3>
                <p>${restaurant.description}</p>
            </div>
        </div>
    </div>
</section>


<section class="product" id="product">
    <div class="box-container">
        <#list foods.content as food >
        <div class="box">
            <div class="image">
                <img src="https://s.tmimgcdn.com/scr/800x500/253100/modelo-de-logotipo-de-servico-de-catering-para-todos-os-servicos-de-alimentacao_253135-original.jpg"
                     alt="">
            </div>
            <div class="content">
                <h3 class="fn">${food.name}</h3>
                <div class="price">$${food.price}</div>
                <#if buyer?? >
                <div class="add-btn" data-user-id="${buyer.id}" data-food-id="${food.id}"><i
                        class="fas fa-shopping-cart"></i></div></#if>
        </div>
    </div>
    </#list>
    </div>
</section>
<#if foods.hasPrevious()>
    <a class="pag" href="/foods/${restaurant.id}?page=${foods.number - 1}">Previous Page</a>
</#if>
<#if foods.hasNext()>
    <a class="pag" href="/foods/${restaurant.id}?page=${foods.number + 1}">Next Page</a>
</#if>


<section class="contact" id="contact">

    <h1 class="heading"> add <span> comment </span></h1>


    <div class="row">

        <div class="image">
            <img src="images/contact.png" alt="">
        </div>

        <form action="">
            <div class="comment-container">
                <div class="comment">
                    <span class="username">User123:</span>
                    <span class="timestamp">2 hours ago</span>
                    <div class="text">This is a beautiful comment section!</div>
                </div>
                <div class="comment">
                    <span class="username">CoolGuy42:</span>
                    <span class="timestamp">1 hour ago</span>
                    <div class="text">I agree, it looks great!</div>
                </div>
            </div>
            <textarea placeholder="comment" id="" cols="30" rows="10"></textarea>
            <input type="submit" value="send" class="btn">
        </form>
    </div>

</section>

<section class="footer">
    <div class="box-container">
        <div class="box">
            <h3>find us here</h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. In accusamus praesentium.</p>
            <div class="share">
                <a href="#" class="fab fa-facebook-f"></a>
                <a href="#" class="fab fa-twitter"></a>
                <a href="#" class="fab fa-instagram"></a>
                <a href="#" class="fab fa-linkedin"></a>
            </div>
        </div>

        <div class="box">
            <h3>contact us</h3>
            <p>+52 2 1478 7412</p>
            <a href="#" class="link">ninjashub@gmail.com</a>
        </div>

        <div class="box">
            <h3>localization</h3>
            <p>230 points of pines dr <br>
                colorado springs <br>
                United States.
            </p>
        </div>

    </div>

    <div class="credit">created by <span> ninjashub </span> all rights reserved!</div>

</section>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const addButtons = document.querySelectorAll(".add-btn");
        const csrfToken = document.querySelector('meta[name="_csrf"]').getAttribute('content');

        addButtons.forEach(function (button) {
            button.addEventListener("click", function (event) {
                const foodId = button.getAttribute("data-food-id");
                const userId = button.getAttribute("data-user-id");

                console.log("Food ID clicked:", foodId);

                if (confirm('Are you sure you want to add to cart?')) {

                    const data = {
                        foodId: foodId,
                        userId: userId
                    };


                    fetch('/cart/add', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                            'X-CSRF-TOKEN': csrfToken

                        },
                        body: JSON.stringify(data)
                    })
                        .then(response => {
                            if (response.ok) {

                                alert('Item added to cart successfully!');
                            } else {
                                alert('Failed to add item to cart.');
                            }
                        })
                        .catch(error => {

                            console.error('Error:', error);
                        });
                }
            });
        });
    });

</script>

</body>
</html>