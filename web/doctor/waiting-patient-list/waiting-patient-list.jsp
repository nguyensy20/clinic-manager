<%-- 
    Document   : waiting-patient-list
    Created on : Feb 16, 2023, 7:38:40 AM
    Author     : nguye
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="dal.UserDBContext"/>
<jsp:useBean id="time" class="util.DateTimeHelper"/>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <style><%@include file="../../css/bootstrap.min.css"%></style>
        <style><%@include file="waiting-patient-list-style.css"%></style>
    </head>

    <body>
        <div class="container page">
            <div class="two-list">
                <h1>Edit Waiting Paient List</h1>
                <form action="waiting-patient-list" method="post">
                    Find by name: <input type="text" name="name">
                    <input type="submit" value="Find">
                </form>
                <h2>Result</h2>
                <form  action="waiting-patient-list" method="post">
                    <input type="hidden" name="edit" value="1"> 
                    <table class="patient-table">
                        <tr>
                            <th>Name</th>
                            <th>Phone</th>
                            <th>Nearest booking time</th>
                            <th>Reason</th>
                            <th class="status">Add to waiting list</th>
                        </tr>
                        <c:forEach items = "${requestScope.patients}" var="p">
                            <tr>
                                <td>${p.name}</td>
                                <td>${p.phone}</td>
                                <c:forEach items="${p.books}" var="b">
                                    <td>${b.booking_time}</td>
                                    <td>${b.reason}</td>
                                </c:forEach>
                                <td class="status">
                                    <input type="checkbox" name="patient-${p.id}" value="0">
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                    <h2>Waiting list</h2>
                    <table class="patient-table">
                        <tr>
                            <th>Name</th>
                            <th>Reason</th>
                            <th>Edit</th>
                            <th class="status">Status/Room</th>
                        </tr>
                        <c:forEach items="${requestScope.waitingPatients}" var="wp">
                            <tr>
                                <c:set var="patient_id" value="${wp.patient_id}"></c:set>
                                <td>${user.getNameById(patient_id)}</td>
                                <td>${wp.reason}</td>
                                <td><a href="edit-examination?doctor_id=${sessionScope.user.id}&patient_id=${wp.patient_id}">Edit examination</a></td>
                                <td class="status">
                                    <select class="status-select" name="patient-${wp.patient_id}" id="">
                                        <c:forEach items="${requestScope.rooms}" var="r">
                                            <c:if test="${wp.room eq r}" >
                                                <option value="${r}" selected>${r}</option>
                                            </c:if>
                                            <c:if test="${(wp.room ne r)}">
                                                <option value="${r}">${r}</option>                                                
                                            </c:if>
                                        </c:forEach>
                                        <c:if test="${wp.room eq 0}">
                                            <option value="0" selected>Waiting</option>
                                        </c:if>
                                        <c:if test="${wp.room ne 0}">
                                            <option value="0">Waiting</option>
                                        </c:if>
                                        <option value="-1">Delete</option>
                                    </select>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                    <input class="submit" type="submit" name="" id="" value="Submit">
                </form>
            </div>
        </div>
    </body>

</html>