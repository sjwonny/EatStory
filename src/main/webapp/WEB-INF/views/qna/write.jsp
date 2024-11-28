<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<style>
	/* 전체 중앙 정렬 */
div[align="center"] {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 20px;
    font-family: Arial, sans-serif;
}

/* 테이블 스타일 */
.boardTable {
    border-collapse: collapse;
    width: 80%;
    margin: 20px 0;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.boardTable th, .boardTable td {
    border: 1px solid #ddd;
    padding: 10px;
}

.boardTable th {
    background-color: #f4f4f4;
    text-align: left;
    width: 150px;
    font-weight: bold;
}

.boardTable td {
    background-color: #fff;
}

/* 입력 필드 스타일 */
input[type="text"], input[type="email"], select, textarea {
    width: calc(100% - 20px);
    padding: 8px;
    margin: 5px 0;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    font-size: 14px;
}

textarea {
    resize: none;
}

/* 파일 입력 및 버튼 추가 스타일 */
#image-container {
    margin-top: 10px;
}

input[type="file"] {
    font-size: 14px;
}

button {
    background-color: #007bff;
    color: #fff;
    border: none;
    padding: 8px 12px;
    margin: 10px 0;
    border-radius: 4px;
    cursor: pointer;
    font-size: 14px;
}

button:hover {
    background-color: #0056b3;
}

/* 버튼 박스 스타일 */
.btnBox {
    display: flex;
    justify-content: space-between;
    width: 80%;
    margin: 20px 0;
}

.btnBox input[type="button"] {
    background-color: #28a745;
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 4px;
    font-size: 14px;
    cursor: pointer;
}

.btnBox input[type="button"]:hover {
    background-color: #218838;
}
	</style>
<script type="text/javascript">
	function checkWrite() {
		if (document.write.email.value == "") {
			alert("이메일을 입력하십시오!");
		} else if (document.write.phone.value == "") {
			alert("전화번호를 입력하십시오!");
		} else if (document.write.title.value == "") {
			alert("제목을 입력하시오")
		} else if (document.write.content.value == "") {
			alert("내용을 입력하십시오!")
		} else {
			document.write.submit();
		}
	}

	function addImageInput() {
		var container = document.getElementById('image-container');
		var div = document.createElement('div');
		var input = document.createElement('input');
		input.type = 'file';
		input.name = 'img';
		input.size = '400';
		div.appendChild(input);
		container.appendChild(div);
	}
</script>

<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<div align="center">
<h2>Q&A</h2>
	<form action="${pageContext.request.contextPath }/qna/write"
		method="post" name="write" enctype="multipart/form-data">
		<c:if test="${no != null }">
			<input type="hidden" name="no" value="${no }">
		</c:if>
		<table class="boardTable">
			<tr>
				<th>말머리</th>
				<td><select class="tune" id="category" name="category"
					style="width: 127px;">
						<option value="">문의내용</option>
						<option value="회원/정보관리">회원/정보관리</option>
						<option value="주문/결제">주문/결제</option>
						<option value="배송">배송</option>
						<option value="반품/환불/교환/AS">반품/환불/교환/AS</option>
						<option value="영수증/증빙서류">영수증/증빙서류</option>
						<option value="상품/이벤트">상품/이벤트</option>
						<option value="기타">기타</option>
				</select></td>
			</tr>
			<tr>
				<th>휴대폰</th>
				<td><input type="text" name="phone" placeholder="--없이 입력하세요"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" id="emailInput" name="email"> <select
					id="emailSelect" onchange="fillEmail()">
						<option value="">직접입력</option>
						<option value="@naver.com">naver.com</option>
						<option value="@hanmail.net">hanmail.net</option>
						<option value="@daum.net">daum.net</option>
						<option value="@nate.com">nate.com</option>
						<option value="@hotmail.com">hotmail.com</option>
						<option value="@gmail.com">gmail.com</option>
						<option value="@icloud.com">icloud.com</option>
				</select></td>
			</tr>
			<script>
				function fillEmail() {
					var selectBox = document.getElementById("emailSelect");
					var emailInput = document.getElementById("emailInput");
					var selectedOption = selectBox.options[selectBox.selectedIndex];
					var emailDomain = selectedOption.value;

					emailInput.value = emailInput.value.split("@")[0]
							+ emailDomain;
				}
			</script>
			<tr>
				<th width="60">제목</th>
				<td><input type="text" name="title" size="53"></td>
			</tr>
			<tr>
				<td colspan="2"><textarea id="summernote" rows="15" cols="65"
						name="content"> 
주문하신 경우 양식에 맞게 항목을 기재해주시면 빠른 업무처리가 가능합니다.
휴일간 문의사항은 휴무일 이후 순차적으로 처리해드리겠습니다.
주문번호 :
상품명 :
----------------------------------------------
					</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<div id="image-container">
						<input type="file" name="img" size="400">
					</div>
					<button type="button" onclick="addImageInput()">추가</button>
				</td>
			</tr>
		</table>
		<div class="btnBox">
			<input type="button" value="이전" onclick="history.back()"> <input
				type="button" value="저장" onclick="javascript:checkWrite()">
		</div>
	</form>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		$('#summernote').summernote();
	});
</script>

