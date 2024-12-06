<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 등록</title>
<style type="text/css">
.rcpWrite {
	background-color:white;
	border: 1px solid black;
	margin-left: 200px;
	margin-right: 950px;
	margin-top : 30px;	
	border-radius: 6px;
	
}

.rcpTitle{
	border-bottom: 1px solid black;
	padding: 10px;
}
#MainImgBox{
float: right;
margin-right: 10%;
margin-top: 30px;

}
.marginLine{
margin-left:15px;
margin-top: 15px;
}
.start{
margin-left:15px;
margin-top: 15px;
}
.introRcp,.video,.category,.information,.ingredient,.procedure,.tip,.tag{
margin-left:15px;
margin-top: 15px;
margin-bottom:20px;
}

.ingredientSection,.procedureSection,.tipSection,.tagSection{
border: 1px solid black;
border-radius: 6px;
width:1117px;
margin-left: 200px;
margin-top : 30px;	
}

.marginLine> input{
    width:650px;
    height: 48px;
    padding: 0 10px;
    box-sizing: border-box;
    margin-bottom: 16px;
    border-radius: 6px;
    background-color: #F8F8F8;
    border: none;
}
.introRcp> input{
    width:650px;
    height: 48px;
    padding: 0 10px;
    box-sizing: border-box;
    margin-bottom: 16px;
    border-radius: 6px;
    background-color: #F8F8F8;
    border: none;
}
.video> input{
 
    padding: 0 10px;
    box-sizing: border-box;
    margin-bottom: 16px;
    border-radius: 6px;
    background-color: #F8F8F8;
    border: none;
    width:650px; 
    height: 100px;
}
.tag> input{
 
    padding: 0 10px;
    box-sizing: border-box;
    margin-bottom: 16px;
    border-radius: 6px;
    border: none;
    width:650px; 
    height: 50px;
}

.category select {
    background: #f5f5f5;
    border: 1px solid #e1e1e1;
    font-size: 16px;
    padding: 8px 2px;
    margin: 0 2px 0 0;
    border-radius: 4px;
}

.information select,textarea {
    background: #f5f5f5;
    border: 1px solid #e1e1e1;
    font-size: 16px;
    padding: 8px 2px;
    margin: 0 2px 0 0;
    border-radius: 4px;
}

.notice{
font-size: 12px;
color: pink;
padding: 8px 15px;
margin: 0 2px 0 0;
}
<!--버튼 추가~~~~-->

body{
  font-family: 'Montserrat', sans-serif;
  margin:0;
}

 .btnContainer {
  display: flex;
  justify-content: center;
  align-items: center;
  align-content: center;
  flex-wrap: wrap;
 width: 50vw; 
  margin: 0 auto;
  min-height: 30vh;
/*   width: 600px; */
}
.btn {
  flex: 1 1 auto;
  margin: 10px;
  padding: 30px;
  text-align: center;
  text-transform: uppercase;
  transition: 0.5s;
  background-size: 200% auto;
  color: white;
  box-shadow: 0 0 20px #eee;
  border-radius: 10px;
  
 
 }


.btn:hover {
  background-position: right center; 
}


