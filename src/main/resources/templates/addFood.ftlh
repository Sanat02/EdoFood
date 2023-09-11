<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration and Login Page</title>
    <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 400px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .container h2 {
            margin-bottom: 20px;
            color: #333;
        }

        form {
            width: 100%;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="tel"],
        input[type="number"],
        select {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #3bb77e;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #00a86b;
        }

        .login-option {
            margin-top: 20px;
            font-size: 14px;
            color: #333;
        }

        .login-option a {
            color: #00a86b;
            text-decoration: none;
        }

        .login-divider {
            width: 100%;
            text-align: center;
            margin: 20px 0;
            position: relative;
        }

        .login-divider hr {
            position: absolute;
            top: 50%;
            left: 0;
            width: 100%;
            margin: 0;
        }

        .login-divider .or-text {
            background-color: #f9f9f9;
            padding: 5px 10px;
            font-weight: bold;
            color: #777;
        }


    </style>
</head>
<body>
<div class="container">
    <h2>Food</h2>
    <form action="/foods/add" method="post">
        <#if _csrf??>
            <input type="hidden" name="${(_csrf.parameterName)!'csrf-param-name'}"
                   value="${(_csrf.token)!'csrf-token'}"/>
        </#if>
        <label for="restaurant_name">Food Name:</label>
        <input type="text" id="restaurant_name" name="food_name" placeholder="Enter food name" required>

        <label for="description">Description:</label>
        <input type="text" id="description" name="description" placeholder="Enter restaurant description" required>

        <label for="address">Price:</label>
        <input type="number" id="address" name="price" placeholder="Enter price" required min="0">

        <input type="submit" value="Add">
    </form>

    <div class="login-option">
        Do you want to return?<a href="/profile">Back</a>
    </div>

</div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>

</body>
</html>
