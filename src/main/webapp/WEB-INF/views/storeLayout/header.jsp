<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>분류</title>
 
  
<style type="text/css">
	
body {
	width: 100%;
}
	
*{margin: 0px; padding: 0px;}
ul{list-style: none;} /* 리스트 앞에 . 같은거 제거*/
a{text-decoration: none;} /* 링크에 밑줄 같은거 제거*/
 
header{
   /*메인 이미지의 너비 사이즈와 같음*/
    height: 160px;
    background-color: #FFFFFF;
    border-bottom: 1px solid #dcdcdc;
    width: 100%;
    text-align : center;
}
 
#logo{
    position: absolute;
    margin-top: 0px;
    margin-left: 40px;
 
}
 
#topMenu{
    position: absolute;
    top: 20px;
    right: 70px;
}

 
/* top_menu a의 글시 검정색으로 */
#topMenu a{
color: gray;
font-weight: bold;
}
 
.typeNav{
  position: absolute;
  margin-top: 125px;
  margin-left: 320px;
  font-size: 16px;
}
 
 .typeNav li{
   display: inline;
   margin: 0 40px;
}

 .typeNav a:link {
	text-decoration: none;
	color: #6A24FE;
}

 .typeNav a:visited {
	text-decoration: none;
	color: #6A24FE;
}

 .typeNav a#recipe:link {
	text-decoration: none;
	color: #F0AD18;
}

 .typeNav a#recipe:visited {
	text-decoration: none;
	color: #F0AD18;
}


/* 콘텐츠 영역의 알래에 있는 배너 이미지 inline으로 */
#content li{
    display: inline;
    margin-left: 50px;
}
/* footer 영역 */
footer{
    width: 800px; /*헤더와 같은 사이즈*/
    height: 90px;
    margin-top: 20px;
    text-align: center;
    background-color:  #FFFFFF;
}
 
/* 전체 페이지가 가운데로 오도록 */
#page{
 margin-right: -0px;
    margin-left: -0px;}

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
    width : 100%;
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

.footer.row{
margin-left : px;
}
<!--더보기 드롭다운-->
.dropdown+{
	background-color: #FFDAB9;
	padding: 8px;
	font-size:15px;
	border: none;
     border-radius: 6px;
}

.dropdown{
	color: #6A24FE;
	position: relative;
	display: inline-block;
	margin-left:0px;
}
.dropdown-content{
	display: none;
	position: absolute;
	min-width: 100px;
	padding: 0px;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	
}
.dropdown-content a{
	color: #6A24FE;
	padding: 8px;
	text-decoration:none;
	display: block;
	background-color:#FBEFFB;
	
}
	
.dropdown-content a: hover{background-color: white;}
.dropdown:hover .dropdown-content{display: block;}
.dropdown:hover .dropdown+{
	background-color: white;
}

.selectedNav {
	color: #6A24FE;
	font-weight: bold;
 	font-size: 20px;
}
</style>

<link type="text/css" rel="stylesheet" href="/EatStory/resources/css/style.css">
<link type="text/css" rel="stylesheet" href="/EatStory/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script type="text/javascript" src="/EatStory/resources/js/bootstrap.min.js"></script>

</head>

