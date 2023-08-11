<%-- 
    Document   : Menu
    Created on : Feb 17, 2023, 11:13:50 AM
    Author     : vkhoa
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="user" class="model.User"/>
<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
    <div class="app-brand demo">
        <a href="/SWP391_Project/home" class="app-brand-link">
            <img src="../dashboard_style/assets/img/logo.svg" alt="" style="width: 60px; height: 40px">
            <span class="app-brand-text demo menu-text fw-bolder ms-2" style="text-transform: capitalize">G3 Clinic</span>
        </a>

        <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
            <i class="bx bx-chevron-left bx-sm align-middle"></i>
        </a>
    </div>

    <div class="menu-inner-shadow"></div>

    <ul class="menu-inner py-1">
        <!-- Dashboard -->
        <li class="menu-item active">
            <a href="/SWP391_Project/admin/dashboard" class="menu-link">
                <i class="menu-icon tf-icons bx bx-home-circle" style="color: orange"></i>
                <div data-i18n="Analytics" style="color: orange">Manager</div>
            </a>
        </li>

        <!-- Layouts -->
        <c:set var="u" value="${sessionScope.user}"></c:set>
        <c:if test="${u.hasRoleId(3)}">
            <li class="menu-item">
                <a href="javascript:void(0);" class="menu-link menu-toggle">
                    <i class="menu-icon tf-icons bx bx-layout"></i>
                    <div data-i18n="Layouts">Quản lý phòng khám</div>
                </a>

                <ul class="menu-sub">
                    <li class="menu-item">
                        <a href="/SWP391_Project/manage/services" class="menu-link">
                            <div data-i18n="Without menu">Dịch vụ</div>
                        </a>
                    </li>
                    <li class="menu-item">
                        <a href="/SWP391_Project/manage/treatment" class="menu-link">
                            <div data-i18n="Without navbar">Phương pháp điều trị </div>
                        </a>
                    </li>
                    <li class="menu-item">
                        <a href="/SWP391_Project/manage/drug" class="menu-link">
                            <div data-i18n="Container">Danh mục thuốc</div>
                        </a>
                    </li>
                 
                </ul>
            </li>
        </c:if>
        <c:if test="${u.hasRoleId(2)}">
            <li class="menu-item">
                <a href="javascript:void(0);" class="menu-link menu-toggle">
                    <i class="menu-icon tf-icons bx bx-dock-top"></i>
                    <div data-i18n="Account Settings">Quản lý khám chữa bệnh</div>
                </a>
                <ul class="menu-sub">
                    <li class="menu-item">
                        <a href="../doctor/waiting-patient-list" class="menu-link">
                            <div data-i18n="Account">Waiting Patient List</div>
                        </a>
                    </li>
                    <li class="menu-item">
                        <a href="../doctor/bill-list" class="menu-link">
                            <div data-i18n="Notifications">Invoices not paid yet</div>
                        </a>
                    </li>
                    <li class="menu-item">
                        <a href="../doctor/booked-list" class="menu-link">
                            <div data-i18n="Connections">Booked list</div>
                        </a>
                    </li>
                </ul>
            </li>
        </c:if>
        <c:if test="${u.hasRoleId(4)}">
            <li class="menu-item">
                <a href="javascript:void(0);" class="menu-link menu-toggle">
                    <i class="menu-icon tf-icons bx bx-lock-open-alt"></i>
                    <div data-i18n="Authentications">Quản lý tài khoản</div>
                </a>
                <ul class="menu-sub">
                    <li class="menu-item">
                        <a href="auth-login-basic.html" class="menu-link" target="_blank">
                            <div data-i18n="Basic">future</div>
                        </a>
                    </li>
                    <li class="menu-item">
                        <a href="auth-register-basic.html" class="menu-link" target="_blank">
                            <div data-i18n="Basic">future</div>
                        </a>
                    </li>
                    <li class="menu-item">
                        <a href="auth-forgot-password-basic.html" class="menu-link" target="_blank">
                            <div data-i18n="Basic">future</div>
                        </a>
                    </li>
                </ul>
            </li>
        </c:if>
        <c:if test="${u.hasRoleId(2)}">
        </c:if>
    </ul>
</aside>