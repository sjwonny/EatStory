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
<title>비밀번호 찾기</title>
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

.findpw-wrapper {
	width: 400px;
	height: 350px;
	padding: 40px;
	box-sizing: border-box;
	margin-left: 37%;
	margin-top: 2%;
}

.findpw-wrapper>h2 {
	font-size: 24px;
	color: #6A24FE;
	margin-bottom: 20px;
}

#findpw-form>input {
	width: 100%;
	height: 48px;
	padding: 0 10px;
	box-sizing: border-box;
	margin-bottom: 16px;
	border-radius: 6px;
	background-color: #F8F8F8;
}

#findpw-form>input::placeholder {
	color: #D2D2D2;
}

#findpw-form>input[type="submit"] {
	color: #fff;
	font-size: 16px;
	background-color: #6A24FE;
	margin-top: 20px;
}

#findpw-form>input[type="checkbox"] {
	display: none;
}

.resetBtn input[type="button"] {
	float: right !important;
	background-color: pink;
	color: black;
	border-radius: 10px;
}

#findpw-form>div.bt {
	width: 100%;
	height: 48px;
	padding: 0 10px;
	box-sizing: border-box;
	margin-bottom: 16px;
	border-radius: 6px;
	background-color: #F8F8F8;
}

#findpw-form>div.bt>input[type="date"] {
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
		if (document.findpw.id.value == "") {
			alert("아이디를 입력하십시오!");
			return false;
		} else if (document.findpw.name.value == "") {
			alert("이름을 입력하십시오!");
			return false;
		} else if (document.findpw.email.value == "") {
			alert("이메일을 입력하십시오!");
			return false;
		}
		return true;
	}

</script>

	<div class="findpw-wrapper">
	<h2>Find PassWord</h2>
	<form action="${pageContext.request.contextPath}/login/findpw"
		method="post" name="findpw" id=findpw-form onsubmit="return checkJoin();">
		
		<input type="text" name="id" placeholder="아이디">
		
		<input type="text" name="name" placeholder="이름">
		
		<input type="text" name="email" placeholder="이메일">
		
		<input type="submit" value="인증 메일 전송">
		
		<input type="button" value="초기화" onclick="document.findpw.reset()">
		
	</form>
</div>
</body>
</html>