<body>

	<div id="page">

		<header>
			<div id="logo">
				<a href="${pageContext.request.contextPath }/store/home">
					<img src="${pageContext.request.contextPath}/resources/images/logoImg.png" alt="Logo" width="100" style="margin-top:10px;">
					<img src="${pageContext.request.contextPath}/resources/images/storelogoletter.png" alt="Logo" width="120">
				</a>
			</div>
			<div id="topMenu">
				<c:choose>
					<c:when test="${!empty login }">
						<a href="${pageContext.request.contextPath }/store/mypage">MyPage</a> | 
						<a href="${pageContext.request.contextPath }/login/logout">Logout</a> | 
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath }/login/loginform">Login</a> | 
						<a href="${pageContext.request.contextPath }/users/joinform">Join</a> | 
					</c:otherwise>
				</c:choose>
				<a href="#">Cart</a> | <a href="#">CS center</a>
			</div>
			<div class="search-bar">
				<form action="/search" method="GET">
					<input type="text" name="keyword" placeholder="검색어를 입력하세요" style="width: 450px;">
				    <input type="submit" value="검색"> 
				</form>
			</div>

			<ul class="typeNav" style="color:#610B5E;">
				<li>
               <div class="dropdown">
              	<div class="dropdown+">≡ 전체카테고리</div>
                   	<div class = "dropdown-content">
                   		<c:choose>
									<c:when test="${page_value == 'allitem'}">
										<span class="selectedNav">전체보기</span>
									</c:when>
									<c:otherwise>
										<a href="#">전체보기</a>
									</c:otherwise>
								</c:choose>
                   		<c:choose>
									<c:when test="${page_value == 'fresh'}">
										<span class="selectedNav">신선식품</span>
									</c:when>
									<c:otherwise>
										<a href="#">신선식품</a>
									</c:otherwise>
								</c:choose>
                   		<c:choose>
									<c:when test="${page_value == 'mealbox'}">
										<span class="selectedNav">간편식</span>
									</c:when>
									<c:otherwise>
										<a href="#">간편식</a>
									</c:otherwise>
								</c:choose>
                   		<c:choose>
									<c:when test="${page_value == 'processed'}">
										<span class="selectedNav">가공식품</span>
									</c:when>
									<c:otherwise>
										<a href="#">가공식품</a>
									</c:otherwise>
								</c:choose>
                   		<c:choose>
									<c:when test="${page_value == 'kitchen_item'}">
										<span class="selectedNav">주방용품</span>
									</c:when>
									<c:otherwise>
										<a href="#">주방용품</a>
									</c:otherwise>
								</c:choose>
                   		<c:choose>
									<c:when test="${page_value == 'kitchen_machine'}">
										<span class="selectedNav">주방가전</span>
									</c:when>
									<c:otherwise>
										<a href="#">주방가전</a>
									</c:otherwise>
								</c:choose>
                   		<c:choose>
									<c:when test="${page_value == 'life_item'}">
										<span class="selectedNav">생활용품</span>
									</c:when>
									<c:otherwise>
										<a href="#">생활용품</a>
									</c:otherwise>
								</c:choose>
                   	</div> 
                  </div>
                 </li>
				<li>
					<c:choose>
						<c:when test="${page_value == 'storehome'}">
							<span class="selectedNav">스토어홈</span>
						</c:when>
						<c:otherwise>
							<a href="#">스토어홈</a>
						</c:otherwise>
					</c:choose>
				</li>
				<li>
					<c:choose>
						<c:when test="${page_value == 'best'}">
							<span class="selectedNav">베스트</span>
						</c:when>
						<c:otherwise>
							<a href="#">베스트</a>
						</c:otherwise>
					</c:choose>
				</li>
				<li>
					<c:choose>
						<c:when test="${page_value == 'hotdeal'}">
							<span class="selectedNav">핫딜</span>
						</c:when>
						<c:otherwise>
							<a href="#">핫딜</a>
						</c:otherwise>
					</c:choose>
				</li>
				<li>
					<c:choose>
						<c:when test="${page_value == 'newitem'}">
							<span class="selectedNav">신상</span>
						</c:when>
						<c:otherwise>
							<a href="#">신상</a>
						</c:otherwise>
					</c:choose>
				</li>
				<li>
					<c:choose>
						<c:when test="${page_value == 'event'}">
							<span class="selectedNav">기획전</span>
						</c:when>
						<c:otherwise>
							<a href="#">기획전</a>
						</c:otherwise>
					</c:choose>
				</li>
				<li>
					<c:choose>
						<c:when test="${page_value == 'brand'}">
							<span class="selectedNav">브랜드</span>
						</c:when>
						<c:otherwise>
							<a href="${pageContext.request.contextPath}/brand/list">브랜드</a>
						</c:otherwise>
					</c:choose>
				</li>
				<li>
					<a href="${pageContext.request.contextPath }" id="recipe">레시피</a>
				</li>
			</ul>
		</header>
	</div>
	<div class="main">