<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>Register</title>
    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
</head>
<body class="text-center" style="background-color: #e7e7e7">
<center>
    <div>
        <div>
            <h1>Register</h1>
            <form action="RegisterServlet" method="post">
                <p>Username</p>
                <input type="text" placeholder="Username" name="name" required>
                <p>Password</p>
                <input type="password" placeholder="Password" name="password" required>
                <p>First Name</p>
                <input type="text" placeholder="First Name" name="fname" required>
                <p>Last Name</p>
                <input type="text" placeholder="Last Name" name="lname" required>
                <p>Email Address</p>
                <input type="text" placeholder="Email" name="email" required>
                <p>Phone Number</p>
                <input type="number" min="10" maxlength="10" placeholder="Phone" name="phone" required>
                <br>
                <input type="submit" value="Register">
                <hr>
                <a href="../index.jsp">Already have Account?</a>
            </form>
        </div>
    </div>
</center>
</body>
</html>

