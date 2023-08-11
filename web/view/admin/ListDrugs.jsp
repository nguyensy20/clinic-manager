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

                        <!-- Content -->
                        <!-- Bordered Table -->
                        <div class="card" style="margin-top: 15px; margin-left: 15px; overflow-x: auto;">
                            <h5 class="card-header">Danh sách Thuốc</h5>
                            <!-- Serch -->
                            <form action="/SWP391_Project/manage/drug" method="post" id="search-form">
                                <input type="hidden" name="action" value="search">
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
                                                name="searchName"value="${requestScope.drugName}"
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
                            <div class="card-body">
                                <div class="table-responsive text-nowrap">
                                    <table class="table table-bordered" style="text-align: center">
                                        <thead>
                                            <tr>
                                                <th style="">STT</th>
                                                <th style="">Tên thuốc </th> 
                                                <th style="width: 200px">Giá(VND)</th>  
                                                <th Style="">Đơn vị</th>
                                                <th Style="">Số lượng</th>
                                                <th Style="width: 20px">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="count" value="1" />
                                            <c:forEach items="${requestScope.drugs}" var="d" varStatus="loop">
                                                <tr>
                                                    <td>
                                                        <i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>${count}</strong>
                                                    </td>
                                                    <td style="white-space: pre-wrap;">${d.name}</td>  
                                                    <td><fmt:formatNumber type="currency" value="${d.price}" currencyCode="VND" maxFractionDigits="0" /></td>
                                                    <td style="white-space: pre-wrap;">${d.unit_price}</td>  
                                                    <td style="white-space: pre-wrap;">${d.quantity_in_stock}</td>  
                                                    <td>
                                                        <div  >
                                                            <a style="color: gray;display: inline-block;" href="/SWP391_Project/manage/drug?action=edit&id=${d.id}">
                                                                <i class="bx bx-edit-alt me-1"></i> Edit
                                                            </a>
                                                            <form style="display: inline-block;" action="/SWP391_Project/manage/drug" method="POST" onsubmit="return confirm('Bạn có chắc chắn muốn xóa?')">
                                                                <input type="hidden" name="action" value="delete" />
                                                                <input type="hidden" name="id" value="${d.id}" />
                                                                <button type="submit" style="color: gray; margin-left: 10px; background: none; border: none; cursor: pointer;">
                                                                    <i class="bx bx-trash me-1"></i> Delete
                                                                </button>
                                                            </form>
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
                                                    <a class="page-link" href="?pageNumber=${requestScope.currentPage - 1}&pageSize=${requestScope.pageSize}" tabindex="-1" aria-disabled="${requestScope.currentPage == 1 ? 'true' : 'false'}">Previous</a>
                                                </li>
                                                <c:forEach begin="1" end="${requestScope.totalPages}" var="i">
                                                    <li class="page-item ${requestScope.currentPage == i ? 'active' : ''}"><a class="page-link" href="?pageNumber=${i}&pageSize=${requestScope.pageSize}">${i}</a></li>
                                                    </c:forEach>
                                                <li class="page-item ${requestScope.currentPage == requestScope.totalPages ? 'disabled' : ''}">
                                                    <a class="page-link" href="?pageNumber=${requestScope.currentPage + 1}&pageSize=${requestScope.pageSize}" aria-disabled="${requestScope.currentPage == requestScope.totalPages ? 'true' : 'false'}">Next</a>
                                                </li>
                                            </ul>
                                        </nav>
                                    </c:if>
                                </div><br/>
                                <a href="/SWP391_Project/manage/drug?action=create"><button type="button" class="btn btn-outline-secondary">Thêm thuốc </button></a>
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

