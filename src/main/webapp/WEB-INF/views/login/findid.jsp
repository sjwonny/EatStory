<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

ul {
	list-style: none;
} /* 리스트 앞에 . 같은거 제거*/
a {
	text-decoration: none;
} /* 링크에 밑줄 같은거 제거*/
* {
	padding: 0;
	margin: 0;
	border: none;
}

body {
	font-size: 14px;
	font-family: 'Roboto', sans-serif;
}

.findid-wrapper {
	width: 400px;
	height: 350px;
	padding: 40px;
	box-sizing: border-box;
	margin-left: 37%;
	margin-top: 2%;
}

.findid-wrapper>h2 {
	font-size: 24px;
	color: #6A24FE;
	margin-bottom: 20px;
}

#findid-form>input {
	width: 100%;
	height: 48px;
	padding: 0 10px;
	box-sizing: border-box;
	margin-bottom: 16px;
	border-radius: 6px;
	background-color: #F8F8F8;
}

#findid-form>input::placeholder {
	color: #D2D2D2;
}

#findid-form>input[type="submit"] {
	color: #fff;
	font-size: 16px;
	background-color: #6A24FE;
	margin-top: 20px;
}

#findid-form>input[type="checkbox"] {
	display: none;
}

.resetBtn input[type="button"] {
	float: right !important;
	background-color: pink;
	color: black;
	border-radius: 10px;
}

#findid-form>div.bt {
	width: 100%;
	height: 48px;
	padding: 0 10px;
	box-sizing: border-box;
	margin-bottom: 16px;
	border-radius: 6px;
	background-color: #F8F8F8;
}

#findid-form>div.bt>input[type="date"] {
	width: 100%;
	height: 100%;
	border: none;
	border-radius: 6px;
	background-color: #F8F8F8;
	/* color: #D2D2D2; */
	color: black;
	font-size: 14px; /* 글자 크기 변경 */
	font-family: 'Roboto', sans-serif; /* 영어로 표시 */
}
</style>
</head>
<body>
<script type="text/javascript">

	function checkJoin() {
		var name = document.getElementById("name").value;
		var phone = document.getElementById("phone").value;

		if (name == "") {
			alert("이름을 입력해주세요.");
			return false;
		}

		if (phone == "") {
			alert("전화번호를 입력해주세요.");
			return false;
		}

		if (!isKorean(name)) {
			alert("이름은 한글로 입력해주세요.");
			return false;
		}

		return true;
	}

	//전화번호 형식 확인
	function validatePhoneNumber(input) {
		input.value = input.value.replace(/\D/g, ''); // 숫자 이외의 문자는 제거
	}

	//이름 형식 확인
	function validateName() {
		var nameInput = document.getElementsByName("name")[0];
		var nameError = document.getElementById("nameError");
		var name = nameInput.value;
		var koreanPattern = /^[가-힣]+$/;

		if (!koreanPattern.test(name)) {
			nameError.textContent = "이름은 한글만 입력 가능합니다.";
			nameInput.focus();
			return false;
		}

		nameError.textContent = "";
		return true;
	}

	function isKorean(text) {
		var pattern = /^[ㄱ-ㅎ가-힣]+$/;
		return pattern.test(text);
	}
</script>
</body>
</html>
	<div class="findid-wrapper">
	<h2>Find ID</h2>
	<form action="${ pageContext.request.contextPath }/login/findid"
		method="post" name="findid" id="findid-form" onsubmit="return checkJoin();">
		
			<input type="text" id="name" name="name" placeholder="이름" maxlength="10"
				onblur="validateName()">
				<span id="nameError" style="color: red;"></span>
			
			<input type="text" id="phone" name="phone" placeholder="전화번호 (숫자만 입력)"
				maxlength="11" oninput="validatePhoneNumber(this)">
			
			<input type="submit" value="찾기">
			
			<input type="button" value="초기화" onclick="document.findid.reset()">
			
	</form>	
</div>

