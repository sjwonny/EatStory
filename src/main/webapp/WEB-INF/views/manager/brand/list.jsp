<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/manager/layout/header.jsp" %>	
                <!-- Begin Page Content -->
                <div class="container-fluid">
					<!-- Begin Page Content -->
                <div class="container-fluid">
                    <a href="${pageContext.request.contextPath}/manager/brandInsertForm" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">브랜드 추가</a><br><br>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">현재 입점된 브랜드 리스트입니다.</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>이름</th>
                                            <th>대표</th>
                                            <th>이메일</th>
                                            <th>통신 판매업 신고번호</th>
                                            <th>사업장 소재지</th>
                                            <th>연락처</th>
                                            <th>사업장번호</th>
                                            <th>입점 일자</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                       	<c:forEach var="brand" items="${list}">
	                                        <tr>
                                        		<td>${brand.name}</td>
                                        		<td>${brand.ceo}</td>
                                        		<td>${brand.email}</td>
                                        		<td>${brand.report_num}</td>
                                        		<td>${brand.locat}</td>
                                        		<td>${brand.phone}</td>
                                        		<td>${brand.business_num}</td>
                                        		<td>${brand.input_date}</td>
	                                        </tr>
                                       	</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
<%@ include file="/WEB-INF/views/manager/layout/footer.jsp" %>