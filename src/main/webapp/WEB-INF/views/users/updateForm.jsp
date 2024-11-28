<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
.form-wrapper {
	width: 400px;
	margin: 0 auto;
	padding: 40px;
	box-sizing: border-box;
}

.form-wrapper>h2 {
	font-size: 24px;
	color: #6A24FE;
	margin-bottom: 20px;
}

.form-wrapper form {
	display: grid;
	grid-template-columns: 1fr;
	grid-gap: 16px;
}

.form-wrapper label {
	font-weight: bold;
}

.form-wrapper input[type="text"],
.form-wrapper input[type="password"],
.form-wrapper input[type="number"],
.form-wrapper input[type="email"],
.form-wrapper input[type="date"] {
	width: 100%;
	height: 48px;
	padding: 0 10px;
	box-sizing: border-box;
	border-radius: 6px;
	border: 1px solid #ddd;
}

.form-wrapper input[type="submit"],
.form-wrapper input[type="button"],
.form-wrapper input.button-secondary {
	width: 100%;
	height: 48px;
	border: none;
	border-radius: 6px;
	background-color: #6A24FE;
	color: #fff;
	font-size: 16px;
	cursor: pointer;
}

.form-wrapper input[type="submit"]:hover,
.form-wrapper input[type="button"]:hover,
.form-wrapper input.button-secondary:hover {
	background-color: #4F1DA6;
}	
	
.form-wrapper>div.bt>input[type="date"] {
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

.button-secondary {
	background-color: #f1f1f1;
	color: #333;
}

.button-secondary:hover {
	background-color: #ddd;
}

.form-wrapper input[type="submit"].button-secondary,
.form-wrapper input[type="button"].button-secondary {
	background-color: #f1f1f1;
	color: #333;
}

.form-wrapper input[type="submit"].button-secondary:hover,
.form-wrapper input[type="button"].button-secondary:hover {
	background-color: #ddd;
}

</style>
<script>
	
    function checkUpdate() {
        var passwordError = document.getElementById("pwError");
        if (document.join.pw.value === "") {
            alert("비밀번호를 입력하십시오!");
            return false;
        } else if (passwordError.textContent !== "") {
            alert("비밀번호가 유효하지 않습니다. (영문, 숫자, 특수문자 조합하여 8~16자)");
            return false;
        } else if (document.join.phone.value === "") {
            alert("전화번호를 입력하십시오!");
            return false;
        } else if (document.join.birth.value === "") {
            alert("생년월일을 입력하십시오!");
            return false;
        } else if (document.join.email.value === "") {
            alert("이메일을 입력하십시오!");
            return false;
        } else if (document.join.name.value === "") {
            alert("이름을 입력하십시오!");
            return false;
        } else if (!isKorean(document.join.name.value)) {
            alert("이름은 한글로 입력해주십시오!");
            return false;
        }

        return true;
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
			document.getElementById("pw").focus();
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
<div class="form-wrapper">
	<h2>회원정보 수정</h2>
	<form action="${pageContext.request.contextPath}/users/update" method="post">
		<div>
			<label for="id">아이디(수정 불가)</label>
			<input type="text" id="id" name="id" value="${vo.id}" readonly>
		</div>
		<div>
			<label for="pw">비밀번호</label>
			<input type="password" id="pw" name="pw" value="${vo.pw}" }required
				placeholder="비밀번호 (영문,숫자,특수문자 조합하여 8~16자)" autocomplete="off"
				onblur="validatePw()">
				<span id="pwError" style="color: red;"></span>
		</div>
		<div>
			<label for="phone">전화번호</label>
			<input type="text" id="phone" name="phone" value="${vo.phone}" maxlength="11" 
				placeholder="전화번호 (숫자만 입력)" oninput="validatePhoneNumber(this)" required>
		</div>
		<div>
			<label for="birth">생년월일</label>
			<input type="date" id="birth" name="birth" value="${vo.birth}" required>
		</div>
		<div>
			<label for="email">이메일</label>
			<input type="email" id="email" name="email" value="${vo.email}" required>
		</div>
		<div>
			<label for="name">이름</label>
			<input type="text" id="name" name="name" value="${vo.name}" required
				autocomplete="off" onblur="validateName()">
				<span id="nameError" style="color: red;"></span>
		</div>
		<div>
			<input type="submit" value="수정" onclick="checkUpdate()">
			
			<input type="button" onclick="location.href='${ pageContext.request.contextPath }/users/mypage'" value="돌아가기"
				class="button-secondary">		
		</div>
	</form>
</div>
