<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />

<div class="btnBox" align="center">
	<h2>1:1 문의</h2>
	<button
		onclick="document.location.href='${pageContext.request.contextPath }/qna/writeform'">문의하기</button>
</div>
<br>
<div align="center">
	<table class="boardTable">

		<c:choose>
			<c:when test="${qnaList == null }">
				<tr>
					<td colspan="5" align="center"><span
						style="font-weight: bold;">작성한 글이 없습니다.</span></td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<th>문의날짜 | </th>
					<th>카테고리 | </th>
					<th>제목 | </th>
					<th>문의상태 | </th>
					<th>답변시간</th>
				</tr>
				<c:forEach var="vo" items="${qnaList }"> 					
					<tr>
						<td>${vo.write_date }</td> <!-- 작성일자 -->
						<td>${vo.category }</td> <!-- 카테고리 -->
						<td><a href='${pageContext.request.contextPath }/qna/content/${vo.no}'>${vo.title }</a></td>
						<td><c:choose>
								<c:when test="${vo.qna_status eq 0}">
                 				   접수
             				   </c:when>
								<c:when test="${vo.qna_status eq 1}">
                				    답변완료
             				   </c:when>
							</c:choose></td>
						<td><c:choose>
								<c:when test="${vo.answer_date != null}">
                    				${vo.answer_date}
                				</c:when>
								<c:otherwise>
                  				  	
                				</c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</div>



































