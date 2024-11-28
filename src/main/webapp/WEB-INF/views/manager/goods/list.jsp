<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/manager/layout/header.jsp" %>	
                <!-- Begin Page Content -->
                <div class="container-fluid">
					<!-- Begin Page Content -->
                <div class="container-fluid">
                    <a href="${pageContext.request.contextPath}/manager/goodsInsertForm" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">상품 추가</a><br><br>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">현재 등록된 상품 리스트입니다.</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>브랜드명</th>
                                            <th>상품명</th>
                                            <th>전시 상태</th>
                                            <th>자세히 보기/수정/삭제</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                       	<c:forEach var="goods" items="${goodsList}">
	                                        <tr>
                                        		<td>${goods.brand_name}</td>
                                        		<td>${goods.name}</td>
                                        		<c:if test="${goods.status == 1}">
                                        			<td>판매중</td>
                                        		</c:if>
                                        		<c:if test="${goods.status == 0}">
                                        			<td>판매중단</td>
                                        		</c:if>
                                        		<td><a onclick="javascript:link(${goods.no})" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">자세히 보기</a></td>
	                                        </tr>
                                       	</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <script type="text/javascript">
                	function link(no) {
                		location.href="/eatstory/manager/goods/detail/" + no;
                	}
                </script>
<%@ include file="/WEB-INF/views/manager/layout/footer.jsp" %>