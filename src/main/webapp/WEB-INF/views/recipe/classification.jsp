<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>		
<style type="text/css">	
	#contents {
		width: 1080px;
	}
	
	#contents td{
		padding: 10px;
		width: 270px;
		vertical-align: top;
	}
	
	p#count {
		font-size: 12pt;
		text-align: left;
	}
	
	span#count {
		color: #F0AD18;
		font-size: 20pt;
	} 


/* 테이블 스타일 */
table.filterTable {
    border-collapse: collapse;
    width: 90%;
    max-width: 1900px;
    margin: 20px auto;
    background: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    overflow: hidden;
}
/* 선택된 필터와 필터 버튼의 상하 간격 */
.filters, .selected {
    margin: 2px 2px; /* 버튼 사이 간격 */
    display: inline-block; /* 버튼 정렬 */
}
/* 테이블 헤더 */
table.filterTable th {
    background-color: #007BFF;
    color: #fff;
    text-align: left;
    padding: 12px;
    width: 120px;
}

/* 테이블 셀 */
table.filterTable td {
    padding: 12px;
    border-bottom: 1px solid #ddd;
}

/* 마지막 행 아래쪽 테두리 제거 */
table.filterTable tr:last-child td {
    border-bottom: none;
}

/* 필터 버튼들 */
.filters {
    text-decoration: none;
    color: black;
    padding: 6px 10px;
    border: 1px solid #007BFF;
    border-radius: 3px;
    transition: all 0.3s;
}

.filters:hover {
    background-color: #007BFF;
    color: #fff;
}

/* 선택된 필터 강조 */
.selected {
    color: #fff;
    background-color: #007BFF;
    padding: 6px 10px;
    border-radius: 4px;
}

/* 반응형 디자인 */
@media (max-width: 768px) {
    table.filterTable {
        width: 100%;
        font-size: 14px;
    }

    th, td {
        padding: 8px;
    }
}
</style>
	<div align="center">
		<div>
			<br>
			<table border="1" class="filterTable">
				<tr>
					<th width="108px">종류별</th>
					<td>
						&nbsp;
						<c:choose>
							<c:when test="${ type_no == 0}">
								<span class="selected">전체</span>&nbsp;
							</c:when>
							<c:otherwise>
								<a href="${cpath }/recipe/seperate?type_no=0&situation_no=${situation_no}&method_no=${method_no}&ingre_no=${ingre_no}" 
										class="filters">전체</a>&nbsp;
							</c:otherwise>
						</c:choose>
						<c:forEach var="dto" items="${tList }">
							<c:choose>
								<c:when test="${ type_no == dto.no}">
									<span class="selected">${dto.type }</span>&nbsp;
								</c:when>
								<c:otherwise>
									<a href="${cpath }/recipe/seperate?type_no=${dto.no }&situation_no=${situation_no}&method_no=${method_no}&ingre_no=${ingre_no}" 
											class="filters">${dto.type }</a>&nbsp;
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th>상황별</th>
					<td>
						&nbsp;
						<c:choose>
							<c:when test="${ situation_no == 0}">
								<span class="selected">전체</span>&nbsp;
							</c:when>
							<c:otherwise>
								<a href="${cpath }/recipe/seperate?type_no=${type_no}&situation_no=0&method_no=${method_no}&ingre_no=${ingre_no}" 
										class="filters">전체</a>&nbsp;
							</c:otherwise>
						</c:choose>
						<c:forEach var="dto" items="${sList }">
							<c:choose>
								<c:when test="${ situation_no == dto.no}">
									<span class="selected">${dto.situation }</span>&nbsp;
								</c:when>
								<c:otherwise>
									<a href="${cpath }/recipe/seperate?type_no=${type_no}&situation_no=${dto.no}&method_no=${method_no}&ingre_no=${ingre_no}" 
											class="filters">${dto.situation }</a>&nbsp;
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th>방법별</th>
					<td>
						&nbsp;
						<c:choose>
							<c:when test="${ method_no == 0}">
								<span class="selected">전체</span>&nbsp;
							</c:when>
							<c:otherwise>
								<a href="${cpath }/recipe/seperate?type_no=${type_no}&situation_no=${situation_no}&method_no=0&ingre_no=${ingre_no}" 
										class="filters">전체</a>&nbsp;
							</c:otherwise>
						</c:choose>
						<c:forEach var="dto" items="${mList }">
							<c:choose>
								<c:when test="${ method_no == dto.no}">
									<span class="selected">${dto.method }</span>&nbsp;
								</c:when>
								<c:otherwise>
									<a href="${cpath }/recipe/seperate?type_no=${type_no}&situation_no=${situation_no}&method_no=${dto.no}&ingre_no=${ingre_no}" 
											class="filters">${dto.method }</a>&nbsp;
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th>재료별</th>
					<td>
						&nbsp;
						<c:choose>
							<c:when test="${ ingre_no == 0}">
								<span class="selected">전체</span>&nbsp;
							</c:when>
							<c:otherwise>
								<a href="${cpath }/recipe/seperate?type_no=${type_no}&situation_no=${situation_no}&method_no=${method_no}&ingre_no=0" 
										class="filters">전체</a>&nbsp;
							</c:otherwise>
						</c:choose>
						<c:forEach var="dto" items="${iList }">
							<c:choose>
								<c:when test="${ ingre_no == dto.no}">
									<span class="selected">${dto.ingre }</span>&nbsp;
								</c:when>
								<c:otherwise>
									<a href="${cpath }/recipe/seperate?type_no=${type_no}&situation_no=${situation_no}&method_no=${method_no}&ingre_no=${dto.no}" 
											class="filters">${dto.ingre }</a>&nbsp;
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</td>
				</tr>
			</table>
		</div>
		<div style="width:1080px">
			<br>
				<p id="count" >총 <span id="count">${(list == null)? 0 : list.size() }</span>개의 맛있는 레시피가 있습니다.</p>
			<br>
		</div>
		<div>
			<table id="contents">
				<% int i = 0; %>
				<tr>
				<c:forEach var="dto" items="${list }">
					<% if (i != 0 && i % 4 == 0) { %>
						</tr>
						<tr>
					<% } %>
					<td>
						<a href="#"><img src="${cpath}/resources/recipeImages/${eimglist.get(i).getImg() }" width="240px"></a>
						<p>${dto.title }</p>
						<p></p>
					</td>
					<% i++; %>
				</c:forEach>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
	</div>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>