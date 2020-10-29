<%-- 
    Document   : login
    Created on : Sep 29, 2020, 9:31:27 AM
    Author     : cuongnm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
        <section class="content">
            <div class="wrapper">
                <div class="title">
                    Login</div>
                <form action="logIn" method="post">
                    <p style="color: red">${err}</p>
                    <div class="field">
                        <input type="text" required name="email">
                        <label>Email Address</label>
                    </div>
                    <div class="field">
                        <input type="password" required name="pass">
                        <label>Password</label>
                    </div>
                    <div >
                        <input type="checkbox" name="remember" value="1">
                        <label>Remember me!</label>
                    </div>
                    <div class="field">
                        <input type="submit" value="Login">
                    </div>
                    <div class="signup-link">
                        Not a member? <a href="/ProjectMain/signup.jsp">Signup now</a></div>
                </form>
            </div>
        </section>
    </body>
</html>
