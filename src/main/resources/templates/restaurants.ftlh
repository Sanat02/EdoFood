<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order food</title>

    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
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

        .log {
            display: flex;
            gap: 15px;
            font-size: 20px;
        }

        .log:hover {
            color: var(--primary-color);
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


        .search {
            width: 100%;
            position: relative;
            display: flex;

        }

        .searchTerm {
            width: 100%;
            border: 3px solid var(--primary-color);
            border-right: none;
            padding: 5px;
            height: 35.5px;
            border-radius: 5px 0 0 5px;
            outline: none;
            color: #9DBFAF;
            margin-bottom: 40px;
        }

        .searchTerm:focus {
            color: var(--primary-color);;
        }

        .searchButton {
            width: 40px;
            height: 36px;
            border: 1px solid var(--primary-color);
            background: var(--primary-color);
            text-align: center;
            color: #fff;
            border-radius: 0 5px 5px 0;
            cursor: pointer;
            font-size: 20px;
        }

        .product {
            margin-top: 60px;
            margin-bottom: 30px;
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


        .footer {
            background: var(--bg);
            text-align: center;
            margin-top: 150px;
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
    </style>
</head>
<body>

<header class="header">
    <a href="#" class="logo"> <i class="fas fa-shopping-cart"></i> Shop</a>
    <nav class="navbar">
        <a href="#home">home</a>
        <a href="#about">profile</a>
    </nav>

    <!-- <div class="icons">
        <div id="cart-btn" class="fas fa-shopping-basket"></div>
        <div id="login-btn" class="fas fa-user"></div>
        <div id="menu-btn" class="fas fa-bars"></div>
    </div> -->

    <div class="log">
        <a href="#">
            <div>Sign in</div>
        </a>
        <a href="#">
            <div>Sign up</div>
        </a>
    </div>
</header>
<section class="product" id="product">

    <h1 class="heading"> our <span> restaurants</span></h1>

    <div class="wrap">
        <div class="search">
            <input type="text" class="searchTerm" placeholder="What are you looking for?">
            <button type="submit" class="searchButton">
                <i class="fa fa-search"></i>
            </button>
        </div>
    </div>

    <div class="box-container">
        <#list restaurants.content as restaurant>
            <div class="box">
                <div class="image">
                    <img src="https://img.myloview.com/stickers/chef-hat-vector-logo-chef-hat-logo-vector-illustration-restaurant-logo-cooking-logo-700-229284823.jpg" alt="">
                </div>
                <div class="content">
                    <h3>${restaurant.name}</h3>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                    <div class="price">More info</div>
                </div>
            </div>
        </#list>
    </div>

</section>
<#if restaurants.hasPrevious()>
    <a class="pag" href="/?page=${restaurants.number - 1}">Previous Page</a>
</#if>
<#if restaurants.hasNext()>
    <a class="pag" href="/?page=${restaurants.number + 1}">Next Page</a>
</#if>


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
</section>
</body>
</html>