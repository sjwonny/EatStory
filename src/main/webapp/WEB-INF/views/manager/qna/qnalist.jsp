<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/manager/layout/header.jsp" %>	
                <!-- Begin Page Content -->
                <div class="container-fluid">
					<!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">QnA 내역 현재까지 접수된 모든 QnA (1:1문의) 내역입니다.</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>문의날짜</th>
                                            <th>작성자</th>
                                            <th>카테고리</th>
                                            <th>제목</th>
                                            <th>문의상태</th>
                                            <th>답변시각</th>
                                            <th>관리자</th>
                                            <th>자세히 보기</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                       	<c:forEach var="qna" items="${list}">
	                                        <tr>
                                        		<td>${qna.write_date}</td>
                                        		<td>${qna.users_name}</td>
                                        		<td>${qna.category}</td>
                                        		<td>${qna.title}</td>
                                        		<c:if test="${qna.qna_status == 0}">
                                        			<td>접수</td>
                                        		</c:if>
                                        		<c:if test="${qna.qna_status == 1}">
                                        			<td>답변완료</td>
                                        		</c:if>
                                        		<td>${qna.answer_date}</td>
                                        		 <td>${qna.admin_name}</td> 
                                        		<td><a onclick="javascript:link(${qna.no})" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">자세히 보기</a></td>
	                                        </tr>
                                       	</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->
                <script type="text/javascript">
                	function link(no) {
                		location.href="/eatstory/manager/qna/detail/" + no;
                	}
                </script>

<%@ include file="/WEB-INF/views/manager/layout/footer.jsp" %>