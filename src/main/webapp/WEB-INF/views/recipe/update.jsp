<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript">
		function checkWrite() {
			if(confirm("수정하시겠습니까?")) {
				document.write.submit();
			}
		}
	</script>
</head>
<body>
<div align="center">
	<form action="${pageContext.request.contextPath}/recipe/write" method="post" name="write" enctype="multipart/form-data">
		<label for="title">레시피 제목</label>
		<input name="title" value="${vo.title}"><br>
		<label for="describe">요리 소개</label>
		<input name="describe" value="${vo.describe}"><br>
		<label for="main_photo">대표 요리 사진</label>
		<input type="file" name="main_photo" accept="image/jpeg, image/png, image/jpg, image/gif"><br>
		<label for="video">동영상</label>
		<input name="video" value="${vo.video}"><br>
  		카테고리
		<select name="type_no">
			<option value="">종류별</option>
			<c:forEach var="type" items="${typeList}">
				<option value="${type.no}">${type.type}</option>
			</c:forEach>
		</select>
		<select name="situation_no">
			<option value="">상황별</option>
			<c:forEach var="situation" items="${situationList}">
				<option value="${situation.no}">${situation.situation}</option>
			</c:forEach>
		</select>
		<select name="method_no">
			<option value="">방법별</option>
			<c:forEach var="method" items="${methodList}">
				<option value="${method.no}">${method.method}</option>
			</c:forEach>
		</select>
		<select name="ingredient_no">
			<option value="">재료별</option>
			<c:forEach var="ingre" items="${ingreList}">
				<option value="${ingre.no}">${ingre.ingre}</option>
			</c:forEach>
		</select>
		<br>

		인원<select name="people_count">
			<option value="">인원</option>
			<option value="1">1인분</option>
			<option value="2">2인분</option>
			<option value="3">3인분</option>
			<option value="4">4인분</option>
			<option value="5">5인분</option>
			<option value="6">6인분 이상</option>
		</select>
		시간<select name="hour">
			<option value="">시간</option>
			<option value="5">5분이내</option>
			<option value="10">10분이내</option>
			<option value="20">20분이내</option>
			<option value="30">30분이내</option>
			<option value="60">60분이내</option>
			<option value="90">90분이내</option>
			<option value="120">2시간이내</option>
			<option value="999">2시간이상</option>
		</select>
		난이도<select name="difficulty">
			<option value="">난이도</option>
			<option value="1">아무나</option>
			<option value="2">초급</option>
			<option value="3">중급</option>
			<option value="4">고급</option>
			<option value="5">신의경지</option>
		</select>
		<br><br><br>
		
		<label for="ingredientVoList[0].category">재료</label>
		<input name="ingredientVoList[0].category" value=""><br>
		<label for="ingredientVoList[0].content">항목</label>
		<input name="ingredientVoList[0].content" value=""><br>
		<label for="ingredientVoList[0].amount">재료양</label>
		<input name="ingredientVoList[0].amount" value=""><br>
		<label for="ingredientVoList[1].category">재료</label>
		<input name="ingredientVoList[1].category" value=""><br>
		<label for="ingredientVoList[1].content">항목</label>
		<input name="ingredientVoList[1].content" value=""><br>
		<label for="ingredientVoList[1].amount">재료양</label>
		<input name="ingredientVoList[1].amount" value=""><br>
		<label for="ingredientVoList[1].content">항목</label>
		<input name="ingredientVoList[1].content" value=""><br>
		<label for="ingredientVoList[1].amount">재료양</label>
		<input name="ingredientVoList[1].amount" value=""><br><br><br>
		
		<label for="stepVoList[0].detail">Step 1</label>
		<input name="stepVoList[0].detail" value="">
		<label for="stepVoList[0].step_photo">대표 요리 사진</label>
		<input type="file" name="stepVoList[0].step_photo" accept="image/jpeg, image/png, image/jpg, image/gif"><br>
		<label for="stepVoList[0].ingre">재료</label>
		<input name="stepVoList[0].ingre" value=""><br>
		<label for="stepVoList[0].tool">도구</label>
		<input name="stepVoList[0].tool" value=""><br>
		<label for="stepVoList[0].fire">불</label>
		<input name="stepVoList[0].fire" value=""><br>
		<label for="stepVoList[0].tip">팁</label>
		<input name="stepVoList[0].tip" value=""><br>
		
		<label for="stepVoList[1].detail">Step 2</label>
		<input name="stepVoList[1].detail" value="">
		<label for="stepVoList[1].step_photo">대표 요리 사진</label>
		<input type="file" name="stepVoList[1].step_photo" accept="image/jpeg, image/png, image/jpg, image/gif"><br>
		<label for="stepVoList[1].ingre">재료</label>
		<input name="stepVoList[1].ingre" value=""><br>
		<label for="stepVoList[1].tool">도구</label>
		<input name="stepVoList[1].tool" value=""><br>
		<label for="stepVoList[1].fire">불</label>
		<input name="stepVoList[1].fire" value=""><br>
		<label for="stepVoList[1].tip">팁</label>
		<input name="stepVoList[1].tip" value=""><br><br><br>
		
		<label for="end_image">요리 완성 사진</label>
		<input type="file" name="end_image" multiple="multiple" accept="image/jpeg, image/png, image/jpg, image/gif"><br><br><br>
		
		<label for="tips">요리팁</label>
		<input name="tips" value=""><br><br><br>
		
		<label for="tag">태그</label>
		<input name="tage" value="">
		<input type="button" value="등록하기" onclick="javascript:checkWrite()">
	</form>
</div>
</body>
</html>