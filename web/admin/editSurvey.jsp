<%-- 
    Document   : editSurvey
    Created on : Sep 30, 2020, 11:58:15 PM
    Author     : cuongnm
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
                <li><a class="checked" href="/ProjectMain/showSurvey.jsp">Dashboard</a></li>
                <li><a href="">Result</a></li>
            </ul>
            <footer>@2020</footer>
        </div>
        <section>
            <header><img src="image/forms-blank-googlecolors.png" alt=""/> Edit Survey</header>
            <div class="container">
                <h2>${survey.title} - ${survey.status}</h2>
                <form class="form-horizontal" action="editSurvey" method="post">
                    <input name="id" value="${survey.id}" style="display: none"/>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="email">Title:</label>
                        <div class="col-sm-10">
                            <input required="" type="text" class="form-control" name="title" value="${survey.title}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="pwd">Detail:</label>
                        <div class="col-sm-10">          
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="detail">${survey.detail}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="pwd">Status:</label>
                        <div class="col-sm-10">          
                            <select name="status" class="form-control selectpicker">
                                <option value="Pending">Pending</option>
                                <option value="Running">Running</option>
                                <option value="Stop">Stop</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">        
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-success" style="width: 5rem" name="save" value="name">Save</button>
                            <a href="/ProjectMain/showSurvey"><button type="button" class="btn btn-danger" style="width: 5rem">Return</button></a>
                        </div>
                    </div>
                </form>
            </div>
        </section>



        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </body>
</html>
