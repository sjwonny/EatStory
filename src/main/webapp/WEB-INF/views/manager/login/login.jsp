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
    <script type="text/javascript">
		function login() {
			document.login.submit();
		}
	</script>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/manager/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/manager/css/style.css" rel="stylesheet">
</head>

<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                        
                            <div class="col-lg-6 d-none d-lg-block bg-login-image" style="background-image: url(${pageContext.request.contextPath}/resources/manager/img/CleanLogo.png)"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
									<br><br>
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">EatStory Manager Page</h1>
									<br><br>
                                    </div>
                                    <form action="${pageContext.request.contextPath}/manager/login" name="login" class="user" method="post">
                                        <div class="form-group">
                                            <input type="email" name="email" class="form-control form-control-user"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="Enter Email Address" value="${email}">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="pw" class="form-control form-control-user"
                                                id="exampleInputPassword" placeholder="Password">
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                            	<c:choose>
                                            		<c:when test="${check}">
	                                            		<input type="checkbox" name="emailCheck" class="custom-control-input" id="customCheck" checked="checked">
                                            		</c:when>
                                            		<c:otherwise>
		                                                <input type="checkbox" name="emailCheck" class="custom-control-input" id="customCheck">
                                            		</c:otherwise>
                                            	</c:choose>
                                            
	                                                <label class="custom-control-label" for="customCheck">Remember Me</label>
                                            </div>
                                        </div>
                                        <a href="javascript:login();" class="btn btn-primary btn-user btn-block">
                                            Login
                                        </a>
                                        <hr>
                                    </form>
                                    <div class="text-center">
                                        <a class="small" href="forgot-password.html">Forgot Password?</a>
                                    </div>
									<br><br><br>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
<!-- 
    Bootstrap core JavaScript
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    Core plugin JavaScript
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    Custom scripts for all pages
    <script src="js/sb-admin-2.min.js"></script>
 -->
</body>

</html>