<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/manager/layout/header.jsp" %>	
<!-- Begin Page Content -->
<div class="container-fluid">
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">상품 정보 입력</h6>
		</div>
		<div class="card-body">
		
		
<form action="${pageContext.request.contextPath}/manager/goodsInsert" method="post" enctype="multipart/form-data" name="data">

  	
  	<div class="form-group">
  	  <label class="form-label mt-4">브랜드 선택</label>
      <select name="brand_no" class="form-select" id="exampleSelect1">
      		<option value="">--브랜드 선택--</option> 
      	<c:forEach var="brand" items="${brandList}">
      		<option value="${brand.no}">${brand.name}</option>
      	</c:forEach>
      </select>
      
	  <label class="col-form-label mt-4">상품명</label>
	  <input name="name" class="form-control" id="inputDefault">
	  <small class="form-text text-muted">대표할 상품의 이름을 입력해주세요.</small>
	  
	  <label class="col-form-label mt-4">부가설명</label>
	  <input name="sub_info" class="form-control" id="inputDefault">
	  <small class="form-text text-muted">상품에 대한 설명을 입력해주세요.</small><br><br>
	  
		<div id="mainImg-body" class="card shadow mb-4">
			<div id="add-mainImg-body" style="cursor: pointer;" class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">상품 대표 이미지 추가</h6>
			</div>
			<div class="card-body" id="mainImg-div">
				<small class="form-text text-muted">상품 대표 이미지를 선택해주세요.</small>
				<div class="row" id="mainImg-count0">
					<br><br>
					<div class="col-lg-10">
						<input id="mainImg0" name="mainImg" class="form-control" type="file" id="formFile" accept="image/jpeg, image/png, image/jpg, image/gif">
					</div>
				</div>
			</div>
		</div>
		
	  <label class="col-form-label mt-4">상품금액</label>
	  <input name="price" class="form-control" id="inputDefault" placeholder="금액단위 : 원">
	  <small class="form-text text-muted">대표 상품의 금액을 입력해주세요.</small>
	  
	  <label class="col-form-label mt-4">배송비</label>
	  <input name="delivery_price" class="form-control" id="inputDefault" placeholder="금액단위 : 원">
	  <small class="form-text text-muted">배송비를 입력해주세요.</small>
	  
	  <!-- 배송비가 0원이 아닌 경우 활성화되도록 -->
	  <label class="col-form-label mt-4">무료 배송 조건</label>
	  <input name="free_condition" class="form-control" id="inputDefault" placeholder="금액단위 : 원">
	  <small class="form-text text-muted">ex) 50,000원 이상 구매 시 무료배송일 경우, 50000을 입력해주세요.</small>
      
      <label class="col-form-label mt-4">할인 여부</label>
      <div class="form-check form-switch">
        <input name="dc" class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
        <label class="form-check-label" for="flexSwitchCheckDefault">할인</label>
      </div>
	  
	  <label class="col-form-label mt-4">할인금액</label>
	  <input name="dc_price" disabled="disabled" class="form-control" id="inputDefault" placeholder="금액단위 : 원">
	  <small class="form-text text-muted">할인된 최종 금액을 입력해주세요.</small>
	  
	  <label class="col-form-label mt-4">할인율</label>
	  <input name="dc_amount" disabled="disabled" class="form-control" id="inputDefault" placeholder="금액단위 : 원">
	  <small class="form-text text-muted">할인된 최종 퍼센트를 입력해주세요.</small>
	  
	  <label class="col-form-label mt-4">상품 전시 여부</label>
      <div class="form-check form-switch">
        <input name="status" class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
        <label class="form-check-label" for="flexSwitchCheckChecked">전시하기</label>
      </div>
      <br><br>

		<!-- 영역 묶기 -->
		<div id="option-body" class="card shadow mb-4">
			<div id="add-option-body" style="cursor: pointer;" class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">옵션 등록</h6>
			</div>
			<div class="card-body" id="option-div">
				<div class="row" id="option_count0">
				<div class="col-lg-4">
					<label class="col-form-label mt-4">옵션 정보</label>
				  	<input name="option_detail" class="form-control" id="inputDefault">
				  	<small class="form-text text-muted">옵션 정보를 입력해주세요.</small>
				</div>
				<div class="col-lg-4">
					<label class="col-form-label mt-4">옵션 금액</label>
					<input name="option_price" class="form-control" id="inputDefault" placeholder="금액단위 : 원">
					<small class="form-text text-muted">옵션 금액을 입력해주세요.</small>
				</div>
				<div class="col-lg-4">
					<label class="col-form-label mt-4">수량</label>
					<input name="option_count" class="form-control" id="inputDefault">
					<small class="form-text text-muted">옵션의 재고 수량을 입력해주세요.</small>
				</div>
			</div>
			</div>
		</div>

		<div id="detailImg-body" class="card shadow mb-4">
			<div id="add-detailImg-body" style="cursor: pointer;" class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">상품 상세 이미지 추가</h6>
			</div>
			<div class="card-body" id="detailImg-div">
				<small class="form-text text-muted">상품 상세 설명에 노출될 이미지를 선택해주세요.</small>
				<div class="row" id="detailImg-count0">
					<br><br>
					<div class="col-lg-10">
						<input name="detailImg" id="detailImg0" class="form-control" type="file" id="formFile" accept="image/jpeg, image/png, image/jpg, image/gif">
					</div>
				</div>
			</div>
		</div>
	  
	  
	  
	  <label class="form-label mt-4">배송/환불/교환</label>
	      <textarea name="delivery_info" class="form-control" id="exampleTextarea" rows="10"></textarea>
	  <small class="form-text text-muted">배송/환불/교환 영역에 노출될 내용을 입력해주세요.</small>
		
      <label class="col-form-label mt-4">핫딜 여부</label>
      <div class="form-check form-switch">
        <input name="hot_deal" class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
        <label class="form-check-label" for="flexSwitchCheckDefault">핫딜</label>
      </div>
		
	</div>
	
