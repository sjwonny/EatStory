<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<link
	href="${pageContext.request.contextPath}/resources/manager/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="${pageContext.request.contextPath}/resources/manager/css/style.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/manager/css/style1.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>

<div
	style="padding-left: 180px; padding-right: 180px; padding-top: 60px; padding-bottom: 60px">
	<div class="container-fluid">
		<div class="card-body">
			step_photo
			<form action="${pageContext.request.contextPath}/recipe/write" method="post" enctype="multipart/form-data" name="data">
				<div class="card shadow mb-4">
					<div id="add-option-body" class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">레시피 기본 정보</h6>
					</div>
					<div class="row">
						<div class="col-lg-8">
							<div class="card-body" id="option-div">
								<div class="row">
									<div class="col-lg-12">
										<label class="col-form-label mt-4">대표 이미지</label> 
										   <input name="main_photo" class="form-control" type="file" id="formFile" accept="image/jpeg, image/png, image/jpg, image/gif">
										<label class="col-form-label mt-4">레시피 제목</label> 
										   <input name="title" class="form-control" id="inputDefault" placeholder="예) 소고기 미역국 끓이기"> 
										<label class="col-form-label mt-4">레시피 소개</label> 
										   <input name="describe" class="form-control" id="inputDefault" placeholder="예) 남편의 생일을 맞아 소고기 미역국을 끓여봤어요."> 
										<label class="col-form-label mt-4">동영상</label> 
										   <input name="video" class="form-control" id="inputDefault" placeholder="동영상이 있으면 주소를 입력하세요. (Youtube만 가능합니다.)">
									</div>
									<div class="row">
										<div class="col-lg-3">
											<label class="form-label mt-4">종류별</label> 
											 <select name="type_no" class="form-select" id="exampleSelect1">
												<option value="">--종류별--</option>
												<c:forEach var="type" items="${typeList}">
													<option value="${type.no}">${type.type}</option>
												</c:forEach>
											</select>
										</div>
										<div class="col-lg-3">
											<label class="form-label mt-4">상황별</label> 
											 <select name="situation_no" class="form-select" id="exampleSelect1">
												<option value="">--상황별--</option>
												<c:forEach var="situation" items="${situationList}">
													<option value="${situation.no}">${situation.situation}</option>
												</c:forEach>
											</select>
										</div>
										<div class="col-lg-3">
											<label class="form-label mt-4">방법별</label> 
											 <select name="method_no" class="form-select" id="exampleSelect1">
												<option value="">--방법별--</option>
												<c:forEach var="method" items="${methodList}">
													<option value="${method.no}">${method.method}</option>
												</c:forEach>
											</select>
										</div>
										<div class="col-lg-3">
											<label class="form-label mt-4">재료별</label> 
											<select name="ingredient_no" class="form-select" id="exampleSelect1">
												<option value="">--재료별--</option>
												<c:forEach var="ingre" items="${ingreList}">
													<option value="${ingre.no}">${ingre.ingre}</option>
												</c:forEach>
											</select>
										</div>
										<div class="col-lg-4">
											<label class="form-label mt-4">인원</label> 
											 <select name="people_count" class="form-select" id="exampleSelect1">
												<option value="">인원</option>
												<option value="1">1인분</option>
												<option value="2">2인분</option>
												<option value="3">3인분</option>
												<option value="4">4인분</option>
												<option value="5">5인분</option>
												<option value="6">6인분 이상</option>
											</select>
										</div>
										<div class="col-lg-4">
											<label class="form-label mt-4">조리 시간</label> 
											 <select name="hour" class="form-select" id="exampleSelect1">
												<option value="">시간</option>
												<option value="5">5분이내</option>
												<option value="10">10분이내</option>
												<option value="20">20분이내</option>
												<option value="30">30분이내</option>
												<option value="60">60분이내</option>
												<option value="90">90분이내</option>
												<option value="120">2시간이내</option>
												<option value="999">2시간이상</option>
											</select>
										</div>
										<div class="col-lg-4">
											<label class="form-label mt-4">난이도</label> 
											 <select name="difficulty" class="form-select" id="exampleSelect1">
												<option value="">난이도</option>
												<option value="1">아무나</option>
												<option value="2">초급</option>
												<option value="3">중급</option>
												<option value="4">고급</option>
												<option value="5">신의경지</option>
											</select>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-2">
							<br>
							<br>
							<br> <img id="main_photo_preview" style="width: 200px"
								src="${pageContext.request.contextPath}/resources/recipe/default.gif" /><br>
						</div>
					</div>
				</div>
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">레시피 재료 정보</h6>
					</div>
					<div class="card-body" id="option-div">
						<small class="form-text text-muted">재료가 남거나 부족하지 않도록 정확한 계량정보를 적어주세요.</small><br>
						<br>
						<div id="ingredient-list">
							<div class="card shadow mb-4">
								<div class="card-body">
									<div class="row" id="0">
										<div class="row" id="0">
											<div class="col-lg-3">
												<label class="col-form-label mt-4">재료 종류</label>
												 <input name="ingredientVoList[0].categoryArr" class="form-control" id="inputDefault" placeholder="예) 소스" value="재료"><br>
											</div>
											<div class="col-lg-1">
												<label class="col-form-label mt-4">&nbsp;</label>
												 <input type="button" onclick="javascript:AddIngreOne(this.parentElement)" class="btn btn-primary" value="추가">
											</div>
											<div class="col-lg-4">
												<label class="col-form-label mt-4">재료 이름</label>
												 <input name="ingredientVoList[0].contentArr[0]" class="form-control" id="inputDefault" placeholder="예) 돼지고기"><br>
											</div>
											<div class="col-lg-3">
												<label class="col-form-label mt-4">재료양</label>
												 <input name="ingredientVoList[0].amountArr[0]" class="form-control" id="inputDefault" placeholder="예) 300g"><br>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
					<input type="button" onclick="AddIngreList(this.parentElement)" class="btn btn-primary" style="margin: 10px 10px" value="재료/양념 묶음 추가">
				</div>


				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">요리 순서</h6>
					</div>
					<div class="card-body" id="option-div">
						<small class="form-text text-muted">요리의 맛이 좌우될 수 있는 중요한 부분은 빠짐없이 적어주세요.<br>예) 10분간 익혀주세요 &#62; 10분간 약한불로 익혀주세요. </small>
						<br>
						<br>
						<div id="step-list">
							<div class="card shadow mb-4">
								<div class="card-body">
									<div class="row" id="0">
										<div class="col-lg-3">
											<label class="col-form-label mt-4">STEP1</label>
										</div>
										<div class="row">
											<div class="col-lg-8">
												<textarea class="form-control" name="stepVoList[0].detail" id="exampleTextarea" rows="7" placeholder="예) 소고기는 기름을 떼어내고 적당한 크기로 썰어주세요."></textarea>
											</div>
											<div class="col-lg-4">
												<input name="step_photo" class="form-control" type="file" accept="image/jpeg, image/png, image/jpg, image/gif">
												<img id="stepVoList[0].step_photo_preview" style="height: 150px" src="${pageContext.request.contextPath}/resources/recipe/default.gif" /><br>
											</div>
											<div class="col-lg-8">
												<div class="row">
													<div class="col-lg-2">
														<small class="form-text text-muted">재료 정보</small>
													</div>
													<div class="col-lg-10">
														<input name="stepVoList[0].ingre" class="form-control" id="inputDefault" placeholder="예) 밀가루 100g, 소금 2큰술, 물 100g">
													</div>
												</div>
											</div>
											<div class="col-lg-8">
												<div class="row">
													<div class="col-lg-2">
														<small class="form-text text-muted">도구 정보</small>
													</div>
													<div class="col-lg-10">
														<input name="stepVoList[0].tool" class="form-control" id="inputDefault" placeholder="예) 국자, 가위">
													</div>
												</div>
											</div>
											<div class="col-lg-8">
												<div class="row">
													<div class="col-lg-2">
														<small class="form-text text-muted">불</small>
													</div>
													<div class="col-lg-10">
														<input name="stepVoList[0].fire" class="form-control" id="inputDefault" placeholder="예) 강불, 약불">
													</div>
												</div>
											</div>
											<div class="col-lg-8">
												<div class="row">
													<div class="col-lg-2">
														<small class="form-text text-muted">요리팁</small>
													</div>
													<div class="col-lg-10">
														<input name="stepVoList[0].tip" class="form-control" id="inputDefault">
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<input type="button" onclick="AddStep(this.parentElement)"class="btn btn-primary" style="margin: 10px 10px" value="순서 추가">
				</div>


				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">요리 완성 사진</h6>
					</div>
					<div class="card-body">
						<input name="end_image" class="form-control" type="file" id="formFile" accept="image/jpeg, image/png, image/jpg, image/gif" multiple="multiple"><br>
						<br>
					</div>
				</div>


				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">요리팁</h6>
					</div>
					<div class="card-body">
						<textarea class="form-control" name="tips" rows="7" placeholder="예) 고기요리에는 소금보다 설탕을 먼저 넣어야 단맛이 겉돌지 않고 육질이 부드러워요."></textarea>
					</div>
				</div>
				<%-- 
	  <label class="col-form-label mt-4">태그</label>
	  <input name="tage" class="form-control" id="inputDefault" placeholder=">
	   --%>
			</form>
			<div align="center">
				<button onclick="insertCheck()" class="btn btn-primary" style="width: 100% height: auto">레시피 등록하기</button>
				<button onclick="" class="btn btn-primary" style="width: 100% height: auto">레시피 임시저장하기</button>
			</div>
		</div>
		<div class="card-header py-3"></div>
	</div>
