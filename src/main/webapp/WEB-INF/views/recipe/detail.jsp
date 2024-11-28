<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link
	href="${pageContext.request.contextPath}/resources/manager/css/style.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/manager/css/style1.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/manager/css/all.min.css"
	rel="stylesheet" type="text/css">
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<div
	style="padding-left: 180px; padding-right: 180px; padding-top: 60px; padding-bottom: 60px">
	<div class="card shadow mb-4">
		<div class="card-body">
			<div class="row">
				<div class="col-lg-12" align="right">
					<c:if test="${login == vo.user_no }"><!-- 작성자일 경우 -->
						<button onclick="document.location.href='${pageContext.request.contextPath}/recipe/updateform/${vo.no}'" class="btn btn-primary">수정</button>
						<button onclick="checkDelete()" class="btn btn-primary">삭제</button>
					</c:if>
				</div>
				<div class="col-lg-12" align="right">
					<label class="col-form-label mt-4" style="margin-top: 0px">조회수 ${vo.hit}</label>
				</div>
				<div class="col-lg-2"></div>
				<div class="col-lg-8" align="center">
					<h2>${vo.title}</h2>
				</div>
				<div class="col-lg-2"></div>
				<div class="col-lg-12" align="center">
					<h6>${vo.describe}</h6>
				</div>
				<div class="col-lg-12">
					<label class="col-form-label mt-4">&nbsp;</label>
				</div>
				<div class="col-lg-12" align="center">
					<c:forEach var="file" items="${imgList}"> 
					<img src="${pageContext.request.contextPath}/resources/recipe/${vo.no}/${file.img}" style="width: 500px; object-fit: cover; border-radius: 2%;"> </c:forEach> 

				</div>
				<div class="col-lg-12">
					<label class="col-form-label mt-4">&nbsp;</label>
				</div>
				<div class="col-lg-12" align="center">
					<img class="user-image" src="${pageContext.request.contextPath}/resources/images/users.png" style="width: 100px; height: 100px; object-fit: cover; border-radius: 50%;">
					<h4>${vo.users_name}</h4>
					<button onclick="" class="btn btn-primary">소식받기</button>
				</div>
				<div class="col-lg-12">
					<label class="col-form-label mt-4">&nbsp;</label>
				</div>
				<div class="card shadow mb-4"></div>
				<div class="col-lg-12">
					<label class="col-form-label mt-4">&nbsp;</label>
				</div>
				<div class="col-lg-4" align="center">
					<img src="${pageContext.request.contextPath}/resources/images/user.svg" height="44">
				</div>
				<div class="col-lg-4" align="center">
					<img src="${pageContext.request.contextPath}/resources/images/clock.svg" height="44">
				</div>
				<div class="col-lg-4" align="center">
					<img src="${pageContext.request.contextPath}/resources/images/star.svg" height="44">
				</div>
				<div class="col-lg-4" align="center">
					<c:if test="${vo.people_count != 6}">
						<h5>${vo.people_count}인분</h5>
					</c:if>
					<c:if test="${vo.people_count == 6}">
						<h5>${vo.people_count}인분 이상</h5>
					</c:if>
				</div>
				<div class="col-lg-4" align="center">
					<c:choose>
						<c:when test="${vo.hour < 120}">
							<h5>${vo.hour}분이내</h5>
						</c:when>
						<c:when test="${vo.hour == 120}">
							<h5>2시간 이내</h5>
						</c:when>
						<c:otherwise>
							<h5>2시간 이상</h5>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-lg-4" align="center">
					<c:choose>
						<c:when test="${vo.difficulty == 1}">
							<h5>아무나</h5>
						</c:when>
						<c:when test="${vo.difficulty == 2}">
							<h5>초급</h5>
						</c:when>
						<c:when test="${vo.difficulty == 3}">
							<h5>중급</h5>
						</c:when>
						<c:when test="${vo.difficulty == 4}">
							<h5>고급</h5>
						</c:when>
						<c:when test="${vo.difficulty == 5}">
							<h5>신의경지</h5>
						</c:when>
					</c:choose>
				</div>
				<div class="col-lg-12">
					<label class="col-form-label mt-4">&nbsp;</label>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>

	<div class="card shadow mb-4">
		<div class="card-body">
			<div class="col-lg-12">
				<h3>재료1</h3>
			</div>
				 <div class="row">
				 	<c:forEach var="data" items="${iList}"> 
						<div class="col-lg-2">${data.content}</div>
						<div class="col-lg-2">${data.amount}</div>
					</c:forEach>
					<div class="col-lg-12">
						<label class="col-form-label mt-4">&nbsp;</label>
					</div>
				</div> 
		</div>
	</div>



	<br>
	<br>
	<div class="card shadow mb-4">
		<div class="card-body">
			<div class="col-lg-12">
				<h3>동영상</h3>
			</div>
			<div class="col-lg-12" align="center">
				<iframe width="560" height="315"
					src="https://www.youtube.com/embed/${vo.video}"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
					allowfullscreen></iframe>
				<br>
			</div>
		</div>
	</div>
	<br>
	<br>
	<div class="card shadow mb-4">
		<div class="card-body">
			<c:forEach var="step" items="${sList}" varStatus="i">
				<div class="col-lg-12">
					<h3>STEP ${i.count}</h3>
				</div>
				<div class="col-lg-12">
					<h5>&nbsp;&nbsp;&nbsp;&nbsp;${step.detail}</h5>
				</div>
				<div class="col-lg-12">
					<img src="${pageContext.request.contextPath}/resources/recipe/${vo.no}/${step.img}" style="height: 400px; width: 720px; object-fit: cover; border-radius: 2%;">
				</div>
				<c:if test="${step.ingre != null}">
					<div class="col-lg-12">
						<small><img src="${pageContext.request.contextPath}/resources/images/ingre.png" style="width: 20px; height: 20px; margin-bottom: 18px; margin-top: 12px">&nbsp;${step.ingre}<br></small>
					</div>
				</c:if>
				<c:if test="${step.tool != null}">
					<div class="col-lg-12">
						<small><img src="${pageContext.request.contextPath}/resources/images/tools.png" style="width: 20px; height: 20px; margin-bottom: 18px; margin-top: 12px">&nbsp;${step.tool}<br></small>
					</div>
				</c:if>
				<c:if test="${step.fire!= null}">
					<div class="col-lg-12">
						<small><img src="${pageContext.request.contextPath}/resources/images/fire.png" style="width: 20px; height: 20px; margin-bottom: 18px; margin-top: 12px">&nbsp;${step.fire}<br></small>
					</div>
				</c:if>
				<c:if test="${step.tip != null}">
					<div class="col-lg-12">
						<small><img src="${pageContext.request.contextPath}/resources/images/tip.png" style="width: 30px; height: 30px; margin-bottom: 18px; margin-top: 12px">&nbsp;${step.tip}<br></small>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>
	<br>
	<br>
	<div class="card shadow mb-4">
		<div class="card-body">
			<div class="col-lg-12">
				<h3>요리 완성</h3>
			</div>
			<c:forEach var="img" items="${imgList}" varStatus="i">
				<div class="col-lg-12">
					<img src="${pageContext.request.contextPath}/resources/recipe/${vo.no}/${img.img}" style="height: 400px; width: 720px; object-fit: cover; border-radius: 2%;"><br>
					<br>
				</div>
			</c:forEach>
		</div>
	</div>

	<c:if test="${vo.tips != null}">
		<div class="card shadow mb-4">
			<div class="card-body">
				<div class="col-lg-12">
					<h3>요리팁</h3>
				</div>
				<div class="col-lg-12">
					<h5>
						<img src="${pageContext.request.contextPath}/resources/images/tip.png" style="width: 30px; height: 30px; margin-bottom: 18px; margin-top: 12px">&nbsp;&nbsp;&nbsp;&nbsp;${vo.tips}
					</h5>
				</div>
			</div>
		</div>
	</c:if>
