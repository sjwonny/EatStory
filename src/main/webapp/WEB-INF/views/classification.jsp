<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">

* {

    box-sizing: border-box;
}
.cateBtn a {
    color: #5da619;
    font-size: 14px;
}
.four {
    display: flex;
    flex-direction: column;
    list-style-type: none;
    padding: 0;
    padding-left: 5px;
  }
  
 .categoryAll.st3 {
    background: #fff;
    padding: 16px 15px 8px 12px;
    vertical-align: top;
    margin-top: 0;
    border-right: none;
    border-left: none;
    border-top: none;
}
.cate_list{
 display: block;
}

/* 항목들 간의 우측 간격 설정 */
.cate_list a {
  margin-right: 15px; 
  border-radius: 20%;
  color: black;
}
.cate_list a:hover {
  background-color:#D2D2D2; 
}

.cateBtn {
   
   border-bottom:2px solid #e6e7e8;
    text-align: center;
  
}

#toggleBtn{
	 background-color: white;
	 cursor: pointer;
	/*  align:center;
	 position: absolute; */
}

/*여기부터 카테고리 아래 본문*/

      
 .form {
    display: block;
    margin-top: 0em;
}

.ammount{
float: left!important;
}
.rcpAll .rcpBox {
    font-size: 16px;
    color: #333;
    padding: 5px 0 40px 8px;
}

.pull-right {
    float: right!important;
}

.nav-tabs2 {
    border: 1px solid #e0e0e0;
    padding-bottom: 1px;
    font-size: 15px;
}

.nav {
    padding-left: 0;
    margin-bottom: 0;
    list-style: none;
}

ul {
    display: block;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}
.nav.nav-tabs2 {
  display: flex;
  justify-content: flex-end;
  align-items: center;
  padding: 0;
}

.nav.nav-tabs2 li {
  display: inline-block;
  margin-left: 10px;
}
:after, :before {
    box-sizing: border-box;
}

.menuName.line2 {
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    word-wrap: break-word;
    white-space: normal;
    line-height: 1.5;
}
.menuName {
    margin: 0 0 6px 0;
    color: #000;
    text-align: left;
    font-size: 15px;
}
* {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}

.rcpViewList {
	list-style: none;
    padding: 0;
    margin: 0 12px 40px 0;
    display: inline-block;
    vertical-align: top;
    position: relative; 
}
.rcpView {
    margin: 0;
    vertical-align: top;
}
.rcpThumbnail {
    position: relative;
    border-radius: 4px;
    overflow: hidden;
}
div {
    display: block;
}
.rcpView.ea4 li {
    width: 282px;
}
body {
    font-size: 14px;
}

a {
    color: #333;
    text-decoration: none;
    background-color: transparent;
}

a:-webkit-any-link {
    cursor: pointer;
}

.menuCaption {
    padding: 10px 2px;
}
.menuName.line2 {
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    word-wrap: break-word;
    white-space: normal;
    line-height: 1.5;
}
.menuName {
    margin: 0 0 6px 0;
    color: #000;
    text-align: left;
    font-size: 15px;
}

element.style {
    display: inline-block;
    vertical-align: bottom;
}
.rcpWriter {
    color: #999;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
    font-size: 14px;
    vertical-align: 0;
    padding: 0 1px 7px 0;
    font-weight: 300;
}
.isNew {
    vertical-align: super;
    line-height: 1;
    margin: 0 0 9px 0;
}
ul {
	list-style: none;
} /* 리스트 앞에 . 같은거 제거*/
li {
    text-align: -webkit-match-parent;
}
.menuCaption {
    padding: 10px 2px;
}
.rcpView.ea4 li {
    width: 282px;
}
.rcpWriter img {
    width: 22px;
    height: 22px;
    border-radius: 50%;
    margin: 0 4px -2px 0;
    vertical-align: text-bottom;
}

.isNew_star img {
    width: 14px;
    margin-right: 1px;
    margin: 0;
}
.menuCaption_buyer {
    color: #999;
    font-size: 13px;
    margin-left: 2px;
    font-weight: 300;
}
.rcpThumbnail img {
    width: 100%;
}

