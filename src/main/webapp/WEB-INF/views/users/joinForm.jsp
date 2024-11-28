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
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
<title>회원가입</title>
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

.join-wrapper {
	width: 400px;
	height: 350px;
	padding: 40px;
	box-sizing: border-box;
	margin-left: 37%;
	margin-top: 2%;
}

.join-wrapper>h2 {
	font-size: 24px;
	color: #6A24FE;
	margin-bottom: 20px;
}

#join-form>input {
	width: 100%;
	height: 48px;
	padding: 0 10px;
	box-sizing: border-box;
	margin-bottom: 16px;
	border-radius: 6px;
	background-color: #F8F8F8;
}

#join-form>input::placeholder {
	color: #D2D2D2;
}

#join-form>input[type="submit"] {
	color: #fff;
	font-size: 16px;
	background-color: #6A24FE;
	margin-top: 20px;
}

#join-form>input[type="checkbox"] {
	display: none;
}

.resetBtn input[type="button"] {
	float: right !important;
	background-color: pink;
	color: black;
	border-radius: 10px;
}

#join-form>div.bt {
	width: 100%;
	height: 48px;
	padding: 0 10px;
	box-sizing: border-box;
	margin-bottom: 16px;
	border-radius: 6px;
	background-color: #F8F8F8;
}

#join-form>div.bt>input[type="date"] {
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
	<script>
		function checkJoin() {
			if (document.getElementById("idError").textContent != "") {
				alert("아이디가 유효하지 않습니다.(영문,숫자 조합하여 6~16자)"); // 추가된 부분: 아이디 유효성 검사 실패 시 회원가입 방지
				return; // 아이디 유효성 검사 실패 시 회원가입 중단
			} else if (document.getElementById("pwError").textContent != "") {
				alert("비밀번호가 유효하지 않습니다.(영문,숫자,특수문자 조합하여 8~16자)"); // 추가된 부분: 비밀번호 유효성 검사 실패 시 회원가입 방지
				return; // 비밀번호 유효성 검사 실패 시 회원가입 중단
			} else if (document.getElementById("idCheckError").textContent != "사용 가능한 ID입니다") {
				alert("아이디 중복 확인을 해주십시오.");
				return; // 아이디 중복 확인 안할 시 회원가입 중단
			} else if (document.join.id.value == "") {
				alert("아이디를 입력하십시오!");
			} else if (document.join.pw.value == "") {
				alert("비밀번호를 입력하십시오!");
			} else if (document.join.repw.value == "") {
				alert("비밀번호 확인을 입력하십시오!");
			} else if (document.join.phone.value == "") {
				alert("전화번호를 입력하십시오!");
			} else if (document.join.birth.value == "") {
				alert("생년월일을 입력하십시오!");
			} else if (document.join.email.value == "") {
				alert("이메일을 입력하십시오!");
			} else if (document.join.name.value == "") {
				alert("이름을 입력하십시오!");
			} else if (!isKorean(document.join.name.value)) {
				alert("이름은 한글로 입력해주십시오!");
			} else if (document.join.pw.value != document.join.repw.value) {
				alert("비밀번호가 일치하지 않습니다.");
			} else {
				document.join.submit();
			}
		}

		//추가
		//아이디 유효성 검사
		function validateId() {
			var id = document.getElementById("id").value;
			var idPattern = /^[a-zA-Z0-9]+$/;
			var idError = document.getElementById("idError");

			if (id.length < 6 || !idPattern.test(id)) {
				idError.innerText = "아이디는 6자 이상의 영문자와 숫자만 사용 가능합니다.";
				return false;
			} else {
				idError.innerText = "";
				return true;
			}
		}

		function checkId() {
			var idInput = document.getElementById("id");
			if (idInput.value == "") {
				alert("아이디를 입력하십시오!");
				return;
			}

			var url = "${pageContext.request.contextPath}/users/checkId";
			var param = "id=" + encodeURIComponent(idInput.value);

			sendRequest(url, param, resultFn, "POST");
		}

		function resultFn() {

			if (xhr.readyState == 4 && xhr.status == 200) {
				var data = xhr.responseText;
				const join = document.getElementById("join");
				const check = document.getElementById('idCheckError');
				const idCheckError = document.getElementById('idCheckError');

				check.innerText = '';

				if (data === '사용 가능한 ID입니다') {
					check.style.cssText = "color: blue; font-size: 10px;";
					idCheckError.innerText = "";
					document.getElementById('join').disabled = false;
				} else {
					check.style.color = "red";
					idCheckError.innerText = "아이디 중복 확인이 필요합니다.";
					document.getElementById('join').disabled = true;
				}

				check.innerText = data;
			}
		}

		//비밀번호 유효성 검사
		function validatePw() {
			var passwordInput = document.getElementsByName("pw")[0];
			var passwordError = document.getElementById("pwError");

			var pw = passwordInput.value;

			//비밀번호 조건 확인
			var passwordPattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;
			if (!passwordPattern.test(pw)) {
				pwError.textContent = "비밀번호는 영문, 숫자, 특수문자 조합하여 8~16자여야 합니다.";
				pw.focus();
				return false;
			}

			pwError.textContent = "";
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
<div class="join-wrapper">
	<h2>Join</h2>
	<form action="${ pageContext.request.contextPath }/users/join"
		method="post" name="join" id="join-form">

		<input type="text" id="id" name="id" maxlength="16" placeholder="아이디 (영문,숫자 조합하여 6~16자)" autocomplete="off" onblur="validateId()"> 
		<span id="idError" style="color: red;"></span>

		<input type="button" value="중복확인" onclick="checkId()"><br>
		<span id="idCheckError"></span> 
		<input type="password" name="pw" maxlength="16" placeholder="비밀번호 (영문,숫자,특수문자 조합하여 8~16자)"
			autocomplete="off" onblur="validatePw()"> 
		<span id="pwError" style="color: red;"></span> 
		<input type="password" name="repw" maxlength="16" placeholder="비밀번호 확인"> <input type="text"
			name="phone" maxlength="11" placeholder="전화번호 (숫자만 입력)"
			oninput="validatePhoneNumber(this)"> 
		<input type="text"
			name="name" maxlength="10" placeholder="이름" autocomplete="off"
			onblur="validateName()"> 
		<span id="nameError" style="color: red;"></span>

		<div class="bt">
			<input type="date" name="birth" placeholder="생년월일">
		</div>

		<input type="email" name="email" placeholder="이메일"
			pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}" required>

		<div class="resetBtn">
			<input type="button" value="초기화" onclick="document.join-form.reset()">
		</div>

		<input id="join" type="button" value="회원가입" onclick="checkJoin()"
			style="background-color: #6A24FE; color: #fff;">

	</form>
</div>


