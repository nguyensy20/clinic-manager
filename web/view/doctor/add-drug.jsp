<%-- 
    Document   : dashboard
    Created on : Feb 14, 2023, 11:49:07 AM
    Author     : vkhoa
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>

    <head>
        <meta http-equiv<!DOCTYPE html>


    <html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default"
          data-assets-path="../dashboard_style/assets/" data-template="vertical-menu-template-free">

        <head>
            <meta charset="utf-8" />
            <meta name="viewport"
                  content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

            <title>Admin</title>

            <meta name="description" content="" />

            <!-- Favicon -->
            <link rel="icon" type="image/x-icon" href="../dashboard_style/assets/img/logo.svg" />

            <!-- Fonts -->
            <link rel="preconnect" href="https://fonts.googleapis.com" />
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
            <link
                href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
                rel="stylesheet" />

            <!-- Icons. Uncomment required icon fonts -->
            <link rel="stylesheet" href="../dashboard_style/assets/vendor/fonts/boxicons.css" />

            <!-- Core CSS -->
            <link rel="stylesheet" href="../dashboard_style/assets/vendor/css/core.css"
                  class="template-customizer-core-css" />
            <link rel="stylesheet" href="../dashboard_style/assets/vendor/css/theme-default.css"
                  class="template-customizer-theme-css" />
            <link rel="stylesheet" href="../dashboard_style/assets/css/demo.css" />

            <!-- Vendors CSS -->
            <link rel="stylesheet"
                  href="../dashboard_style/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

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
                        <div class="card" style="margin-top: 15px; margin-left: 15px; overflow-x: auto;">
                            <jsp:include page="../components/patient-profile.jsp">
                                <jsp:param name="p" value="${p}"/>
                            </jsp:include>
                            <h5 class="card-header">Thêm thuốc</h5>
                            <!-- Serch -->
                            <script> // Search
                                // Báº¯t sá»± kiá»n nháº¥n enter
                                document.getElementById("search-input").addEventListener("keypress", function (event) {
                                    if (event.keyCode === 13) {
                                        event.preventDefault(); // NgÄn cháº·n form submit máº·c Äá»nh
                                        document.getElementById("search-form").submit(); // Gá»­i request
                                    }
                                });

                                // Báº¯t sá»± kiá»n click icon tÃ¬m kiáº¿m
                                document.getElementById("basic-addon-search31").addEventListener("click", function (event) {
                                    event.preventDefault(); // NgÄn cháº·n form submit máº·c Äá»nh
                                    document.getElementById("search-form").submit(); // Gá»­i request
                                });
                            </script>
                            <div class="card-body">
                                <div class="table-responsive text-nowrap">
                                    <table class="table table-bordered" style="text-align: center">
                                        <thead>
                                            <tr>
                                                <th style="">STT</th>
                                                <th style="">TÊN THUỐC</th>
                                                <th Style="">ĐƠN VỊ</th>
                                                <th Style="">SỐ LƯỢNG</th>
                                                <th>LIỀU LƯỢNG</th>
                                                <th>ACTION</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="count" value="1" />
                                            <c:forEach items="${requestScope.reportDrugs}" var="rpD" varStatus="loop">
                                                <tr>
                                                    <td>
                                                        <i class="fab fa-angular fa-lg text-danger me-3"></i>
                                                        <strong>${count}</strong>
                                                    </td>
                                                    <td style="white-space: pre-wrap;">
                                                        <select id="defaultSelect" class="form-select">
                                                            <c:forEach items="${requestScope.drugs}" var="d">
                                                                <c:if test="${d.id eq rpD.id}">
                                                                    <option value="${d.id}" selected>${d.name}</option>
                                                                </c:if>
                                                                <c:if test="${d.id ne rpD.id}">
                                                                    <option value="${d.id}" >${d.name}</option>
                                                                </c:if>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                    <td>
                                                        <fmt:formatNumber type="currency" value="${rpD.price}" currencyCode="VND"
                                                                          maxFractionDigits="0" />
                                                    </td>
                                                    <td style="white-space: pre-wrap;"><input class="form-control" type="number"
                                                                                              value="${rpD.amount}" id="html5-number-input"></td>
                                                    <td style="white-space: pre-wrap;"><input class="form-control" type="text"
                                                                                              value="${rpD.dosage}" id="html5-text-input"></td>
                                                    <td>
                                                        <div class="dropdown">
                                                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                                                    data-bs-toggle="dropdown">
                                                                <i class="bx bx-dots-vertical-rounded"></i>
                                                            </button>
                                                            <div class="dropdown-menu">
                                                                <a class="dropdown-item"
                                                                   href="add-drug-detail?action=edit&drug_id=${rpD.id}"><i
                                                                        class="bx bx-edit-alt me-1"></i> Edit</a>
                                                                <a class="dropdown-item"
                                                                   href="add-drug?action=delete&drug_id=${rpD.id}"><i
                                                                        class="bx bx-trash me-1"></i> Delete</a>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <c:set var="count" value="${count + 1}" />
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <c:if test="${requestScope.totalPages > 1}">
                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination justify-content-center">
                                                <li class="page-item ${requestScope.currentPage == 1 ? 'disabled' : ''}">
                                                    <a class="page-link"
                                                       href="?pageNumber=${requestScope.currentPage - 1}&pageSize=${requestScope.pageSize}"
                                                       tabindex="-1"
                                                       aria-disabled="${requestScope.currentPage == 1 ? 'true' : 'false'}">Previous</a>
                                                </li>
                                                <c:forEach begin="1" end="${requestScope.totalPages}" var="i">
                                                    <li class="page-item ${requestScope.currentPage == i ? 'active' : ''}"><a
                                                            class="page-link"
                                                            href="?pageNumber=${i}&pageSize=${requestScope.pageSize}">${i}</a>
                                                    </li>
                                                </c:forEach>
                                                <li
                                                    class="page-item ${requestScope.currentPage == requestScope.totalPages ? 'disabled' : ''}">
                                                    <a class="page-link"
                                                       href="?pageNumber=${requestScope.currentPage + 1}&pageSize=${requestScope.pageSize}"
                                                       aria-disabled="${requestScope.currentPage == requestScope.totalPages ? 'true' : 'false'}">Next</a>
                                                </li>
                                            </ul>
                                        </nav>
                                    </c:if>
                                </div><br />
                                <a href="add-drug-detail?action=add"><button type="button" class="btn btn-outline-secondary">Thêm thuốc</button></a>
                                <a href="edit-examination?patient_id=${sessionScope.patient.id}"><button type="button" class="btn btn-outline-secondary">Quay lại</button></a>
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