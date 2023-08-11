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


                            <c:if test="${requestScope.drug.id ne null }">
                                <div class="card mb-4">
                                    <h5 class="card-header">Chỉnh sửa thông tin thuốc  </h5>
                                    <form action="/SWP391_Project/manage/drug" method="post" onsubmit="return confirm('Bạn có muốn chỉnh sửa không?')">
                                        <input type="hidden" name="action" value="edit">
                                        <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
                                        <div class="card-body">
                                            <div class="mb-3">
                                                <label for="exampleFormControlInput1" class="form-label">Tên thuốc</label>
                                                <input value="${requestScope.drug.name}" 
                                                       name="name" type="text" 
                                                       class="form-control" 
                                                       id="exampleFormControlInput1" 
                                                       placeholder="Drug name"                                                    
                                                       required minlength="1" maxlength="500"/>
                                                <div class="invalid-feedback">
                                                    Tên không hợp lệ (1-500 ký tự).
                                                </div>
                                            </div>
                                            <div>
                                                <label for="exampleFormControlInput2" class="form-label">Giá</label>
                                                <input name="price" type="number" 
                                                       class="form-control" 
                                                       id="exampleFormControlInput2" 
                                                       placeholder="Price" 
                                                       value="${requestScope.drug.price}" 
                                                       required min="0" step="any"/>
                                                <div class="invalid-feedback">
                                                    Giá không hợp lệ (phải là số dương).
                                                </div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="exampleFormControlInput1" class="form-label">Đơn vị</label>
                                                <input value="${requestScope.drug.unit_price}" 
                                                       name="unit_price" type="text" 
                                                       class="form-control" 
                                                       id="exampleFormControlInput1" 
                                                       placeholder="Unit Price" 
                                                       required minlength="1" maxlength="500"/>
                                                <div class="invalid-feedback">
                                                    Đơn vị không hợp lệ (1-500 ký tự).
                                                </div>
                                            </div>
                                            <div>
                                                <label for="exampleFormControlInput2" class="form-label">Số lượng</label>
                                                <input name="quantity_in_stock" type="number" 
                                                       class="form-control" 
                                                       id="exampleFormControlInput2" 
                                                       placeholder="Quantity in stock" 
                                                       value="${requestScope.drug.quantity_in_stock}" required min="0" step="any"/>
                                                <div class="invalid-feedback">
                                                    Số lượng không hợp lệ (phải là số dương).
                                                </div>
                                            </div>
                                            <br/>
                                            <button type="submit" class="btn btn-outline-success">Chỉnh sửa</button>
                                        </div>
                                    </form>
                                </div>
                            </c:if>
                            <c:if test="${requestScope.drug.id eq null}">
                                <div class="card mb-4">
                                    <h5 class="card-header">Thêm thuốc </h5>
                                    <form action="/SWP391_Project/manage/drug" method="post" onsubmit="return confirm('Bạn muốn thêm thuốc này không?')">
                                        <input type="hidden" name="action" value="create">
                                        <div class="card-body">
                                            <div class="mb-3">
                                                <label for="exampleFormControlInput1" class="form-label">Tên thuốc</label>
                                                <input value="" 
                                                       name="name" type="text" 
                                                       class="form-control" 
                                                       id="exampleFormControlInput1" 
                                                       placeholder="Drug name" 
                                                       required minlength="1" maxlength="500"/>
                                                <div class="invalid-feedback">
                                                    Tên thuốc không hợp lệ (1-500 ký tự).
                                                </div>
                                            </div>
                                            <div>
                                                <label for="exampleFormControlInput1" class="form-label">Giá</label>
                                                <input name="price" type="number" 
                                                       class="form-control" 
                                                       id="exampleFormControlInput2" 
                                                       placeholder="Price" 
                                                       value="" required min="0" step="any"/>
                                                <div class="invalid-feedback">
                                                    Giá không hợp lệ (phải là số dương).
                                                </div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="exampleFormControlInput1" class="form-label">Đơn vị</label>
                                                <input value="" 
                                                       name="unit_price" type="text" 
                                                       class="form-control" 
                                                       id="exampleFormControlInput1" 
                                                       placeholder="Unit Price" 
                                                       required minlength="1" maxlength="500"/>
                                                <div class="invalid-feedback">
                                                    Đơn vị không hợp lệ (1-500 ký tự).
                                                </div>
                                            </div>
                                            <div>
                                                <label for="exampleFormControlInput2" class="form-label">Số lượng</label>
                                                <input name="quantity_in_stock" type="number" 
                                                       class="form-control" 
                                                       id="exampleFormControlInput2" 
                                                       placeholder="Quantity in stock" 
                                                       value="" required min="0" step="any"/>
                                                <div class="invalid-feedback">
                                                    Số lượng không hợp lệ (phải là số dương).
                                                </div>
                                            </div>
                                            <br/>
                                            <button type="submit" class="btn btn-outline-success">Thêm thuốc </button>
                                        </div>
                                    </form>
                                    <c:if test="${requestScope.messDrugExist ne null}">
                                        <div class="alert alert-danger" role="alert" 
                                             style="width: 30%;margin-left: 400px; text-align: center"
                                             id="alert">                                    
                                            ${requestScope.messDrugExist}
                                        </div>
                                    </c:if>
                                    <script>                                       
                                        var alert = document.getElementById("alert");
                                        // Ẩn alert sau 3 giây
                                        setTimeout(function () {
                                            alert.style.display = 'none';
                                        }, 3000);
                                    </script>
                                </div>

                            </c:if>
                            <script>
                                // Xác thực dữ liệu trên trường nhập liệu tên,
                                var nameInput = document.querySelector('input[name="name"]');
                                nameInput.addEventListener('input', function () {
                                    if (nameInput.checkValidity()) {
                                        nameInput.classList.remove('is-invalid');
                                    } else {
                                        nameInput.classList.add('is-invalid');
                                    }
                                });
                                // Xác thực dữ liệu trên trường nhập liệu unit_price
                                var unit_priceInput = document.querySelector('input[name="unit_price"]');
                                nameInput.addEventListener('input', function () {
                                    if (nameInput.checkValidity()) {
                                        nameInput.classList.remove('is-invalid');
                                    } else {
                                        nameInput.classList.add('is-invalid');
                                    }
                                });

                                // Xác thực dữ liệu trên trường nhập liệu giá
                                var priceInput = document.querySelector('input[name="price"]');
                                priceInput.addEventListener('input', function () {
                                    if (priceInput.checkValidity()) {
                                        priceInput.classList.remove('is-invalid');
                                    } else {
                                        priceInput.classList.add('is-invalid');
                                    }
                                });
                                // Xác thực dữ liệu trên trường nhập liệu quantity_in_stock
                                var priceInput = document.querySelector('input[name="quantity_in_stock"]');
                                priceInput.addEventListener('input', function () {
                                    if (priceInput.checkValidity()) {
                                        priceInput.classList.remove('is-invalid');
                                    } else {
                                        priceInput.classList.add('is-invalid');
                                    }
                                });
                            </script>



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

