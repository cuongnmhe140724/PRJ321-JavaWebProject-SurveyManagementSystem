<%-- 
    Document   : resultSurveyDetail
    Created on : Oct 1, 2020, 10:40:26 AM
    Author     : cuongnm
--%>

<%@page import="model.Guest"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="a" class="dal.AnswerDAO" scope="request"></jsp:useBean>
        <jsp:useBean id="q" class="dal.QuestionDAO" scope="request"></jsp:useBean>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/contentStyle.css" rel="stylesheet" type="text/css"/>
        <link href="css/navStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
    <body>
        <div class="slidebar">
            <header>Survey Manager</header>
            <ul>
                <li><a class="checked" href="showSurvey">Dashboard</a></li>
                <li><a class="checked" href="/ProjectMain/resultSurvey">Result</a></li>
                <li><a href="/ProjectMain/logOut">Log Out</a></li>
            </ul>
            <footer>@2020</footer>
        </div>
        <section>
            <header><img src="image/forms_48dp.png" alt=""/>Survey "Name"</header>
            <div class="show">
                <c:forEach items="${guestList}" var="guest">
                    <header>${guest.name}:</header>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Question</th>
                                <th scope="col">Answer</th>
                            </tr>
                        </thead>
                        <c:set var="gId" value="${guest.id}"></c:set>
                        <c:forEach items="${a.getAnswerByGuest(gId)}" var="answer">
                            <tbody>
                                <tr>
                                    <th scope="row">${answer.id}</th>
                                    <c:set var="qId" value="${answer.questionId}"></c:set>
                                    <td><p>${q.getQuestionByQuestionId(qId).question}</p></td>
                                    <td><p>${answer.answer}</p></td>
                                </tr>
                            </tbody>
                        </c:forEach>
                    </table>
                </c:forEach>
            </div>

        </section>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </body>
</html>
