<%-- 
    Document   : doSurvey
    Created on : Oct 10, 2020, 3:11:50 PM
    Author     : cuongnm
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
    <body class="container-fluid">
        <c:if test="${answerList == null}">
            <form class="container" action="doSurvey" method="post">
                <input name="id" value="${id}" style="display: none"/>
                <input name="name" value="${name}" style="display: none"/>
                <input name="size" value="${questionList.size()}" style="display: none"/>
                <div class="card">
                    <img src="image/${img}" class="card-img-top" alt="" style="height: 12rem"/>
                    <div class="card-body">
                        <h5 class="card-title">${survey.title}</h5>
                        <p class="card-text">${survey.detail}</p>
                    </div>
                </div>
                <c:forEach items="${questionList}" var="q"> 
                    <div class="card">
                        <div class="card-body">
                            <c:choose>
                                <c:when test="${q.required == true}">
                                    <h5 class="card-title">${q.question}*</h5>
                                    <input name="${q.id}" required="" class="card-text form-control" type="text" placeholder="Your answer">
                                </c:when>
                                <c:otherwise>
                                    <h5 class="card-title">${q.question}</h5>
                                    <input name="${q.id}" class="card-text form-control" type="text" placeholder="Your answer">
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </c:forEach>
                <button type="submit" class="btn btn-outline-success">Submit</button>
            </form>
        </c:if>
        <c:if test="${answerList != null}">
            <div class="container">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Thank you for doing the survey</h5>
                        <h6 class="card-text form-control">Your survey results have been recorded.</h6>
                    </div>
                </div>
                <a href="/ProjectMain/"><button type="" class="btn btn-outline-danger">Cancel</button></a>
            </div>
        </c:if>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </body>
</html>
