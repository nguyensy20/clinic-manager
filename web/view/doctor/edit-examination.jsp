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
                                <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light"></span> Edit examination</h4>
                                <div class="row">
                                    <!-- Basic -->
                                    <div class="col-md-10">
                                        <jsp:include page="../components/patient-profile.jsp">
                                            <jsp:param name="p" value="${p}"/>
                                        </jsp:include>
                                        <div class="card mb-4">
                                            <div class="card-body">
                                                <form action="edit-examination" method="post">
                                                    <div class="mb-3">
                                                        <label for="exampleFormControlTextarea1" class="form-label">Notes</label>
                                                        <textarea  name="note" class="form-control" id="exampleFormControlTextarea1"
                                                                   rows="3">${p.description}</textarea>
                                                    </div>
                                                    <!-- Number -->
                                                    <div class="row mb-3">

                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <div class="mb-3 row">
                                                                        <label for="html5-number-input"
                                                                               class="col-md-4 col-form-label">Pulse</label>
                                                                        <div class="col-md-8">
                                                                            <input class="form-control" name="pulse" type="number" value="${m.pulse}"
                                                                                   id="html5-number-input">
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="mb-3 row">
                                                                        <label for="html5-number-input"
                                                                               class="col-md-4 col-form-label">Blood pressure</label>
                                                                        <div class="col-md-8">
                                                                            <input class="form-control" name="bloodPress" type="number" value="${m.bloodPress}"
                                                                                   id="html5-number-input">
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="mb-3 row">
                                                                        <label for="html5-number-input"
                                                                               class="col-md-4 col-form-label">Breathing</label>
                                                                        <div class="col-md-8">
                                                                            <input class="form-control" name="breathing" type="number" value="${m.breathing}"
                                                                                   id="html5-number-input">
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <div class="mb-3 row">
                                                                        <label for="html5-number-input"
                                                                               class="col-md-4 col-form-label">Height</label>
                                                                        <div class="col-md-8">
                                                                            <input class="form-control" name="height" type="number" value="${m.height}"
                                                                                   id="html5-number-input">
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="mb-3 row">
                                                                        <label for="html5-number-input"
                                                                               class="col-md-4 col-form-label">Weight</label>
                                                                        <div class="col-md-8">
                                                                            <input class="form-control" name="weight" type="number" value="${m.weight}"
                                                                                   id="html5-number-input">
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>

                                                    <div class="row mb-3">
                                                        <label class="col-sm-2 col-form-label"
                                                               for="basic-default-name">Symptoms</label>
                                                        <div class="col-sm-10">
                                                            <textarea  name="symptoms" class="form-control" id="exampleFormControlTextarea1"
                                                                       rows="3" placeholder="Enter symptoms">${m.symptom}</textarea>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <label class="col-sm-2 col-form-label"
                                                               for="basic-default-company">Result</label>
                                                        <div class="col-sm-10">
                                                            <textarea  name="result" class="form-control" id="exampleFormControlTextarea1"
                                                                       rows="3" placeholder="Enter result or diseases">${m.result}</textarea>
                                                        </div>
                                                    </div>
                                                    <a href="add-treatment">Add treatment</a>
                                                    <table class="table table-bordered">
                                                        <thead>
                                                            <tr>
                                                                <th>STT</th>
                                                                <th>TÊN PHƯƠNG PHÁP</th>
                                                                <th>Detail</th>
                                                                <th>GIÁ(VND)</th>
                                                                <th>Actions</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach  items="${requestScope.treatments}" var="t">
                                                                <tr>
                                                                    <td>1</td>
                                                                    <td>${t.name}</td>
                                                                    <td>
                                                                        <div class="accordion-body">${t.detail}</div>
                                                                    </td>
                                                                    <td>${t.price}</td>
                                                                    <td>
                                                                        <div class="dropdown">
                                                                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                                                                                <i class="bx bx-dots-vertical-rounded"></i>
                                                                            </button>
                                                                            <div class="dropdown-menu">
                                                                                <a class="dropdown-item" href="add-treatment-detail?action=edit&treatment_id=${t.id}"><i class="bx bx-edit-alt me-1"></i> Edit</a>
                                                                                <a class="dropdown-item" href="add-treatment?action=delete&treatment_id=${t.id}" ><i class="bx bx-trash me-1"></i> Delete</a>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                    <a href="add-drug?action=view">Add drug</a>
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
                                                    <div class="row justify-content-end">
                                                        <div class="col-sm-10">
                                                            <button type="submit" class="btn btn-primary" name="submit" value="submit">Send</button>
                                                            <button type="submit" class="btn btn-primary" name="draft" value="draft">Draft</button>
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