img {
    vertical-align: middle;
    border: 0;
}
a:-webkit-any-link {
    color: -webkit-link;
    cursor: pointer;
}
.reviewCount {
    color: #999;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
    font-size: 12px;
    vertical-align: middle;
    padding-left: 1px;
    line-height: normal;
    font-weight: 300;
    }
.hidden{
	display : none;
}

</style>


<script type="text/javascript">
var i=0;
function categoryClose(){
	
	const category = document.getElementById("category_close");
	var cate = document.getElementById("ca_name");
	
	if(i == 0){
		category.className="hidden";
		cate.innerHTML = "";
		cate.innerHTML = "카테고리열기"
		i = 1;
	}else{
		category.className="";
		cate.innerHTML = "";
		cate.innerHTML = "카테고리닫기"
		i = 0;
	}
}
/* 
 function toggleCategory() {
	 var categoryBar = document.getElementById("categoryBar");
	 var categoryBar = document.getElementById("ca_name");
	  var toggleBtn = document.getElementById('toggleBtn');

	  if (categoryBar.style.display = 'none') {
		  toggleBtn.textContent = '카테고리 닫기';
	  } else {
		  categoryBar.style.display = 'block';
		  toggleBtn.textContent = '카테고리 열기';
	  }
	} */


</script>
<%@ include file="/WEB-INF/views/layout/header.jsp" %> 
	<!--<c:set var="cpath" value="${pageContext.request.contextPath }"/>	-->	
	<div align="center" >
		  <div id="categoryBar" >
    <table id="category_close" class=""width="100%" cellspacing="0" cellpadding="0">
        <tbody>
        <tr>
        
            <th style="padding-top: 10px;">
            <div class="four" style= "color: #2E9AFE;">
            <ul>
                <li>종류별</li>
                <li>상황별</li>
                <li>재료별</li>
                <li>방법별</li>
            </ul>
            </div>
            </th>
            <td>
            
            
               <div class="categoryAll st3">
                    <div class="cate_list">
                <a href="#" class="active">전체</a><a href="#">밑반찬</a><a href="#">메인반찬</a><a href="#">국/탕</a><a href="#">찌개</a><a href="#">디저트</a><a href="#">면/만두</a><a href="#">밥/죽/떡</a><a href="#">퓨전</a><a href="#">김치/젓갈/장류</a><a href="#">양념/소스/잼</a><a href="#">양식</a><a href="#">샐러드</a><a href="#">스프</a><a href="#">빵</a><a href="#">과자</a><a href="#">차/음료/술</a><a href="#">기타</a>            </div>
                        <div class="cate_list">
                <a href="#" class="active">전체</a><a href="#">일상</a><a href="#">초스피드</a><a href="#">손님접대</a><a href="#">술안주</a><a href="#">다이어트</a><a href="#">도시락</a><a href="#">영양식</a><a href="#">간식</a><a href="#">야식</a><a href="#">푸드스타일링</a><a href="#">해장</a><a href="#">명절</a><a href="#">이유식</a><a href="#">기타</a>            </div>
                        <div class="cate_list">
                <a href="#" class="active">전체</a><a href="#">소고기</a><a href="#">돼지고기</a><a href="#">닭고기</a><a href="#">육류</a><a href="#">채소류</a><a href="#">해물류</a><a href="#">달걀/유제품</a><a href="#">가공식품류</a><a href="#">쌀</a><a href="#">밀가루</a><a href="#">건어물류</a><a href="#">버섯류</a><a href="#">과일류</a><a href="#">콩/견과류</a><a href="#">곡류</a><a href="#">기타</a>            </div>
                        <div class="cate_list">
                <a href="#" class="active">전체</a><a href="#">볶음</a><a href="#">끓이기</a><a href="#">부침</a><a href="#">조림</a><a href="#">무침</a><a href="#">비빔</a><a href="#">찜</a><a href="#">절임</a><a href="#">튀김</a><a href="#">삶기</a><a href="#">굽기</a><a href="#">데치기</a><a href="#">회</a><a href="#">기타</a>            </div>
               </div> 
               
                 
                <!--  <div class="categoryAll st3">
                    <div class="cate_list">
                <a href="javascript:goSearchRecipe('cat4','')" class="active">전체</a><a href="javascript:goSearchRecipe('cat4','63')">밑반찬</a><a href="javascript:goSearchRecipe('cat4','56')">메인반찬</a><a href="javascript:goSearchRecipe('cat4','54')">국/탕</a><a href="javascript:goSearchRecipe('cat4','55')">찌개</a><a href="javascript:goSearchRecipe('cat4','60')">디저트</a><a href="javascript:goSearchRecipe('cat4','53')">면/만두</a><a href="javascript:goSearchRecipe('cat4','52')">밥/죽/떡</a><a href="javascript:goSearchRecipe('cat4','61')">퓨전</a><a href="javascript:goSearchRecipe('cat4','57')">김치/젓갈/장류</a><a href="javascript:goSearchRecipe('cat4','58')">양념/소스/잼</a><a href="javascript:goSearchRecipe('cat4','65')">양식</a><a href="javascript:goSearchRecipe('cat4','64')">샐러드</a><a href="javascript:goSearchRecipe('cat4','68')">스프</a><a href="javascript:goSearchRecipe('cat4','66')">빵</a><a href="javascript:goSearchRecipe('cat4','69')">과자</a><a href="javascript:goSearchRecipe('cat4','59')">차/음료/술</a><a href="javascript:goSearchRecipe('cat4','62')">기타</a>            </div>
                        <div class="cate_list">
                <a href="javascript:goSearchRecipe('cat2','')" class="active">전체</a><a href="javascript:goSearchRecipe('cat2','12')">일상</a><a href="javascript:goSearchRecipe('cat2','18')">초스피드</a><a href="javascript:goSearchRecipe('cat2','13')">손님접대</a><a href="javascript:goSearchRecipe('cat2','19')">술안주</a><a href="javascript:goSearchRecipe('cat2','21')">다이어트</a><a href="javascript:goSearchRecipe('cat2','15')">도시락</a><a href="javascript:goSearchRecipe('cat2','43')">영양식</a><a href="javascript:goSearchRecipe('cat2','17')">간식</a><a href="javascript:goSearchRecipe('cat2','45')">야식</a><a href="javascript:goSearchRecipe('cat2','20')">푸드스타일링</a><a href="javascript:goSearchRecipe('cat2','46')">해장</a><a href="javascript:goSearchRecipe('cat2','44')">명절</a><a href="javascript:goSearchRecipe('cat2','14')">이유식</a><a href="javascript:goSearchRecipe('cat2','22')">기타</a>            </div>
                        <div class="cate_list">
                <a href="javascript:goSearchRecipe('cat3','')" class="active">전체</a><a href="javascript:goSearchRecipe('cat3','70')">소고기</a><a href="javascript:goSearchRecipe('cat3','71')">돼지고기</a><a href="javascript:goSearchRecipe('cat3','72')">닭고기</a><a href="javascript:goSearchRecipe('cat3','23')">육류</a><a href="javascript:goSearchRecipe('cat3','28')">채소류</a><a href="javascript:goSearchRecipe('cat3','24')">해물류</a><a href="javascript:goSearchRecipe('cat3','50')">달걀/유제품</a><a href="javascript:goSearchRecipe('cat3','33')">가공식품류</a><a href="javascript:goSearchRecipe('cat3','47')">쌀</a><a href="javascript:goSearchRecipe('cat3','32')">밀가루</a><a href="javascript:goSearchRecipe('cat3','25')">건어물류</a><a href="javascript:goSearchRecipe('cat3','31')">버섯류</a><a href="javascript:goSearchRecipe('cat3','48')">과일류</a><a href="javascript:goSearchRecipe('cat3','27')">콩/견과류</a><a href="javascript:goSearchRecipe('cat3','26')">곡류</a><a href="javascript:goSearchRecipe('cat3','34')">기타</a>            </div>
                        <div class="cate_list">
                <a href="javascript:goSearchRecipe('cat1','')" class="active">전체</a><a href="javascript:goSearchRecipe('cat1','6')">볶음</a><a href="javascript:goSearchRecipe('cat1','1')">끓이기</a><a href="javascript:goSearchRecipe('cat1','7')">부침</a><a href="javascript:goSearchRecipe('cat1','36')">조림</a><a href="javascript:goSearchRecipe('cat1','41')">무침</a><a href="javascript:goSearchRecipe('cat1','42')">비빔</a><a href="javascript:goSearchRecipe('cat1','8')">찜</a><a href="javascript:goSearchRecipe('cat1','10')">절임</a><a href="javascript:goSearchRecipe('cat1','9')">튀김</a><a href="javascript:goSearchRecipe('cat1','38')">삶기</a><a href="javascript:goSearchRecipe('cat1','67')">굽기</a><a href="javascript:goSearchRecipe('cat1','39')">데치기</a><a href="javascript:goSearchRecipe('cat1','37')">회</a><a href="javascript:goSearchRecipe('cat1','11')">기타</a>            </div>
                 </div>
                <i class="fas fa-check-circle"></i> -->
                 
                 
                 
                 
                 
            </td>
        </tr>
        <tr>
            <th>
                <div class="four"  style= "color: #2E9AFE;">
                <li>테마별</li>
                </div>
            </th>
            <td>
                <div id="searchCategory" style="padding:6px 15px 0px 12px" class="categoryAll st3">
                    <div class="cate_list">
                        <a href="#">여성/뷰티</a>
                        <a href="#">엄마/아기</a>
                        <a href="#">건강/질병</a>
                        <a href="#">제철요리</a>
                        <a href="#">추천</a>
                    </div>
                </div>
            </td>
        </tr>
        </tbody>
    </table>
