<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<style>
table {
	border-collapse: collapse;
	width: 80%;
}

th, td {
	border: 1px solid black;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}
</style>

</head>
<body>
	<h2 align="center">장바구니</h2>
	<div align="center">
		<form id="purchaseForm" method="post" action="">
			<div>
				<input type="hidden" name="cartNo" id="cartNo"> <input
					type="hidden" name="usersNo" id="usersNo">
				<button type="button"
					onclick="location.href = '${pageContext.request.contextPath}/goods/list'">돌아가기</button>

				<table>
					<tr>
						<th colspan="2">상품/옵션 정보</th>
						<th>수량</th>
						<th>상품금액</th>
						<th>할인/적립</th>
						<th>합계금액</th>
						<th>배송비</th>
					</tr>
					<c:forEach var="vo" items="${goodsVo}">
						<tr>
							<td><a
								href="${pageContext.request.contextPath}/goods/${vo.no}"><img
									src="${pageContext.request.contextPath}/resources/goods/${vo.no}/main.jpeg"
									style="width: 200px; height: 200px" /></a></td>
							<td><a
								href="${pageContext.request.contextPath}/goods/${vo.no}">
									${vo.name}</a> <br> ${vo.detail}</td>
							<td>${vo.quantity}개</td>
							<td>${vo.option_price}원</td>
							<td>적립 상품 +${Math.floor(vo.option_price * 0.005)}원</td>
							<td>${vo.option_price * vo.quantity}원</td>
							<td>기본,고정배송비 <br> ${vo.delivery_price}원
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="deliveryInfo">
				<h3>배송정보</h3>
				<table>
					<tr>
						<th>* 받으실분</th>
						<td><input type="text"></td>
					</tr>
					<tr>
						<th rowspan="2">* 받으실 곳</th>
						<td><input type="text">우편번호</td>
					</tr>
					<tr>
						<td><input type="text"></td>
					</tr>
					<tr>
						<th>* 휴대폰번호</th>
						<td><input type="text"></td>
					</tr>
				</table>
				<h3>결제정보</h3>
				<table>
					<tr>
						<th>상품 합계 금액</th>
						<td id="totalPrice">${totalPrice }원</td>
					</tr>
					<tr>
						<th>배송비</th>
						<td id="totalDeliveryPrice">${totalDeliveryPrice }원</td>
					</tr>
					<tr>
						<th>쿠폰 사용</th>
						<td><input type="button" value="쿠폰 등록"></td>
					</tr>
					<tr>
						<th>적립금 사용</th>
						<td></td>
					</tr>
					<tr>
						<th>예상 적립금</th>
						<td>${Math.floor(totalPrice * 0.005) }원</td>
					</tr>
					<tr>
						<th>최종 결제 금액</th>
						<td>${totalPrice + totalDeliveryPrice}원</td>
					</tr>
				</table>
			</div>
			<button type="button" onclick="purchase()">상품 주문</button>
		</form>
	</div>
</body>
</html>
