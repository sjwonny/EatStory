<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
    	#nav {
			margin-left: 320px;
			display: inline-block;
			text-align: left;
		}
		
		#nav a {
			font-size:9pt;
		}
		
		#nav a:link {
			color:black;
		}
		
		#nav a:visited {
			color:black;
		}
		
		#nav a:hover {
			color:#6A24FE;
		}
		
		#contents {
			display: inline-block;
			margin-left: 120px;
			vertical-align: top;
		}
		
		.midSeperate {
			font-weight: bold;
			font-size:11pt;
		}
		
		.selected {
			color: #6A24FE;
			font-weight: bold;
			font-size:10pt;
		}
    </style>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="nav">
		<span id="h3">마이페이지</span>
		<br>
		<br><hr><br>
		<div>
			<p class="midSeperate">쇼핑정보</p>
			<ul>
				<c:choose> 
					<c:when test="${mypage_value == 1 }">
						<li class="selected">- 주문목록/배송조회</li>
					</c:when>
					<c:otherwise>
						<li>- <a href="#">주문목록/배송조회</a></li>
					</c:otherwise>
				</c:choose>
				<c:choose> 
					<c:when test="${mypage_value == 2 }">
						<li class="selected">- 취소/교환/반품 내역</li>
					</c:when>
					<c:otherwise>
						<li>- <a href="#">취소/교환/반품 내역</a></li>
					</c:otherwise>
				</c:choose>
				<c:choose> 
					<c:when test="${mypage_value == 3 }">
						<li class="selected">- 환불/입금 내역</li>
					</c:when>
					<c:otherwise>
						<li>- <a href="#">환불/입금 내역</a></li>
					</c:otherwise>
				</c:choose>
				<c:choose> 
					<c:when test="${mypage_value == 4 }">
						<li class="selected">- 찜리스트</li>
					</c:when>
					<c:otherwise>
						<li>- <a href="#">찜리스트</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<br><hr><br>
		<div>
			<p class="midSeperate">혜택관리</p>
			<ul>
				<c:choose> 
					<c:when test="${mypage_value == 5 }">
						<li class="selected">- 쿠폰</li>
					</c:when>
					<c:otherwise>
						<li>- <a href="${pageContext.request.contextPath }/store/mycoupon">쿠폰</a></li>
					</c:otherwise>
				</c:choose>
				<c:choose> 
					<c:when test="${mypage_value == 6 }">
						<li class="selected">- 적립금</li>
					</c:when>
					<c:otherwise>
						<li>- <a href="#">적립금</a></li>
					</c:otherwise>
				</c:choose>
				<li>- <a href="#">수익금</a></li>
			</ul>
		</div>
		<br><hr><br>
		<div>
			<p class="midSeperate">고객센터</p>
			<ul>
				<c:choose> 
					<c:when test="${mypage_value == 7 }">
						<li class="selected">- 1:1 문의</li>
					</c:when>
					<c:otherwise>
						<li>- <a href="#">1:1 문의</a></li>
					</c:otherwise>
				</c:choose>
				<li>- <a href="${pageContext.request.contextPath }/users/updateform">회원정보수정</a></li>
			</ul>
		</div>
		<br><hr><br>
		<div>
			<p class="midSeperate">혜택관리</p>
			<ul>
				<c:choose> 
					<c:when test="${mypage_value == 8 }">
						<li class="selected">- 배송지 관리</li>
					</c:when>
					<c:otherwise>
						<li>- <a href="#">배송지 관리</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<br><hr><br>
		<div>
			<p class="midSeperate">나의 상품문의</p>
			<ul>
				<c:choose> 
					<c:when test="${mypage_value == 9 }">
						<li class="selected">- 상품문의</li>
					</c:when>
					<c:otherwise>
						<li>- <a href="#">상품문의</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<br><hr><br>
		<div>
			<p class="midSeperate">나의 상품후기</p>
			<ul>
				<c:choose> 
					<c:when test="${mypage_value == 10 }">
						<li class="selected">- 상품후기</li>
					</c:when>
					<c:otherwise>
						<li>- <a href="#">상품후기</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>