</div>   
<div class="cateBtn">
 <span id="toggleBtn"><button onclick="categoryClose()"><span id="ca_name">카테고리닫기</span></button>
 <img id="searchCategory_img" src="https://recipe1.ezmember.co.kr/img/icon_arrow9_up.gif"></span>
</div>






<ul class="rcpAll">
        <div class="rcpBox">
           <div class="ammount"> 총 <b>14</b>개의 레시피로 요리 도전! </div>
            <ul class="nav nav-tabs2 pull-right" style="position:relative;">
              <li role="presentation"><a href="js" onclick="goSearchRecipe('order','accuracy')">정확순</a></li>
              <li role="presentation"><a href="js;" onclick="goSearchRecipe('order','date')">최신순</a></li>
              <li role="presentation" class="active"><a href="javascript:void(0);" onclick="goSearchRecipe('order','reco')">추천순</a></li>
            </ul>
       </div>

        <ul class="rcpView ea4" style="padding:10 10 0 8px;">
            <li class="rcpViewList">
                <div class="rcpThumbnail">
                    <a href="/recipe/7003248" class="common_sp_link">
                                                <img src="https://recipe1.ezmember.co.kr/cache/recipe/2023/06/01/ab57242f104f802b66bd72bb9794224c1_m.jpg">
                    </a>
                </div>
                <div class="menuCaption">
                    <div class="menuName line2">청포묵김무침 다이어트식 반찬</div>
                    <div class="rcpWriter" style="display: inline-block; vertical-align: bottom;">
                        <a href="/profile/recipe.html?uid=irene777"><img src="https://recipe1.ezmember.co.kr/cache/rpf/2023/02/20/2c7ed41b4e78811b2c325e3c128a9e381.jpg">용주부</a>
                    </div>
                    <div class="isNew">
                            <span class="reviewCount">(1)</span>
                                                <span class="menuCaption_buyer" style="vertical-align: middle;">조회수 193</span>
                    </div>
                </div>
            </li>
            <li class="rcpViewList">
                <div class="rcpThumbnail">
                    <a href="/recipe/7003325" class="common_sp_link">
                                                <img src="https://recipe1.ezmember.co.kr/cache/recipe/2023/06/02/8f3269bed660ed37557523d7ef82cab51_m.jpg">
                    </a>
                </div>
                <div class="menuCaption">
                    <div class="menuName line2">휴게소 버터감자 집에서 만들기</div>
                    <div class="rcpWriter" style="display: inline-block; vertical-align: bottom;">
                        <a href="/profile/recipe.html?uid=ksiumn22"><img src="https://recipe1.ezmember.co.kr/cache/rpf/2023/05/18/2938feb43ba7643e4968a77d2a30a1561.bbd2eea79a055db72b114e3f9121bebb">세딸마mi</a>
                    </div>
                    <div class="isNew">
                            <span class="reviewCount">(1)</span>
                                                <span class="menuCaption_buyer" style="vertical-align: middle;">조회수 168</span>
                    </div>
                </div>
            </li>
            <li class="rcpViewList">
                <div class="rcpThumbnail">
                    <a href="/recipe/7003603" class="common_sp_link">
                                                <img src="https://recipe1.ezmember.co.kr/cache/recipe/2023/06/07/11f51efe1f7fd6a3d9c47fff4dc76f2a1_m.jpg">
                    </a>
                </div>
                <div class="menuCaption">
                    <div class="menuName line2">오이맛살냉채</div>
                    <div class="rcpWriter" style="display: inline-block; vertical-align: bottom;">
                        <a href="/profile/recipe.html?uid=dal031"><img src="https://recipe1.ezmember.co.kr/cache/rpf/2023/03/04/4db307c661cc92cf77a30bf530d2a0a81.f4d975082303ba44f752108dd76d5a6c">잔근육</a>
                    </div>
                    <div class="isNew">
                                                <span class="menuCaption_buyer" style="vertical-align: middle;">조회수 10</span>
                    </div>
                </div>
            </li>
            <li class="rcpViewList">
                <div class="rcpThumbnail">
                    <a href="/recipe/7003602" class="common_sp_link">
                                                <img src="https://recipe1.ezmember.co.kr/cache/recipe/2023/06/07/bddec27f5a284aae7bee0b3ac5d698c41_m.jpg">
                    </a>
                </div>
                <div class="menuCaption">
                    <div class="menuName line2">우뭇가사리 무침 맛있게 만드는법. 다이어트 음식!!</div>
                    <div class="rcpWriter" style="display: inline-block; vertical-align: bottom;">
                        <a href="/profile/recipe.html?uid=irene777"><img src="https://recipe1.ezmember.co.kr/cache/rpf/2023/02/20/2c7ed41b4e78811b2c325e3c128a9e381.jpg">용주부</a>
                    </div>
                    <div class="isNew">
                                                <span class="menuCaption_buyer" style="vertical-align: middle;">조회수 9</span>
                    </div>
                </div>
            </li>
            <li class="rcpViewList">
                <div class="rcpThumbnail">
                    <a href="/recipe/6996297" class="common_sp_link">
                                                <img src="https://recipe1.ezmember.co.kr/cache/recipe/2023/02/02/41942668ad91ccfb305c4cab9dee030f1_m.jpg">
                    </a>
                </div>
                <div class="menuCaption">
                    <div class="menuName line2">고구마떡 고구마씨를 말릴 수 있는 위험한 레시피</div>
                    <div class="rcpWriter" style="display: inline-block; vertical-align: bottom;">
                        <a href="/profile/recipe.html?uid=80802273"><img src="https://recipe1.ezmember.co.kr/cache/rpf/2022/11/05/4cce125098a9333dc3d355a0b297e5e41.jpg">즐거운날랄라</a>
                    </div>
                    <div class="isNew">
                            <span class="reviewCount">(6)</span>
                                                <span class="menuCaption_buyer" style="vertical-align: middle;">조회수 4,311</span>
                    </div>
                </div>
            </li>
            <li class="rcpViewList">
                <div class="rcpThumbnail">
                    <a href="/recipe/6912734" class="common_sp_link">
                                                <img src="https://recipe1.ezmember.co.kr/cache/recipe/2019/05/25/39ac1e73e998e88da300d38663242f0a1_m.jpg">
                    </a>
                </div>
                <div class="menuCaption">
                    <div class="menuName line2">버섯으로 관자 느낌 내는 방법! 새송이버섯간장버터구이 만들기</div>
                    <div class="rcpWriter" style="display: inline-block; vertical-align: bottom;">
                        <a href="/profile/recipe.html?uid=48794657"><img src="https://recipe1.ezmember.co.kr/cache/rpf/2019/12/30/0c96d23a0f039a99325d354605d60f691.jpg">루던</a>
                    </div>
                    <div class="isNew">
                            <span class="reviewCount">(269)</span>
                                                <span class="menuCaption_buyer" style="vertical-align: middle;">조회수 32만</span>
                    </div>
                </div>
            </li>
            <li class="rcpViewList">
                <div class="rcpThumbnail">
                    <a href="/recipe/4030952" class="common_sp_link">
                                                <img src="https://recipe1.ezmember.co.kr/cache/recipe/2015/04/22/a673e92121f268ea47ea5212bcbde4891_m.jpg">
                    </a>
                </div>
                <div class="menuCaption">
                    <div class="menuName line2">아삭아삭한 고추된장박이 </div>
                    <div class="rcpWriter" style="display: inline-block; vertical-align: bottom;">
                        <a href="/profile/recipe.html?uid=dollshouse"><img src="https://recipe1.ezmember.co.kr/img/df/pf_100_100.png">돌하우스</a>
                    </div>
                    <div class="isNew">
                            <span class="reviewCount">(120)</span>
                                                <span class="menuCaption_buyer" style="vertical-align: middle;">조회수 32만</span>
                    </div>
                </div>
            </li>
            <li class="rcpViewList">
                <div class="rcpThumbnail">
                    <a href="/recipe/7003601" class="common_sp_link">
                                                <img src="https://recipe1.ezmember.co.kr/cache/recipe/2023/06/07/3124bec69e48a7f0ad8d4de6433ab4cd1_m.jpg">
                    </a>
                </div>
                <div class="menuCaption">
                    <div class="menuName line2">김치찌개 황금레시피 밥도둑 돼지고기 김치찌개 </div>
                    <div class="rcpWriter" style="display: inline-block; vertical-align: bottom;">
                        <a href="/profile/recipe.html?uid=ilovedldl"><img src="https://recipe1.ezmember.co.kr/cache/rpf/2023/02/27/3173e12e48c83f522393789e4adfe4071.jpg">맛있는시간</a>
                    </div>
                    <div class="isNew">
                                                <span class="menuCaption_buyer" style="vertical-align: middle;">조회수 9</span>
                    </div>
                </div>
            </li>
            <li class="rcpViewList">
                <div class="rcpThumbnail">
                    <a href="/recipe/6843136" class="common_sp_link">
                                                <img src="https://recipe1.ezmember.co.kr/cache/recipe/2016/02/16/d74c6731fce3dc72c5579b24083185f11_m.jpg">
                    </a>
                </div>
                <div class="menuCaption">
                    <div class="menuName line2">달콤 짭조름♡ 떡 베이컨 간장조림♡</div>
                    <div class="rcpWriter" style="display: inline-block; vertical-align: bottom;">
                        <a href="/profile/recipe.html?uid=sksmssk3333"><img src="https://recipe1.ezmember.co.kr/cache/rpf/2016/02/05/5bf1e27ed64d699ea1ac59336b42de2a1.a320cc1d07e2f9bad5aec71e5cc0e961">요블리</a>
                    </div>
                    <div class="isNew">
                            <span class="reviewCount">(106)</span>
                                                <span class="menuCaption_buyer" style="vertical-align: middle;">조회수 19.4만</span>
                    </div>
                </div>
            </li>
            <li class="rcpViewList">
                <div class="rcpThumbnail">
                    <a href="/recipe/7003600" class="common_sp_link">
                                                <img src="https://recipe1.ezmember.co.kr/cache/recipe/2023/06/07/d4c1a5d84259539740421577434f9b021_m.jpg">
                    </a>
                </div>
                <div class="menuCaption">
                    <div class="menuName line2">갈치구이 맛있게 굽는법, 손질법, 왕소금 필수!</div>
                    <div class="rcpWriter" style="display: inline-block; vertical-align: bottom;">
                        <a href="/profile/recipe.html?uid=irene777"><img src="https://recipe1.ezmember.co.kr/cache/rpf/2023/02/20/2c7ed41b4e78811b2c325e3c128a9e381.jpg">용주부</a>
                    </div>
                    <div class="isNew">
                                                <span class="menuCaption_buyer" style="vertical-align: middle;">조회수 12</span>
                    </div>
                </div>
            </li>
            <li class="rcpViewList">
                <div class="rcpThumbnail">
                    <a href="/recipe/6885909" class="common_sp_link">
                                                <img src="https://recipe1.ezmember.co.kr/cache/recipe/2018/03/22/779982ef4e8f9c32c472297e632789a91_m.jpg">
                    </a>
                </div>
                <div class="menuCaption">
                    <div class="menuName line2">【간단반찬】꽈리고추 햄볶음 만들기~</div>
                    <div class="rcpWriter" style="display: inline-block; vertical-align: bottom;">
                        <a href="/profile/recipe.html?uid=20618485"><img src="https://recipe1.ezmember.co.kr/cache/rpf/2020/06/05/67ebc9100bec839cbff7fa660ad139f31.1d3c00132bbe67d06b7c7817824d48ef">조밍키♥</a>
                    </div>
                    <div class="isNew">
                            <span class="reviewCount">(111)</span>
                                                <span class="menuCaption_buyer" style="vertical-align: middle;">조회수 16.2만</span>
                    </div>
                </div>
            </li>
            <li class="rcpViewList">
                <div class="rcpThumbnail">
                    <a href="/recipe/6877253" class="common_sp_link">
                                                <img src="https://recipe1.ezmember.co.kr/cache/recipe/2017/09/28/d445feff73d436cbea92af449c3f66ac1_m.jpg">
                    </a>
                </div>
                <div class="menuCaption">
                    <div class="menuName line2">비엔나 만두 강정</div>
                    <div class="rcpWriter" style="display: inline-block; vertical-align: bottom;">
                        <a href="/profile/recipe.html?uid=41823403"><img src="https://recipe1.ezmember.co.kr/cache/rpf/2017/08/22/bf5ec5177b6d34785ea59f9b48e986361.jpg">찌니훗</a>
                    </div>
                    <div class="isNew">
                            <span class="reviewCount">(114)</span>
                                                <span class="menuCaption_buyer" style="vertical-align: middle;">조회수 24.6만</span>
                    </div>
                </div>
            </li>
            <li class="rcpViewList">
                <div class="rcpThumbnail">
                    <a href="/recipe/6915088" class="common_sp_link">
                                                <img src="https://recipe1.ezmember.co.kr/cache/recipe/2019/07/01/097a119634a9657ee34d81b011a97b131_m.jpg">
                    </a>
                </div>
               <div class="menuCaption">
                    <div class="menuName line2">밥도둑 반찬 고추장 달걀조림 만들기!TV 알토란 레시피</div>
                    <div class="rcpWriter" style="display: inline-block; vertical-align: bottom;">
                        <a href="/profile/recipe.html?uid=ksy9623"><img src="https://recipe1.ezmember.co.kr/cache/rpf/2018/08/09/05a3826f9317b517e0fa6fd3caac70b71.png">뽀유TV</a>
                    </div>
                    <div class="isNew">
                            <span class="reviewCount">(119)</span>
                                                <span class="menuCaption_buyer" style="vertical-align: middle;">조회수 26.1만</span>
                    </div>
                </div>
            </li>
            <li class="rcpViewList">
                <div class="rcpThumbnail">
                    <a href="/recipe/6897374" class="common_sp_link">
                                                <img src="https://recipe1.ezmember.co.kr/cache/recipe/2018/10/07/da4e0452ac3bd20bb0528f4abc1211881_m.jpg">
                    </a>
                </div>
                <div class="menuCaption">
                    <div class="menuName line2">꿀마늘 닭강정(아이들 단골메뉴 찜♡♡)</div>
                    <div class="rcpWriter" style="display: inline-block; vertical-align: bottom;">
                        <a href="/profile/recipe.html?uid=77772297"><img src="https://recipe1.ezmember.co.kr/cache/rpf/2021/05/16/97de54f3ebe8164ece8668909ce4dc0a1.c337de66b86390f12d0f7b5f0163a507">비바스밥</a>
                    </div>
                    <div class="isNew">
                            <span class="reviewCount">(89)</span>
                                                <span class="menuCaption_buyer" style="vertical-align: middle;">조회수 18.4만</span>
                    </div>
                </div>
            </li>
            
    </ul>