</div>
<!-- 별점 영역 -->
<c:if test="${vo.user_no != login}">
	<div style="padding-left: 500px; padding-right: 500px;">
		<div class="card shadow mb-4">
			<div class="card-body">
				<div align="center">
					<form method="post" name="rating">
						<div class="row">
							<div class="col-lg-12">
								<span id="score">${vo.score/2}</span><br>
								<br>
								<fieldset class="rate">
									 <input type="radio" id="rating10" name="score" value="10"> <!--별 5개 : 10점 -->
									<label for="rating10" title="5점"></label> <!-- 라벨이 별 역할(라벨 선택-> 별 선택), for은 radio버튼의 id와 연결 -->
									 <input type="radio" id="rating9" name="score" value="9"><!-- name:score-> 모든 버튼이 하나의 그룹이 되어 score이라는 값이 됨. -->
									<label class="half" for="rating9" title="4.5점"></label> 
									 <input type="radio" id="rating8" name="score" value="8">
									<label for="rating8" title="4점"></label> 
									 <input type="radio" id="rating7" name="score" value="7">
									<label class="half" for="rating7" title="3.5점"></label> <!-- half 클래스 : 반 쪽 별  -->
									 <input type="radio" id="rating6" name="score" value="6">
									<label for="rating6" title="3점"></label> 
									 <input type="radio" id="rating5" name="score" value="5">
									<label class="half" for="rating5" title="2.5점"></label> 
									 <input type="radio" id="rating4" name="score" value="4">
									<label for="rating4" title="2점"></label> 
									 <input type="radio" id="rating3" name="score" value="3">
									<label class="half" for="rating3" title="1.5점"></label> 
									 <input type="radio" id="rating2" name="score" value="2">
									<label for="rating2" title="1점"></label> 
									 <input type="radio" id="rating1" name="score" value="1"> <!-- 별 0.5개 : 1점 -->
									<label class="half" for="rating1" title="0.5점"></label>
								</fieldset>
							</div>
							<div class="col-lg-12">
								<input type="button" value="별점 주기"
									onclick="checkRating(this.form)" class="btn btn-primary">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</c:if>


