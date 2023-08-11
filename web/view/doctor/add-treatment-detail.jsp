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
                                <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Forms /</span> Edit examination</h4>
                                <div class="row">
                                    <!-- Basic -->
                                    <div class="col-md-10">
                                        <jsp:include page="../components/patient-profile.jsp">
                                            <jsp:param name="p" value="${p}"/>
                                        </jsp:include>
                                        <div class="card mb-4">
                                            <div class="card-header d-flex align-items-center justify-content-between">
                                                <h5 class="mb-0">Basic Layout</h5>
                                            </div>
                                            <div class="card-body">
                                                <form action="add-treatment-detail" method="post">
                                                    <!-- Number -->
                                                    <div class="mb-3">
                                                        <label for="defaultSelect" class="form-label">Select treatment</label>
                                                        <select name="treatment" class="form-select">
                                                            <c:forEach items="${requestScope.treatments}" var="t">
                                                                <c:if test="${requestScope.treatment.id eq t.id}">
                                                                    <option  value="${t.id}" selected>${t.name}></option>
                                                                </c:if>
                                                                <c:if test="${requestScope.treatment.id ne t.id}">
                                                                    <option  value="${t.id}">${t.name}></option>
                                                                </c:if>
                                                                <%--<c:if test="${requestScope.treatment ne null}">--%>
                                                                <%--</c:if>--%>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div>
                                                        <label for="exampleFormControlTextarea1" class="form-label">Detail</label>
                                                        <input type="hidden" name="action" value="${requestScope.action}">
                                                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="detail">${requestScope.treatment.detail}</textarea>
                                                    </div>
                                                    <div class="row justify-content-end">
                                                        <div class="col-sm-10">
                                                            <button type="submit" class="btn btn-primary" name="back" value="back">Back</button>
                                                            <button type="submit" class="btn btn-primary" name="submit" value="submit">Send</button>
                                                        </div>
                                                    </div>
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

