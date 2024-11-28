<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<style>
    .common2_sp_link {
    position: absolute;
    left: 0;
    top: 0;
    bottom: 0;
    right: 0;
    z-index: 1;
}
.store_brand_tit img {
    width: 80px;
    height: 80px;
    margin-right: 12px;
}
.store_brand_tit b {
    font-size: 36px;
    font-weight: 600;
    vertical-align: middle;
}
#contents .sub_content {
    width: 100%;
    margin: 0;
    padding: 0;
}
.s_list_wrap_vt .common2_sp_list_ul {
    display: flex;
    flex-wrap: wrap;
    width: 100%;
    padding: 0;
}
body {
    font-size: 14px;
    line-height: 1.42857143;
    color: #333;
} 
ul,li{list-style: none;} /* 리스트 앞에 . 같은거 제거*/
a{text-decoration: none;} /* 링크에 밑줄 같은거 제거*/
</style>


<body>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<Br><Br>
      <div class="s_contents">
  <div class="store_brand_tit"  style="font-size:30px; display:flex; align-items: center;">
 <img src="${pageContext.request.contextPath}/resources/brand/${no}.jpeg" class="brand_logo" style=" margin-left: 43%;"> 
 <b class="brand_name" style="margin-top:10px;">${brandVo.name}</b>
</div>
 



<ul class="common2_sp_list_ul ea3" style=" display: flex; flex-wrap: wrap; margin-left: 10%; margin-top: 6%;">
<c:forEach var="vo" items="${gList }"> 
 <a href="${pageContext.request.contextPath }/goods/${vo.no}">
           <li class="common2_sp_list_li"   style="flex: 0 0 calc(33.33% - 30px); margin-right: 20px; margin-bottom: 30px; text-align: center;">
           	<div class="common2_sp_thumb">
            		<img src="${vo.img}" style="width:400px; heigt:100px;">
                <div class="common2_sp_caption">
                <div class="common2_sp_caption_tit line2">${vo.name}</div>
                <span class="common2_sp_caption_per" style="color:red;"><b>${vo.dc_amount}</b>%</span>
                      <div class="common2_sp_caption_price_box">
	                      <strong class="common2_sp_caption_price">
	                      <c:choose> 
	                      <c:when test="${vo.dc_price==0}">
	                      <span>${vo.price}</span> 
	                      </c:when> 
	                      <c:otherwise>
		                      <span>${vo.dc_price}</span>
		                      </c:otherwise>
       					</c:choose> 
		                      <small>원</small></div>
	                      </strong>
	                    
						<div class="common2_sp_caption_rv2">
						 <c:choose> 
						<c:when test="${vo.rating== 10}"> 
                            <span class="caption_rv2_img"></span><b class="caption_rv2_pt" style="color:purple;">★★★★★</b>
               		     </c:when>  
                         <c:when test="${vo.rating== 9}">
     						<span class="caption_rv2_img"></span><b class="caption_rv2_pt" style="color:purple;">★★★★</b>
     				    </c:when>
                         <c:when test="${vo.rating== 8}">
     						<span class="caption_rv2_img"></span><b class="caption_rv2_pt" style="color:purple;">★★★</b>
     				    </c:when>
                         <c:when test="${vo.rating== 7}">
     						<span class="caption_rv2_img"></span><b class="caption_rv2_pt" style="color:purple;">★★</b>
     				    </c:when>
                         <c:when test="${vo.rating== 6}">
     						<span class="caption_rv2_img"></span><b class="caption_rv2_pt" style="color:purple;">★</b>
     				    </c:when>
     				    <c:otherwise>
       						<span class="caption_rv2_img"></span><b class="caption_rv2_pt" style="color:purple;"></b>
       					</c:otherwise>
       					</c:choose> 
                        </div>   
                      
                      <%--  <c:choose>
							  <c:when test="${총 주문금액}>= ${vo.free_codition}">                    
	                      <div class="common2_sp_caption_icon"><span class="icon_free">무료배송</span> </div>
	                        </c:when>
                    		   </c:choose>  --%><!-- 총 주문금액 가져와야 할 듯 -->
	                       <div class="common2_sp_caption_icon">
	                      <c:choose> 
							   <c:when test="${vo.hot_deal== 1 }"> 
                    		  <span class="icon_hot">핫딜</span>
                    		    </c:when>
                    		   </c:choose> 
                      </div>
                   
                    </div> 
                    
                </div>
            
            </li>
               </a>
</c:forEach>
 </ul>  

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
        
</body>
</html>