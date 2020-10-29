<%-- 
    Document   : editQuestion
    Created on : Oct 1, 2020, 9:35:27 AM
    Author     : cuongnm
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
        <script>tinymce.init({selector: 'textarea'});</script>
        <link href="css/navStyle.css" rel="stylesheet" type="text/css"/>
        <link href="css/contentStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
    <body>
        <div class="slidebar">
            <header>Survey Manager</header>
            <ul>
                <li><a class="checked" href="/ProjectMain/showSurvey">Dashboard</a></li>
                <li><a href="">Result</a></li>
            </ul>
            <footer>@2020</footer>
        </div>
        <section>
            <header><img src="image/forms-blank-googlecolors.png" alt=""/>Edit question</header>
            <div class="container">
                <h2>Add question</h2>
                <form class="form-horizontal" action="addQuestion?id=${survey.id}" method="post">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="pwd">Question:</label>
                        <div class="col-sm-10">          
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="Enter description" name="question"></textarea>
                        </div>
                    </div>
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" id="exampleCheck1" name="required" value="1">
                        <label class="form-check-label" for="exampleCheck1">Required</label>
                    </div>
                    <div class="form-group">        
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-success" style="width: 5rem">Add</button>
                            <a href="/ProjectMain/showSurvey"><button type="button" class="btn btn-danger" style="width: 5rem">Return</button></a>
                        </div>
                    </div>
                </form>
            </div>

<!--            table edit question-->
            <div class="show">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Question</th>
                            <th scope="col">Required</th>
                            <th scope="col"></th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${questionList}" var="question">
                        <form action="editQuestion?id=${question.id}&sid=${survey.id}" method="post">
                            <tr>
                                <th scope="row">${question.id}</th>
                                <td>
                                    <label class="control-label col-sm-2" for="pwd">Question:</label>
                                    <div class="col-sm-10">          
                                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="Enter description" name="question${question.id}">${question.question}</textarea>
                                    </div>
                                </td>
                                <td><select name="required${question.id}" class="form-control selectpicker">
                                        <c:choose>
                                            <c:when test="${question.required == true}">
                                                <option value="true" selected="">Yes</option>
                                                <option value="false">No</option>
                                            </c:when>
                                            <c:when test="${question.required == false}">
                                                <option value="true">Yes</option>
                                                <option value="false" selected="">No</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="true">Yes</option>
                                                <option value="false">No</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </select></td>
                                <td>
                                    <button type="submit" class="btn btn-success">Save</button>
                                </td>
                                <td>
                                    <a href="deleteQuestion?id=${question.id}&sid=${survey.id}"><button type="button" class="btn btn-danger">Delete</button></a>
                                </td>
                            </tr>
                        </form>
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