<!-- 댓글 영역 -->
<div style="padding-left: 100px; padding-right: 100px; padding-top: 60px; padding-bottom: 60px">
	<div class="card shadow mb-4">
		<div class="card-body">
			<div align="center">
				<form method="post" name="comment" action="${pageContext.request.contextPath}/recipe/comment/${vo.no}" enctype="multipart/form-data">
					<div class="row">
						<div class="col-lg-2">
							<input type="file" name="image" accept="image/jpeg, image/png, image/jpg, image/gif" class="form-control"><br>
						</div>
						<div class="col-lg-8">
							<textarea name="detail" class="form-control" rows="5"></textarea>
						</div>
						<div class="col-lg-2">
							<input type="button" value="댓글 작성하기" onclick="checkComment(this.form)" class="btn btn-primary">
						</div>
					</div>
				</form>
			</div>
			<br>
			<div id="commentList">
				<c:forEach var="pc" items="${comList}">
					<div class="card shadow mb-4">
						<div class="card-body" id="${pc.NO}">
							<div class="row">
								<div class="col-lg-2">
									<img src="${pageContext.request.contextPath}/resources/users/${pc.USERS_IMG}" style="width: 30px; height: 30px; object-fit: cover; border-radius: 50%;" />
									<c:if test="${pc.USERS_NO == vo.user_no}"> 
								레시피 작성자
							</c:if>
									<c:if test="${pc.USERS_NO != vo.user_no}">
								${pc.USERS_NAME}
							</c:if>
									<br>${pc.WRITE_DATE}
								</div>
								<div class="col-lg-7">
									${pc.DETAIL}
									<c:if test="${pc.IMG != null}">
										<br>
										<img src="${pageContext.request.contextPath}/resources/recipe/${vo.no}/comment/${pc.IMG}" style="height: 100px; object-fit: cover; border-radius: 2%;" />
									</c:if>
									<br>
								</div>
								<div class="col-lg-3" align="right">
									<c:if test="${pc.USERS_NO == login}">
										<div class="row" id="${pc.NO}" align="right">
											<div class="col-lg-6" style="cursor: pointer;" align="right" id="${pc.NO}">
												<a onclick="addComment(this)" id="no">답글</a>
											</div>
											<div class="col-lg-3" style="cursor: pointer;" align="right">
												<a onclick="upComment(this)" id="no">수정</a>
											</div>
											<c:if test="${pc.value == '[]'}">
												<div class="col-lg-3" style="cursor: pointer;">
													<a onclick="delComment(this)" id="no">삭제</a>
												</div>
											</c:if>
											<c:if test="${pc.value != '[]'}">
												<div class="col-lg-3" style="cursor: pointer;">
													<a onclick="DontDelComment()" id="no">삭제</a>
												</div>
											</c:if>
										</div>
									</c:if>
									<c:if test="${pc.USERS_NO != login}">
										<div class="row" id="${pc.key}">
											<div class="col-lg-2"></div>
											<div class="col-lg-7" style="cursor: pointer;" align="right" id="${pc.no}">
												<a onclick="addComment(this)" id="no">답글</a>
											</div>
											<div id="complainComment" class="col-lg-3" style="cursor: pointer;">신고</div>
										</div>
									</c:if>
								</div>
								<div class="col-lg-12" id="appendComment">&nbsp;</div>
								<%-- <c:forEach var="cc" items="${pc.value}">
									<div class="col-lg-1">&nbsp;</div>
									<div class="col-lg-11">
										<div class="card shadow mb-4">
											<div class="card-body">
												<div class="row">

													<div class="col-lg-2">
														<img src="${pageContext.request.contextPath}/resources/users/${cc.users_img}" style="width: 30px; height: 30px; object-fit: cover; border-radius: 50%;" />
														<c:if test="${cc.users_no == vo.user_no}">
												레시피 작성자
											</c:if>
														<c:if test="${cc.users_no != vo.user_no}">
												${cc.users_name}
											</c:if>
														<br>${cc.write_date}
													</div>
													<div class="col-lg-7">
														${cc.detail}
														<c:if test="${cc.img != null}">
															<br>
															<img src="${pageContext.request.contextPath}/resources/recipe/${vo.no}/comment/${cc.img}" style="height: 100px; object-fit: cover; border-radius: 2%;" />
														</c:if>
													</div>
													<div class="col-lg-3" align="right">
														<c:if test="${cc.users_no == login}">
															<div class="row" id="${cc.no}" align="right">
																<div class="col-lg-4" align="right"></div>
																<div class="col-lg-4" style="cursor: pointer;" align="right">
																	<a onclick="upComment(this)" id="no">수정</a>
																</div>
																<div class="col-lg-4" style="cursor: pointer;">
																	<a onclick="delComment(this)" id="no">삭제</a>
																</div>
															</div>
														</c:if>
														<c:if test="${cc.users_no != login}">
															<div class="row" id="${cc.no}">
																<div class="col-lg-8"></div>
																<div id="complainComment" class="col-lg-4" style="cursor: pointer;">신고</div>
															</div>
														</c:if>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach> --%>
							</div>
						</div>
					</div>
				</c:forEach>
				<%-- <c:forEach var="pc" items="${comMap}">
					<div class="card shadow mb-4">
						<div class="card-body" id="${pc.key.no}">
							<div class="row">
								<div class="col-lg-2">
									<img src="${pageContext.request.contextPath}/resources/users/${pc.key.users_img}" style="width: 30px; height: 30px; object-fit: cover; border-radius: 50%;" />
									<c:if test="${pc.key.users_no == vo.user_no}"> 
								레시피 작성자
							</c:if>
									<c:if test="${pc.key.users_no != vo.user_no}">
								${pc.key.users_name}
							</c:if>
									<br>${pc.key.write_date}
								</div>
								<div class="col-lg-7">
									${pc.key.detail}
									<c:if test="${pc.key.img != null}">
										<br>
										<img src="${pageContext.request.contextPath}/resources/recipe/${vo.no}/comment/${pc.key.img}" style="height: 100px; object-fit: cover; border-radius: 2%;" />
									</c:if>
									<br>
								</div>
								<div class="col-lg-3" align="right">
									<c:if test="${pc.key.users_no == login}">
										<div class="row" id="${pc.key.no}" align="right">
											<div class="col-lg-6" style="cursor: pointer;" align="right" id="${pc.key.no}">
												<a onclick="addComment(this)" id="no">답글</a>
											</div>
											<div class="col-lg-3" style="cursor: pointer;" align="right">
												<a onclick="upComment(this)" id="no">수정</a>
											</div>
											<c:if test="${pc.value == '[]'}">
												<div class="col-lg-3" style="cursor: pointer;">
													<a onclick="delComment(this)" id="no">삭제</a>
												</div>
											</c:if>
											<c:if test="${pc.value != '[]'}">
												<div class="col-lg-3" style="cursor: pointer;">
													<a onclick="DontDelComment()" id="no">삭제</a>
												</div>
											</c:if>
										</div>
									</c:if>
									<c:if test="${pc.key.users_no != login}">
										<div class="row" id="${pc.key}">
											<div class="col-lg-2"></div>
											<div class="col-lg-7" style="cursor: pointer;" align="right" id="${pc.key.no}">
												<a onclick="addComment(this)" id="no">답글</a>
											</div>
											<div id="complainComment" class="col-lg-3" style="cursor: pointer;">신고</div>
										</div>
									</c:if>
								</div>
								<div class="col-lg-12" id="appendComment">&nbsp;</div>
								<c:forEach var="cc" items="${pc.value}">
									<div class="col-lg-1">&nbsp;</div>
									<div class="col-lg-11">
										<div class="card shadow mb-4">
											<div class="card-body">
												<div class="row">

													<div class="col-lg-2">
														<img src="${pageContext.request.contextPath}/resources/users/${cc.users_img}" style="width: 30px; height: 30px; object-fit: cover; border-radius: 50%;" />
														<c:if test="${cc.users_no == vo.user_no}">
												레시피 작성자
											</c:if>
														<c:if test="${cc.users_no != vo.user_no}">
												${cc.users_name}
											</c:if>
														<br>${cc.write_date}
													</div>
													<div class="col-lg-7">
														${cc.detail}
														<c:if test="${cc.img != null}">
															<br>
															<img src="${pageContext.request.contextPath}/resources/recipe/${vo.no}/comment/${cc.img}" style="height: 100px; object-fit: cover; border-radius: 2%;" />
														</c:if>
													</div>
													<div class="col-lg-3" align="right">
														<c:if test="${cc.users_no == login}">
															<div class="row" id="${cc.no}" align="right">
																<div class="col-lg-4" align="right"></div>
																<div class="col-lg-4" style="cursor: pointer;" align="right">
																	<a onclick="upComment(this)" id="no">수정</a>
																</div>
																<div class="col-lg-4" style="cursor: pointer;">
																	<a onclick="delComment(this)" id="no">삭제</a>
																</div>
															</div>
														</c:if>
														<c:if test="${cc.users_no != login}">
															<div class="row" id="${cc.no}">
																<div class="col-lg-8"></div>
																<div id="complainComment" class="col-lg-4" style="cursor: pointer;">신고</div>
															</div>
														</c:if>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</c:forEach> --%>
			</div>
		</div>
	</div>
