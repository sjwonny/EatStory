<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 상세페이지</title>
<style type="text/css">
ul,li{list-style: none;}
.container {
	display: flex;
	margin-left: 200px;
	margin-right: 149px;
	margin-top: 30px;
}

.content {
	border: 1px solid black;
	width: 75%; /* 본문 영역의 너비 조정 */
	padding: 20px;
	margin-right: 20px;
	border-radius: 10px;
}

 .sidebar {
	border: 1px solid black;
	width: 16.5%; /* 사이드바 영역의 너비 조정 */
	border-radius: 10px;
	font-size:20px;
}  

.marginLine {
	margin-left: 10px;
	margin-right: 10px;
}

.rcpMainImg img {
	width: 100%;
}

.rcpMainImg {
	margin-right: 10px;
}

.iconList {
	display: flex;
	margin-left:80%;
}

.userName img {
	width: 80px;
}



.userName {
	display: flex;
	align-items: center;
}

.userName .userProfile, .userName .userNickName {
	margin-right: 5px; /* 요소 사이의 간격을 조정하세요 */
}

<!--소식 받기 버튼-->
.buttons {
	margin: 10%;
	text-align: center;
}

.btn-hover {
	width: 70px;
	font-size: 13px;
	font-weight: 600;
	color: #fff;
	cursor: pointer;
	margin: 10px;
	height: 40px;
	text-align: center;
	border: none;
	background-size: 300% 100%;
	border-radius: 50px;
	moz-transition: all .4s ease-in-out;
	-o-transition: all .4s ease-in-out;
	-webkit-transition: all .4s ease-in-out;
	transition: all .4s ease-in-out;
}

.btn-hover:hover {
	background-position: 100% 0;
	moz-transition: all .4s ease-in-out;
	-o-transition: all .4s ease-in-out;
	-webkit-transition: all .4s ease-in-out;
	transition: all .4s ease-in-out;
}

.btn-hover:focus {
	outline: none;
}

