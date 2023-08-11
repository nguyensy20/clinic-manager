<%-- 
    Document   : dashboard
    Created on : Feb 14, 2023, 11:49:07 AM
    Author     : vkhoa
--%>
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
                        <div class="content-wrapper" style="margin-top: 15px; margin-left: 15px"> 
                            <!-- Content -->
                            <!-- Form controls -->


                            <c:if test="${requestScope.service.id ne null }">
                                <div class="card mb-4">
                                    <h5 class="card-header">Chỉnh sửa dịch vụ </h5>
                                    <form action="/SWP391_Project/manage/services" method="post" onsubmit="return validateForm()">
                                        <input type="hidden" name="action" value="edit">
                                        <input type="hidden" name="id" value="<%= request.getParameter("id") %>">  <!-- express -->
                                        <div class="card-body">
                                            <div class="mb-3">
                                                <label for="exampleFormControlInput1" class="form-label">Tên dịch vụ</label>
                                                <input value="${requestScope.service.name}" name="name"
                                                       type="text"
                                                       class="form-control"
                                                       id="exampleFormControlInput1"
                                                       placeholder="Service name"
                                                       required
                                                       minlength="10"
                                                       maxlength="500"
                                                       />
                                                <span id="nameError" style="color: red;"></span>
                                            </div>
                                            <div>
                                                <label for="exampleFormControlTextarea1" class="form-label">Mô tả</label>
                                                <textarea value="" name="description" class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="Description" required minlength="10">${requestScope.service.description}</textarea>
                                                <span id="descriptionError" style="color: red;"></span>
                                            </div><br/>
                                            <button type="submit" class="btn btn-outline-success">Chỉnh sửa</button>
                                        </div>
                                    </form>
                                </div>
                            </c:if>
                            <script>
                                function validateForm() {
                                    var name = document.forms[0]["name"].value;
                                    var description = document.forms[0]["description"].value;

                                    // Kiểm tra tên dịch vụ
                                    if (name == "" || name.length < 10 || name.length > 500) {
                                        document.getElementById("nameError").innerHTML = "Tên dịch vụ phải có độ dài từ 3 đến 50 ký tự";
                                        return false;
                                    } else {
                                        document.getElementById("nameError").innerHTML = "";
                                    }

                                    // Kiểm tra mô tả
                                    if (description == "" || description.length < 10) {
                                        document.getElementById("descriptionError").innerHTML = "Mô tả phải có ít nhất 10 ký tự";
                                        return false;
                                    } else {
                                        document.getElementById("descriptionError").innerHTML = "";
                                    }

                                    // Nếu dữ liệu hợp lệ thì submit form
                                    return true;
                                }
                            </script>
                            <c:if test="${requestScope.service.id eq null}">
                                <div class="card mb-4">
                                    <h5 class="card-header">Thêm dịch vụ </h5>
                                    <form action="/SWP391_Project/manage/services" method="post" onsubmit="return confirm('Bạn muốn thêm dịch vụ này không?')">
                                        <input type="hidden" name="action" value="create">
                                        <div class="card-body">
                                            <div class="mb-3">
                                                <label for="exampleFormControlInput1" class="form-label">Tên dịch vụ</label>
                                                <input value="" name="name"
                                                       type="te"
                                                       class="form-control"
                                                       id="exampleFormControlInput1"
                                                       placeholder="Service name"
                                                        placeholder="Service name"
                                                       required
                                                       minlength="10"
                                                       maxlength="500"
                                                       />
                                                 <span id="nameError" style="color: red;"></span>
                                            </div>
                                            <div>
                                                <label for="exampleFormControlTextarea1" class="form-label">Miêu tả</label>
                                                <textarea value="" name="description" class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="Description" required minlength="10"></textarea>
                                                 <span id="descriptionError" style="color: red;"></span>
                                            </div><br/>
                                            <button type="submit" class="btn btn-outline-success">Thêm dịch vụ</button>
                                        </div>
                                    </form>
                                </div>
                            </c:if>

                            <!-- / Content -->

                            <!-- Footer -->

                            <!-- / Footer -->

                            <div class="content-backdrop fade"></div>
                        </div>
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