</div>

<style type="text/css">
@import
	url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

.rate {
	display: inline-block;
	border: 0;
	margin-right: 15px;
}

.rate>input { /*라디오버튼 숨기기(선택은 가능)*/
	display: none;
}

.rate>label {
	float: right; /* 오른쪽 정렬 ,기본 회색 */
	color: #ddd
}

.rate>label:before {
	display: inline-block;
	font-size: 1rem;
	padding: .3rem .2rem;
	margin: 0;
	cursor: pointer;
	font-family: FontAwesome;
	content: "\f005 "; /* 별모양으로 만들기(아이콘) */
}

.rate .half:before {
	content: "\f089 "; /* 반 별 아이콘 설정 */
	position: absolute;
	padding-right: 0;
}

.rate input:checked ~ label, /* 체크했을 때  */
.rate label:hover,/*  마우스 가져다 댔을 때  */
.rate label:hover ~ label { /* ~는 내가 체크하거나 가져다 댄 것 이전의 별들도 모두 */
	color: #f73c32 !important; /* 빨강색으로 변하게 */
}

.rate input:checked+.rate label:hover,/*  라디오 버튼이 선택된 상태에서 마우스를 올리면 해당 label의 색상이 빨간색으로 변하게 설정 */
.rate input input:checked ~ label:hover, 
	.rate input:checked ~ .rate label:hover ~ label,
	 .rate label:hover ~ input:checked ~ label {
	color: #f73c32 !important;
}
</style>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>


