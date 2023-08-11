<%-- 
    Document   : dashboard
    Created on : Feb 14, 2023, 11:49:07 AM
    Author     : vkhoa
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="user" class="dal.UserDBContext"/>
<jsp:useBean id="time" class="util.DateTimeHelper"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv<!DOCTYPE html>


    <html
        lang="en"
        class="light-style layout-menu-fixed"
        dir="ltr"
        data-theme="theme-default"
        data-assets-path="../dashboard_style/assets/"
        data-template="vertical-menu-template-free"
        >
        <head>
            <meta charset="utf-8" />
            <meta
                name="viewport"
                content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
                />

            <title>Admin</title>

            <meta name="description" content="" />

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

        <body>
            <!-- Layout wrapper -->
            <div class="layout-wrapper layout-content-navbar">
                <div class="layout-container">
                    <!-- Menu -->
                    <jsp:include page="../components/Menu.jsp" />

                    <!-- / Menu -->

                    <!-- Layout container -->
                    <div class="layout-page">
                        <!-- Navbar -->

                        <jsp:include page="../components/Navbar.jsp" />

                        <!-- / Navbar -->

                        <!-- Content wrapper -->

                        <!-- Content -->

                        <!-- Bordered Table -->
                        <div class="card" style="margin-top: 20px; margin-left: 20px">
                            <h5 class="card-header" style="">Edit Waiting Paient List</h5>
                            <!-- Serch -->
                            <form action="waiting-patient-list" method="post" id="search-form">
                                <div class="col-md-6" style="margin-top: -30px">
                                    <div class="card-body demo-vertical-spacing demo-only-element">
                                        <div class="input-group input-group-merge">
                                            <span class="input-group-text" id="basic-addon-search31">
                                                <i class="bx bx-search"></i>
                                            </span>
                                            <input
                                                type="text"
                                                class="form-control"
                                                placeholder="Search By Name..."
                                                aria-label="Search By Name..."
                                                aria-describedby="basic-addon-search31"
                                                name="name"
                                                id="search-input"
                                                />
                                        </div>
                                    </div>
                                </div>
                                <button type="submit" style="display: none;"></button>
                            </form>
                            <script> // Search
                                // Bắt sự kiện nhấn enter
                                document.getElementById("search-input").addEventListener("keypress", function (event) {
                                    if (event.keyCode === 13) {
                                        event.preventDefault(); // Ngăn chặn form submit mặc định
                                        document.getElementById("search-form").submit(); // Gửi request
                                    }
                                });

                                // Bắt sự kiện click icon tìm kiếm
                                document.getElementById("basic-addon-search31").addEventListener("click", function (event) {
                                    event.preventDefault(); // Ngăn chặn form submit mặc định
                                    document.getElementById("search-form").submit(); // Gửi request
                                });
                            </script>

                            <div class="card-body" style="margin-top: -75px;  white-space: pre-wrap;">
                                <div class="table-responsive text-nowrap">

                                    <form  action="waiting-patient-list" method="post">
                                        <input type="hidden" name="edit" value="1"> 
                                        <table class="table table-bordered" style="text-align: center">
                                            <thead>
                                                <tr>
                                                    <th style="width: 20%" >Name</th>
                                                    <th style="width: 20%">Phone</th>
                                                    <th style="width: 25%">Address</th>
                                                    <th style="width: 5%">Add to waiting list</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items = "${requestScope.patients}" var="p">
                                                    <tr>
                                                        <td>${p.name}</td>
                                                        <td>${p.phone}</td>
                                                        <td>${p.address}</td>
                                                        <td >
                                                            <div  style="margin-left: 8px; margin-bottom: 8px; align-items: center">
                                                                <input class="form-check-input" type="checkbox" name="patient-${p.id}" value="0" style="color: orange" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <h5 class="card-header">Waiting list</h5>
                                        <table class="table table-bordered" style="text-align: center;">
                                            <thead>
                                                <tr>
                                                    <th style="" >Name</th>
                                                    <th style="">Edit</th>
                                                    <th>Room/Status</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.waitingPatients}" var="wp">
                                                    <tr>
                                                        <c:set var="patient_id" value="${wp.patient_id}"></c:set>
                                                        <td>${user.getNameById(patient_id)}</td>
                                                        <td>
                                                            <a style="color: gray;display: inline-block;" href="edit-examination?doctor_id=${sessionScope.user.id}&patient_id=${wp.patient_id}">
                                                                <i class="bx bx-edit-alt me-1"></i> Edit examination
                                                            </a>
                                                            
                                                        </td>
                                                        <td>${wp.room}</td>
                                                        <td><a href="waiting-patient-list?action=delete&patient_id=${wp.patient_id}">Delete</a></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <button style="float: right; margin-top: 10px" type="submit" class="btn btn-outline-secondary">Submit</button>
                                    </form>

                                </div>
                            </div>
                        </div>
                        <!--/ Bordered Table -->

                        <!-- / Content -->

                        <!-- Footer -->

                        <!-- / Footer -->


                        <!-- Content wrapper -->
                    </div>
                    <!-- / Layout page -->
                </div>

                <!-- Overlay -->
                <div class="layout-overlay layout-menu-toggle"></div>
            </div>
            <!-- / Layout wrapper -->



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
        </body>

