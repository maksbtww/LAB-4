<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">Website</h2>
    <form action="Login" method="post" class="w-50 mx-auto">
        <div class="mb-3">
            <label for="name" class="form-label">Username</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>
        <div class="mb-3">
            <label for="pass" class="form-label">Password</label>
            <input type="password" class="form-control" id="pass" name="pass" required>
        </div>
        <button type="submit" class="btn btn-login w-100">Login</button>
        <a href="register.jsp" class="d-block text-center mt-3">Register</a>
    </form>

    <%
        String error = request.getParameter("error");
        if (error != null && error.equals("true")) {
    %>
    <p style="color: red; text-align: center; margin-top: 15px;">Invalid username or password</p>
    <%
        }
    %>
</div>
</body>
</html>