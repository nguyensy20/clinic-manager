<%-- 
    Document   : home
    Created on : Oct 17, 2022, 10:28:01 AM
    Author     : sonnt
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="dal.UserDBContext"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="Start your development with Steller landing page.">
        <meta name="author" content="Devcrud">
        <title>G3 ENT Clinic</title>
        <!-- font icons -->
        <link rel="stylesheet" href="assets/vendors/themify-icons/css/themify-icons.css">
        <!-- Bootstrap + Steller main styles -->
        <link rel="stylesheet" href="assets/css/steller.css">

    </head>
    <body data-spy="scroll" data-target=".navbar" data-offset="40" id="home">
        <!-- Page navigation -->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top" data-spy="affix" data-offset-top="0">
            <div class="container">
                <a class="navbar-brand" href="#"><img src="assets/imgs/logo.svg" alt=""></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto align-items-center">
                        <li class="nav-item">
                            <a class="nav-link" href="#home">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#service">Service</a>
                        </li>                                                              

                        <c:set var="hasAdminRole" value="false"/>                       
                        <c:forEach items="${sessionScope.user.roles}" var="role">
                            <c:if test="${role.name eq 'Admin' || role.name eq 'Doctor' || role.name eq 'Manage'}">
                                <c:if test="${not hasAdminRole}">                                   
                                    <li class="nav-item">
                                        <a class="nav-link" href="admin/dashboard">Manage</a>
                                    </li>                                   
                                    <c:set var="hasAdminRole" value="true"/>
                                </c:if>
                            </c:if>
                            <c:if test="${role.name eq 'Patient'}">                           
                                <li class="nav-item">
                                    <a class="nav-link" href="/SWP391_Project/patient/medical-report-list?patientId=${sessionScope.user.id}">Bệnh án</a>
                                </li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${sessionScope.user ne null}">
                            <li class="nav-item">
                                <a class="nav-link" href="patient/booking">Booking</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#contact">Contact</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="common/profile">User Profile</a>
                            </li>
                            <li class="nav-item">
                                <a class="- btn btn-primary rounded ml-4" href="logout">Logout</a>
                            </li> 
                        </c:if>
                        <c:if test="${sessionScope.user eq null}">

                            <li class="nav-item">
                                <a class="nav-link" href="/SWP391_Project/login">Booking</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#contact">Contact</a>
                            </li>
                            <li class="nav-item">
                                <a class="- btn btn-primary rounded ml-4" href="login">Login</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>          
        </nav>
        <!-- End of page navibation -->

        <!-- Page Header -->
        <header class="header" id="home">
            <div class="container">
                <div class="infos">              
                    <h6 class="title">G3 ENT Clinic</h6>
                    <div class="buttons pt-3">
                        <p class="mb-5 pb-4">Kết quả chuẩn vàng - An Toàn điều trị</p>
                    </div>      
                    <div class="socials mt-4">
                        <a class="social-item" href="javascript:void(0)"><i class="ti-facebook"></i></a>
                        <a class="social-item" href="javascript:void(0)"><i class="ti-google"></i></a>
                        <a class="social-item" href="javascript:void(0)"><i class="ti-github"></i></a>
                        <a class="social-item" href="javascript:void(0)"><i class="ti-twitter"></i></a>
                    </div>
                </div>              
                <div class="img-holder">
                    <img src="assets/imgs/man.svg" alt="">
                </div>      
            </div>  

            <!-- Header-widget -->
            <div class="widget">
                <div class="widget-item">
                    <p>Đang khám</p>
                    <h2>4</h2>
                </div>
                <div class="widget-item">
                    <p>Hàng đợi</p>
                    <h2>12</h2>
                </div>

            </div>
        </header>
        <!-- End of Page Header -->

        <!-- About section -->

        <!-- Service section -->
        <section id="service" class="section">
            <div class="container text-center">

                <h6 class="section-title mb-4">Dịch vụ</h6>
                <p class="mb-5 pb-4">Đội ngũ bác sĩ giàu kinh nghiệm và chuyên môn cao, thiết bị tiến tiến và phương pháp điều trị hiện đại. <br/> Hãy gặp chúng tôi để cảm nhận sự khác biệt!</p>

                <div class="row">
                    <c:forEach items="${requestScope.services}" var="s">
                        <div class="col-sm-6 col-md-3 mb-4">
                            <div class="custom-card card border">
                                <div class="card-body">                                  
                                    <h5>${s.name}</h5>
                                    <p class="mb-5 pb-4">${s.description}</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>



        <!-- Testmonial Section -->
        <section id="testmonial" class="section">
            <div class="container text-center">               
                <h6 class="section-title mb-4">Đội Ngũ Y Bác Sỹ </h6>
                <p class="mb-5 pb-4">Được đào tạo và tốt nghiệp từ các trường y tế hàng đầu, trình độ chuyên môn cao và kinh nghiệm lâu năm, liên tục được cập nhật về các kỹ thuật mới nhất và tiên tiến nhất trong lĩnh vực y tế.</p>


                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div class="card testmonial-card border">
                                <div class="card-body">
                                    <img src="assets/imgs/avatar-1.jpg" alt="">
                                    <p>Dr A</p>
                                    <h1 class="title">Có hơn 10 năm kinh nghiệm làm việc trong lĩnh vực tai mũi họng.
                                        Đã tham gia và thực hiện hàng trăm ca phẫu thuật tai mũi họng thành công.
                                        Tận  tâm và chu đáo với bệnh nhân của mình, luôn lắng nghe và đưa ra những lời khuyên tốt nhất cho bệnh nhân.</h1>

                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="card testmonial-card border">
                                <div class="card-body">
                                    <img src="assets/imgs/avatar-2.jpg" alt="">
                                    <p>Dr K</p>
                                    <h1 class="title">Là bác sĩ chuyên khoa tai mũi họng được đào tạo tại một trường đại học hàng đầu.
                                        Có kinh nghiệm làm việc tại nhiều bệnh viện lớn và đạt được nhiều thành tích trong điều trị bệnh nhân tai mũi họng.
                                        Luôn cập nhật những công nghệ và phương pháp điều trị mới nhất để đem lại hiệu quả cao nhất cho bệnh nhân của mình.</h1>

                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="card testmonial-card border">
                                <div class="card-body">
                                    <img src="assets/imgs/avatar-3.jpg" alt="">
                                    <p>Dr F</p>
                                    <h1 class="title">Là bác sĩ chuyên khoa tai mũi họng tâm huyết và luôn đặt lợi ích của bệnh nhân lên hàng đầu.
                                        Có nhiều kinh nghiệm trong việc điều trị các bệnh lý tai mũi họng phức tạp và đã giúp hàng nghìn bệnh nhân khắp nơi cảm thấy khỏe mạnh hơn.
                                       Tận tâm và sẵn sàng dành thời gian để tìm hiểu rõ về tình trạng sức khỏe của bệnh nhân và đưa ra phương án điều trị phù hợp nhất.</h1>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End of testmonial section -->

        <!-- Blog Section -->
        

        <!-- Hire me section -->
            
        <!-- End od Hire me section. -->

        <!-- Contact Section -->
        <section id="contact" class="position-relative section">
           
            <div id="map">
                <iframe src="https://snazzymaps.com/embed/61257"></iframe>
            </div>      
        </section>
        <!-- End of Contact Section -->

        <!-- Page Footer -->
        <footer class="page-footer">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-sm-6">
                        <p>Copyright <script>document.write(new Date().getFullYear())</script> &copy; <a href="http://www.devcrud.com" target="_blank">DevCRUD</a></p>
                    </div>
                    <div class="col-sm-6">
                        <div class="socials">
                            <a class="social-item" href="javascript:void(0)"><i class="ti-facebook"></i></a>
                            <a class="social-item" href="javascript:void(0)"><i class="ti-google"></i></a>
                            <a class="social-item" href="javascript:void(0)"><i class="ti-github"></i></a>
                            <a class="social-item" href="javascript:void(0)"><i class="ti-twitter"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </footer> 
        <!-- End of page footer -->

        <!-- core  -->
        <script src="assets/vendors/jquery/jquery-3.4.1.js"></script>
        <script src="assets/vendors/bootstrap/bootstrap.bundle.js"></script>
        <!-- bootstrap 3 affix -->
        <script src="assets/vendors/bootstrap/bootstrap.affix.js"></script>

        <!-- steller js -->
        <script src="assets/js/steller.js"></script>

    </body>
</html>
