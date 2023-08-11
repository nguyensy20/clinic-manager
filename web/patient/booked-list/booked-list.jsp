<%-- 
    Document   : my-booking-list.jsp
    Created on : Feb 2, 2023, 5:26:38 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="helper" class="util.DateTimeHelper"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My booked list</title>
    <style><%@include file="../../css/bootstrap.min.css"%></style>
    <style><%@include file="booked-list-style.css"%></style>
</head>
<body>
    <header>
        <div class="container" >
            <div class="row">
                <div class="col-md-3"><img src="../image/logo.png" alt="logo" ></div>
                <div class="col-md-6">
                    <div class="menu">
                        <nav>
                            <a href="../home" class="text-link">Home</a>
                            <a href="" class="text-link">Disease List</a>
                            <a href="" class="text-link">Treatment List</a>
                            <a href="booking" class="text-link">Booking</a>
                        </nav>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="auth">
                        <a href="../login"  class="text-link">Login</a>
                        <a href="" class="text-link">Sign up</a>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <div class="container">
        <div class="col-md-8">
            <h3>Future</h3>
            <c:forEach items="${requestScope.bookings}" var="b">
                <c:if test="${helper.isHistory(b.booking_time) eq 0}">
                    <div class="row future">
                        <div class="col-md-10 left">
                            <img src="../image/doctor/mrf.jpg" alt="mr" class="doctor-img">
                            ${b.booking_time} 
                            <br>
                            ${b.reason}
                        </div>
                        <div class="col-md-2">
                            <a class="btn btn-primary" href="../remove-booking?booking_time=${b.booking_time}">Remove</a>
                        </div>  
                    </div>
                </c:if>
            </c:forEach>
            <h3>History</h3>
            <select name="" id="">
                <option value="">Done</option>
                <option value="">Latest</option>
                <option value="">Newest</option>
            </select>
            <c:forEach items="${requestScope.bookings}" var="b">
                <c:if test="${helper.isHistory(b.booking_time) eq 1}">
                    <div class="row future">
                        <div class="col-md-10 left">
                            <img src="../image/doctor/mrf.jpg" alt="mr" class="doctor-img">
                            ${b.booking_time} 
                            <br>
                            ${b.reason}
                            <br><!-- comment -->
                            Status: 
                            <c:if test="${b.status}">
                                <b style="color: green">Done</b>
                            </c:if>
                            <c:if test="${!b.status}">
                                <b style="color: red">Cancel</b>
                            </c:if>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
        <div class="col-md-4">

        </div>
    </div>
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <img src="..\image\logo.png" alt="logo" style="height: 40px;">
                    <p>Phòng khám tai mũi họng</p>
                    <p>28 Thành Thái, Dịch Vọng, Cầu Giấy, Hà Nội
                    <p>ĐKKD số: 0106790291. Sở KHĐT Hà Nội cấp ngày 16/03/2015</p>
                </div>
                <div class="col-md-3">
                    <div class="link">
                        <a class = "footer-link" href="">Đặt lịch khám</a>
                        <a class = "footer-link" href="">Giới thiệu</a>
                        <a class = "footer-link" href=""> Quy trình khám bệnh</a>
                        <a class = "footer-link" href="">Hỗ trợ giải quyết khiếu nại</a>
                        <a class = "footer-link" href="">Tuyển dụng</a>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="contact">
                        <a class = "footer-link" href=""><img src="..\image\logo-facebook.png" alt="facebook"></a>
                        <a class = "footer-link" href=""><img src="..\image\logo-gmail.png" alt="gmail"></a>
                        <a class = "footer-link" href=""><img src="..\image\logo-youtube.png" alt="youtube"></a>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>
