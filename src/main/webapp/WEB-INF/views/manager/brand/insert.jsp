<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/manager/layout/header.jsp" %>	
<!-- <style type="text/css">
	.filebox label {
	  display: inline-block;
	  padding: .10em .5em;
	  color: #999;
	  font-size: inherit;
	  line-height: normal;
	  vertical-align: middle;
	  background-color: #fdfdfd;
	  cursor: pointer;
	  border: 1px solid #ebebeb;
	  border-bottom-color: #e2e2e2;
	  border-radius: .25em;
	}
	
	.filebox input[type="file"] {  /* 파일 필드 숨기기 */
	  position: absolute;
	  width: 1px;
	  height: 1px;
	  padding: 0;
	  margin: -1px;
	  overflow: hidden;
	  border: 0;
	}
</style> -->

<form action="${pageContext.request.contextPath}/manager/brandInsert" method="post" enctype="multipart/form-data" name="data">
<!-- Begin Page Content -->
<div class="container-fluid">
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">브랜드 추가</h6>
		</div>
		<div class="card-body">

<!-- Content Row -->
<div class="row">
    <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">상호</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                        	<input name="name" placeholder="상호">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-success shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">대표자 이름</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                        	<input name="ceo" placeholder="대표자 이름">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-info shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">이메일</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                        	<input name="email" placeholder="이메일">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Pending Requests Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-warning shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">전화번호</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                        	<input name="phone"  placeholder="전화번호">
                       	</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-success shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">통신판매업 신고번호</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                        	<input name="report_num" placeholder="통신판매업 신고번호">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-info shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">사업장 소재지</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                        	<input name="locat" placeholder="사업장 소재지">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Pending Requests Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-warning shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">사업장 번호</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                        	<input name="business_num"  placeholder="사업장 번호">
                       	</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">로고</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
							<div class="filebox">
							    <div class="form-group">
							      <input class="form-control" name="logo" type="file" id="formFile">
							    </div>
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Content Row -->
		</div>
		<div class="card-header py-3">
			<a onclick="insertCheck()" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">추가</a>
		</div>
	</div>
</div>


</form>

<script type="text/javascript">
	function insertCheck() {
		if (document.data.name.value == '') {
			print_alert("상호");
		} else if (document.data.ceo.value == '') {
			print_alert("대표자 이름");
		} else if (document.data.email.value == '') {
			print_alert("이메일");
		} else if (document.data.phone.value == '') {
			print_alert("전화번호");
		} else if (document.data.report_num.value == '') {
			print_alert("통신판매업 신고번호");
		} else if (document.data.locat.value == '') {
			print_alert("사업장 소재지");
		} else if (document.data.business_num == '') {
			print_alert("사업장번호");
		} else if (document.data.logo.value == '') {
			print_alert("로고");
		} else {
			if (confirm("브랜드를 추가하시겠습니까?")) {
				document.data.submit();
			}
		}
	}
	
	function print_alert(word) {
		alert(word + "을(를) 입력해주세요.");
	}
</script>
<%@ include file="/WEB-INF/views/manager/layout/footer.jsp" %>