<script type="text/javascript">
/* 답글 작성 영역 노출 */
function addComment(e) {
	const parent = e.parentElement.parentElement.parentElement.parentElement.children[3];
	if (e.id == 'no') {
		const temp = document.createElement("div");
		temp.className = "row";
		temp.id = "commentArea";
		temp.innerHTML = `
			<div class="col-lg-1"></div>
			<div class="col-lg-11">
			<div class="card shadow mb-4"><div class="card-body">
				<div align="center">
					<form method="post" name="comment" action="${pageContext.request.contextPath}/recipe/comment/${vo.no}" enctype="multipart/form-data">
						<div class="row">
							<div class="col-lg-2">
								<input type="file" name="image" accept="image/jpeg, image/png, image/jpg, image/gif" class="form-control"><br>
							</div>
							<div class="col-lg-8">
								<textarea name="detail" class="form-control" rows="5"></textarea>
								<input type="hidden" name="comment_no" value="` + e.parentElement.id + `">
							</div>
							<div class="col-lg-2">
								<input type="button" value="댓글 작성하기" onclick="checkComment(this.form)" class="btn btn-primary">
							</div>
						</div> 
					</form>
				</div><br>
			</div></div>
			</div>
		`;
		parent.append(temp);
		e.id = "yes";
		e.innerText = "답글 취소";
	} else {
		document.getElementById("commentArea").remove();
		e.id = "no";
		e.innerText = "답글";
	}
}

