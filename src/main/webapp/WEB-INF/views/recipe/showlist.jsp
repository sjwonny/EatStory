<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 사이트</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 960px;
	margin: 0 auto;
	padding: 20px;
}

h2 {
	text-align: center;
	margin-bottom: 20px;
}

.recipe-list {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
}

.recipe-item {
	width: calc(25% - 20px);
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	padding: 10px;
	background-color: #fff;
}

.recipe-image {
	width: 100%;
	height: auto;
	margin-bottom: 10px;
}

.recipe-title {
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 5px;
}

.user-profile {
	display: flex;
	align-items: center;
	margin-bottom: 5px;
}

.user-image {
	width: 30px;
	height: 30px;
	border-radius: 50%;
	margin-right: 10px;
}

.user-name {
	font-size: 14px;
	font-style: italic;
}

.rating {
	font-size: 14px;
	margin-bottom: 5px;
}

.hit {
	font-size: 14px;
	color: #888;
}
</style>
</head>
<body>
	<div class="container">
		<h2>총 ${count}개의 맛있는 레시피가 있습니다.</h2>
		<a class="btn"
			href="${pageContext.request.contextPath}/recipe/writeform">레시피 등록</a> <!-- 컨트롤러로! -->
		<div class="recipe-list">
			<c:choose>
				<c:when test="${list == null}"> <!-- 리스트가 없다면 -->
					<p class="no-recipe-msg">레시피가 존재하지 않습니다.</p>
				</c:when>
				<c:otherwise> <!-- 레시피가 있다면 -->
					<c:forEach var="vo" items="${list}"> <!-- list vo에 담기 -->
						<div class="recipe-item">
							<a href="${pageContext.request.contextPath}/recipe/${vo.no}"> <!-- 컨트롤러로 레시피 번호 보냄(시퀀스)그리고 상세페이지로 넘어감 -->
							<img class="recipe-image" src="${pageContext.request.contextPath}/resources/recipe/${vo.no}/main.jpeg" alt="레시피 이미지" />
							</a> 
							<div class="recipe-title">${vo.title}</div> <!-- 레시피 제목 -->
							<div class="user-profile">
								<img class="user-image" src="${pageContext.request.contextPath}/resources/images/users.png" alt="프로필 이미지" /> 
								<div class="user-name">${vo.users_name}</div> <!-- 작성자 이름 -->
							</div>
							<div class="rating">별점: ${vo.score/2}</div> 
							<div class="hit">조회수: ${vo.hit}</div> <!-- 조회수  -->
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
