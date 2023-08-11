<%-- 
    Document   : add-treatment-detail
    Created on : Feb 16, 2023, 7:41:14 AM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <style><%@include file="../../css/bootstrap.min.css"%></style>
        <style><%@include file="add-treatment-detail.css"%></style>
    </head>
    <body>
        <div class="container">
            <div class="add-treatment-detail">
                <h3>Add treatment detail</h3>
                <div class="profile">
                    Doctor: Nguyen Van A <br>
                    Patient: Nguyen Van B-31 tuoi-Hoa Lac Thach That Ha Noi
                </div>
                <h5>Symptoms: </h5>
                This screen will display the list of patients who have registered for today's examination. It also displays the patient's examination order based on the registration time and indicates whether the patient is currently being examined.
                <p class="date">Ha Noi, ngay 10 thang 2 nam 2023</p>
                <form action="add-treatment-detail" method="post">
                    <select name="treatment">
                        <c:forEach items="${requestScope.treatments}" var="t">
                            <option value="${t.id}">${t.name}</option>
                        </c:forEach>
                    </select>
                    <h5>Details</h5>
                    <textarea name="detail" id="" cols="110" rows="5">This screen will display the list of patients who have registered for today's examination. It also displays the patient's examination order based on the registration time and indicates whether the patient is currently being examined.
                    </textarea>
                    <!--                    <h5>Result</h5>
                                        <textarea name="result" id="" cols="110" rows="3">This screen will display the list of patients who have registered for today's examination. It also displays the patient's examination order based on the registration time and indicates whether the patient is currently being examined.
                                        </textarea>-->
                    Price: <input type="number" name="price">
                    <input class="submit" type="submit" value="Submit">
                </form>
            </div>
        </div>
    </body>
</html>