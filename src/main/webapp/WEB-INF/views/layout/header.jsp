<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Eat Story</title>


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
header {
	/*메인 이미지의 너비 사이즈와 같음*/
	height: 160px;
	background-color: #FFFFFF;
	border-bottom: 1px solid #dcdcdc;
	width: 100%;
	text-align: center;
}

#logo {
	position: absolute;
	top: 0px;
	left: 40px;
}

#topMenu {
	position: absolute;
	top: 20px;
	right: 70px;
}

/* top_menu a의 글시 검정색으로 */
#topMenu a {
	color: gray;
	font-weight: bold;
}

.typeNav {
	position: absolute;
	top: 125px;
	left: 320px;
	font-size: 16px;
}

.typeNav li {
	display: inline;
	margin: 0 50px;
}

/* 콘텐츠 영역의 알래에 있는 배너 이미지 inline으로 */
#content li {
	display: inline;
	margin-left: 50px;
}
/* footer 영역 */
footer {
	width: 800px; /*헤더와 같은 사이즈*/
	height: 90px;
	margin-top: 20px;
	text-align: center;
	background-color: #FFFFFF;
}

/* 전체 페이지가 가운데로 오도록 */
#page {
	margin-right: -0px;
	margin-left: -0px;
}

.search-bar {
	display: flex;
	align-items: center;
	position: absolute;
	top: 50px;
	left: 40%;
	transform: translate(-30%, -30%);
}

.search-bar form {
	display: flex;
}

.search-bar input[type="text"] {
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 10px 0 0 10px;
}

.search-bar input[type="submit"] {
	padding: 8px 16px;
	/*  background-color: #6FF4BD; */
	color: #fff;
	background-color: #6A24FE;
	border: none;
	border-radius: 0 10px 10px 0;
	cursor: pointer;
}

.search-bar input[type="submit"]:hover {
	background-color: #6A24FE;
}

/*  여기부터 푸터 */
.footer {
	background: #fff;
	color: #999;
	padding: 2px 0 5px 0;
	margin-top: 30px;
	border-top: 2px solid #dcdcdc;
	width: 100%;
}

.row {
	margin-right: -0px;
	margin-left: -0px;
}

/** {
    box-sizing: border-box;
    margin: 0px;
    padding: 0px;
}*/
.footer .intro {
	width: 100px;
	padding: 26px 0 0 24px;
}

.row {
	display: flex;
}

.col-xs-4 {
	flex: 1;
}

.footer.row {
	margin-left: px;
}

<!-- 더보기 드롭다운-->
.dropdown+{
background-color:#FFDAB9;
padding:8px;
font-size:15px;
border:none;
border-radius:6px;
}
.dropdown {
	position: relative;
	display: inline-block;
	margin-left: 0px;
}

.dropdown-content {
	display: none;
	position: absolute;
	min-width: 100px;
	padding: 0px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
}

.dropdown-content a {
	color: black;
	padding: 8px;
	text-decoration: none;
	display: block;
	background-color: #FBEFFB;
}

.dropdown-content a: hover {
	background-color: white;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover
.dropdown+{
background-color:white;
}
</style>

<link type="text/css" rel="stylesheet"
	href="/EatStory/resources/css/style.css">
<link type="text/css" rel="stylesheet"
	href="/EatStory/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script type="text/javascript"
	src="/EatStory/resources/js/bootstrap.min.js"></script>

</head>

<body>

	<div id="page">

		<header>
			<div id="logo">
				<a href="${pageContext.request.contextPath }"> <img
					src="${pageContext.request.contextPath}/resources/images/logoImg.png"
					alt="Logo" width="100" style="margin-top: 10px;"> <img
					src="${pageContext.request.contextPath}/resources/images/logoLetter.png"
					alt="Logo" width="120">
				</a>
			</div>
			<div id="topMenu">
				<c:choose>
					<c:when test="${!empty login }">
						<a href="${pageContext.request.contextPath }/users/mypage">MyPage</a> | 
					<a href="${pageContext.request.contextPath }/login/logout">Logout</a> | 
			</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath }/login/loginform">Login</a> | 
					<a href="${pageContext.request.contextPath }/users/joinform">Join</a> | 
			</c:otherwise>
				</c:choose>
				<a href="${pageContext.request.contextPath }">Home</a>
			</div>
			<div class="search-bar">
				<form action="/search" method="GET">
					<input type="text" name="keyword" placeholder="검색어를 입력하세요"
						style="width: 450px;"> <input type="submit" value="검색">
				</form>
			</div>

			<ul class="typeNav" style="color: #610B5E;">
			<li><a href="${pageContext.request.contextPath }/recipe/writeform">레시피 작성하기</a></li>
				<li><a href="${pageContext.request.contextPath }/recipe/seperate?type_no=0&situation_no=0&method_no=0&ingre_no=0">분류</a></li>
				<li><a href="${pageContext.request.contextPath}/brand/list">브랜드 스토어</a></li>
				<li><a href="${pageContext.request.contextPath }/qna/list">문의</a></li>
				
				
			</ul>
		</header>
	</div>
