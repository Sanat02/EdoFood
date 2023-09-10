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

        .j {
            padding: 1.2rem 0;
            color: var(--black);
            text-transform: uppercase;
            font-size: 2rem;
            text-decoration: none;
            margin-right: 3px;
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
            margin-top: 80px;
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
            padding-bottom: 12px;
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
            margin-bottom: 30px;
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

        .btn {
            background: transparent;
            width: 200px;
            position: relative;
            padding: 15px;
            color: #1ECD97;
            cursor: pointer;
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 3px;
            transition: all 500ms cubic-bezier(0.6, -0.28, 0.735, 0.045);
            border-radius: 4px;
            font-weight: 600;
            overflow: hidden;
            border: 2px solid #1ECD97;
            text-decoration: none;
        }

        /* In Progress Button */
        .btn-progress {
            width: 500px;
            color: transparent;
        }

        .btn-fill:after {
            content: '';
            background: #1ECD97;
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
            transform: scaleX(0);
            transform-origin: 0;
            display: block;
            animation: fill 3.2s linear forwards;
        }

        /* Button Complete */
        .btn-complete {
            padding: 10px;
            width: 50px;
            color: #fff;
            pointer-events: none;
        }

        .btn-complete:after {
            font-family: FontAwesome;
            content: "\f00c";
            color: #fff;
            height: 100%;
            padding-left: 3px;
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #1ECD97;
        }

        .rp {
            margin-top: 30px;
            width: 5px;
        }
        .j:hover{
            color: #3bb77e;
        }
    </style>
</head>
<body>

<header class="header">
    <a href="#" class="logo"> <i class="fas fa-shopping-cart"></i> Shop</a>
    <nav class="navbar">
        <a href="#home">home</a>
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
<section class="product" id="product">

    <h1 class="heading"> our <span> restaurants</span></h1>

    <div class="wrap">
        <form action="/" method="POST">
            <#if _csrf??>
                <input type="hidden" name="${(_csrf.parameterName)!'csrf-param-name'}"
                       value="${(_csrf.token)!'csrf-token'}"/>

            </#if>

            <div class="search">
                <input type="text" class="searchTerm" name="searchTerm" placeholder="What are you looking for?">
                <button type="submit" class="searchButton">
                    <i class="fa fa-search"></i>
                </button>
            </div>
        </form>
    </div>


    <#if restaurant??>
    <div class="box-container">
        <div class="box">
            <div class="image">
                <img src="https://img.myloview.com/stickers/chef-hat-vector-logo-chef-hat-logo-vector-illustration-restaurant-logo-cooking-logo-700-229284823.jpg"
                     alt="">
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
                <a href="/foods/${restaurant.id}" class='btn'>Learn More</a>
            </div>
        </div>
    </div>
</section>
<#else>
    <div class="box-container">
        <#list restaurants.content as restaurant>
            <div class="box">
                <div class="image">
                    <img src="https://img.myloview.com/stickers/chef-hat-vector-logo-chef-hat-logo-vector-illustration-restaurant-logo-cooking-logo-700-229284823.jpg"
                         alt="">
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
                    <a href="/foods/${restaurant.id}" class='btn'>Learn More</a>
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
</#if>
<div class="rp"></div>
</body>
</html>