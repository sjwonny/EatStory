<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의</title>
<script>
	function deleteAction() {
		var check = confirm("삭제 하시겠습니까?");

		if (!check) {
			return;
		}

		location.href = '${pageContext.request.contextPath }/qna/delete/${vo.no}';
	}
</script>
</head>
<body>
	<div align="center" id="qna">
		<div>
			<h1>1:1문의</h1>
		</div>
		<div>
			<h3>[ ${vo.category } ] ${vo.title }</h3>
		</div>
		<div>${vo.users_name}|${vo.write_date}</div>
		<div>
			<h2>Q.</h2>
			<c:forEach var="img" items="${imgList }">
				<img alt="Q&A사진"
					src="${pageContext.request.contextPath}/resources/qna/${vo.no}/${img.filename}"
					style="width: 100px; height: 100px" />
				<br>
			</c:forEach>
			<span>사진</span>
		</div>
		<pre>${vo.content}</pre>
		<div class="btnBox">
			<input type="button" value="수정" onclick="location.href='${pageContext.request.contextPath }/qna/updateform/${vo.no}'"> <!--업데이트 폼으로 가는 컨트롤러로 이동(qna 글번호와 함께) -->
			<input type="button" value="삭제" onclick="deleteAction()"> <!-- delete url은 함수에 적혀있음  -->
		</div>
	</div>
	<c:if test="${vo.answer != null }">
		<div align="center" id="answer">
			<div>${vo.manager_no } | ${vo.answer_date }</div>
			<h2>
				A.
				<h2>
					<pre>${vo.answer }</pre>
		</div>
	</c:if>
</body>
</html>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>