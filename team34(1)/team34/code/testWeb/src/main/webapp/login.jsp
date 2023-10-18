<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="./login.css">
</head>
<body>
<div class="container">
        <div class="login">
            <h2>Login</h2>
            <div class="box">
            <form method="post" action="./login">
    
                <div class="form-group">
                    <label for="username">username</label>
                    <input type="text" name="username"/>
                </div>
                <div class="form-group">
                    <label for="password">password</label>
                    <input type="text" name="password"/>
                </div>
                <button id="btn" type="SUBMIT">Login</button>
            </form>
            </div>
        </div>
    </div>
</body>
</html>