<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style type="text/css">
table {
	width: 400px;
	margin: 0 auto;
	border-collapse: collapse;
}

td {
	padding: 8px;
	border: 1px solid #ddd;
}

.label {
	font-weight: bold;
	background-color: #f1f1f1;
}

.value {
	text-align: center;
}

.button-row {
	text-align: right;
}

.button {
	padding: 8px 16px;
	background-color: #6A24FE;
	color: #fff;
	border-radius: 4px;
	font-size: 16px;
	border: none;
	cursor: pointer;
}

.button:hover {
	background-color: #4F1DA6;
}
</style>
<div align="center">
	<h2 style="color: #6A24FE;">회원정보</h2>
	<table id="table">
		<tr>
			<td class="label">번호</td>
			<td class="value">${vo.no}</td>
		</tr>
		<tr>
			<td class="label">아이디</td>
			<td class="value">${vo.id}</td>
		</tr>
		<tr>
			<td class="label">비밀번호</td>
			<td class="value">${vo.pw}</td>
		</tr>
		<tr>
			<td class="label">전화번호</td>
			<td class="value">${vo.phone}</td>
		</tr>
		<tr>
			<td class="label">생년월일</td>
			<td class="value">${vo.birth}</td>
		</tr>
		<tr>
			<td class="label">이메일</td>
			<td class="value">${vo.email}</td>
		</tr>
		<tr>
			<td class="label">이름</td>
			<td class="value">${vo.name}</td>
		</tr>
		<tr>
			<td colspan="2" class="button-row">
			<input type="button" value="수정" onclick="location.href='${pageContext.request.contextPath}/users/updateform'" class="button">
		    <input type="button" value="회원탈퇴" onclick="location.href='${pageContext.request.contextPath}/users/deleteform'" class="button">
		    </td>
		</tr>
	</table>
</div>
