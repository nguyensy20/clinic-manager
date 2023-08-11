<%-- 
    Document   : home
    Created on : Oct 17, 2022, 10:28:01 AM
    Author     : sonnt
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" href="../dashboard_style/assets/css/steller.css">

    </head>
    <body data-spy="scroll" data-target=".navbar" data-offset="40" id="home">

        <!-- Page navigation -->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top" data-spy="affix" data-offset-top="0">
            <div class="container">
                
                <a class="navbar-brand" href="#"><img src="../image/doctor/logo.png" alt=""></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto align-items-center">
                        <li class="nav-item">
                            <a class="nav-link" href="../home">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../doctor/waiting-patient-list">Waiting Patient List</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#service">Service</a>
                        </li>                   
                        <li class="nav-item">
                            <a class="nav-link" href="../patient/booking">Booking</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="admin/dashboard">Manage</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#contact">Contact</a>
                        </li>
                    </ul>
                </div>
            </div>          
        </nav>
        <!-- End of page navibation -->

         <div class="layout-wrapper layout-content-navbar">
            <div class="layout-container">
                <!-- Menu -->

                <!-- / Navbar -->

                <!-- Content wrapper -->
                <div class="content-wrapper">
                    <!-- Content -->

                    <div class="container-xxl flex-grow-1 container-p-y">

                        <div class="row">
                            <div class="col-md-12">
                                <ul class="nav nav-pills flex-column flex-md-row mb-3">
                                    <li class="nav-item">
                                        <a class="nav-link active" href="javascript:void(0);"><i class="bx bx-user me-1"></i> User Profile</a>
                                    </li>
                                </ul>
                                <div class="card mb-4">
                                    <h5 class="card-header">Profile Details</h5>
                                    <!-- Account -->
                                    <div class="card-body">
                                        <div class="d-flex align-items-start align-items-sm-center gap-4">
                                            <img
                                                src="../image/doctor/mrf.jpg"
                                                alt="user-avatar"
                                                class="d-block rounded"
                                                height="100"
                                                width="100"
                                                id="uploadedAvatar"
                                                />
                                        </div>
                                    </div>
                                    <hr class="my-0" />
                                    <div class="card-body">
                                        <form id="formAccountSettings" method="POST" onsubmit="return false">
                                            <div class="row">
                                                <div class="mb-3 col-md-6">
                                                    <label for="fullName" class="form-label">Full Name</label>
                                                    <input
                                                        class="form-control"
                                                        type="text"
                                                        id="fullName"
                                                        name="fullName"
                                                        value=${sessionScope.user.name}
                                                        autofocus
                                                        />
                                                </div>
                                                <div class="mb-3 col-md-6">
                                                    <label for="gender" class="form-label">Gender</label>
                                                    <input class="form-control" type="text" name="gender" id="gender" 
                                                           value=${sessionScope.user.gender?"Male":"Female"} />
                                                </div>
                                                <div class="mb-3 col-md-6">
                                                    <label for="username" class="form-label">Username</label>
                                                    <input
                                                        class="form-control"
                                                        type="text"
                                                        id="username"
                                                        name="username"
                                                        value=${sessionScope.user.username}
                                                        />
                                                </div>
                                                <div class="mb-3 col-md-6">
                                                    <label for="dob" class="form-label">Date of birth</label>
                                                    <input
                                                        type="text"
                                                        class="form-control"
                                                        id="dob"
                                                        name="dob"
                                                        value=${sessionScope.user.dob}
                                                        />
                                                </div>
                                                <div class="mb-3 col-md-6">
                                                    <label class="form-label" for="phoneNumber">Phone Number</label>
                                                    <div class="input-group input-group-merge">
                                                        <input
                                                            type="text"
                                                            id="phoneNumber"
                                                            name="phoneNumber"
                                                            class="form-control"
                                                            placeholder=${sessionScope.user.phone}
                                                            />
                                                    </div>
                                                </div>
                                                <div class="mb-3 col-md-6">
                                                    <label for="address" class="form-label">Address</label>
                                                    <input type="text" class="form-control" id="address" name="address" 
                                                           value=${sessionScope.user.address} />
                                                </div>
                                                <div class="mb-3 col-md-12">
                                                    <label for="state" class="form-label">Description</label>
                                                    <input class="form-control" type="text" id="description" name="description" 
                                                           value=${sessionScope.user.description} />
                                                </div>

                                        </form>
                                    </div>
                                    <!-- /Account -->
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

                    <!-- Main JS -->
                    <script src="../dashboard_style/assets/js/main.js"></script>

                    <!-- Page JS -->
                    <script src="../dashboard_style/assets/js/pages-account-settings-account.js"></script>

                    <!-- Place this tag in your head or just before your close body tag. -->
                    <script async defer src="https://buttons.github.io/buttons.js"></script>
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
