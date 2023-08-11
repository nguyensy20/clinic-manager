<%-- 
    Document   : add-drug
    Created on : Feb 18, 2023, 2:50:41 PM
    Author     : nguye
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        Add drug
        <form action="add-drug" method="post">
            <input type="hidden" name="doctor_id" value="${sessionScope.user.id}">
            <input type="hidden" name="patient_id" value="${sessionScope.patient.id}">
            <input type="hidden" name="time" value="${sessionScope.time}">
            <select name="drug">
                <c:forEach items="${requestScope.drugs}" var="d">
                    <option value="${d.id}">${d.name}</option>
                </c:forEach>
            </select>
            <input type="submit" value="submit">
        </form>
    </body>
</html>
