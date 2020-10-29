<%-- 
    Document   : showSurvey
    Created on : Sep 30, 2020, 7:43:47 PM
    Author     : cuongnm
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Survey Management</title>
        <link href="css/navStyle.css" rel="stylesheet" type="text/css"/>
        <link href="css/contentStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
    <body>
        <div class="slidebar">
            <header>Survey Manager</header>
            <ul>
                <li><a class="checked" href="showSurvey">Dashboard</a></li>
                <li><a href="resultSurvey">Result</a></li>
                <li><a href="logOut">Log Out</li>
            </ul>
            <footer>@2020</footer>
        </div>
        <section>
            <header><img src="image/forms_48dp.png" alt=""/> My Survey</header>
            <div class="show">
                <a href="/ProjectMain/addSurvey.jsp"><button type="button" class="btn btn-success" style="width: 15rem">Add Survey</button></a>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Title</th>
                            <th scope="col">Status</th>
                            <th scope="col">Detail</th>
                            <th scope="col"></th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${surveyList}" var="survey">
                            <tr>
                            <th scope="row">${survey.id}</th>
                            <td>${survey.title}</td>
                            <td>${survey.status}</td>
                            <td>${survey.detail}</td>
                            <td>
                                <a href="showQuestion?id=${survey.id}"><button type="button" class="btn btn-success">Edit question</button></a>
                            </td>
                            <td>
                                <a href="editSurvey?id=${survey.id}"><button type="button" class="btn btn-success">Edit</button></a>
                            </td>
                            <td>
                                <a href="/ProjectMain/deleteSursey?id=${survey.id}"><button type="button" class="btn btn-danger">Delete</button></a>
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