</div>

<script type="text/javascript">
	/* 대표 이미지 첨부 후 미리보기 */
/* 	const main_photo = document.getElementById('main_photo');
	const preview = document.getElementById("main_photo_preview");
	
	main_photo.addEventListener('change', () => {
		const reader = new FileReader();
		reader.onload = ({ target }) => {
			preview.src = target.result;
		}
		reader.readAsDataURL(main_photo.files[0]);
	}); */
	
	
	/* 완성 이미지 첨부 후 미리보기 */
/* 	const end_img = document.getElementById('end_image');
	const end_img_preview = document.getElementById("end_img_preview");
	
	end_img.addEventListener('change', () => {
		const reader = new FileReader();
		reader.onload = ({target}) => {
			end_img_preview.src = target.result;
		}
		reader.readAsDataURL(end_img.files[0]);
	});
	 */
	var ingredient = {"0": 0};
	 
	/* 재료 1개 추가하기 */
	function AddIngreOne(element) {
		const parent = element.parentElement.parentElement;
		const arrCnt = Number(element.parentElement.id) + 1;
		element.parentElement.id = arrCnt;
		const count = parent.id;
		const temp = document.createElement("div");
		temp.className = "row";
		temp.innerHTML = `
				<div class="col-lg-4"></div>
				<div class="col-lg-4">
	  				<input name="ingredientVoList[` + count + `].contentArr[` + arrCnt + `]" class="form-control" id="inputDefault" placeholder="예) 돼지고기"><br>
				</div>
				<div class="col-lg-3">
	  				<input name="ingredientVoList[` + count + `].amountArr[` + arrCnt + `]" class="form-control" id="inputDefault" placeholder="예) 300g"><br>				
				</div>
				<div class="col-lg-1">
	  				<input type="button" onclick="javascript:delIngreOne(this.parentElement)" class="btn btn-primary" value="삭제">				
				</div>
		`;
		parent.append(temp);
		ingredient[count] = Number(ingredient[count]) + 1; 
	}
	
	/* 재료 1개 삭제하기 */
	function delIngreOne(element) {
		element.parentElement.remove();
	}
	
	/* 재료 리스트 추가하기 */
	var listCnt = 1; /* 현재 묶음의 수를 체크 */
	function AddIngreList(element) {
		const temp = document.createElement("div");
		temp.className="card shadow mb-4";
		temp.innerHTML = `
			<div class="card-body">
				<div class="row" id="` + listCnt + `">
					<div class="col-lg-12" align="right">
				<input type="button" onclick="delIngreList(this.parentElement)" class="btn btn-primary" style="margin: 10px 10px" value="묶음 삭제">
			</div>
					<div class="row">
 					<div class="col-lg-3">
					<label class="col-form-label mt-4">재료 종류</label>
	  				<input name="ingredientVoList[` + listCnt + `].categoryArr" class="form-control" id="inputDefault" placeholder="예) 소스" value="재료"><br>
  				</div>
  				<div class="col-lg-1">
					<label class="col-form-label mt-4">&nbsp;</label>
  					<input type="button" onclick="javascript:AddIngreOne(this.parentElement)" class="btn btn-primary" value="추가">
  				</div>
				<div class="col-lg-4">
					<label class="col-form-label mt-4">재료 이름</label>
	  				<input name="ingredientVoList[` + listCnt + `].contentArr[0]" class="form-control" id="inputDefault" placeholder="예) 돼지고기"><br>			
				</div>
				<div class="col-lg-3">
					<label class="col-form-label mt-4">재료양</label>
	  				<input name="ingredientVoList[` + listCnt + `].amountArr[0]" class="form-control" id="inputDefault" placeholder="예) 300g"><br>				
				</div>
			</div>
		</div>
	</div>
		`;
		ingredient[listCnt] = 0;
		listCnt += 1;
		document.getElementById("ingredient-list").append(temp);
	}
	
	/* 재료 리스트 삭제하기 */
	function delIngreList(element) {
		element.parentElement.parentElement.parentElement.remove();
		delete ingredient[element.parentElement.id];
	}

	

	var stepArr = [0];
	
	var step = 1; /* 현재 스텝의 수 */
	/* 스텝 추가하기 */
	function AddStep(element) {
		const temp = document.createElement("div");
		temp.className="card shadow mb-4";
		temp.innerHTML = `
			<div class="card-body">
				<div class="row" id="` + step + `">
					<div class="col-lg-3">
					<label class="col-form-label mt-4">STEP` + (step+1) + ` </label>
  				</div>
					<div class="col-lg-9" align="right">
					<input type="button" onclick="delStepList(this.parentElement)" class="btn btn-primary" style="margin: 10px 10px" value="묶음 삭제">
				</div>
					<div class="row">
						<div class="col-lg-8">
						<textarea class="form-control" name="stepVoList[`+ step + `].detail" id="exampleTextarea" rows="7"  placeholder="예) 소고기는 기름을 떼어내고 적당한 크기로 썰어주세요."></textarea>
						</div>
					<div class="col-lg-4">
  						<input name="step_photo" class="form-control" type="file" accept="image/jpeg, image/png, image/jpg, image/gif">
  						<img id="stepVoList[`+ step + `].step_photo_preview" style="height: 150px" src="${pageContext.request.contextPath}/resources/recipe/default.gif"/><br>
					</div>
						<div class="col-lg-8">
							<div class="row">
								<div class="col-lg-2">
  								<small class="form-text text-muted">재료 정보</small>
								</div>
								<div class="col-lg-10">
								<input name="stepVoList[`+ step + `].ingre" class="form-control" id="inputDefault" placeholder="예) 밀가루 100g, 소금 2큰술, 물 100g">
								</div>	
							</div>
						</div>
						<div class="col-lg-8">
							<div class="row">
								<div class="col-lg-2">
  								<small class="form-text text-muted">도구 정보</small>
								</div>
								<div class="col-lg-10">
								<input name="stepVoList[`+ step + `].tool" class="form-control" id="inputDefault" placeholder="예) 국자, 가위">
								</div>	
							</div>
						</div>
						<div class="col-lg-8">
							<div class="row">
								<div class="col-lg-2">
  								<small class="form-text text-muted">불</small>
								</div>
								<div class="col-lg-10">
								<input name="stepVoList[`+ step + `].fire" class="form-control" id="inputDefault" placeholder="예) 강불, 약불">
								</div>	
							</div>
						</div>
						<div class="col-lg-8">
							<div class="row">
								<div class="col-lg-2">
  								<small class="form-text text-muted">요리팁</small>
								</div>
								<div class="col-lg-10">
								<input name="stepVoList[`+ step + `].tip" class="form-control" id="inputDefault">
								</div>	
							</div>
						</div>
				</div>
			</div>
		</div>
		`;
		stepArr.push(step);
		step += 1;
		document.getElementById("step-list").append(temp);
	}
	
	/* 스텝 삭제 */
	function delStepList(element) {
		element.parentElement.parentElement.parentElement.remove();
		
	}
	
 	function insertCheck() {
		const form = document.data;
		if (form.main_photo.value == '') {
			return print_alert("대표 이미지", form.main_photo);
		} else if (form.title.value == '') {
			return print_alert("레시피 제목", form.title);
		} else if (form.describe.value == '') {
			return print_alert("레시피 소개", form.describe);
		} else if (form.type_no.value == '') {
			return print_alert("종류별", form.type_no);
		} else if (form.situation_no.value == '') {
			return print_alert("상황별", form.situation_no);
		} else if (form.method_no.value == '') {
			return print_alert("방법별", form.method_no);
		} else if (form.ingredient_no.value == '') {
			return print_alert("종류별", form.ingredient_no);
		} else if (form.people_count.value == '') {
			return print_alert("인원", form.people_count);
		} else if (form.hour.value == '') {
			return print_alert("조리 시간", form.hour);
		} else if (form.difficulty.value == '') {
			return print_alert("난이도", form.difficulty);
		} 
		for (var ingre in ingredient) {
			for (let i = 0; i <= ingredient[ingre]; i++) {
				if (data == 0) {
					if (document.getElementsByName("ingredientVoList[" + ingre + "].categoryArr")[0].value == '') {
						return print_alert("재료 종류", document.getElementsByName("ingredientVoList[" + ingre + "].categoryArr")[0]);
					}
				} 
				if (document.getElementsByName("ingredientVoList[" + ingre + "].contentArr[" + i + "]")[0] != undefined && document.getElementsByName("ingredientVoList[" + ingre + "].contentArr[" + i + "]")[0].value == '') {
					return print_alert("재료 이름", document.getElementsByName("ingredientVoList[" + ingre + "].contentArr[" + i + "]")[0]);
				} else if (document.getElementsByName("ingredientVoList[" + ingre + "].amountArr[" + i + "]")[0] != undefined && document.getElementsByName("ingredientVoList[" + ingre + "].amountArr[" + i + "]")[0].value == '') {
					return print_alert("재료양", document.getElementsByName("ingredientVoList[" + ingre + "].amountArr[" + i + "]")[0]);
				}
			}
		}
		for (var step in stepArr) {
			if (document.getElementsByName("stepVoList[" + step + "].detail")[0] != undefined) {
				if (document.getElementsByName("stepVoList[" + step + "].detail")[0].value == '') {
					return print_alert("조리 순서(STEP) 정보", document.getElementsByName("stepVoList[" + step + "].detail")[0]);
				} 
			}
		}
		var step_photoArr = document.getElementsByName("step_photo");
 		for (var i = 0 ; i < step_photoArr.length; i++) {
 			if (step_photoArr[i].value == '') {
				return print_alert("요리 순서(STEP) 이미지", step_photoArr[i]);
 			}
		} 
		if (form.end_image.value == '') {
			return print_alert("요리 완성 사진", form.end_image);
		}
		form.submit();
		
	} 
	
	function print_alert(word, f) {
		alert(word + "을(를) 입력해주세요.");
		f.focus();
	}
</script>

<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
