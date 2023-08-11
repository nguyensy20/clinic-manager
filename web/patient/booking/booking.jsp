<%-- 
    Document   : booking
    Created on : Feb 2, 2023, 5:22:41 PM
    Author     : nguye
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="file" class="util.FileHelper"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <style><%@include file="../../css/bootstrap.min.css"%></style>
        <style><%@include file="booking-style.css"%></style>
    </head>
    <body>
        <header>
            <div class="container" >
                <div class="row">
                    <div class="col-md-3"><img src="..\image\logo.png" alt="logo" ></div>
                    <div class="col-md-6">
                        <div class="menu">
                            <nav>
                                <a class = "text-link" href="..\home">Home</a>
                                <a class = "text-link" href="">Disease List</a>
                                <a class = "text-link" href="">Treatment List</a>
                                <a class = "text-link" href="booking">Booking</a>
                            </nav>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="auth">
                            <a class = "text-link" href="../login">Login</a>
                            <a class = "text-link" href="">Sign up</a>
                            <a class = "text-link" href="../logout">Logout</a>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <div class="container">
            <div class="col-md-2 column"></div>
            <div class="col-md-8 column">
                <form action="booking"  method="post" >
                    <input type="hidden" name="patient_id" value="${sessionScope.user.id}">
                    Date: <input type="date" name="booking-time"> <br>
                    <textarea name="reason" id="" cols="85" rows="5" placeholder="Reason"></textarea> <br>
                    <input type="submit" value="Book">
                </form>
            </div>
            <div class="col-md-2 column"></div>
        </div>
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <img src="../image/logo.png" alt="logo" style="height: 40px;">
                        <p>Phòng khám tai mũi họng</p>
                        <p>28 Thành Thái, Dịch Vọng, Cầu Giấy, Hà Nội
                        <p>ĐKKD số: 0106790291. Sở KHĐT Hà Nội cấp ngày 16/03/2015</p>
                    </div>
                    <div class="col-md-3">
                        <div class="link">
                            <a class="text-link" href="">Đặt lịch khám</a>
                            <a class="text-link" href="">Giới thiệu</a>
                            <a class="text-link" href=""> Quy trình khám bệnh</a>
                            <a class="text-link" href="">Hỗ trợ giải quyết khiếu nại</a>
                            <a class="text-link" href="">Tuyển dụng</a>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="contact">
                            <a href=""><img src="../image/logo-facebook.png" alt="facebook"></a>
                            <a href=""><img src="../image/logo-gmail.png" alt="gmail"></a>
                            <a href=""><img src="../image/logo-youtube.png" alt="youtube"></a>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </body>
</html>