<%-- 
    Document   : signup
    Created on : Sep 29, 2020, 2:23:45 PM
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
        <section class="contentUp">
            <div class="wrapper">
                <div class="title">
                    Sign Up</div>
                <p style="color: red">${err}</p>
                <form action="signUp" method="post">
                    <div class="field">
                        <input type="text" required name="email">
                        <label>Email Address</label>
                    </div>
                    <div class="field">
                        <input type="password" required name="pass">
                        <label>Password</label>
                    </div>
                    <div class="field">
                        <input type="password" required name="cfpass">
                        <label>Confirm Password</label>
                    </div>
                    <div class="field">
                        <input type="submit" value="Sign Up">
                    </div>
                    <div class="signup-link">
                        <a href="/ProjectMain/" style="font-size: 15px">Return home</a></div>
                </form>
            </div>
        </section>>
    </body>
</html>
