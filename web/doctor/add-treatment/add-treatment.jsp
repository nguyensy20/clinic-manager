<%-- 
    Document   : add-treatment
    Created on : Feb 16, 2023, 7:40:47 AM
    Author     : nguye
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="time" class="util.DateTimeHelper"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <style><%@include file="../../css/bootstrap.min.css"%></style>
        <style><%@include file="add-treatment.css"%></style>
    </head>
    <body>
        <c:set var="p" value="${sessionScope.patient}"></c:set>
            <div class="container">
                <div class="add-treatment">
                    <h3>Add treatment</h3>
                    <div class="profile">
                        Doctor: ${sessionScope.user.name} <br>
                    Patient:${p.name}-31 tuoi-${p.address}
                </div>
                <h5>Symptoms: </h5>
                <p>${requestScope.symptom}</p>
                <p class="date">Ha Noi, ${sessionScope.time}</p>
                <form action="add-treatment" method="post">
                    <table class="treatment-table">
                        <tr>
                            <th>Treatment</th>
                            <th>Detail</th>
                            <th>Price</th>
                            <th></th>
                        </tr>
                        <c:forEach items="${requestScope.treatments}" var="t">
                            <tr>
                                <td>${t.name}</td>
                                <td>${t.detail}</td>
                                <td>${t.price}</td>
                                <td>
                                    <a href="">Edit</a>
                                    <a href="">Remove</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                    <input type="submit" name="add" value="Add"><!-- comment -->
                    <input type="submit" name="save" value="Save"><!-- comment -->
                </form>
            </div>
        </div>
    </body>
</html>