/* 댓글 작성 동작 */
function checkComment(c) {
	if ("${login}" == null || "${login}" == '') {
		if (confirm("로그인 후 시도해주세요.\n로그인 페이지로 이동하시겠습니까?")) {
			return location.href="${pageContext.request.contextPath}/login/loginform";
		} else {
			return
		}
	}
	if (c.detail.value == '') {
		return alert("댓글을 입력한 후 시도해주세요.");
	}
	if (confirm("댓글을 작성하시겠습니까?")) {
		c.submit();
	}
	
} 

/* 댓글 삭제 동작 */
function delComment(c) {
	if ("${login}" == null || "${login}" == '') {
		if (confirm("로그인 후 시도해주세요.\n로그인 페이지로 이동하시겠습니까?")) {
			return location.href="${pageContext.request.contextPath}/login/loginform";
		} else {
			return
		}
	}
	if (confirm("댓글을 삭제하시겠습니까?")) {
		url = "${pageContext.request.contextPath}/recipe/comment/delete?no=" + ${vo.no} + "&commentNo=" + c.parentElement.parentElement.id;
		location.href=url;
	}
}
/* 댓글 삭제 가능 여부 확인 */
function DontDelComment() {
	alert("답글이 존재하는 경우 댓글을 삭제할 수 없습니다.");
}

