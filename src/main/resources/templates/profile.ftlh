<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Complete Responsive Grocery Store Website</title>

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

        body {
            padding-top: 100px;
            padding-bottom: 50px;
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

        .log {
            display: flex;
            gap: 15px;
            font-size: 20px;
        }

        .profile-container {
            width: 100%;
            text-align: center;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
        }

        .profile-picture {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            overflow: hidden;
            margin: 0 auto;
            box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);
            transition: transform 0.2s ease-in-out;
        }

        .profile-picture img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .profile-info {
            margin-top: 20px;
        }

        .profile-info h2 {
            font-size: 24px;
            margin: 10px 0;
        }

        .profile-info p {
            font-size: 16px;
            margin-bottom: 10px;
            color: #333;
        }

        .set-image-button {
            background-color: #ffba43;
            color: #fff;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.2s ease-in-out;
        }

        .set-image-button:hover {
            background-color: #ecc37c;
        }

        .table-container {
            width: 100%;
            max-width: 1300px;
            margin: 20px auto;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            overflow-x: auto;
            margin-top: 32px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        thead {
            background-color: #3bb77e;
            color: #fff;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .delete-button, .set-image-button {
            padding: 8px 12px;
            font-size: 14px;
            background-color: #ffba43;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .delete-button:hover, .set-image-button:hover {
            background-color: #facd7f;
        }

        /* Center buttons in the cell */
        td > button {
            display: inline-block;
            margin-right: 5px;
        }

        .add-food-button {
            width: 150px;
            display: block;
            margin: 20px auto;
            padding: 10px 35px;
            background-color: var(--primary-color);
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.2s ease-in-out;
            text-decoration: none;
        }

        .add-food-button:hover {
            background-color: var(--secondary);
        }

        @media screen and (max-width: 768px) {
            .profile-container {
                width: 100%;
                float: none;
                margin-left: 0;
            }

            .table-container {
                width: 100%;
                float: none;
                margin-right: 0;
                margin-left: 0;
            }
        }

        .pag {
            margin-top: 20px;
            text-decoration: none;
            color: white;
            font-size: 20px;
            background-color: #00a86b;
            padding: 5px;
            border-radius: 4px;
            margin-bottom: 300px;
            margin-left: 350px;
        }
    </style>
</head>
<body>

<header class="header">
    <a href="#" class="logo"> <i class="fas fa-shopping-cart"></i> Grocery </a>

    <nav class="navbar">
        <a href="/">home</a>
        <a href="#product">profile</a>
    </nav>

    <div class="log">
        <a class="j" href="/logout">
            <div>log out</div>
        </a>
    </div>
</header>
<#if company??>
    <div class="profile-container">
        <div class="profile-picture">
            <img src="https://www.pngarts.com/files/10/Default-Profile-Picture-Download-PNG-Image.png"
                 alt="Profile Picture">
        </div>
        <div class="profile-info">
            <h2>${restaurant.name}</h2>
            <p>${restaurant.description}</p>
            <p>Contact: ${restaurant.phoneNumber}</p>
            <p>Address: ${restaurant.address}</p>
        </div>
        <a href="#">
            <button class="set-image-button">Set Image</button>
        </a>
    </div>
<#else>
    <div class="profile-container">
        <div class="profile-picture">
            <img src="https://www.pngarts.com/files/10/Default-Profile-Picture-Download-PNG-Image.png"
                 alt="Profile Picture">
        </div>
        <div class="profile-info">
            <h2>Account name:${buyer.accountName}</h2>
            <p>Email:${buyer.email}</p>
        </div>
        <a href="#">
            <button class="set-image-button">Set Image</button>
        </a>
    </div>
</#if>

<#if company?? >

    <div class="table-container">

        <table>
            <thead>
            <tr>
                <th>Food Name</th>
                <th>Description</th>
                <th>Price</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <#list foods.content as food >
                <tr>
                    <td>${food.name}</td>
                    <td>${food.description}</td>
                    <td>$${food.price}</td>
                    <td>
                        <button class="delete-button">Delete</button>
                        <button class="set-image-button">Set Image</button>
                    </td>
                </tr>
            </#list>
            </tbody>
        </table>

        <a href="#" class="add-food-button">Add Food</a>
    </div>
    <#if foods.hasPrevious()>
        <a class="pag" href="/profile?page=${foods.number - 1}">Previous Page</a>
    </#if>
    <#if foods.hasNext()>
        <a class="pag" href="/profile?page=${foods.number + 1}">Next Page</a>
    </#if>
</#if>
</body>
</html>
