<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 재설정</title>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f1f1f1;
        }

        .resetpw-wrapper {
            width: 400px;
            margin: 0 auto;
            padding: 40px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .resetpw-wrapper h2 {
            font-size: 24px;
            color: #6A24FE;
            margin-bottom: 20px;
        }

        .resetpw-wrapper p {
            margin-bottom: 16px;
        }

        .resetpw-wrapper input[type="text"] {
            width: 100%;
            height: 40px;
            padding: 8px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 12px;
        }
        
        .resetpw-wrapper input[type="password"] {
            width: 100%;
            height: 40px;
            padding: 8px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 12px;
        }

        .resetpw-wrapper input[type="submit"] {
            width: 100%;
            height: 40px;
            padding: 8px;
            border: none;
            border-radius: 4px;
            background-color: #6A24FE;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<script>

	function validatePw() {
		var idInput = document.getElementsByName("id")[0];
		var passwordInput = document.getElementsByName("pw")[0];
		var confirmPasswordInput = document.getElementsByName("repw")[0];
		var idError = document.getElementById("idError");
		var passwordError = document.getElementById("pwError");

		var id = idInput.value.trim();
		var pw = passwordInput.value;
		var repw = confirmPasswordInput.value;

		// 아이디 확인
		if (id === "") {
			idError.textContent = "기존 아이디를 입력해주세요.";
			idInput.focus();
			return false;
		} else {
			idError.textContent = "";
		}

		// 비밀번호 조건 확인
		var passwordPattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;
		if (!passwordPattern.test(pw)) {
			passwordError.textContent = "비밀번호는 영문, 숫자, 특수문자 조합하여 8~16자여야 합니다.";
			passwordInput.focus();
			return false;
		} else {
			passwordError.textContent = "";
		}

		// 비밀번호 확인 일치 여부 확인
		if (pw !== repw) {
			passwordError.textContent = "비밀번호와 확인용 비밀번호가 일치하지 않습니다.";
			passwordInput.focus();
			return false;
		} else {
			passwordError.textContent = "";
		}

		return true;
	}
	
	
</script>

    <div class="resetpw-wrapper">
        <h2>비밀번호 재설정</h2>
		<form action="${contextPath}/users/resetpw" method="post" onsubmit="return validatePw();">
            <p>새로운 비밀번호를 입력하세요:</p>
            
            <input type="text" name="id" placeholder="기존 아이디" > 
            	<span id="idError" style="color: red;"></span> 
             
            <input type="password" name="pw" placeholder="새로운 비밀번호 (영문,숫자,특수문자 조합하여 8~16자)" required>
            	<span id="pwError" style="color: red;"></span>
            
            <input type="password" name="repw" placeholder="비밀번호 확인" required>
             
            
            <input type="submit" value="비밀번호 재설정">
        </form>
    </div>
</body>
</html>
