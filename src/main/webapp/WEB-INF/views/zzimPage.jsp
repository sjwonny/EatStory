<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
        font-family: Arial, sans-serif;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    th, td {
        padding: 10px;
        text-align: left;
    }

    th {
        background-color: #f2f2f2;
    }

    .check_s {
        width: 20px;
        height: 20px;
        display: inline-block;
        border: 1px solid #ccc;
        cursor: pointer;
    }

    .pick_add_img img {
        width: 15%;
        height: 15%;
    }

    .pick_add_info {
        margin-left: 20px;
    }

    .pick_add_info em a {
        color: #000;
        text-decoration: none;
        font-weight: bold;
    }

    .btn_gray_list a {
        display: inline-block;
        padding: 5px;
        background-color: #ccc;
        color: #fff;
        text-decoration: none;
        margin-top: 5px;
    }

    .benefit_list {
        list-style: none;
        padding: 0;
    }

    .benefit_list li {
        display: inline-block;
        margin-right: 10px;
    }

    .btn_wish_choice_del,
    .btn_wish_choice_cart {
        display: inline-block;
        padding: 10px;
        background-color: #ccc;
        color: #fff;
        text-decoration: none;
        margin-top: 10px;
    }
</style>
</head>
<body>
<div align="center">
<h1>위시 리스트</h1>
</div>
<br><br>

<form id="frmWish" name="frmWish" method="post" target="ifrmProcess">
                    <input type="hidden" name="mode" value="">
                    <input type="hidden" name="isCart" value="false">
                    <table>
                        <colgroup>
                            <col style="width:8%">  <!-- 선택 -->
                            <col>                   <!-- 상품명/옵션 -->
                            <col style="width:15%"> <!-- 상품금액/수량 -->
                            <col style="width:15%"> <!-- 혜택 -->
                            <col style="width:10%"> <!-- 합계 -->
                        </colgroup>
                        <thead>
                        <tr>
                            <th>
                                <div class="form_element">
                                    <input type="checkbox" id="allCheck" name="allCheck" class="gd_checkbox_all" data-target-name="sno[]" data-target-form="#frmWish">
                                    <label for="allCheck" class="check_s"></label>
                                </div>
                            </th>
                            <th>상품명/옵션</th>
                            <th>상품금액/수량</th>
                            <th>혜택</th>
                            <th>합계</th>
                        </tr>
                        </thead>
                        <tbody>

                            <c:forEach var="map" items="${list }">
                        <tr>
                            <td>
                                <div class="form_element wish_sno_318466">
                                    <input type="checkbox" id="wishSno318466" name="sno[]" value="318466" data-order-possible="y">
                                    <label for="wishSno318466" class="check_s"></label>
                                </div>
                            </td>
                            <td class="td_left">
                                <div class="pick_add_cont">
                                    <span class="pick_add_img">
                                        <a href="../goods/goods_view.php?goodsNo=1000037390"><img src="${map.STORE_IMG}" width="15%" height="15%" class="middle"></a>
                                    </span>
                                    <div class="pick_add_info">

                                        <em><a href="../goods/goods_view.php?goodsNo=1000037390">${map.NAME}</a></em><br><br>

                                        <span class="text_type_cont">${map.DETAIL}<strong>            
                                            <!-- (+1,000원) 이건 detail에 들어가있어야함-->            
            
            

            
                                            </strong>            
                                        </span>

                                    </div>
                                </div>
                                <!-- //pick_add_info -->
                                <!-- //pick_add_list -->
                            </td>
                            <td>
                                <strong>${map.PRICE}</strong>
/ 1개
                                <div class="btn_gray_list">
                                    <a href="#optionViewLayer" class="btn_gray_small btn_open_layer" data-goodsno="1000037390" data-sno="318466" data-page="wish_modify"><span>옵션/수량변경</span></a>
                                </div>
                            </td>
                            <td>
                                <ul class="benefit_list">
                                    <li class="benefit_mileage">
                                        <em>적립</em>
                                        <span>상품 <strong>+30원</strong></span>
                                    </li>
                                </ul>
                            </td>
                            <td>
                                <div class="">
                                    <a href="#" style="width: 80px;color: #fff;" class="btn_wish_cart js_cart_wish" data-sno="318466"><em>장바구니</em></a>

                                    <a href="${pageContext.request.contextPath }/goods/deleteWish/${map.NO}" style="width: 80px;" class="btn_wish_del" data-sno="318466"><em>삭제하기</em></a>
                                </div>
                            </td>
                        </tr>

</c:forEach>

 <c:choose>
	<c:when test="${su1 != 0 }">
		<script type="text/javascript">
			alert("추가 성공");
		
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert("추가 실패");
			history.back();
		</script>
	</c:otherwise>
</c:choose> 
 <!-- 
  <c:choose>
	<c:when test="${su2 != 0 }">
		<script type="text/javascript">
			alert("삭제 성공");
		
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert("삭제 실패");
			history.back();
		</script>
	</c:otherwise>
</c:choose> 
 -->
<%-- ${msg} --%>
                        </tbody>
                    </table>
                    <button class="btn_wish_choice_del"><em>선택 상품 삭제</em></button>
                    <button class="btn_wish_choice_cart"><em>선택 상품 장바구니</em></button>
                </form>
</body>
</html>