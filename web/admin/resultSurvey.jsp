<%-- 
    Document   : resultServey
    Created on : Oct 1, 2020, 10:26:32 AM
    Author     : cuongnm
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/navStyle.css" rel="stylesheet" type="text/css"/>
        <link href="css/contentStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
    <body>
        <div class="slidebar">
            <header>Survey Manager</header>
            <ul>
                <li><a href="showSurvey">Dashboard</a></li>
                <li><a class="checked" href="resultSurvey">Result</a></li>
                <li><a href="/ProjectMain/logOut">Log Out</a></li>
            </ul>
            <footer>@2020</footer>
        </div>
        <section>
            <header><img src="image/forms_48dp.png" alt=""/> Result of Survey</header>
            <div class="show">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Name</th>
                            <th scope="col">Status</th>
                            <th scope="col"></th>

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${surveyList}" var="survey">
                            <tr>
                                <th scope="row">${survey.id}</th>
                                <td>${survey.title}</td>
                                <td>${survey.status}</td>
                                <td>
                                    <a href="resultDetail?id=${survey.id}"><button type="button" class="btn btn-success">Show result</button></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>

                </table>
            </div>

        </section>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </body>
</html>
