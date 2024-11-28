<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
ul{list-style: none;} /* 리스트 앞에 . 같은거 제거*/
a{text-decoration: none;} /* 링크에 밑줄 같은거 제거*/

.store_brand_list {
    padding: 30px 0 20px 8px;
    display: flex;
}
.store_brand_list li {
  text-align: center;
}
ol, ul {
    margin-bottom: 0;
    list-style: none;
    padding: 0;
    margin-top: 0;
}

ul {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}
.store_brand_list li img {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    box-shadow: 0 0 3px rgba(0, 0, 0, 0.25);
}
img {
    vertical-align: middle;
    border: 0;
    
}
.store_brand_list li a {
    display: block;
    text-align: center;
    margin-left:40px;
    margin-right:40px;
}
.store_brand_list li {
  flex: 0 0 calc(12.5% - 10px); /* 8개의 사진을 한 줄에 배치 (10px는 사진 사이의 간격) */
  margin-right: 0px; /* 사진들 간의 오른쪽 간격 */
  margin-bottom: 50px; /* 사진들 간의 아래쪽 간격 */
   text-align: center;
   margin-left: 30px;
}
.store_brand_list {
    padding: 30px 0 20px 8px;
    display: flex;
    flex-wrap: wrap;
}
.store_brand_list li p {
  font-size: 14px; /* 원하는 글씨 크기로 변경 */
  color: black; /* 검정색으로 변경 */
}
.sub_tit {
    padding: 60px 0 50px 0;
    text-align: center;
    line-height: 1;
}
</style>
</head>
<body>
<div align="center">
	<div class="sub_tit_m" style="font-size:40px; font-weight: bold;">브랜드 모아보기</div>
	<ul class="store_brand_list">
				<c:forEach var="vo" items="${list}"> 
					<li><a href="${pageContext.request.contextPath}/product/${vo.no}"> <!-- 컨트롤러로 브랜드번호 보냄 -->
					<img src="${pageContext.request.contextPath}/resources/brand/${vo.no}.jpeg" style="width:100px; height:100px;"><div><p>${vo.name}</p></div></a></li>
				 </c:forEach> 
			 </ul>
</div>

</body>
</html>


<%-- ${pageContext.request.contextPath}/resources/brand/브랜드번호.jpeg --%>

