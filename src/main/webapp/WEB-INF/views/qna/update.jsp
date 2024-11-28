<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">

	function addImageInput() {
		var container = document.getElementById('image-container');
		var div = document.createElement('div');
		var input = document.createElement('input');
		input.type = 'file';
		input.name = 'img';
		input.size = '400';
		div.appendChild(input);
		container.appendChild(div);

		var label = document.createElement('label');
		var checkbox = document.createElement('input');
		checkbox.type = 'checkbox';
		checkbox.name = 'deleteImage';
		label.htmlFor = checkbox.name;
		label.textContent = '삭제';

		div.appendChild(input);
		div.appendChild(label);
		div.appendChild(checkbox);
		container.appendChild(div);
	}
</script>

<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<div align="center">
	<form action="${pageContext.request.contextPath }/qna/update"
		method="post" name="update" enctype="multipart/form-data">
		<c:if test="${vo.no != null }"> <!-- no가 컨트롤러에서 보여지지 않았는데 어떻게 여기서 쓰일 수 있는지 -->
			<input type="hidden" name="no" value="${vo.no }"> <!-- hidden으로 no값 컨트롤러로 보내기 -->
		</c:if> 
		<table class="boardTable">
			<tr>
				<th>말머리</th>
				<td><select class="tune" id="category" name="category"
					style="width: 127px;">
						<option value="">문의내용</option>
						<option value="회원/정보관리"
							${vo.category eq '회원/정보관리' ? 'selected' : ''}>회원/정보관리</option>
						<option value="주문/결제" ${vo.category eq '주문/결제' ? 'selected' : ''}>주문/결제</option>
						<option value="배송" ${vo.category eq '배송' ? 'selected' : ''}>배송</option>
						<option value="반품/환불/교환/AS"
							${vo.category eq '반품/환불/교환/AS' ? 'selected' : ''}>반품/환불/교환/AS</option>
						<option value="영수증/증빙서류"
							${vo.category eq '영수증/증빙서류' ? 'selected' : ''}>영수증/증빙서류</option>
						<option value="상품/이벤트"
							${vo.category eq '상품/이벤트' ? 'selected' : ''}>상품/이벤트</option>
						<option value="기타" ${vo.category eq '기타' ? 'selected' : ''}>기타</option>
				</select></td>
			</tr>
			<tr>
				<th>휴대폰</th>
				<td><input type="text" name="phone" placeholder="--없이 입력하세요"
					value="${vo.phone }"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" id="emailInput" name="email"
					value="${vo.email }"> <select id="emailSelect"
					onchange="fillEmail()">
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
					var selectedOption = selectBox.options[selectBox.selected
				Index];
					var emailDomain = selectedOption.value;

					emailInput.value = emailInput.value.split("@")[0]
							+ emailDomain;
				}
			</script>
			<tr>
				<th width="60">제목</th>
				<td><input type="text" name="title" size="53" value="${vo.title }"></td>
			</tr>
			<tr>
				<td colspan="2"><textarea id="summernote" rows="15" cols="65" name="content"> ${vo.content }
					</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<div id="image-container">
						<c:forEach var="filename" items="${vo.filenames}">
							<div>${filename}
								<input type="checkbox" name="deleteImage" value="${filename}" id="deleteImage"> <label for="deleteImage">삭제</label>
							</div>
						</c:forEach>
					</div>
					<button type="button" onclick="addImageInput()">추가</button>
				</td>
			</tr>
		</table>
		<div class="btnBox">
			<input type="button" value="이전" onclick="history.back()"> 
			<input type="submit" value="저장">
		</div>
	</form>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		$('#summernote').summernote();
	});
</script>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