</form>
		
		
		</div>
		<div class="card-header py-3">
			<button onclick="insertCheck()" class="btn btn-primary">추가</button>
		</div>
	</div>
</div>

<script type="text/javascript">
	var option_count = 1;
	var option_body = document.getElementById("option-body");
	var add_option_body = document.getElementById("add-option-body");
	add_option_body.addEventListener("click", obClick);
	function obClick() {
		const option_div = document.createElement("div");
		option_div.className = "row";
		option_div.id = 'option_count' + option_count;
		option_div.innerHTML = `
			<div class="col-lg-4">
			<label class="col-form-label mt-4">옵션 정보</label>
		  	<input name="option_detail" class="form-control" id="inputDefault">
		  	<small class="form-text text-muted">옵션 정보를 입력해주세요.</small>
			</div>
			<div class="col-lg-4">
			<label class="col-form-label mt-4">옵션 금액</label>
			<input name="option_price" class="form-control" id="inputDefault" placeholder="금액단위 : 원">
			<small class="form-text text-muted">옵션 금액을 입력해주세요.</small>
			</div>
			<div class="col-lg-4">
			<label class="col-form-label mt-4">수량</label>
			<input name="option_count" class="form-control" id="inputDefault">
			<small class="form-text text-muted">옵션의 재고 수량을 입력해주세요.</small>
			</div>
			<div align="right">
			<button onclick="javascript:deleteOption(this.parentElement)" class="btn btn-primary">옵션 삭제</button>
			</div>
		`;
		document.getElementById("option-div").append(option_div);
		option_count += 1;
	}
	
	var mainImg_count = 1;
	var add_mainImg_body = document.getElementById("add-mainImg-body");
	add_mainImg_body.addEventListener("click", mIClick);
	function mIClick() {
		const temp = document.createElement("div");
		temp.className="row";
		temp.id = 'mainImg-count' + mainImg_count;
		temp.innerHTML = `
			<br><br>
			<div class="col-lg-10">
			<input name="mainImg" class="form-control" type="file" id="formFile" accept="image/jpeg, image/png, image/jpg, image/gif">
			</div>
			<div class="col-lg-2">
				<button onclick="javascript:deleteOption(this.parentElement)" class="btn btn-primary">삭제</button>
			</div>
		`;
		document.getElementById("mainImg-div").append(temp);
		mainImg_count += 1;
	}
	
	var detailImg_count = 1;
	var add_detailImg_body = document.getElementById("add-detailImg-body");
	add_detailImg_body.addEventListener("click", dIClick);
	function dIClick() {
		const temp = document.createElement("div");
		temp.className="row";
		temp.id = 'detailImg-count' + detailImg_count;
		temp.innerHTML = `
			<br><br>
			<div class="col-lg-10">
			<input name="detailImg" class="form-control" type="file" id="formFile" accept="image/jpeg, image/png, image/jpg, image/gif">
			</div>
			<div class="col-lg-2">
				<button onclick="javascript:deleteOption(this.parentElement)" class="btn btn-primary">삭제</button>
			</div>
		`;
		document.getElementById("detailImg-div").append(temp);
		mainImg_count += 1;
	}
	
	
	
	
	document.data.dc.addEventListener("click", dcClick);
	
	function deleteOption(element) {
		element.parentElement.remove();
	}
	
	function dcClick() {
		if (!document.data.dc.checked) {
			document.data.dc_price.disabled = 'disabled';
			document.data.dc_price.value = null;
			document.data.dc_amount.disabled = 'disabled';
			document.data.dc_amount.value = null;
		} else {
			document.data.dc_price.disabled = '';
			document.data.dc_amount.disabled = '';
		}
	}

	function insertCheck() {
 		if (document.data.brand_no.value == '') {
			return print_alert("브랜드 선택", document.data.brand_no);
		} else if (document.data.name.value == '') {
			return print_alert("이름", document.data.name);
		} else if (document.data.sub_info.value == '') {
			return print_alert("부가설명", document.data.sub_info);
		} else if (document.getElementById("mainImg0").value == '') {
			return print_alert("상품 대표 이미지", document.getElementById("mainImg0"));
		} else if (document.data.price.value == '') {
			return print_alert("상품 금액", document.data.price);
		} else if (document.data.delivery_price.value == '') {
			return print_alert("배송비", document.data.delivery_price);
		} else if (document.data.free_condition.value == '') {
			return print_alert("무료 배송 조건", document.data.free_condition);
		} else if (document.data.dc.checked && document.data.dc_price.value ==  '') {
			return print_alert("할인 금액", document.data.dc_price);
		} else if (document.data.dc.checked && document.data.dc_amount.value == '') {
			return print_alert("할인율", document.data.dc_amount);
		}
		var option_detail = document.getElementsByName("option_detail");
		var option_price = document.getElementsByName("option_price");
		var option_count = document.getElementsByName("option_count");
		for (var i = 0; i < option_detail.length; i++) {
			if (option_detail[i].value == '') {
				return print_alert("옵션 정보", option_detail[i]);
			} else if (option_price[i].value == '') {
				return print_alert("옵션 금액", option_price[i]);
			} else if (option_count[i].value == '') {
				return print_alert("옵션 수량", option_count[i]);
			}
		}
		if (document.getElementById("detailImg0").value == '') {
			return print_alert("상품 상세 설명 이미지", document.getElementById("detailImg0"));
		} else if (document.data.delivery_info.value == '') {
			return print_alert("배송/환불/교환", document.data.delivery_info);
		} else {
			if (confirm("상품을 추가하시겠습니까?")) {
				if (document.data.status.checked) {
					document.data.status.value = 1;
				} else {
					document.data.status.value = 0;
				}
				if (document.data.hot_deal.checked) {
					document.data.hot_deal.value = 1;
				} else {
					document.data.hot_deal.value = 0;
				}
				document.data.submit();
			}
		}
		
	}
	
	function print_alert(word, f) {
		alert(word + "을(를) 입력해주세요.");
		f.focus();
	}
</script>
<%@ include file="/WEB-INF/views/manager/layout/footer.jsp" %>