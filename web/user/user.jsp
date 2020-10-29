<%-- 
    Document   : user
    Created on : Sep 29, 2020, 2:48:56 PM
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
                <form action="doSurvey" method="get">
                    <p style="color: red">${err}</p>
                    <div class="field">
                        <input type="text" required name="surveyId">
                        <label>ID survey</label>
                    </div>
                    <div class="field">
                        <input type="text" required name="name">
                        <label>Name</label>
                    </div>
                    <div class="field">
                        <input type="submit" value="Do survey">
                    </div>
                </form>
            </div>
        </section>
    </body>
</html>
