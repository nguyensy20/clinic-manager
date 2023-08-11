<%-- 
    Document   : ListMedicalRecords
    Created on : Feb 26, 2023, 6:05:25 PM
    Author     : vkhoa
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="helper" class="util.DateTimeHelper"/>
<jsp:useBean id="user" class="dal.UserDBContext"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="Start your development with Steller landing page.">
        <meta name="author" content="Devcrud">
        <title>Patient</title>
        <!-- font icons -->
        <link rel="stylesheet" href="../dashboard_style/assets/vendors/themify-icons/css/themify-icons.css">
        <!-- Bootstrap + Steller main styles -->
        <link rel="stylesheet" href="../dashboard_style/assets/css/steller.css">
        <!-- Favicon -->
        <link rel="icon" type="image/x-icon" href="../dashboard_style/assets/img/logo.svg" />

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet"
            />

        <!-- Icons. Uncomment required icon fonts -->
        <link rel="stylesheet" href="../dashboard_style/assets/vendor/fonts/boxicons.css" />

        <!-- Core CSS -->
        <link rel="stylesheet" href="../dashboard_style/assets/vendor/css/core.css" class="template-customizer-core-css" />
        <link rel="stylesheet" href="../dashboard_style/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
        <link rel="stylesheet" href="../dashboard_style/assets/css/demo.css" />

        <!-- Vendors CSS -->
        <link rel="stylesheet" href="../dashboard_style/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

        <link rel="stylesheet" href="../dashboard_style/assets/vendor/libs/apex-charts/apex-charts.css" />

        <!-- Page CSS -->

        <!-- Helpers -->
        <script src="../dashboard_style/assets/vendor/js/helpers.js"></script>

        <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
        <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
        <script src="../dashboard_style/assets/js/config.js"></script>
    </head>


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
                        <a class="nav-link" href="/SWP391_Project/home">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#service">Service</a>
                    </li>                                                              

                    <c:set var="hasAdminRole" value="false"/>                       
                    <c:forEach items="${sessionScope.user.roles}" var="role">
                        <c:if test="${role.name eq 'Admin' || role.name eq 'Doctor' || role.name eq 'Manage'}">
                            <c:if test="${not hasAdminRole}">                                   
                                <li class="nav-item">
                                    <a class="nav-link" href="/SWP391_Project/admin/dashboard">Manage</a>
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
                            <a class="nav-link" href="/SWP391_Project/patient/booking">Booking</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#contact">Contact</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/SWP391_Project/common/profile">User Profile</a>
                        </li>
                        <li class="nav-item">
                            <a class="- btn btn-primary rounded ml-4" href="/SWP391_Project/logout">Logout</a>
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
                            <a class="- btn btn-primary rounded ml-4" href="/SWP391_Project/login">Login</a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>          
    </nav>
    <!-- End of page navibation -->

    <div class="content-wrapper" style="margin-left: 150px; margin-top: 70px ">
        <!-- Content -->
        <div class="container-xxl flex-grow-1 container-p-y">
            <div class="row">
                <!-- Basic -->
                <div class="col-md-10">
                    <div class="card mb-4">
                        <div class="card-body">
                            <c:set var="md" value="${requestScope.medicalReport}"></c:set>
                            <c:set var="p" value="${requestScope.patient}"></c:set>
                            <c:set var="d" value="${requestScope.doctor}"></c:set>
                                <div style="text-align: center">
                                    <h3> <i class="fab fa-angular fa-lg text-danger me-3">Hóa đơn</i></h3>
                                </div>

                                <h5>
                                    <i class="fab fa-angular fa-lg text-danger me-3">I.Phần hành chính</i>
                                </h5>
                                <div class="demo-inline-spacing mt-3" style="margin-bottom: 15px">
                                    <ol class="list-group list-group-numbered">
                                        <li class="list-group-item">Họ tên người bệnh: ${p.name}</li>
                                    <li class="list-group-item">Ngày, tháng, năm sinh: ${p.dob}</li>
                                    <li class="list-group-item">Địa chỉ hiện tại: ${p.address}</li>
                                    <li class="list-group-item">Thời gian khám: ${helper.toDateTimeSql(md.time)}</li>
                                    <li class="list-group-item">Bác sĩ: Doctor ${d.name}</li>
                                </ol>
                            </div>

                            <h5> 
                                <i class="fab fa-angular fa-lg text-danger me-3">II. Hóa đơn khám bệnh, chữa bệnh</i>
                            </h5>                          
                            <div class="table-responsive text-nowrap" >
                                <table class="table table-bordered" style="text-align: center">
                                    <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Tên phương pháp, dịch vụ </th>
                                            <th>Đơn giá(VNĐ) </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="countTreatment" value="1"/>
                                        <c:set var="totalTreatmentPrice" value="0"></c:set>
                                        <c:forEach items="${md.treatments}" var="t">

                                            <tr>
                                                <td>${countTreatment}</td>
                                                <td>${t.name}</td>
                                                <td><fmt:formatNumber value="${t.price}" pattern="#,###"/></td>
                                            </tr>
                                            <c:set var="countTreatment" value="${countTreatment + 1}"/>
                                            <c:set var="totalTreatmentPrice" value="${totalTreatmentPrice+t.price}"></c:set>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <strong style="margin-top: 10px; float: right">
                                    <i class="fab fa-angular fa-lg text-danger me-3">
                                        Tổng chi phí KCB: <fmt:formatNumber value="${totalTreatmentPrice}" pattern="#,###"/> VNĐ
                                    </i>

                                </strong><br/>

                                <h5 style="margin-top: 15px"> 
                                    <i class="fab fa-angular fa-lg text-danger me-3">III. Hóa đơn thuốc</i>
                                </h5>                               
                                <div class="table-responsive text-nowrap">
                                    <table class="table table-bordered" style="text-align: center">
                                        <thead>
                                            <tr>
                                                <th>STT</th>
                                                <th>Thuốc</th>
                                                <th>Số lượng</th>
                                                <th>Đơn giá(VNĐ) </th>
                                                <th>Thành tiền(VNĐ) </th>
                                            </tr>
                                        </thead>
                                        <c:set var="countDrug" value="1"/>
                                        <c:set var="totalDrugPrice" value="0"></c:set>
                                            <tbody>
                                            <c:forEach items="${md.drugs}" var="d">

                                                <tr>
                                                    <td>${countDrug}</td>
                                                    <td>${d.name}</td>
                                                    <td>${d.amount}</td>
                                                    <td><fmt:formatNumber value="${d.price}" pattern="#,###"/></td>
                                                    <c:set var="drugPrice" value="${d.amount*d.price}"></c:set>
                                                    <c:set var="totalDrugPrice" value="${totalDrugPrice + drugPrice}"></c:set>
                                                    <td><fmt:formatNumber value="${drugPrice}" pattern="#,###"/></td>
                                                </tr>
                                                <c:set var="countDrug" value="${countDrug + 1}"/>                         
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <strong style="margin-top: 10px; float: right">
                                    <i class="fab fa-angular fa-lg text-danger me-3">
                                        Tổng chi phí thuốc: <fmt:formatNumber value="${totalDrugPrice}" pattern="#,###"/> VNĐ
                                    </i>      
                                </strong><br/>
                                <strong style="margin-top: 10px; float: right">
                                    <i class="fab fa-angular fa-lg text-danger me-3">
                                        Tổng tiền phải trả = Tổng chi phí KCB + Tổng chi phí thuốc 
                                        = <fmt:formatNumber value="${totalTreatmentPrice}" pattern="#,###"/> 
                                        + <fmt:formatNumber value="${totalDrugPrice}" pattern="#,###"/> 
                                        = <fmt:formatNumber value="${totalDrugPrice + totalTreatmentPrice}" pattern="#,###"/>  VNĐ
                                    </i>      
                                </strong><br/>  
                            </div>
                            <div style="float: right; margin-top: 20px">
                                <a href="/SWP391_Project/patient/medical-report-list?patientId=${sessionScope.user.id}">
                                    <button class="btn btn-primary" >Back</button>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>   
        </div>

        <!-- / Content -->


        <div class="content-backdrop fade"></div>
    </div>
    <script src="../dashboard_style/assets/vendors/jquery/jquery-3.4.1.js"></script>
    <script src="../dashboard_style/assets/vendors/bootstrap/bootstrap.bundle.js"></script>
    <!-- bootstrap 3 affix -->
    <script src="../dashboard_style/assets/vendors/bootstrap/bootstrap.affix.js"></script>

    <!-- steller js -->
    <script src="../dashboard_style/assets/js/steller.js"></script>
    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="../dashboard_style/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="../dashboard_style/assets/vendor/libs/popper/popper.js"></script>
    <script src="../dashboard_style/assets/vendor/js/bootstrap.js"></script>
    <script src="../dashboard_style/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="../dashboard_style/assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="../dashboard_style/assets/vendor/libs/apex-charts/apexcharts.js"></script>

    <!-- Main JS -->
    <script src="../dashboard_style/assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="../dashboard_style/assets/js/dashboards-analytics.js"></script>

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>

</html>
