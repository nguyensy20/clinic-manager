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
    <div style="margin-left: 30px; width: 90%">
        <!-- Start list medical report -->
        <div class="BorderedTable" style="">
            <!-- Bordered Table -->
            <div class="card" style="margin-top: 100px;">
                <div style="">                   
                    <div style="float: right; margin-top: 70px; margin-right: 15px">
                        <div style="display: inline-flex;">
                            <h6  style="">Tên bệnh nhân: ${sessionScope.user.name} </h6>
                            <h6  style="margin-left: 20px">Giới tính: ${sessionScope.user.gender?"Nam":"Nữ"} </h6>
                        </div>
                        <h6 style="">Ngày sinh: ${sessionScope.user.dob} </h6>
                        <h6 style="">Địa chỉ: ${sessionScope.user.address} </h6>
                        <h6  style="">Số điện thoại: ${sessionScope.user.phone} </h6>
                    </div>                     
                    <div>
                        <h3 class="card-header" style="text-align: center; margin-left: 300px">
                            <i class="fab fa-angular fa-lg text-danger me-3"><strong>Danh sách bệnh án</strong></i> 
                        </h3>

                    </div>
                    <!-- Search -->
                    <form action="/SWP391_Project/patient/medical-report-list" method="get">
                        <input type="hidden" value="${sessionScope.user.id}" name="patientId">
                        <div>
                            <div class="col-md-5" style="display: flex;">                 
                                <label style="font-size: 11px" for="html5-date-input" class="col-md-4 col-form-label">Từ ngày:</label>
                                <div class="col-md-10" style=" margin-left: -85px;">
                                    <input style="height: 80%; width: 60%" 
                                           class="form-control" type="date" 
                                           value="${requestScope.firstTime}" 
                                           name="fromDate" />
                                </div>
                            </div>
                            <div class="col-md-5" style="display: flex;">
                                <label style="font-size: 11px" for="html5-date-input" class="col-md-4 col-form-label">Đến ngày:</label>
                                <div class="col-md-10" style=" margin-left: -85px;">
                                    <input style="height: 80%; width: 60%" 
                                           class="form-control" type="date" 
                                           value="${requestScope.lastTime}" 
                                           name="toDate" />
                                </div>
                            </div>
                            <div style="display: flex">
                                <div style="padding-left: 120px" class="col-md-6">
                                    <c:set var="doctorIdLong" value="${param.doctorId != null && param.doctorId != 'all' ? Long.parseLong(param.doctorId) : 0}"/>
                                    <select name="doctorId" class="form-select" style="width: 90%;">
                                        <option value="all" ${doctorIdLong == 0 ? 'selected':''}>
                                            Tất cả bác sĩ
                                        </option>
                                        <c:forEach items="${uniqueDoctorIds}" var="doctor_Id">
                                            <option value="${doctor_Id}" ${doctor_Id == doctorIdLong ? 'selected':''} >
                                                Doctor: ${user.getNameById(doctor_Id)}                       
                                            </option>
                                        </c:forEach>
                                    </select> 
                                </div>
                                <div>
                                    <button type="submit" class="btn rounded-pill btn-outline-dark">Tìm kiếm</button>
                                </div>
                            </div>
                        </div>
                    </form>

                    <!-- End Search -->
                </div>
                <!-- List medical -->

                <div class="card-body">
                    <div class="table-responsive text-nowrap">
                        <table class="table table-bordered" style="text-align: center">
                            <thead>
                                <tr>
                                    <th style="width: 5%">Chi tiết</th>
                                    <th style="width: 20%">Bác sĩ</th>
                                    <th style="width: 25%">Ngày Khám</th>
                                    <th style="width: 50%">Kết quả chẩn đoán</th>
                                </tr>
                            </thead>

                            <tbody>

                                <c:forEach items="${requestScope.medicalReports}" var="m" varStatus="status">
                                <form id="form-button-0" action="/SWP391_Project/patient/medical-report-list" method="post">
                                    <input type="hidden" name="patientId" value="${sessionScope.user.id}">
                                    <input type="hidden" value="${param.fromDate}" name="fromDate">
                                    <input type="hidden" value="${param.toDate}" name="toDate">
                                    <input type="hidden" value="${param.doctorId}" name="paramDoctorId">
                                    <tr>
                                        <td>
                                            <div class="dropdown" >
                                                <button id="button-${status.index}" type="submit" class="btn p-0 dropdown-toggle hide-arrow"
                                                        onclick="sendAjaxRequest(event, 'button-${status.index}')">
                                                    <i class="bx bx-dots-vertical-rounded"></i>
                                                </button>
                                            </div>
                                        </td>
                                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i><strong>Doctor ${user.getNameById(m.doctor_id)}</strong>
                                            <input type="hidden" name="doctorId" value="${m.doctor_id}">
                                        </td>
                                        <td>${helper.toDateTimeSql(m.time)}</td>
                                        <td>
                                            <i class="fab fa-angular fa-lg text-danger me-3">${m.result}</i><strong> </strong>
                                        </td>
                                    <input type="hidden" name="timeString" value="${helper.toDateTimeSql(m.time)}">
                                    </tr>
                                </form>
                            </c:forEach>
                            </tbody>

                        </table>
                    </div>
                </div>

                <!-- End List medical -->

            </div>
            <!--/ Bordered Table -->
        </div>
        <!-- End list medical report -->
        <script>
            function sendAjaxRequest(event, buttonId) {
                event.preventDefault(); // Ngăn chặn form submit mặc định
                let form = document.getElementById(form -${buttonId}); // Lấy form tương ứng với button
                let formData = new FormData(form); // Tạo object FormData để chứa dữ liệu của form

                fetch('/SWP391_Project/patient/medical-report', {
                    method: 'POST',
                    body: formData
                })
                        .then(response => response.json())
                        .then(data => {
                            // Cập nhật nội dung của thẻ div
                            let reportContent = document.getElementById('report-content');
                            reportContent.innerHTML = data.result;
                            // Nếu kết quả trả về là rỗng, ẩn thẻ div
                            if (data.result === '') {
                                reportContent.classList.add('d-none');
                            }
                            // Nếu kết quả trả về không rỗng, hiển thị thẻ div
                            else {
                                reportContent.classList.remove('d-none');
                                reportContent.classList.add('d-block');
                            }
                        })
                        .catch(error => console.error(error));
            }
        </script>

        <c:if test="${requestScope.medicalReport ne null}">
            <div class="" id="report-content" >

                <div class="my-content" style="width: 100%" >
                    <div class="demo-inline-spacing mt-3">
                        <div class="list-group list-group-horizontal-md text-md-center">
                            <a class="list-group-item list-group-item-action active" id="home-list-item" data-bs-toggle="list" href="#horizontal-medicalDetail">Medical Report Detail</a>
                            <a class="list-group-item list-group-item-action" id="profile-list-item" data-bs-toggle="list" href="#horizontal-TreatmentDetail">Treatment Detail</a>
                            <a class="list-group-item list-group-item-action" id="messages-list-item" data-bs-toggle="list" href="#horizontal-Prescription">Prescription</a>
                            <a class="list-group-item list-group-item-action"  href="/SWP391_Project/patient/bill?patient_id=${requestScope.medicalReport.patient_id}&doctor_id=${requestScope.medicalReport.doctor_id}&time=${helper.toDateTimeSql(requestScope.medicalReport.time)}">Hóa đơn</a>
                        </div>
                        <div class="tab-content px-0 mt-0">
                            <div class="tab-pane fade show active" id="horizontal-medicalDetail">
                                <div class="card" style="">
                                    <i class="fab fa-angular fa-lg text-danger me-3">Ngày khám:   <strong>${helper.toDateTimeSql(requestScope.medicalReport.time)} </strong></i>

                                    <table class="table table-bordered" style="text-align: center">

                                        <thead>
                                            <tr>
                                                <th style="width: 25%">Chỉ số</th>
                                                <th style="width: 15%">Giá trị</th>
                                                <th style="width: 60%">Đánh giá</th>
                                            </tr>
                                        </thead>
                                        <tbody>                                     
                                            <tr>
                                                <td>
                                                    <i class="fab fa-angular fa-lg text-danger me-3">Weight(Kg)</i><strong> </strong>
                                                </td>
                                                <td>
                                                    <i class="fab fa-angular fa-lg text-danger me-3"></i><strong>${requestScope.medicalReport.weight} </strong>
                                                </td>
                                                <td id="danh-gia-bmi">

                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <i class="fab fa-angular fa-lg text-danger me-3">Height(cm)</i><strong> </strong>
                                                </td>
                                                <td>
                                                    <i class="fab fa-angular fa-lg text-danger me-3"></i><strong>${requestScope.medicalReport.height} </strong>
                                                </td>
                                                <td id="">

                                                </td>
                                            </tr>  
                                            <tr>
                                                <td>
                                                    <i class="fab fa-angular fa-lg text-danger me-3">Pulse(bpm)</i><strong> </strong>
                                                </td>
                                                <td>
                                                    <i class="fab fa-angular fa-lg text-danger me-3"></i><strong>${requestScope.medicalReport.pulse} </strong>
                                                </td>
                                                <td id="danh-gia-pulse">

                                                </td>
                                            </tr>  
                                            <tr>
                                                <td>
                                                    <i class="fab fa-angular fa-lg text-danger me-3">BloodPress(mmHg)</i><strong> </strong>
                                                </td>
                                                <td>
                                                    <i class="fab fa-angular fa-lg text-danger me-3"></i><strong>${requestScope.medicalReport.bloodPress} </strong>
                                                </td>
                                                <td id="danh-gia-blood">

                                                </td>
                                            </tr>  
                                            <tr>
                                                <td>
                                                    <i class="fab fa-angular fa-lg text-danger me-3">Breathing(rpm)</i><strong> </strong>
                                                </td>
                                                <td>
                                                    <i class="fab fa-angular fa-lg text-danger me-3"></i><strong>${requestScope.medicalReport.breathing} </strong>
                                                </td>
                                                <td id="danh-gia-breath">

                                                </td>
                                            </tr>  
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="horizontal-TreatmentDetail">
                                <div class="card" style="">
                                    <div class="table-responsive text-nowrap">
                                        <i class="fab fa-angular fa-lg text-danger me-3">Ngày khám:   <strong>${helper.toDateTimeSql(requestScope.medicalReport.time)} </strong></i>
                                        <table class="table table-bordered" style="text-align: center">
                                            <thead>
                                                <tr>
                                                    <th style="width: 30%">Tên thủ thuật</th>
                                                    <th style="width: 45%">Chi tiết</th>
                                                    <th style="width: 25%">Giá(VND)</th>

                                                </tr>
                                            </thead>

                                            <tbody>
                                                <c:set var="total" value="0" />
                                                <c:forEach items="${requestScope.treatments}" var="m">
                                                    <tr>
                                                        <td>
                                                            <i class="fab fa-angular fa-lg text-danger me-3">${m.name}</i><strong> </strong>
                                                        </td>
                                                        <td>
                                                            <i class="fab fa-angular fa-lg text-danger me-3"></i><strong>${m.detail} </strong>
                                                        </td>
                                                        <td>
                                                            <fmt:formatNumber value="${m.price}" pattern="#,###"/>
                                                        </td>
                                                    </tr>
                                                    <c:set var="total" value="${total + m.price }" />
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <div style="float: right; margin-top: 10px">
                                            <strong>Tổng tiền: <fmt:formatNumber value="${total}" pattern="#,###"/> (VND)</strong>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="horizontal-Prescription">
                                <div class="card" style="">
                                    <div class="table-responsive text-nowrap">
                                        <i class="fab fa-angular fa-lg text-danger me-3">Ngày khám:   <strong>${helper.toDateTimeSql(requestScope.medicalReport.time)} </strong></i>
                                        <table class="table table-bordered" style="text-align: center">
                                            <thead>
                                                <tr>
                                                    <th style="width: 20%">Tên thuốc</th>
                                                    <th style="width: 10%">Số lượng</th>
                                                    <th style="width: 15%">Unit Price</th>
                                                    <th style="width: 40%">Liều dùng</th>
                                                    <th style="width: 15%">Giá(VND)</th>

                                                </tr>
                                            </thead>

                                            <tbody>
                                                <c:set var="total" value="0" />
                                                <c:forEach items="${requestScope.drugs}" var="d">
                                                    <tr>                                               
                                                        <td>
                                                            <i class="fab fa-angular fa-lg text-danger me-3">${d.name}</i><strong> </strong>
                                                        </td>
                                                        <td>
                                                            <i class="fab fa-angular fa-lg text-danger me-3"></i><strong>${d.amount} </strong>
                                                        </td>
                                                        <td>
                                                            <fmt:formatNumber value="${d.price}" pattern="#,###"/>
                                                        </td>
                                                        <td>${d.dosage}</td>                                                  
                                                        <td>
                                                            <fmt:formatNumber value="${d.price * d.amount}" pattern="#,###"/>
                                                        </td>
                                                    </tr>
                                                    <c:set var="total" value="${total + d.price * d.amount}" />
                                                </c:forEach>

                                            </tbody>
                                        </table>
                                        <div style="float: right; margin-top: 10px">
                                            <strong>Tổng tiền: <fmt:formatNumber value="${total}" pattern="#,###"/> (VND)</strong>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
    </div>
    <script>
        // Lấy giá trị trọng lượng và chiều cao từ các phần tử HTML
        var weight = parseFloat('${requestScope.medicalReport.weight}');
        var height = parseFloat('${requestScope.medicalReport.height}') / 100; // chuyển đổi chiều cao thành mét

        // Tính toán chỉ số BMI
        var bmi = weight / (height * height);
        // Lấy giới tính và tuổi của người dùng từ các phần tử HTML
        var gender = '${sessionScope.user.gender}' ? 'Nam' : 'Nữ';
        var dob = new Date('${sessionScope.user.dob}');
        var today = new Date();
        var age = today.getFullYear() - dob.getFullYear();
        // Tính toán đánh giá sơ bộ dựa trên giới tính và tuổi
        var bmiResult;
        if (gender === 'Nam') {
            if (age <= 24) {
                if (bmi < 18.5) {
                    bmiResult = 'Bạn đang thấp còi. Hãy tăng cân!';
                } else if (bmi >= 18.5 && bmi < 25) {
                    bmiResult = 'Chỉ số BMI của bạn trong khoảng bình thường. Tiếp tục giữ vững nhé!';
                } else if (bmi >= 25 && bmi < 30) {
                    bmiResult = 'Bạn đang béo phì độ I. Hãy giảm cân và tập thể dục đều đặn hơn!';
                } else if (bmi >= 30 && bmi < 40) {
                    bmiResult = 'Bạn đang béo phì độ II. Cần đến bác sỹ để có phương pháp điều trị thích hợp hơn!';
                } else if (bmi >= 40) {
                    bmiResult = 'Bạn đang béo phì độ III. Cần đến bác sỹ ngay để được tư vấn cụ thể!';
                }
            } else {
                // Đánh giá cho những người có tuổi lớn hơn 24 và giới tính nam
                if (bmi < 18.5) {
                    bmiResult = 'Chỉ số BMI của bạn thấp còi. Hãy tăng cân!';
                } else if (bmi >= 18.5 && bmi < 23) {
                    bmiResult = 'Chỉ số BMI của bạn trong khoảng bình thường. Tiếp tục giữ vững nhé!';
                } else if (bmi >= 23 && bmi < 25) {
                    bmiResult = 'Chỉ số BMI của bạn vượt qua mức bình thường. Hãy tập thể dục và kiểm soát chế độ ăn uống!';
                } else if (bmi >= 25 && bmi < 30) {
                    bmiResult = 'Bạn đang bị béo phì độ I. Hãy giảm cân và tập thể dục đều đặn hơn!';
                } else if (bmi >= 30 && bmi < 35) {
                    bmiResult = 'Bạn đang béo phì độ II. Cần đến bác sỹ để có phương pháp điều trị thích hợp hơn!';
                } else if (bmi >= 35 && bmi < 40) {
                    bmiResult = 'Bạn đang bị béo phì độ II. Hãy giảm cân và tập thể dục một cách nghiêm túc hơn!';
                } else {
                    bmiResult = 'Bạn đang bị béo phì độ III. Hãy tham khảo ý kiến chuyên gia ngay!';
                }
            }
        }
        if (gender === 'Nữ') {
            if (age <= 24) {
                if (bmi < 18.5) {
                    bmiResult = 'Bạn đang thấp còi. Hãy tăng cân!';
                } else if (bmi >= 18.5 && bmi < 25) {
                    bmiResult = 'Chỉ số BMI của bạn trong khoảng bình thường. Tiếp tục giữ vững nhé!';
                } else if (bmi >= 25 && bmi < 30) {
                    bmiResult = 'Bạn đang béo phì độ I. Hãy giảm cân và tập thể dục đều đặn hơn!';
                } else if (bmi >= 30 && bmi < 40) {
                    bmiResult = 'Bạn đang béo phì độ II. Cần đến bác sỹ để có phương pháp điều trị thích hợp hơn!';
                } else if (bmi >= 40) {
                    bmiResult = 'Bạn đang béo phì độ III. Cần đến bác sỹ ngay để được tư vấn cụ thể!';
                }
            } else {
                // Đánh giá cho những người có tuổi lớn hơn 24 và giới tính nữ
                if (bmi < 18.5) {
                    bmiResult = 'Bạn đang thấp còi. Hãy tăng cân và tham khảo ý kiến bác sỹ để có chế độ ăn uống và luyện tập phù hợp hơn!';
                } else if (bmi >= 18.5 && bmi < 23) {
                    bmiResult = 'Chỉ số BMI của bạn trong khoảng bình thường. Tiếp tục giữ vững nhé!';
                } else if (bmi >= 23 && bmi < 25) {
                    bmiResult = 'Bạn đang hơi thừa cân. Hãy cân nhắc giảm cân và tập thể dục đều đặn hơn!';
                } else if (bmi >= 25 && bmi < 30) {
                    bmiResult = 'Bạn đang béo phì độ I. Hãy giảm cân và tập thể dục đều đặn hơn!';
                } else if (bmi >= 30 && bmi < 40) {
                    bmiResult = 'Bạn đang béo phì độ II. Cần đến bác sỹ để có phương pháp điều trị thích hợp hơn!';
                } else if (bmi >= 40) {
                    bmiResult = 'Bạn đang béo phì độ III. Cần đến bác sỹ ngay để được tư vấn cụ thể!';
                }
            }
        }
        // Đánh giá nhịp tim
        var pulse = parseInt('${requestScope.medicalReport.weight}');
        var pulseResult;
        if (gender === 'Nam') {
            if (age >= 18 && age <= 65) {
                if (pulse < 60) {
                    pulseResult = 'Nhịp tim của bạn thấp hơn bình thường. Nên kiểm tra lại sức khỏe và tập luyện thể thao đều đặn hơn!';
                } else if (pulse >= 60 && pulse < 100) {
                    pulseResult = 'Nhịp tim của bạn trong khoảng bình thường. Tiếp tục giữ vững nhé!';
                } else if (pulse >= 100) {
                    pulseResult = 'Nhịp tim của bạn cao hơn bình thường. Nên kiểm tra lại sức khỏe và giảm stress, tập luyện đều đặn hơn!';
                }
            } else {
                // Đánh giá cho những người có tuổi lớn hơn 65 và giới tính nam
                if (pulse < 50) {
                    pulseResult = 'Nhịp tim của bạn thấp hơn bình thường. Nên kiểm tra lại sức khỏe và tập luyện thể thao đều đặn hơn!';
                } else if (pulse >= 50 && pulse < 80) {
                    pulseResult = 'Nhịp tim của bạn trong khoảng bình thường. Tiếp tục giữ vững nhé!';
                } else if (pulse >= 80) {
                    pulseResult = 'Nhịp tim của bạn cao hơn bình thường. Nên kiểm tra lại sức khỏe và giảm stress, tập luyện đều đặn hơn!';
                }
            }
        } else if (gender === 'Nữ') {
            if (age >= 18 && age <= 65) {
                if (pulse < 60) {
                    pulseResult = 'Nhịp tim của bạn thấp hơn bình thường. Nên kiểm tra lại sức khỏe và tập luyện thể thao đều đặn hơn!';
                } else if (pulse >= 60 && pulse < 100) {
                    pulseResult = 'Nhịp tim của bạn trong khoảng bình thường. Tiếp tục giữ vững nhé!';
                } else if (pulse >= 100) {
                    pulseResult = 'Nhịp tim của bạn cao hơn bình thường. Nên kiểm tra lại sức khỏe và giảm stress, tập luyện đều đặn hơn!';
                }
            } else {
                // Đánh giá cho những người có tuổi lớn hơn 65 và giới tính nữ
                if (pulse < 50) {
                    pulseResult = 'Nhịp tim của bạn thấp hơn bình thường. Nên kiểm tra lại sức khỏe và tập luyện thể thao đều đặn hơn!';
                } else if (pulse >= 50 && pulse < 80) {
                    pulseResult = 'Nhịp tim của bạn trong khoảng bình thường. Tiếp tục giữ vững nhé!'
                } else if (pulse >= 80 && pulse < 100) {
                    pulseResult = 'Nhịp tim của bạn cao hơn bình thường. Nên kiểm tra lại sức khỏe và giảm stress, tập luyện đều đặn hơn!';
                } else if (pulse >= 100) {
                    pulseResult = 'Nhịp tim của bạn rất cao. Bạn cần đến bác sĩ để được khám và điều trị sớm!';
                }
            }
        }
        //Đánh giá huyết áp(only tâm thu)
        var BloodPress = parseFloat('${requestScope.medicalReport.bloodPress}');
        var bloodResult;
        if (BloodPress < 90) {
            bloodResult = 'Huyết áp tâm thu của bạn thấp hơn mức bình thường. Bạn nên ăn uống đầy đủ, nghỉ ngơi đủ giấc và tập thể dục để cải thiện tình trạng này.';
        } else if (BloodPress >= 90 && BloodPress <= 119) {
            bloodResult = 'Huyết áp tâm thu của bạn trong mức bình thường. Tiếp tục giữ vững lối sống lành mạnh để duy trì sức khỏe.';
        } else if (BloodPress >= 120 && BloodPress <= 129) {
            bloodResult = 'Huyết áp tâm thu của bạn ở mức bình thường cao. Bạn nên đảm bảo việc ăn uống và tập luyện hợp lý để duy trì tình trạng này.';
        } else if (BloodPress >= 130 && BloodPress <= 139) {
            bloodResult = 'Huyết áp tâm thu của bạn ở mức tăng cao. Bạn nên hạn chế tiêu thụ muối, giảm stress và tập luyện đều đặn hơn.';
        } else if (BloodPress >= 140 && BloodPress <= 159) {
            bloodResult = 'Huyết áp tâm thu của bạn cao. Bạn nên đi khám bác sĩ để được khám và chữa trị kịp thời.';
        } else if (BloodPress >= 160 && BloodPress <= 179) {
            bloodResult = 'Huyết áp tâm thu của bạn cao. Bạn nên đi khám bác sĩ để được khám và chữa trị kịp thời.';
        } else {
            bloodResult = 'Huyết áp tâm thu của bạn rất cao. Bạn cần đến bác sĩ để được khám và điều trị sớm!';
        }
        //Đánh giá tần số hô hấp
        var breathing = parseFloat('${requestScope.medicalReport.breathing}');
        var breathingResult;
        if (age >= 12) {
            if (breathing < 12) {
                breathingResult = 'Tần số hô hấp của bạn thấp hơn bình thường. Nên kiểm tra lại sức khỏe và hỏi ý kiến bác sĩ!';
            } else if (breathing >= 12 && breathing <= 20) {
                breathingResult = 'Tần số hô hấp của bạn trong khoảng bình thường. Tiếp tục giữ vững nhé!';
            } else if (breathing > 20) {
                breathingResult = 'Tần số hô hấp của bạn cao hơn bình thường. Nên kiểm tra lại sức khỏe và hỏi ý kiến bác sĩ!';
            }
        } else if (age >= 5) {
            if (breathing < 20) {
                breathingResult = 'Tần số hô hấp của bạn thấp hơn bình thường. Nên kiểm tra lại sức khỏe và hỏi ý kiến bác sĩ!';
            } else if (breathing >= 20 && breathing <= 30) {
                breathingResult = 'Tần số hô hấp của bạn trong khoảng bình thường. Tiếp tục giữ vững nhé!';
            } else if (breathing > 30) {
                breathingResult = 'Tần số hô hấp của bạn cao hơn bình thường. Nên kiểm tra lại sức khỏe và hỏi ý kiến bác sĩ!';
            }
        } else if (age >= 1) {
            if (breathing < 20) {
                breathingResult = 'Tần số hô hấp của bé thấp hơn bình thường. Nên kiểm tra lại sức khỏe và hỏi ý kiến bác sĩ!';
            } else if (breathing >= 20 && breathing <= 30) {
                breathingResult = 'Tần số hô hấp của bé trong khoảng bình thường. Tiếp tục giữ vững nhé!';
            } else if (breathing > 30) {
                breathingResult = 'Tần số hô hấp của bé cao hơn bình thường. Nên kiểm tra lại sức khỏe và hỏi ý kiến bác sĩ!';
            }
        } else {
            if (breathing < 30) {
                breathingResult = 'Tần số hô hấp của bé thấp hơn bình thường. Nên kiểm tra lại sức khỏe và hỏi ý kiến bác sĩ!';
            } else if (breathing >= 30 && breathing <= 40) {
                breathingResult = 'Tần số hô hấp của bé trong khoảng bình thường. Tiếp tục giữ vững nhé!';
            } else if (breathing > 40) {
                breathingResult = 'Tần số hô hấp của bé cao hơn bình thường. Nên kiểm tra lại sức khỏe và hỏi ý kiến bác sĩ'
            }
        }
        document.getElementById("danh-gia-bmi").innerHTML = bmiResult;
        document.getElementById("danh-gia-pulse").innerHTML = pulseResult;
        document.getElementById("danh-gia-blood").innerHTML = bloodResult;
        document.getElementById("danh-gia-breath").innerHTML = breathingResult;
    </script>
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
