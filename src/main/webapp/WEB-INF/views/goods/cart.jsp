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
	<script type="text/javascript">
		function selectAll(selectAll) {
			const checkboxes = document.getElementsByName('cartCheckBox');

			checkboxes.forEach((checkbox) => {
				checkbox.checked = selectAll.checked;
			})
		}

		function deleteSelected() {
			const form = document.getElementById('cartForm');
			const checkboxes = document.getElementsByName('cartCheckBox');
			let isAnySelected = false;
			let cartNos = '';

			for (let i = 0; i < checkboxes.length; i++) {
				if (checkboxes[i].checked) {
					isAnySelected = true;
					if (cartNos !== '') {
						cartNos += ',';
					}
					cartNos += checkboxes[i].value;
				}
			}

			if (isAnySelected) {
				if (confirm("선택하신 상품을 장바구니에서 삭제 하시겠습니까?")) {
					document.getElementById('cartNo').value = cartNos;
					form.action = "${pageContext.request.contextPath}/cart/delete";
					form.submit();
				}
			}
		}
		
		function paymentSelected() {
		    const form = document.getElementById('cartForm');
		    const checkboxes = document.getElementsByName('cartCheckBox');
		    let isAnySelected = false;
		    let cartNos = '';

		    for (let i = 0; i < checkboxes.length; i++) {
		        if (checkboxes[i].checked) {
		            isAnySelected = true;
		            if (cartNos !== '') {
		                cartNos += ',';
		            }
		            cartNos += checkboxes[i].value;
		        }
		    }

		    if (isAnySelected) {
		        if (confirm("선택하신 상품을 장바구니에서 주문 하시겠습니까?")) {
		            document.getElementById('cartNo').value = cartNos;
		            form.action = "${pageContext.request.contextPath}/order/order";
		            if (cartNos !== '') {
		                form.submit();
		            } else {
		                alert("상품을 선택해주세요.");
		            }
		        }
		    }

		}

		
		function calculateTotalPrice() {
			  const checkboxes = document.getElementsByName('cartCheckBox');
			  let totalPrice = 0;

			  for (let i = 0; i < checkboxes.length; i++) {
			    if (checkboxes[i].checked) {
			      const quantityElement = document.getElementById(`quantity${i}`);
			      const priceElement = document.getElementById(`price${i}`);
			      const quantity = parseInt(quantityElement.textContent.trim());
			      const price = parseInt(priceElement.textContent.trim());
			      
			      if (!isNaN(quantity) && !isNaN(price)) {
			        totalPrice += quantity * price;
			      }
			    }
			  }

			  const checkPriceElement = document.querySelector('.totalCheckPrice');
			  checkPriceElement.textContent = '총 가격: ' + totalPrice + '원';
			}

	</script>
	<h2 align="center">장바구니</h2>
	<div align="center">
		<form id="cartForm" method="post" action="">
			<input type="hidden" name="cartNo" id="cartNo">
			<button type="button"
				onclick="location.href = '${pageContext.request.contextPath}/goods/list'">돌아가기</button>
			<button type="button" onclick="deleteSelected()">선택 삭제</button>
			<button type="button" onclick="paymentSelected()">상품 주문</button>
			<table>
				<tr>
					<th><input type="checkbox" name="cartCheckBox" value=""
						onclick="selectAll(this)" checked="checked">전체상품</th>
					<th colspan="2">상품/옵션 정보</th>
					<th>수량</th>
					<th>상품금액</th>
					<th>할인/적립</th>
					<th>합계금액</th>
					<th>배송비</th>
				</tr>
				<c:forEach var="vo" items="${goodsVo}">
					<tr>
						<td><input type="checkbox" name="cartCheckBox"
							value="${vo.cartNo}" onclick="calculateTotalPrice()"
							checked="checked"></td>
						<td><a
							href="${pageContext.request.contextPath}/goods/${vo.no}">
							<img src="${pageContext.request.contextPath}/resources/goods/${vo.no}/main.jpeg" style="width: 200px; height: 200px" /> 
					
							</a></td>
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
		</form>
	</div>
</body>
</html>
