<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  textarea {
    width: 100%; /* 너비 전체 사용 */
    max-width: 55%; /* 최대 너비 제한 */
    height: 400px; /* 높이 설정 */
    padding: 12px; /* 내부 여백 */
    font-size: 16px; /* 글씨 크기 */
    line-height: 1.6; /* 줄 간격 */
    border: 1px solid #ccc; /* 테두리 */
    border-radius: 8px; /* 둥근 테두리 */
    background-color: #f9f9f9; /* 배경색 */
    box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1); /* 박스 그림자 */
    resize: vertical; /* 세로 크기 조절만 가능 */
  }
  
  textarea:focus {
    border-color: #007BFF; /* 포커스 시 테두리 색상 변경 */
    outline: none; /* 기본 포커스 제거 */
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5); /* 포커스 시 박스 그림자 */
  }
  
/* 리뷰 전체 영역 */
.review-container {
    display: flex;
    flex-direction: column;
    gap: 10px;
    margin-bottom: 30px;
    margin-top:20px;
    border-bottom: 1px solid #ddd;
    padding-bottom: 20px;
    margin-left:20%;
    margin-right:30%;
}

/* 리뷰 항목 */
.review-item {
    display: flex;
    justify-content: space-between; /* 이름과 날짜를 양쪽 끝에 배치 */
    align-items: flex-start; /* 항목 간 세로 정렬 */
    gap: 10px;
}

/* 왼쪽 영역 - 이름과 평점 */
.review-left {
    display: flex;
    gap: 10px;
    flex: 1;
}

/* 사용자 이름 */
.review_users_name {
    font-weight: bold;
    font-size: 16px;
    color: #333;
    margin-bottom: 5px;
}

/* 리뷰 평점 */
.ReviewScore {
    display: flex;
    align-items: center;
    gap: 5px;
}

/* 별점 관련 스타일 */
.caption_rv2_img {
    display: inline-block;
    width: 20px;
    height: 20px;
    background: url('star-icon.png') no-repeat center center;
    background-size: cover;
}

.caption_rv2_pt {
    font-size: 16px;
    font-weight: bold;
    color: #800080; /* 자주색 */
}

/* 오른쪽 영역 - 작성일 */
.review-writeDate {
    font-size: 12px;
    color: #999;
    text-align: right; /* 오른쪽 정렬 */
    min-width: 50px; /* 최소 너비 설정으로 날짜 공간 확보 */
}

/* 리뷰 내용 */
.review_content {
    font-size: 14px;
    color: #555;
    margin-top: 10px;
    word-wrap: break-word;
}


/* 공통 스타일 */
body {
	font-family: Arial, sans-serif;
	color: #333;
	line-height: 1.5;
}

/* 이미지 스타일 */
img {
	border: 1px solid #ddd;
	border-radius: 8px;
	margin-bottom: 10px;
}

/* 텍스트 스타일 */
/* div {
	text-align: center;
} */

/* 제품 이름 */
div:nth-child(2) {
	font-size: 22px;
	font-weight: bold;
	color: #444;
	margin-bottom: 5px;
}

/* 가격 정보 */
div:nth-child(3) {
	font-size: 20px;
	color: #e74c3c; /* 강조 색상 */
	font-weight: bold;
	margin-bottom: 5px;
}

del {
	font-size: 16px;
	color: #999;
}

/* 배송비와 적립금 */
div:nth-child(5), div:nth-child(6) {
	font-size: 14px;
	color: #555;
	margin: 5px 0;
}

/* 옵션 드롭다운 */
select {
	width: 30%;
	padding: 8px;
	font-size: 14px;
	margin: 10px auto;
	border: 1px solid #ccc;
	border-radius: 4px;
	background-color: #f9f9f9;
}

/* 주문금액 */
#totalAmount {
	font-size: 16px;
	font-weight: bold;
	color: #e67e22;
}

