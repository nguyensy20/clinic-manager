<%-- 
    Document   : dashboard
    Created on : Feb 14, 2023, 11:49:07 AM
    Author     : vkhoa
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <c:set var="m" value="${requestScope.medicalReport}"></c:set>
            <c:set var="p" value="${sessionScope.patient}"></c:set>
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
                        <!-- Content wrapper -->
                        <div class="content-wrapper">
                            <!-- Content -->
                            <div class="container-xxl flex-grow-1 container-p-y">
                                <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light"></span>Bill</h4>
                                <a href="bill-list">
                                    <button class="btn btn-primary">Back</button>
                                </a>
                                <div class="row">
                                    <!-- Basic -->
                                    <div class="col-md-10">
                                        <div class="card mb-4">
                                            <div class="card-body">
                                                <c:set var="md" value="${requestScope.medicalReport}"></c:set>
                                                <c:set var="p" value="${requestScope.patient}"></c:set>
                                                <c:set var="d" value="${requestScope.doctor}"></c:set>
                                                    <form action="create-bill" method="post">
                                                        <input type="hidden" name="time" value="${requestScope.time}">
                                                    <input type="hidden" name="patient_id" value="${requestScope.patient.id}">
                                                    <input type="hidden" name="doctor_id" value="${requestScope.doctor.id}">
                                                    <h5>I.Phần hành chính</h5>
                                                    <div class="demo-inline-spacing mt-3">
                                                        <ol class="list-group list-group-numbered">
                                                            <li class="list-group-item">Họ tên người bệnh: ${p.name}</li>
                                                            <li class="list-group-item">Ngày, tháng, năm sinh: ${p.dob}</li>
                                                            <li class="list-group-item">Địa chỉ hiện tại: ${p.address}</li>
                                                            <li class="list-group-item">Đến khám: ${md.time}</li>
                                                            <li class="list-group-item">Bác sĩ: ${d.name}</li>
                                                        </ol>
                                                    </div>
                                                    <h5>II. Chi phí khám bệnh, chữa bệnh </h5>
                                                    (Chi phí KCB ngày ${md.time})
                                                    <div class="table-responsive text-nowrap">
                                                        <table class="table table-bordered">
                                                            <thead>
                                                                <tr>
                                                                    <th>STT</th>
                                                                    <th>Tên phương pháp, dịch vụ </th>
                                                                    <th>Đơn giá </th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:set var="count" value="1"/>
                                                                <c:set var="total" value="0"></c:set>
                                                                <c:forEach items="${md.treatments}" var="t">
                                                                    1
                                                                    <tr>
                                                                        <td>${count}</td>
                                                                        <td>${t.name}</td>
                                                                        <td>${t.price}</td>
                                                                    </tr>
                                                                    <c:set var="count" value="${count + 1}"/>
                                                                    <c:set var="total" value="${total+t.price}"></c:set>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                        <strong>
                                                            Tổng chi phí KCB: ${total} đồng 
                                                        </strong>
                                                        <h5>III. Đơn thuốc </h5>
                                                        (Chi phí thuốc ngày  ${md.time})
                                                        <div class="table-responsive text-nowrap">
                                                            <table class="table table-bordered">
                                                                <thead>
                                                                    <tr>
                                                                        <th>STT</th>
                                                                        <th>Thuốc</th>
                                                                        <th>Đơn vị </th>
                                                                        <th>Liều lượng</th>
                                                                        <th>Số lượng</th>
                                                                        <th>Đơn giá </th>
                                                                        <th>Thành tiền </th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:forEach items="${md.drugs}" var="d">
                                                                        2
                                                                        <tr>
                                                                            <td>${count}</td>
                                                                            <td>${d.name}</td>
                                                                            <td></td>
                                                                            <td>${d.dosage}</td>
                                                                            <td>${d.amount}</td>
                                                                            <td>${d.price}</td>
                                                                            <c:set var="drugPrice" value="${d.amount*d.price}"></c:set>
                                                                            <td>${drugPrice}</td>
                                                                        </tr>
                                                                        <c:set var="count" value="${count + 1}"/>
                                                                        <c:set var="total" value="${total+drugPrice}"></c:set>
                                                                    </c:forEach>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <strong>
                                                            Tổng chi phí thuốc: <br>
                                                            Tổng cộng: ${total} đồng<br>
                                                        </strong>
                                                        <input type="checkbox" name="is_paid" value="1"> Đã trả tiền <br>
                                                    </div>
                                                    <button type="submit" class="btn btn-primary" name="submit" value="submit">Save</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- / Content -->


                            <div class="content-backdrop fade"></div>
                        </div>
                        <!-- Content wrapper -->
                        <!-- Content -->
                        <!-- Bordered Table -->

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