.btn1{
  background-image: linear-gradient(to right, #fbc2eb 0%, #a6c1ee 51%, #fbc2eb 100%);
   flex-basis: 30px; 
   height:20px;
}

.btn2 {
  background-image: linear-gradient(to right, #84fab0 0%, #8fd3f4 51%, #84fab0 100%);
  flex-basis: 30px; 
   height:20px;
}

.btn3{
  background-image: linear-gradient(to right, #a1c4fd 0%, #c2e9fb 51%, #a1c4fd 100%);
  flex-basis: 10px;
  height:20px;
}

<!--버튼 끝~~-->
<!--------------->
.modal_bg {
		
	display: none;
	width: 100%;
	height: 100%;
	   position: fixed;
	top: 0;
	left: 0;
	right: 0;
	background: rgba(0, 0, 0, 0.6);
	z-index: 999; 
}
	
.modal_wrap {
		
	display: none;
	position: absolute;
	top:50%;
	left:50%;
	transform:translate(-50%,-50%); 
	width: 900px;
	height: 700px;
	background:white;
	z-index: 1000; 
	margin-top:100px;
}

	
/*팝업 버튼*/
.btn_box .btn_open {
		
	display: block; 
	width: 150px;
	height: 50px;
	margin: 0 auto; 
	line-height: 50px;
	background: #333;
	text-align: center; 
	box-sizing: border-box; 
}
	
.btn_box .btn_open p {
	color: #fff; 
}
<!------------모달창---------------->
element.style {
    font-size: 15px;
    line-height: 1.8;
    padding: 15px 0 0 15px;
    margin: 0;
}

p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
.modal-body .blog_select dd {
    padding: 18px 0 10px 27px;
    color: #999;
}

.modal-header {
    min-height: 16.43px;
    padding: 15px 17px 14px;
    border-bottom: 1px solid #b4b4b4;
    background: #efefef;
    border-radius: 10px 10px 0 0;
}
.step_cont {
    display: inline-block;
    vertical-align: middle;
    background: #f5f5f5;
    border: 1px solid #e1e1e1;
    font-size: 16px;
    line-height: 25px;
}
<!--네비 추가바-->
/* .btn0  {
	display: inline-block;
    margin: 0 2px;
    font-weight: 400;
    text-align: center;
    white-space: nowrap; 
    vertical-align: middle;
    touch-action: manipulation;
    cursor: pointer;
    user-select: none;
    background-image: none;
} */


</style>

<script>
function updateImage(input) { //첫번째 이미지 첨부
	  var image = document.getElementById('uploaded-image');
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function (e) {
	      image.src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  }
	}
function updateImage2(input) { //두번째 이미지 첨부
	  var image = document.getElementById('stepImg+');
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function (e) {
	      image.src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  }
	}
function attachPhotos() { //사진 여러개 첨부
	  var fileInput = document.createElement('input');
	  fileInput.type = 'file';
	  fileInput.multiple = true;
	  fileInput.addEventListener('change', function(event) {
	    var files = event.target.files;
	    var imageCount = Math.min(files.length, 4); // 최대 4개의 사진만 처리
	    
	    for (var i = 0; i < imageCount; i++) {
	      var file = files[i];
	      var reader = new FileReader();
	      reader.onload = createImageHandler(i);
	      reader.readAsDataURL(file);
	    }
	  });
	  
	  fileInput.click();
	}

	function createImageHandler(index) { //위에 딸려나온것
	  return function(event) {
	    var imageUrl = event.target.result;
	    var imgId = 'photo' + (index + 1);
	    var imgElement = document.getElementById(imgId);
	    imgElement.src = imageUrl;
	  };
	}
	
	var ingredientCount = 3; // 초기 재료 카운트

	var ingredientCount = 3; // 초기 재료 카운트

	 function addIngredient() { //재료 추가버튼 
		  var ingredientList = document.getElementById('ingreAmount');

		  var listItem = document.createElement('li');

		  var materialInput = document.createElement('input');
		  materialInput.type = 'text';
		  materialInput.name = 'material' + (ingredientList.children.length + 1);
		  materialInput.style.width = '330px';
		  materialInput.style.background = '#f5f5f5';
		  materialInput.style.border = '1px solid #e1e1e1';
		  materialInput.style.borderRadius = '4px';
		  materialInput.placeholder = '예) 식재료';

		  var amountInput = document.createElement('input');
		  amountInput.type = 'text';
		  amountInput.name = 'amount' + (ingredientList.children.length + 1);
		  amountInput.style.width = '280px';
		  amountInput.style.background = '#f5f5f5';
		  amountInput.style.border = '1px solid #e1e1e1';
		  amountInput.style.borderRadius = '4px';
		  amountInput.placeholder = '예) 양';
		  amountInput.style.marginLeft ='8px';

		  listItem.appendChild(materialInput);
		  listItem.appendChild(amountInput);

		  ingredientList.appendChild(listItem);
		}

		var addButton = document.querySelector('.plusBtn button');
		addButton.addEventListener('click', addIngredient);  
		
		
		
			
			
				/////////////////////////////////////////////////////////////
				
				var isFirstGroupAdded = false; // 첫 번째 묶음이 추가되었는지 여부를 나타내는 변수

function addIngredientGroup() {
  if (!isFirstGroupAdded) {
    var ingredientGroup = document.querySelector('.ingredient').cloneNode(true);
    var addButton = document.querySelector('.plusBtn button');

    // 묶음을 추가할 위치를 찾아서 이전 요소 뒤에 추가
    addButton.parentNode.insertBefore(ingredientGroup, addButton.nextSibling);
    isFirstGroupAdded = true;
  } else {
    var ingredientGroups = document.querySelectorAll('.ingredient');
    var lastGroup = ingredientGroups[ingredientGroups.length - 1];
    var clonedGroup = lastGroup.cloneNode(true);

    // 묶음을 추가할 위치를 찾아서 이전 요소 뒤에 추가
    lastGroup.parentNode.insertBefore(clonedGroup, lastGroup.nextSibling);
  }
}

// '재료/양념 묶음 추가' 버튼 클릭 시 호출되는 함수 등록
var addButton = document.querySelector('.plusBtn button');
addButton.onclick = addIngredientGroup;
				

	
	function removeIngredientGroup(event) {
		  var groupToRemove = event.target.closest('.ingredient'); // 클릭한 버튼이 속한 가장 가까운 .ingredient 요소 선택

		  if (groupToRemove) {
		    groupToRemove.remove();
		  }
		}

		// '묶음 삭제' 버튼 클릭 시 호출되는 함수 등록
		var removeButtons = document.querySelectorAll('.removeBtn button');
		removeButtons.forEach(function(button) {
		  button.onclick = removeIngredientGroup;
		});
		
		
		// "한번에 넣기" 버튼 클릭 시 모달 창 보이기
		  var addAllButton = document.getElementById('addAllButton');
		  var modal = document.getElementById('myModal');
		  var modalClose = document.getElementById('modalClose');

		  addAllButton.addEventListener('click', function() {
		    modal.style.display = 'block';
		  });

		  // 모달 창 닫기 버튼 클릭 시 모달 창 숨기기
		  modalClose.addEventListener('click', function() {
		    modal.style.display = 'none';
		  });	
		  
			 function checkWrite() {
				 if(document.write.photo-file.value=="") {
					alert("사진을 첨부해주세요");
					
				}else if(document.write.rcpTitle.value==""){
					alert("레시피 제목을 입력해주세요");
				}else if(document.write.describe.value==""){
					alert("요리소개를 입력해주세요");
				}else if(document.write.ingredientVoList[0].category.value==""){
					alert("항목을 입력해주세요");
				}else if(document.write.ingredientVoList[0].content.value==""){
					alert("재료를 입력해주세요");
				}else if(document.write.ingredientVoList[0].amount.value==""){
					alert("재료량을 입력해주세요");
				}else{
					document.write.submit();
				}
			}  


				
</script>
</head>
<body>

<div class="rcpWrite" align ="">
    <div class="rcpTitle">레시피 등록</div>
      <div id="divMainPhotoUpload">
         <div id="MainImgBox" >
             <img id="uploaded-image" src="https://recipe1.ezmember.co.kr/img/pic_none4.gif" style="width: 200px; height: 250px; padding:40px; border: 1px solid black; border-radius: 6px; cursor:pointer"><br>
          <label for="photo-file">
       		 <input type="file" name="photo-file" id="photo-file" accept=".jpg, .jpeg, .png" class="hidden"
          onchange="updateImage(this)">
          </label>
        </div>  
      </div>
      <div class="marginLine">
      	<p>레시피 제목</p>
      <input type="text" name="writeTitle" placeholder="예) 소고기 미역국 끓이기" >
      </div>
      <div class="introRcp">
      	<p>요리소개</p>
      <input type="text" name="background"  placeholder="이 레시피의 탄생배경을 적어주세요. 예) 남편의 생일을 맞아 소고기 미역국을 끓여봤어요.">
      </div>

	  <div class="video">
		  <p>동영상</p>
          <input type="text" name="videoUrl"  placeholder="동영상이 있으면 url을 입력하세요." >
	  </div>

      <div class="category">
      <p>카테고리</p>
			<select name="kind">
				<option value="">종류별</option>
				<option value="k0">밑반찬</option>
				<option value="k1">메인반찬</option>
				<option value="k2">국/탕</option>
				<option value="k3">찌개</option>
				<option value="k4">디저트</option>
				<option value="k5">면/만두</option>
				<option value="k6">밥/죽/떡</option>
				<option value="k7">퓨전</option>
				<option value="k8">김치/젓갈/장류</option>
				<option value="k9">양념/소스/잼</option>
				<option value="k10">양식</option>
				<option value="k11">샐러드</option>
				<option value="k12">스프</option>
				<option value="k13">빵</option>
				<option value="k14">과자</option>
				<option value="k15">차/음료/술</option>
				<option value="k16">기타</option>
			</select> <select name="environment">
				<option value="">상황별</option>
				<option value="e0">일상</option>
				<option value="e1">초스피드</option>
				<option value="e2">손님접대</option>
				<option value="e3">술안주</option>
				<option value="e4">다이어트</option>
				<option value="e5">도시락</option>
				<option value="e6">영양식</option>
				<option value="e7">간식</option>
				<option value="e8">야식</option>
				<option value="e9">푸드스타일링</option>
				<option value="e10">해장</option>
				<option value="e11">명절</option>
				<option value="e12">이유식</option>
				<option value="e13">기타</option>
			</select> <select name="method">
				<option value="">방법별</option>
				<option value="m0">볶음</option>
				<option value="m1">끓이기</option>
				<option value="m2">부침</option>
				<option value="m3">조림</option>
				<option value="m4">무침</option>
				<option value="m5">비빔</option>
				<option value="m6">찜</option>
				<option value="m7">절임</option>
				<option value="m8">튀김</option>
				<option value="m9">삶기</option>
				<option value="m10">굽기</option>
				<option value="m11">데치기</option>
				<option value="m12">회</option>
				<option value="m13">기타</option>
			</select> <select name=ingredient">
				<option value="">재료별</option>
				<option value="i0">소고기</option>
				<option value="i1">돼지고기</option>
				<option value="i2">닭고기</option>
				<option value="i3">육류</option>
				<option value="i4">채소류</option>
				<option value="i5">해물류</option>
				<option value="i6">달걀/유제품</option>
				<option value="i7">가공식품류</option>
				<option value="i8">쌀</option>
				<option value="i9">밀가루</option>
				<option value="i10">건어물류</option>
				<option value="i11">버섯류</option>
				<option value="i12">과일류</option>
				<option value="i13">콩/견과류</option>
				<option value="i14">곡류</option>
				<option value="i15">기타</option>
			</select>
		</div>
      
      <div class="information">
      <p>요리정보</p>
			<select name="person">
				<option value="">인원</option>
				<option value="p1">1인분</option>
				<option value="p2">2인분</option>
				<option value="p3">3인분</option>
				<option value="p4">4인분</option>
				<option value="p5">5인분</option>
				<option value="p6">6인분이상</option>
			</select> <select name="time">
				<option value="">시간</option>
				<option value="t5">5분이내</option>
				<option value="t10">10분이내</option>
				<option value="t15">15분이내</option>
				<option value="t20">20분이내</option>
				<option value="t30">30분이내</option>
				<option value="t60">60분이내</option>
				<option value="t90">90분이내</option>
				<option value="t120">2시간이내</option>
				<option value="t999">2시간이상</option>
			</select> <select name="degree">
				<option value="">난이도</option>
				<option value="d0">아무나</option>
				<option value="d1">초급</option>
				<option value="d2">중급</option>
				<option value="d3">고급</option>
				<option value="d4">신의경지</option>
			</select>
		</div>
     </div>
    
     <div class="ingredientSection">
		<div class="ingredient">
		<input type="text" name="ingreTitle" value="재료" style="background:#f5f5f5; height:50px; border: 1px solid #e1e1e1; border-radius: 4px;">
		<span class="twoBtn">
		<button onclick="js">한번에 넣기</button>
		<button onclick="removeIngredientGroup(event)">묶음삭제</button>
		</span>
		<br><br>
		<ul id="ingreAmount">
		<li>
			<input type="text" name="material1" style="width:330px; background: #f5f5f5; border: 1px solid #e1e1e1; border-radius: 4px;"  placeholder="예) 돼지고기">
			<input type="text" name="amount1" style="width:280px; background: #f5f5f5; border: 1px solid #e1e1e1; border-radius: 4px;" placeholder="예) 300g">
		</li>
		
		<li>
			<input type="text" name="material2" style="width:330px; background: #f5f5f5; border: 1px solid #e1e1e1; border-radius: 4px;" placeholder="예) 양배추">
			<input type="text" name="amount2" style="width:280px; background: #f5f5f5; border: 1px solid #e1e1e1; border-radius: 4px;" placeholder="예) 1/2개">
	    </li>
		
		<li>
			<input type="text" name="material3" style="width:330px; background: #f5f5f5; border: 1px solid #e1e1e1; border-radius: 4px;" placeholder="예) 참기름">
			<input type="text" name="amount3" style="width:280px; background: #f5f5f5; border: 1px solid #e1e1e1; border-radius: 4px;" placeholder="예) 1T">
		</li>
		</ul>
		<div class="plusBtn" >
		<button type="button" onclick="addIngredient()">추가</button>
		</div>
		</div>

        <div class="notice">♥ 양념, 양념장, 소스, 드레싱, 토핑, 시럽, 육수 밑간 등으로 구분해서 작성해주세요.
            <div class="plusBtn"><br>
            	<button type="button" onclick="addIngredientGroup()"> 재료/양념 묶음 추가</button>
			</div>
        </div>
    </div> <!-- 재료 끝 -->
    
    
    <div class="procedureSection">
    <div class="procedure">
      <p>요리순서
    	  <button type="button" onclick="js">순서사진 한번에 넣기</button>
      </p>
	  <span class="notice2" style="font-size:12px;"><b>요리의 맛이 좌우될 수 있는 중요한 부분은 빠짐없이 적어주세요.</b><br>
		<div style=" font-size: 12px; color: pink;">예) 10분간 익혀주세요 ▷ 10분간 약한불로 익혀주세요.<br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;마늘편은 익혀주세요 ▷ 마늘편을 충분히 익혀주셔야 매운 맛이 사라집니다.<br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;꿀을 조금 넣어주세요 ▷ 꿀이 없는 경우, 설탕 1스푼으로 대체 가능합니다.
	  </div></span>
      <div id="divStepArea" class="ui-sortable">
            <p>Step1</p>
            <div id="step1" style="display:inline-block">
                <textarea placeholder="예) 감자는 전분을 빼기 위해 물에 담가놓습니다." style="height:160px; width:430px;"></textarea>
            </div>
            <div id="stepImg" style="display:inline-block">
                <div style="right:3000px">
                <label for="stepImg1">
                <input type="file" name="stepImg1" id="stepImg1" onchange="updateImage2(this)">
                </div>
                <div class="photo+">
                   <img id="stepImg+" src="https://recipe1.ezmember.co.kr/img/pic_none2.gif" alt="" class="file-img" style="width:180px; height:170px;">
               </div>
               </label>
            </div>
            
            
            <div style="margin-top: 20px;">
               <a href="js;" id="stepBtn_material_2" class="btn0 btn0-xs btn0-default" style="width:70px;height:26px;" >
              <img src="https://recipe1.ezmember.co.kr/img/mobile/app_icon_step_material.png" style="width:16px;height:16px;"> 재료</a>
              <a href="js;" id="stepBtn_cooker_2" class="btn0 btn0-xs btn0-default" style="width:70px;height:26px;">
              <img src="https://recipe1.ezmember.co.kr/img/mobile/app_icon_step_tool.png?v.1" style="width:16px;height:16px;"> 도구</a>
              <a href="js;" id="stepBtn_fire_2" class="btn0 btn0-xs btn0-default" style="width:70px;height:26px;">
              <img src="https://recipe1.ezmember.co.kr/img/mobile/app_icon_step_fire.png?v.1" style="width:16px;height:16px;"> 불</a>
              <a href="js;" id="stepBtn_tip_2" class="btn0 btn0-xs btn0-default" style="width:70px;height:26px;">
              <img src="https://recipe1.ezmember.co.kr/img/mobile/app_icon_step_tip.png?v.1" style="width:16px;height:16px;"> 팁</a>
                            <a href="js;" id="stepBtn_all_2" class="btn0 btn0-xs btn0-default" style="width:70px;height:26px;"> 전체 </a>
              <a href="js;" id="stepBtn_guide_2" class="btn0 btn0-xs btn0-default" style="width:160px;height:26px; border: 1px solid #E2A9F3; background:white; color:black; padding:6px 7px 4px;">추가기능을 넣어보세요!!</a>

              <div id="stepForm_material_2" style="margin: 5px;"><img src="https://recipe1.ezmember.co.kr/img/mobile/app_icon_step_material.png" style="width:24px;height:24px;"> <input type="text" name="step_material[]" id="step_material_2" placeholder="밀가루 100g,소금 2큰술,물 100g" class="form-control step_cont" style="width:500px;height:24px;"></div>
              <div id="stepForm_cooker_2" style="margin: 5px;"><img src="https://recipe1.ezmember.co.kr/img/mobile/app_icon_step_tool.png?v.1" style="width:24px;height:24px;"> <input type="text" name="step_cooker[]" id="step_cooker_2" placeholder="국자,볼" class="form-control step_cont" style="width:500px;height:24px;"></div>
              <div id="stepForm_fire_2" style="margin: 5px;"><img src="https://recipe1.ezmember.co.kr/img/mobile/app_icon_step_fire.png?v.1" style="width:24px;height:24px;"> <input type="text" name="step_fire[]" id="step_fire_2" placeholder="약불" class="form-control step_cont" style="width:500px;height:24px;"></div>
              <div id="stepForm_tip_2" style="display:none;margin:5px 5px;"><img src="https://recipe1.ezmember.co.kr/img/mobile/app_icon_step_tip.png?v.1" style="width:24px;height:24px;vertical-align:top;"> <textarea name="step_tip[]" id="step_tip_2" class="form-control step_cont" style="width:500px;height:50px;resize:none;"></textarea></div> 
              <div id="stepForm_video_2" style="display:none;margin:5px 5px;"><img src="https://recipe1.ezmember.co.kr/img/mobile/app_icon_step_video.png" style="width:24px;height:24px;"> <input type="text" name="step_video[]" id="step_video_2" placeholder="양파 다듬는 법" class="form-control step_cont" style="width:380px;height:24px;">
                        <input type="text" name="step_video_seq[]" id="step_video_seq_2" placeholder="6816284" class="form-control step_cont" style="width:100px;height:24px;"></div>
          </div> 
            
            
            
            
      </div>

      <div class="plusBtn" style="padding:0 0 20px 180px; width:820px;">
      	<button type="button" onclick="js">순서추가</button>
      </div>


      <p class="result">요리완성사진
    	  <input type="file" name="file" style="display:none;">
		  <br><button onclick="attachPhotos()"> 사진 한번에 넣기</button>
	  </p>
      <div id="photoZone" style="display:inline-block;  display: flex; justify-content: left; margin-top:10px;" >
                <div id="hiddenInput1">
           <!--  <input type="hidden" name="workPhoto">
            <input type="hidden" name="newWorkPhoto">
            <input type="hidden" name="delWorkPhoto"> --><!-- 이거 들어가야하나? -->
            <div style="position:absolute; right:3000px">
            <input type="file" name="photo1" style="display:;width:0px;height:0px;font-size:0px;">
            </div>
            <div id="divWorkPhotoBox_1">
                <img id="photo1" onclick="js" src="https://recipe1.ezmember.co.kr/img/pic_none3.gif"  style="width: 140px; height: 140px; margin-left:10px; cursor:pointer">
            </div>
        </div>
                <div id="hiddenInput2">
            <!-- <input type="hidden" name="workPhoto">
            <input type="hidden" name="newWorkPhoto">
            <input type="hidden" name="delWorkPhoto"> -->
            <div style="position:absolute;left:-3000px">
            <input type="file" name="photo2"  style="display:;width:0px;height:0px;font-size:0px;">
            </div>
            <div id="divWorkPhotoBox_2">
                <img id="photo2" onclick="js" src="https://recipe1.ezmember.co.kr/img/pic_none3.gif"  style="width: 140px; height: 140px; margin-left:10px; margin-right:10px; cursor:pointer">
            </div>
        </div>
                <div id="hiddenInput3">
            <!-- <input type="hidden" name="workPhoto">
            <input type="hidden" name="newWorkPhoto">
            <input type="hidden" name="delWorkPhoto"> -->
            <div style="position:absolute;left:-3000px">
            <input type="file" name="photo3" style="display:;width:0px;height:0px;font-size:0px;">
            </div>
            <div id="divWorkPhotoBox_3">
                <img id="photo3" onclick="js" src="https://recipe1.ezmember.co.kr/img/pic_none3.gif" style="width: 140px; height: 140px; cursor:pointer">
            </div>
        </div>
                <div id="hiddenInput4">
            <!-- <input type="hidden" name="workPhoto">
            <input type="hidden" name="newWorkPhoto">
            <input type="hidden" name="delWorkPhoto"> -->
            <div style="position:absolute;left:-3000px">
            <input type="file" name="photo4" style="display:;width:0px;height:0px; font-size:0px;">
            </div>
            <div id="divWorkPhotoBox_4">
                <img id="photo4" onclick="js" src="https://recipe1.ezmember.co.kr/img/pic_none3.gif" alt="No Image" style="width: 140px; height: 140px; margin-left:10px; margin-right:10px; cursor:pointer">
            </div>
        </div>
      </div>
    </div>
    </div><!-- 요리순서 테이블 끝 -->
    <div class="tipSection">
    <div class="tip">
    <p>요리팁</p>
    <textarea name="cookTip" placeholder="예) 고기 비린내는 소주를 넣으면 없앨 수 있습니다." style="height:120px; width:620px; resize:none;"></textarea>
    </div>
    </div><!--요리팁 끝-->

    <div class="tagSection">
    <div class="tag">
    <p>태그</p>
    <!-- <input type="hidden" name="hiddenTag" style="width:100%"> --><!-- 이것도 써야하나? -->
    <input type="text" style="background-color:#f5f5f5;">
    <span style="display:block; color:#666; margin-bottom:-8px;margin-left:25px; font-size: 15px;">♥ 주재료, 목적, 효능, 대상 등을 태그로 남겨주세요.<em style="font-style:normal; font-size:13px; color:pink; padding-left:8px;">예) 돼지고기, 다이어트, 비만, 칼슘, 감기예방, 이유식, 초간단</em></span>
    </div>
    </div>
  </div> 
 

 <!-- 버튼~~~ -->
    <div class="btnContainer">
  <a class="btn btn1">저장</a>
  <a class="btn btn2">저장 후 공개하기</a> 
  <a class="btn btn3">취소</a> 
</div>
<!-- 버튼~~~ -->









<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %>	 --%>
</body>
</html>