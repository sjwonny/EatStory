<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/manager/layout/header.jsp" %>	
<!-- Begin Page Content -->
<div class="container-fluid">
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">[${vo.category}] ${vo.title}</h6>
		</div>
		<div class="card-body">
			<p><b>${vo.users_name}</b>	&#160; &#124; &#160; ${vo.write_date} &#160; &#124; &#160; ${vo.phone} &#160; &#124; &#160; ${vo.email}</p>
			<hr>
			<p class="mb-0">${vo.content}</p>
			<c:if test="${iList != null}">
				<c:forEach var="image" items="${iList}">
					<img src="${pageContext.request.contextPath}/resources/qna/${image}.jpeg" width="200">			
				</c:forEach>
			</c:if>
		</div>
	</div>
	<div class="card shadow mb-4">
		<c:choose>
			<c:when test="${vo.answer == null}">
				<div class="card-body">
					<textarea id="answer" style="resize:none; width: 100%; height: 300px;">${vo.answer}</textarea>
				</div>
				<div class="card-header py-3">
					<a onclick="insertCheck()" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">답변 달기</a>
				</div>
			</c:when>
			<c:otherwise>
				<div class="card-body">
					<p><b>${vo.admin_name}</b>	&#160; &#124; &#160; ${vo.answer_date}</p>
					<hr>
					<textarea id="answer" style="resize:none; width: 100%; height: 300px; background-color: white;" disabled="disabled">${vo.answer}</textarea>
				</div>
				<div class="card-header py-3">
					<a onclick="disableCheck()" id="update" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">수정</a>
					<a onclick="deleteCheck()" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">삭제</a>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>

<script type="text/javascript">
	function deleteCheck() {
		if (confirm("답변을 삭제하시겠습니까?")) {
			location.href="${pageContext.request.contextPath}/manager/qna/answerDelete/${vo.no}";
			var url = "${pageContext.request.contextPath}/manager/qna/answerDelete/${vo.no}";
			sendRequest(url, '', ResultFn, "POST");
		}
	}

	function disableCheck() {
		const update = document.getElementById('answer');
		if (update.disabled == true) {
			update.disabled = false;
			const btn = document.getElementById("update");
			console.log(btn);
			btn.innerText = "수정 완료";
		} else {
			if (confirm("답변을 수정하시겠습니까?")) {
				var url = "${pageContext.request.contextPath}/manager/qna/answerUpdate/${vo.no}";
				var param = "answer=" + encodeURIComponent(update.value);
				sendRequest(url, param, ResultFn, "POST");
			}
		}
	}

	function insertCheck() {
		var answer = document.getElementById('answer').value;
		if (answer == "") {
			alert("답변을 작성해주세요.");
		} else {
			if (confirm("답변을 작성하시겠습니까?")) {
				var url = "${pageContext.request.contextPath}/manager/qna/answerUpdate/${vo.no}";
				var param = "answer=" + encodeURIComponent(answer);
				
				sendRequest(url, param, ResultFn, "POST");
			}
		}
	}
	
	function ResultFn() {
		if(xhr.readyState == 4 && xhr.status == 200) {
			location.reload();
		}
	}
</script>

<%@ include file="/WEB-INF/views/manager/layout/footer.jsp" %>