/* 버튼 스타일 */
button {
	width: 80px;
	padding: 8px;
	margin: 5px;
	font-size: 14px;
	color: white;
	background-color: #007BFF;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

button:hover {
	background-color: #0056b3;
}
/* 할인율 텍스트 스타일 */
b {
	color: #e74c3c; /* 빨간색 */
	font-weight: bold;
	font-size: 20px; /* 강조를 위해 크기 약간 조정 */
	margin-right: 5px; /* 가격과 간격 추가 */
}

.title_row {
	display: flex;
	justify-content: space-between; /* 글자 간격을 균등하게 분배 */
	align-items: left;
	width: 70%; /* 화면의 80% 너비 */
	margin: 0 auto; /* 가운데 정렬 */
	font-weight: bold;
	font-size: 30px;
	border-bottom: 1px solid #ddd; /* 구분선(optional) */
	padding: 10px 0;
}

.title_row span {
	flex: 1; /* 각 항목이 동일한 비율로 차지 */
	text-align: left; /* 항목을 가운데 정렬 */
}

.delivery_info {
	font-size: 16px; /* 글씨 크기 작게 설정 */
	margin: 10%; /* 위, 아래, 양옆에 각각 10%의 마진 설정 */
	line-height: 1.5; /* 줄 간격 설정(optional) */
}
</STYLE>
<script>
	// 옵션 선택 시 초기화 및 기본값 설정
	window.onload = function() {
		showOption();
	};

	function showOption() {
		var optionSelect = document.getElementsByName("option")[0];
		var selectedOption = optionSelect.value;
		var optionDetails = document.getElementById("optionDetails");
		var totalPrice = 0;

		if (selectedOption) {
			var optionInfo = optionSelect.options[optionSelect.selectedIndex]
					.getAttribute('data-details');
			var existingInfo = optionDetails.innerHTML;

			if (existingInfo) {
				if (existingInfo.includes(optionInfo)) {
					alert("이미 선택된 옵션입니다.");
					return;
				}
				optionDetails.innerHTML += "<div>"
						+ optionInfo
						+ " 개수: <input type='number' name='quantity' min='1' max='999' value='1' onchange='updateTotal()'>"
						+ " <input type='hidden' name='options' value='"
						+ optionSelect.options[optionSelect.selectedIndex].value
						+ "' onchange='updateTotal()'></div>";
			} else {
				optionDetails.innerHTML = "<div>"
						+ optionInfo
						+ " 개수: <input type='number' name='quantity' min='1' max='999' value='1' onchange='updateTotal()'>"
						+ " <input type='hidden' name='options' value='"
						+ optionSelect.options[optionSelect.selectedIndex].value
						+ "' onchange='updateTotal()'></div>";
			}

			optionDetails.style.display = "block";
			updateTotal(); // 옵션 선택 시 총액 업데이트
		} else {
			optionDetails.style.display = "none";
			optionDetails.innerHTML = "";
			updateTotal(); // 옵션 선택 해제 시 총액 업데이트
		}
	}

	function updateTotal() {
		var quantity = document.getElementsByName("quantity");
		var totalAmount = 0;

		for (var i = 0; i < quantity.length; i++) {
			var currentQuantity = parseInt(quantity[i].value);
			var price = parseInt(quantity[i].previousSibling.textContent
					.match(/\d+(?=원)/)[0]);
			totalAmount += currentQuantity * price;
		}

		document.getElementById("totalAmount").textContent = totalAmount
				.toLocaleString();
	}

	function validateForm() {
		var optionSelect = document.getElementsByName("option")[0];
		var quantity = document.getElementsByName("quantity");

		if (!optionSelect.value || quantity.length === 0) {
			alert("가격 정보가 없거나 옵션이 선택되지 않았습니다!");
			return false;
		}

		return true;
	}
</script>
</head>
<body><%@ include file="/WEB-INF/views/layout/header.jsp"%>
	<br>
	<br>
	<div>
		<div align="center">
			<c:forEach var="file" items="${imgGoodsList}">
				<img
					src="${pageContext.request.contextPath}/resources/goods/${vo.no}/${file.img}"
					style="width: 500px; height: 400px" />
				<br>
			</c:forEach>
		</div>
		<div align="center">
			<div>${vo.name}</div>
			<div>
				<b>-${vo.dc_amount}%</b> ${vo.price}원
			</div>
			<div>
				<del>${vo.price + vo.dc_price}원</del>
			</div>

			<div>배송비: ${vo.delivery_price}원</div>
			<fmt:parseNumber var="mileage" value="${vo.dc_price * 0.005}"
				integerOnly="true" />
			<div>적립금: ${mileage}원 적립</div>
			<div>
				<form onsubmit="return validateForm()">
					<select name="option" onchange="showOption()">
						<option value="">[선택]옵션을 선택하세요.</option>
						<c:forEach items="${optionList}" var="option">
							<option value="${option.no}"
								data-details="${option.detail} | ${option.price}원 (재고수량: ${option.count}개)">${option.detail}
								| ${option.price}원 (재고수량: ${option.count}개)</option>
						</c:forEach>
					</select>
					<div id="optionDetails" style="display: none;"></div>
					<div>
						주문금액 <span id="totalAmount">0</span>원
					</div>
					<div>
						<button type="submit"
							formaction="${pageContext.request.contextPath }/goods/wish/${vo.no}">찜</button>
						<button type="submit"
							formaction="${pageContext.request.contextPath}/goods/cart/">장바구니</button>
						<button type="submit"
							formaction="${pageContext.request.contextPath}/goods/buy/${vo.no}">바로구매</button>
					</div>
				</form>

			</div>
			<br>
			<div class="title_row">
				<span>상세정보</span>
			</div>
			<Br>
			<Br>
			<Br>

			<div class="detail_info">${vo.sub_info}</div>

			<!-- 이미지 표시 -->
			<c:forEach var="file" items="${imgDetailGoodsList}">
				<img
					src="${pageContext.request.contextPath}/resources/goods/${vo.no}/${file.img}"
					style="width: 500px; height: 1000px">
				<Br>
			</c:forEach>

			<div class="title_row">
				<span>배송환불</span>
			</div>
			<Br>
			<Br>
			<Br>
			<textarea name="delivery_info" class="form-control"
				id="exampleTextarea" rows="10">${vo.delivery_info}</textarea>
		</div>
	</div>
	<div class="title_row">
		<span>리뷰</span>
	</div>
	<div class="review-container ">
	<c:forEach var="review" items="${rList}">
    <div class="review-item">
        <!-- 왼쪽 영역: 사용자 이름과 평점 -->
        <div class="review-left">
            <div class="review_users_name">${review.users_name}</div>
            <div class="ReviewScore">
                <c:choose> 
                    <c:when test="${review.score == 5 }"> 
                        <span class="caption_rv2_img"></span><b class="caption_rv2_pt">★★★★★</b>
                    </c:when>  
                    <c:when test="${review.score == 4}">
                        <span class="caption_rv2_img"></span><b class="caption_rv2_pt">★★★★</b>
                    </c:when>
                    <c:when test="${review.score == 3}">
                        <span class="caption_rv2_img"></span><b class="caption_rv2_pt">★★★</b>
                    </c:when>
                    <c:when test="${review.score == 2}">
                        <span class="caption_rv2_img"></span><b class="caption_rv2_pt">★★</b>
                    </c:when>
                    <c:when test="${review.score == 1}">
                        <span class="caption_rv2_img"></span><b class="caption_rv2_pt">★</b>
                    </c:when>
                    <c:otherwise>
                        <span class="caption_rv2_img"></span><b class="caption_rv2_pt"></b>
                    </c:otherwise>
                </c:choose> 
            </div>
        </div>
        
        <div class="review-writeDate">${review.write_date}</div>
    </div>
    <div class="review_content">${review.content}</div>
</c:forEach>

	</div>
</body>
</html>