.btn-hover.color1 {
	background-image: linear-gradient(to right, #ed6ea0, #ec8c69, #f7186a, #FBB03B);
	box-shadow: 0 4px 15px 0 rgba(236, 116, 149, 0.75);
}

<!--
소식받기 버튼 끝--><!--url(카카오 등등)-->
.btnUrl {
	margin-top: 10px;
}

.btnUrl img {
	border-radius: 50%;
	width: 50px;
	height: 50px;
}

.ingredientsSection {
	border-top: 1px solid #ccc;
	margin-top: 15px;
}

<!--
재료 부분-->.cont_ingre2 .best_tit {
	margin: 0 -25px;
}

.best_tit {
	font-size: 20px;
	color: #000;
	padding: 0px 30px 0px 0px;
	margin-bottom: 0px;
}

.cont_ingre2{
	padding: 35px 20px 0 25px;
}

 /* .cont_how2{
	padding: 35px 20px 0 25px;
}
 */
.whatTip { /* 요기요기 */
	padding: 35px 20px 0 25px;
}


.btn {
	display: inline-block;
	margin: 0 2px;
	font-weight: 400;
	line-height: 1.42857143;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	touch-action: manipulation;
	cursor: pointer;
	user-select: none;
}

.best_tit_rmn .btn {
	background: #fff;
	border: 1px solid #e5e5e5;
	border-radius: 0;
	color: #888;
	font-size: 15px;
	height: 36px;
	padding: 0 20px 1px;
	float: left;
	margin-right: 5px;
}

<!--재료 리스트-->
.ready_ingre3 ul {
	padding: 0 0 25px 0;
	width: 49%;
	display: inline-block;
	vertical-align: top;
}

.ready_ingre3_tt {
	padding-bottom: 8px;
	color: #333;
	font-size: 16px;
	padding-left: 20px;
	display: block;
}

li {
	display: list-item;
	text-align: -webkit-match-parent;
}

.ready_ingre3 li {
	border-bottom: 1px solid #ececec;
	padding: 10px 6px;
	list-style: none;
	margin: 0 18px;
	font-size: 16px;
	font-weight: 300;
}

.ready_ingre3 li .ingre_list_btn {
	display: inline-block;
	float: right;
	font-size: 14px;
	color: #222;
	border: 1px solid #d7d7d7;
	padding: 5px 14px 7px;
	line-height: 1;
	border-radius: 15px;
	margin-left: 20px;
}  

.ready_ingre3 li a {
	margin: -1px 0 0 5px;
	vertical-align: middle;
}

.ready_ingre3 ul {
	padding: 0 0 25px 0;
	width: 49%;
	display: inline-block;
	vertical-align: top;
}

.ready_ingre3 {
	padding: 0 20px 18px 24px;
	vertical-align: top;
}
<!---------------------->
.cont_ingre2 .best_tit {
    margin: 0 -25px;
}

body {
    font-size: 14px;
    line-height: 1.42857143;
    color: #333;
}
.ready_ingre3 li {
    border-bottom: 1px solid #ececec;
    padding: 10px 6px;
    list-style: none;
    margin: 0 18px;
    font-size: 16px;
    font-weight: 300;
}

.toolSection{
	border-bottom:1px solid #d7d7d7;
}

.multiple-items{ 
	border-bottom:1px solid #d7d7d7;
} 
<!------------------------------------------>
.slick-slider {
	position: relative;
	display: block;
	box-sizing: border-box;
	user-select: none;
	touch-action: pan-y;
	-webkit-tap-highlight-color: transparent;
}

.slick-prev {
	position: absolute;
	left: 5px;
	z-index: 1; /* 이미지 겹쳤을 때 위로오게 */
	top: 50%;
	transform: translateY(-50%); 
	width: 40px;
	height: 40px;
	background-color: transparent;
	color: #fff;
	font-size: 20px;
	cursor: pointer;
	color: transparent !important;
	border:none;
}

.slick-next {
	position: absolute;
	top: 50%;
	right: 5px;
	
	transform: translateY(-50%);
	width: 40px;
	height: 40px;
	background-color: transparent;
	color: #fff;
	font-size: 20px;
	text-align: center;
	cursor: pointer;
	color: transparent !important;
	border:none;
	
}
.slick-next:focus, .slick-prev:focus {
	outline: none;
}

.multiple-items div img {
	margin-top:20px;
	margin-left: 50px;
	margin-right: 0px;
	margin-bottom:20px;
}



.slick-prev:before {
  content: "◀";
  color:skyblue;
}
.slick-next:after{
  content: "▶";
  text-align:left;
  color:skyblue;
}

.multiple-items {
 font-size:20px;
} 

 <!--요리순서-->
 
 .view_step {
    padding: 35px 0 10px;
}
.best_tit {
    font-size: 20px;
    color: #000;
    padding: 0 35px 30px 35px;
}


.media, .media-body {
    zoom: 1;
}
.media {
    margin-top: 15px;
}
.view_step_cont img {
    border-radius: 10px;
    max-width: 100%;
    height: auto;
    margin: 20px 0 10px;
}

.view_step_cont {
    padding: 6px 0px 60px 40px;
    width: 800px;
    font-size: 20px;
}

.carousel-control {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    width: 10%;
    font-size: 20px;
    color: #fff;
    text-align: center;
    text-shadow: 0 1px 2px rgba(0, 0, 0, .6);
    opacity: .8;
    padding-top: 190px;
}


</style>
    <link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/> 
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
    <script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 
<script>
   

$(function() {
	$('.multiple-items').slick({
		infinite : true,
		slidesToShow : 3,
		slidesToScroll : 3
	});
});
</script>
</head>
<body>

<%@ include file="/WEB-INF/views/layout/header.jsp" %>
 <div class="container" >
    <div class="content">
        <!-- 본문 내용 -->
        <div class="marginLine">
				
				<div class="rcpMainImg">
					<img id="mainImg" src="https://recipe1.ezmember.co.kr/cache/recipe/2015/09/05/c86c15b0610548411c9dc68d7620eb55.jpg" alt="레시피 사진">
				</div>
				<div class="userName">
					<a class="userProfile" href="#">
					<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fshop1.phinf.naver.net%2F20220906_87%2F16624751078987Lrbr_PNG%2F63610935709306428_17067423.png&type=a340">
					</a>
					<span class="userNickName" style="font-size:20px;"><b>♡EatStory♡</b></span>
					<button class="btn-hover color1">소식받기</button><!-- 소식을 받으면 버튼이 사라져야함 + alert: OO님을 이웃으로 추가했습니다. -->
				</div>
				<span class="iconList">
					<div class="viewCnt">
					<img src="${pageContext.request.contextPath}/resources/images/eye.svg" id="hit" height="44" alt="조회수">
					<span class="hitFont">조회수</span>
				</div>
				<div class="shoppingList">
					<a href="js">
					<img src="${pageContext.request.contextPath}/resources/images/shopping-cart.svg" id="shopListBtn" height="44" alt="상품목록"></a>
				</div>
				</span>
			</div>
			
				<div class="rcpTitle centered-text" style="text-align: center; margin-top: 50px;">
				<h1>따끈따끈 말랑말랑 타코야키 만들기</h1>
				<div class="rcpInformation centered-text" style="margin: 30px 40px 30px 40px;">속엔 이렇게 큼직한
					문어조각이 쫄깃쫄깃. 따끈따끈 말랑말랑 쫄깃쫄깃 너무 맛있는 타코야키. 사먹는 타코야키와 비교하지 말아 주세요. 큼지막한
					문어가 콱콱 씹히는 부드럽고 감칠맛 나는 반죽에 베이컨, 양배추, 뎅까쯔, 실파등이 듬뿍 들어간 아주 아주 맛있는
					타코야키 랍니다.
			   </div>
				<div class="ptd">
					<span class="person"><img src="${pageContext.request.contextPath}/resources/images/user.svg" id="personEat" height="44" alt="인분"></span>6인분 이상 
					<span class="time"><img src="${pageContext.request.contextPath}/resources/images/clock.svg" id="timeEat" height="44" alt="조리시간"></span> 30분 이내
					<span class="degree"><img src="${pageContext.request.contextPath}/resources/images/star.svg" id="gradeEat" height="44" alt="난이도"></span> 중급
				</div>
				<div class="UrlSection" style="margin-top:50px;">
					<div class="btnUrl">
						<a href="javascript:void(0)" onclick="copyBbsUrl()">
						<img src="https://recipe1.ezmember.co.kr/img/mobile/icon_url_copy.gif"
							data-toggle="tooltip" title="" data-original-title="레시피 주소복사">
						</a>
						<a href="javascript:void(0)" onclick="snsWriter('kakaoStory')">
						<img src="https://recipe1.ezmember.co.kr/img/mobile/icon_sns_ks.png"
							data-toggle="tooltip" title="" data-original-title="카카오스토리">
						</a>
						<a href="javascript:void(0)" onclick="snsWriter('facebook')">
						<img src="https://recipe1.ezmember.co.kr/img/mobile/icon_sns_f.png"
							data-toggle="tooltip" title="" data-original-title="페이스북">
						</a>
						<a href="javascript:void(0)" onclick="snsWriter('twitter')">
						<img src="https://recipe1.ezmember.co.kr/img/mobile/icon_sns_t.png"
							data-toggle="tooltip" title="" data-original-title="트위터">
						</a>
					</div>
				</div>
			</div>
			<div class="ingredientsSection">
				<div class="cont_ingre2">
				<div class="best_tit">
					<b>재료</b>
					<!-- <div class="best_tit_rmn">
						<button id="btnMeasureModal" type="button" class="btn btn-default"
							onclick="$('#measureModal').modal('show');">계량법 안내</button>
					</div> -->
				</div>
				<div class="ready_ingre3" id="divConfirmedMaterialArea">
					<ul>
						<b class="ready_ingre3_tt">[재료]</b>
						<li>니신 타코야키분말 
							<span class="ingre_unit">250그램</span>
						</li>
						<a href="javascript:viewMaterial('1005');" onclick="ga('send', 'event', '레시피본문', '재료정보버튼클릭', '찬물');"></a>
						<li>
						<a href="javascript:viewMaterial('1005');" onclick="ga('send', 'event', '레시피본문', '재료정보버튼클릭', '찬물');">찬물
						<img src="https://recipe1.ezmember.co.kr/img/mobile/icon_info.png" style="width: 20px; height: 20px; margin-left: 2px; vertical-align: middle;">
						</a><a href="javascript:buyCpMaterial('찬물');" class="ingre_list_btn">구매</a>
							<span class="ingre_unit">700cc</span>
						</li>

						<a href="javascript:viewMaterial('1470');" onclick="ga('send', 'event', '레시피본문', '재료정보버튼클릭', '계란');"> </a>
						<li><a href="javascript:viewMaterial('1470');" onclick="ga('send', 'event', '레시피본문', '재료정보버튼클릭', '계란');">계란
								<img src="https://recipe1.ezmember.co.kr/img/mobile/icon_info.png" style="width: 20px; height: 20px; margin-left: 2px; vertical-align: middle;">
						</a><a href="javascript:buyCpMaterial('계란');" class="ingre_list_btn">구매</a>
							<span class="ingre_unit">2개</span></li>

						<a href="javascript:viewMaterial('76');" onclick="ga('send', 'event', '레시피본문', '재료정보버튼클릭', '자숙문어');">
						</a>
						<li><a href="javascript:viewMaterial('76');" onclick="ga('send', 'event', '레시피본문', '재료정보버튼클릭', '자숙문어');">자숙문어
								<img src="https://recipe1.ezmember.co.kr/img/mobile/icon_info.png" style="width: 20px; height: 20px; margin-left: 2px; vertical-align: middle;">
						</a><a href="javascript:buyCpMaterial('자숙문어');" class="ingre_list_btn">구매</a>
							<span class="ingre_unit">300그램</span></li>

						<a href="javascript:viewMaterial('410');" onclick="ga('send', 'event', '레시피본문', '재료정보버튼클릭', '베이컨');"> </a>
						<li><a href="javascript:viewMaterial('410');" onclick="ga('send', 'event', '레시피본문', '재료정보버튼클릭', '베이컨');">베이컨
								<img src="https://recipe1.ezmember.co.kr/img/mobile/icon_info.png" style="width: 20px; height: 20px; margin-left: 2px; vertical-align: middle;">
						</a><a href="javascript:buyCpMaterial('베이컨');" class="ingre_list_btn">구매</a>
							<span class="ingre_unit">150그램</span></li>

						<a href="javascript:viewMaterial('509');" onclick="ga('send', 'event', '레시피본문', '재료정보버튼클릭', '실파');"> </a>
						<li><a href="javascript:viewMaterial('509');" onclick="ga('send', 'event', '레시피본문', '재료정보버튼클릭', '실파');">실파
								<img src="https://recipe1.ezmember.co.kr/img/mobile/icon_info.png" style="width: 20px; height: 20px; margin-left: 2px; vertical-align: middle;">
						</a><a href="javascript:buyCpMaterial('실파');" class="ingre_list_btn">구매</a>
							<span class="ingre_unit">1줌</span></li>

						<a href="javascript:viewMaterial('20');" onclick="ga('send', 'event', '레시피본문', '재료정보버튼클릭', '양배추');"></a>
						<li><a href="javascript:viewMaterial('20');" onclick="ga('send', 'event', '레시피본문', '재료정보버튼클릭', '양배추');">양배추
								<img src="https://recipe1.ezmember.co.kr/img/mobile/icon_info.png" style="width: 20px; height: 20px; margin-left: 2px; vertical-align: middle;">
						</a><a href="javascript:buyCpMaterial('양배추');" class="ingre_list_btn">구매</a>
							<span class="ingre_unit">200그램</span></li>

						<a href="javascript:viewMaterial('508');" onclick="ga('send', 'event', '레시피본문', '재료정보버튼클릭', '식용유');"> </a>
						<li><a href="javascript:viewMaterial('508');" onclick="ga('send', 'event', '레시피본문', '재료정보버튼클릭', '식용유');">식용유
								<img src="https://recipe1.ezmember.co.kr/img/mobile/icon_info.png" style="width: 20px; height: 20px; margin-left: 2px; vertical-align: middle;">
						</a><a href="javascript:buyCpMaterial('식용유');" class="ingre_list_btn">구매</a>
							<span class="ingre_unit">적당량</span></li>

						<a href="javascript:viewMaterial('1142');" onclick="ga('send', 'event', '레시피본문', '재료정보버튼클릭', '파래김가루(아오노리)');">
						</a>
						<li><a href="javascript:viewMaterial('1142');" onclick="ga('send', 'event', '레시피본문', '재료정보버튼클릭', '파래김가루(아오노리)');">파래김가루(아오노리)
								<img src="https://recipe1.ezmember.co.kr/img/mobile/icon_info.png" style="width: 20px; height: 20px; margin-left: 2px; vertical-align: middle;">
						</a><a href="javascript:buyCpMaterial('파래김가루(아오노리)');"
							class="ingre_list_btn">구매</a> <span class="ingre_unit"></span></li>

						<a href="javascript:viewMaterial('267');" onclick="ga('send', 'event', '레시피본문', '재료정보버튼클릭', '가쯔오부시');">
						</a>
						<li><a href="javascript:viewMaterial('267');" onclick="ga('send', 'event', '레시피본문', '재료정보버튼클릭', '가쯔오부시');">가쯔오부시
								<img src="https://recipe1.ezmember.co.kr/img/mobile/icon_info.png" style="width: 20px; height: 20px; margin-left: 2px; vertical-align: middle;">
						</a><a href="javascript:buyCpMaterial('가쯔오부시');" class="ingre_list_btn">구매</a> <span class="ingre_unit"></span></li>
					</ul>
					
					<ul>
						<b class="ready_ingre3_tt">[양념]</b>
						<a href="javascript:viewMaterial('2523');" onclick="ga('send', 'event', '레시피본문', '재료정보버튼클릭', '오타후쿠타코야키소스');">
						</a>
						<li><a href="javascript:viewMaterial('2523');" onclick="ga('send', 'event', '레시피본문', '재료정보버튼클릭', '오타후쿠타코야키소스');">오타후쿠타코야키소스
								<img src="https://recipe1.ezmember.co.kr/img/mobile/icon_info.png" style="width: 20px; height: 20px; margin-left: 2px; vertical-align: middle;">
						</a><a href="javascript:buyCpMaterial('오타후쿠타코야키소스');" class="ingre_list_btn">구매</a> <span class="ingre_unit"></span></li>

						<a href="javascript:viewMaterial('228');" onclick="ga('send', 'event', '레시피본문', '재료정보버튼클릭', '마요네즈');">
						</a>
						<li><a href="javascript:viewMaterial('228');" onclick="ga('send', 'event', '레시피본문', '재료정보버튼클릭', '마요네즈');">마요네즈
								<img src="https://recipe1.ezmember.co.kr/img/mobile/icon_info.png" style="width: 20px; height: 20px; margin-left: 2px; vertical-align: middle;">
						</a><a href="javascript:buyCpMaterial('마요네즈');" class="ingre_list_btn">구매</a>
							<span class="ingre_unit"></span></li>
					</ul>
				</div>
			</div>
			<div class="toolSection" style="margin-left:26px;">
			<div class="best_tit"><b>조리도구</b></div>
			<div class="ready_ingre3">
			<ul class="case1">
			<li>냄비<a href="js" class="ingre_list_btn">구매</a>
			<span class="ingre_unit"></span></li>
			<li>도마<a href="js" class="ingre_list_btn">구매</a><span class="ingre_unit"></span></li></ul></div>
			</div>
       	<div class="tipTiltle" style="font-size:20px; margin-left:30px; margin-top:20px;"><b>노하우</b></div><div class="multiple-items">
      	<div><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fpost.phinf.naver.net%2FMjAxOTA5MDRfMTE4%2FMDAxNTY3NTkxMzUzNTcx.7SVadoUQSXxxRrY7tbbe2bVWkEV09-6tBCPpok9ZrAIg.LmalCmccVIW_AK2QbNhnrtXCdUaRm96WIYGK8LC0PI4g.JPEG%2FIiFxRV5Ry5AJbsi5iCIo7gkn7Pgs.jpg&type=sc960_832" style="width:250px; height:200px;"></div>
      	<div><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxOTEwMjJfMTQ3%2FMDAxNTcxNzMxMzYyMDM0.ZNfyXErLKtjwj7FajsQR6aGpZD6Cipv3Aiz_pgeAxxkg.rvQMeFsgX7naMJHjsn1DPq-SUMEDCXBq02vyVyynCuwg.JPEG.ezday1%2F%25BD%25E6%25B3%25D7%25C0%25CF.jpg&type=sc960_832" style="width:250px; height:200px;"></div> 
      	<div><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMDA5MjRfMTQ4%2FMDAxNjAwOTM5NDQ2NDYw.SI_ob7R8OYWxexdXNsvyehhisIBdNCp-2ag6L7dvxGUg.-jxr1cUUgCjoi4Aj-zKNa4ah7_l8c6fNLTjS9culC38g.JPEG.ezday1%2F%25BD%25E6%25B3%25D7%25C0%25CF.jpg&type=sc960_832" style="width:250px; height:200px;"></div>
      	<div><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxOTEwMTZfNTgg%2FMDAxNTcxMjExNTgwNTA1.gp_TcYivDvqvgAt5wAaR7uRFknwxpOHmCparDX_6Wkcg.Tex7XFoD4RI5mbu75kk-OV6oF0byrFjRgTjqHxZzha0g.PNG.ezday1%2F%25BD%25E6%25B3%25D7%25C0%25CF.png&type=sc960_832" style="width:250px; height:200px;"></div>
      	<div><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxOTEwMDdfMTMx%2FMDAxNTcwNDMzNzA4NTYy.BaAjMJHYRctL9wCTY3skVbVeTb7Ennjwa1mLxhyA-bQg.JJINyNMootgDn6q8py1KRaX1c_5Dm00w-a4oGv9oaNQg.PNG.ezday1%2F%25BD%25E6%25B3%25D7%25C0%25CF.png&type=sc960_832" style="width:250px; height:200px;"></div> 
     	 </div> 
	</div>
	
	<div class="best_tit">
					<div style="margin-top:20px;"> <b>조리순서</b></div>
					<div class="best_tit_rmn" style="margin-left:89%; margin-top:-30px;">
						<a href="javascript:void(0);" onclick="js)">
						<img id="tabStepView1" src="${pageContext.request.contextPath}/resources/images/zoom-in.svg" alt="이미지크게보기">
						</a> 
						<a href="javascript:void(0);" onclick="js">
						<img id="tabStepView2" src="${pageContext.request.contextPath}/resources/images/type.svg" alt="텍스트만보기">
						</a> 
						<a href="javascript:void(0);" onclick="js">
						<img id="tabStepView3" src="${pageContext.request.contextPath}/resources/images/zoom-out.svg" alt="이미지작게보기"></a>
						<button onclick="location.href='/recipe/924490?seq=924490&amp;is_origin=y'" class="btn btn-sm btn-default" style="margin-left: 10px;">원본보기</button>
					</div>
				</div>
				<div id="stepDiv1" class="view_step_cont media step1">
					<div id="stepdescr1" class="media-body">
					<img src="${pageContext.request.contextPath}/resources/images/smile.svg" style="margin-bottom:-4px; margin-right:5px;">양배추와 쪽파는 잘게 다져서 준비합니다. 자숙문어는 먹기좋은 크기로 잘라 줍니다.</div>
					<div id="stepimg1" class="media-right">
						<img src="https://recipe1.ezmember.co.kr/cache/recipe/2015/09/07/0eb32eb0351984624dfa083f502cf5c01.jpg">
					</div>
				</div>
				<div id="stepDiv2" class="view_step_cont media step2">
					<div id="stepdescr2" class="media-body">
					<img src="${pageContext.request.contextPath}/resources/images/smile.svg" style="margin-bottom:-4px; margin-right:5px;">베이컨도 잘게 잘라 준비 합니다. 볼에 찬물과 계란을 넣고 섞어 니신 타코야키 분말을 넣고 잘 섞어 줍니다. (굉장히 묽은 반죽이니 놀라지 마세요.)</div>
					<div id="stepimg2" class="media-right">
						<img src="https://recipe1.ezmember.co.kr/cache/recipe/2015/09/07/758c34e77f9edf39763a371f8cd74d321.jpg">
					</div>
				</div>
				<div id="stepDiv3" class="view_step_cont media step3">
					<div id="stepdescr3" class="media-body">
					<img src="${pageContext.request.contextPath}/resources/images/smile.svg" style="margin-bottom:-4px; margin-right:5px;">재료 준비가 끝나면 타코야키틀을 달궈 틀에 기름을 골고루 충분히 발라 줍니다. 기름칠한 틀에 반죽을 조금 구에 반쯤 붓고 잘라둔 문어를 하나씩 넣어 줍니다.</div>
					<div id="stepimg3" class="media-right">
						<img src="https://recipe1.ezmember.co.kr/cache/recipe/2015/09/07/de80268cc190f86593390f39c02c757e1.jpg">
					</div>
				</div>
				<div id="stepDiv4" class="view_step_cont media step4">
					<div id="stepdescr4" class="media-body">
					<img src="${pageContext.request.contextPath}/resources/images/smile.svg" style="margin-bottom:-4px; margin-right:5px;">문어를 넣고 양배추와 베이컨, 실파를 골고루 뿌린 다음 팬에 빈틈이 없도록 반죽을 부워 줍니다.</div>
					<div id="stepimg4" class="media-right">
						<img src="https://recipe1.ezmember.co.kr/cache/recipe/2015/09/07/014c51a274600a39f2c2cd6c12cd01b21.jpg">
					</div>
				</div>
				<div id="stepDiv5" class="view_step_cont media step5">
					<div id="stepdescr5" class="media-body">
					<img src="${pageContext.request.contextPath}/resources/images/smile.svg" style="margin-bottom:-4px; margin-right:5px;">겉에 넘친 반죽이 익으면 꼬치로 반죽을 구쪽으로 몰아 뒤집은 다음 동그란 모양을 만들어 앞뒤로 노릇노릇하게 구워 줍니다. 완성된 타코야키에 타코야키소스를 바르고 파래김, 마요네즈, 가쯔오부시를 뿌려 장식해 주면 완성.</div>
					<div id="stepimg5" class="media-right">
						<img src="https://recipe1.ezmember.co.kr/cache/recipe/2015/09/07/f7e02e0ae5c52fb643f14913aaa6ace91.jpg">
					</div>
				</div>
				<div id="stepDiv6" class="view_step_cont media step6">
					<div id="stepdescr6" class="media-body">
					<img src="${pageContext.request.contextPath}/resources/images/smile.svg" style="margin-bottom:-4px; margin-right:5px;">
					날씨가 쌀쌀해지면 더 맛있는 따끈따끈
				    말랑말랑 타코야키 완성. 니신 타코야키 분말 굉장히 강추예요. 안에 튀김조각과 실파, 가쓰오분말 등이 들어가 감칠맛
				    나고 아주 맛나더라구요. 요즘엔 가정에서도 쉽게 타코야키를 만들어 먹을수 있도록 타코야키틀부터 시작해서 믹스와 각종
					재료를 쉽게 구할수 있으니 이젠 집에서도 맛있는 타코야키 만들어 드세요.</div>
				<div id="stepimg6" class="media-right">
					<img src="https://recipe1.ezmember.co.kr/cache/recipe/2015/09/07/1051520502428e619698750686be198c1.jpg">
				</div>
			</div>
				<div id="completeimgs" class="carousel slide" data-ride="carousel" style="width: 755px; margin: 0 70px 32px;">
					<ul class="carousel-indicators">
						<li data-target="#completeimgs" data-slide-to="0" class="active"></li>
						<li data-target="#completeimgs" data-slide-to="1" class=""></li>
					</ul>
	
</div>
</div>
</div>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %>	 --%>
</body>
</html>