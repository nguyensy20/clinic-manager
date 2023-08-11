<%-- 
    Document   : edit-examination
    Created on : Feb 16, 2023, 7:39:06 AM
    Author     : nguye
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <style><%@include file="../../css/bootstrap.min.css"%></style>
        <style><%@include file="edit-examination.css"%></style>
    </head>

    <body>
        <c:set var="m" value="${requestScope.medicalReport}"></c:set>
        <c:set var="p" value="${sessionScope.patient}"></c:set>
        <div class="menu-right">
            <ul>
                <li><a href="add-treatment?symptom=${m.symptom}">Add treatment</a></li>
                <li><a href="add-drug">Add drug</a></li>
                <li><a href="">View Medical Report</a></li>
                <li><a href="waiting-patient-list">Back</a></li>
            </ul>
        </div>
        <div class="container">
            <form action="edit-examination" method="post">
                <div class="examination">
                    <div class="profile">
                        <div class="col-md-3 image">
                            <img src="../../image/logo.png" alt="">
                        </div>
                        <div class="col-md-9">
                            <h2>${p.name} - ${p.phone}</h2>
                            <table>
                                <tr>
                                    <c:if test="${p.gender}">
                                        <td>Nam</td>
                                    </c:if>
                                    <c:if test="${!p.gender}">
                                        <td>Nữ</td>
                                    </c:if>
                                    <td>${p.address}</td>
                                </tr>
                                <tr>
                                    <td>21 tuoi</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="information">
                        <h4>Notes</h4>
                        <textarea name="description" id="" cols="30" rows="5">${p.description}
                        </textarea>
                        <h3 style="color: rgb(0, 0, 0);">Examination</h3>
                    </div>
                    <div class="Exam">
                        <table class="clinical-exam">
                            <tr>
                                <td>Pulse <input type="number" name="pulse" value="${m.pulse}"></td>
                                <td>Blood pressure<input type="number" name="bloodPress" value="${m.bloodPress}"></td>
                                <td>Breathing<input type="number" name="breathing" value="${m.breathing}"></td>
                            </tr>
                            <tr>
                                <td>Height<input type="number" name="height" value="${m.height}"></td>
                                <td>Weight<input type="number" name="weight" value="${m.weight}"></td>
                            </tr>
                        </table>
                        <h5>Symptoms</h5>
                        <textarea name="symptoms" id="" cols="30" rows="2">${m.symptom}</textarea>
                        <h5>Result/Diseases</h5>
                        <textarea name="result" id="" cols="30" rows="2">${m.result}</textarea>
                        <input class="submit" type="submit" name="draft" value="Draft">
                        <input class="submit" type="submit" name="submit" value="Submit">
                    </div>
                </div>
            </form>
        </div>
    </body>

</html>