/* 댓글 수정 */
function upComment(c) {
	const area = c.parentElement.parentElement.parentElement.parentElement;
	let imgSrc = '';
	if (area.children[1].children[1] != undefined) {
		imgSrc = area.children[1].children[1].src;
	}
	const commentNo = c.parentElement.parentElement.id;
	area.children[0].remove();
	const text = area.children[0].innerText;
	area.children[0].remove();
	area.children[0].remove();
	const temp = document.createElement("div");
	
	if (imgSrc != '') {
		temp.innerHTML = `
			<form method="post" name="updateComment" action="${pageContext.request.contextPath}/recipe/comment/update?no=` + ${vo.no} + `&commentNo=` + commentNo + `" enctype="multipart/form-data">
				<div class="row">
					<div class="col-lg-2">
						<input type="file" name="image" accept="image/jpeg, image/png, image/jpg, image/gif" class="form-control"><br>
					</div>
					<div class="col-lg-8">
						<textarea name="detail" class="form-control" rows="5">` + text + `</textarea>
						<br>
						<img src="` + imgSrc +  `" style="height: 80px">
						<input type="button" value="사진 삭제하기" onclick="delImg(this)" class="btn btn-primary">
						<p style="color: gray"> 새로운 사진을 선택하시면, 이전에 등록한 사진이 삭제됩니다.</p>
					</div>
					<div class="col-lg-2">
						<input type="button" value="댓글 수정하기" onclick="updateCommentFn()" class="btn btn-primary">
					</div>
				</div>	
			</form>
		 `;
	} else {
		temp.innerHTML = `
			<form method="post" name="updateComment" action="${pageContext.request.contextPath}/recipe/comment/update?no=` + ${vo.no} + `&commentNo=` + commentNo + `" enctype="multipart/form-data">
				<div class="row">
					<div class="col-lg-2">
						<input type="file" name="image" accept="image/jpeg, image/png, image/jpg, image/gif" class="form-control"><br>
					</div>
					<div class="col-lg-8">
						<textarea name="detail" class="form-control" rows="5">` + text + `</textarea>
					</div>
					<div class="col-lg-2">
						<input type="button" value="댓글 수정하기" onclick="updateCommentFn()" class="btn btn-primary">
					</div>
				</div>	
			</form>
		 `;
	}
	
	area.prepend(temp);
}
/* 댓글 수정에서 사진 삭제하기 */
function delImg(f) {
	f.parentElement.children[2].remove();
	f.parentElement.children[2].remove();
	const del = document.createElement("input");
	del.name = "delImg";
	del.type = "hidden";
	document.updateComment.append(del);
	del.value = "true";
}

/* 댓글 수정 데이터 서버에 전송 */
function updateCommentFn() {
	if ("${login}" == null || "${login}" == '') {
		if (confirm("로그인 후 시도해주세요.\n로그인 페이지로 이동하시겠습니까?")) {
			return location.href="${pageContext.request.contextPath}/login/loginform";
		} else {
			return
		}
	}
	if (confirm("댓글을 수정하시겠습니까?")) {
		document.updateComment.submit();
	}
}

/* 별점 등록 */
function checkRating(rating) {
	if ("${login}" == null || "${login}" == '') {
		if (confirm("로그인 후 시도해주세요.\n로그인 페이지로 이동하시겠습니까?")) {
			return location.href="${pageContext.request.contextPath}/login/loginform";
		} else {
			return
		}
	}
	if (rating.score.value == "") {
		return alert("0점은 등록할 수 없습니다.");
	}
	if (confirm("별점을 등록하시겠습니까?")) {
		var url = "${pageContext.request.contextPath}/recipe/rating/${vo.no}";
		var param = "score=" + encodeURIComponent(rating.score.value);
		
		sendRequest(url, param, ratingResultFn, "POST");
	}
}
function ratingResultFn() {
	if(xhr.readyState == 4 && xhr.status == 200) {
		if (xhr.responseText == "-1.0") {
			return alert("해당 레시피에 등록한 별점 이력이 존재하여 별점을 등록할 수 없습니다.");
		}
		var data = xhr.responseText;
		const spanScore = document.getElementById("score");
		spanScore.innerText = data;
		alert("별점이 등록되었습니다.")
	}
}



/* 레시피 삭제 동작 */
function checkDelete() {
	if (confirm("삭제하시겠습니까?")) {
		location.href="${pageContext.request.contextPath}/recipe/delete/${vo.no}";
	}
}
</script>