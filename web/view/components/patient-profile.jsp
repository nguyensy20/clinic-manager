<%-- 
    Document   : patient-profile
    Created on : Mar 4, 2023, 4:42:43 PM
    Author     : nguye
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set var="p" value="${sessionScope.patient}"></c:set>
<div class="card mb-4">
    <div class="card-body">
        <img src="../image/logo.png" alt="user-avatar" class="d-block rounded" height="150" width="150" id="uploadedAvatar">
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label" for="basic-default-name">Họ và tên:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="basic-default-name" placeholder="${p.name}" value="${p.name}">
            </div>
        </div>
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label" for="basic-default-name">Địa chỉ hiện tại: </label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="basic-default-name" placeholder="${p.address}" value="${p.address}">
            </div>
        </div>
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label" for="basic-default-name">Ngày tháng năm sinh</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="basic-default-name" placeholder="${p.dob}" value="${p.dob}">
            </div>
        </div>
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label" for="basic-default-name">Giới tính</label>
            <c:if test="${p.gender}">
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="basic-default-name" placeholder="Nam" value="Nam">
                </div>
            </c:if>
            <c:if test="${!p.gender}">
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="basic-default-name" placeholder="Nữ" value="Nữ">
                </div>
            </c:if>
        </div>
        <div class="row mb-3">
            <label class="col-sm-2 col-form-label" for="basic-default-name">Số điện thoại :</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="basic-default-name" placeholder="${p.phone}" value="${p.phone}">
            </div>
        </div>
    </div>
</div>