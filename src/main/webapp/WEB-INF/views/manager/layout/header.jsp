<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>EatStory Manager Page</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/manager/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/manager/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/manager/css/style1.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/manager/css/dataTables.bootstrap4.min.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
    <script type="text/javascript">
		function checkLog() {
			if (confirm("로그아웃 하시겠습니까?")) {
				location.href="${pageContext.request.contextPath}/manager/logout";
			}
		}	
    </script>

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center"
             href="${pageContext.request.contextPath}/manager">
                <div class="sidebar-brand-icon rotate-n-15">
                    <img src="${pageContext.request.contextPath}/resources/manager/img/CleanLogo.png" style="width:40px; heigth:40px">
                    <!-- <i class="fas fa-laugh-wink"></i> -->
                </div>
                <div class="sidebar-brand-text mx-3">관리자 페이지<sup>EatStory</sup></div>
            </a>
 
            <!-- Divider -->
            <hr class="sidebar-divider">
            <div class="sidebar-heading">
				고객
            </div>
            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath}/manager/userslist">
                    <span>고객 관리</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="">
                    <span>이메일 발송</span></a>
            </li>
            <!-- Divider -->
            <hr class="sidebar-divider">
            <div class="sidebar-heading">
				브랜드
            </div>
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath}/manager/brandlist">
                    <span>입점 브랜드 관리</span></a>
            </li>
            <hr class="sidebar-divider">
            <div class="sidebar-heading">
				게시물
            </div>
            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath}/manager/goodslist">
                    <span>상품 관리</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath}/manager/qnalist">
                    <span>1대1 문의</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="">
                    <span>신고 관리</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="">
                    <span>레시피 관리</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="">
                    <span>이벤트 관리</span></a>
            </li>
            <!-- Divider -->
            <hr class="sidebar-divider">
        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

<!--                      Topbar Search
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form> -->

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" onclick="javascript:checkLog()" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${ESmanagerLogin.name}</span>
                                <img class="img-profile rounded-circle"
                                    src="${pageContext.request.contextPath}/resources/manager/img/undraw_profile.svg">
                            </a>
                        </li>
                    </ul>

                </nav>
                <!-- End of Topbar -->
