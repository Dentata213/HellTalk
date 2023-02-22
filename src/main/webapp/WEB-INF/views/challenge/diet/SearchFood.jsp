<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- https://developers.google.com/fonts/docs/material_icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="${path}/resources/css/lightbox.css">

<style>

#search {
	width: 87%;
	height: 50px;
	margin: 60px 0px 0px 0px;
	
}

.btn {
	width: 120px;
	height: 50px;
	margin: 10px 0px 15px 10px;
	
	background-color: #d67d00;
	color: #ffffff;
	
	font-weight: bold;
	
	display: inline-block;
	border-radius: 20px;
}

#searchtable {
	width: 95%;
	color: #000000 !important;
	/* color: #f7f7f7; */
	
	margin: 10px 0px 10px 0px;
	padding: 20px 20px 20px 20px;
}

#tableCard{
	background-color: #f7f7f7 !important; 
	padding: 10px 10px 10px 10px;
	/*background-color: #1A2236 !important;*/
}

#foodForm {
	width: 100%;
	margin-bottom: 30px;
	padding-left: 10px;
}

.theme-dark .card-header {
	color: #ffffff !important;
	margin-top: 30px;
	margin-bottom: 20px;
	font-weight: bold;
	
}
.card {
	align-items: center;
	min-height: 500px;
    margin-bottom: 20px;
}
#outerCard{
	padding: 20px 20px 20px 20px;
}

.theme-dark .form-control{
	color: #1A2236;
	background-color: #dddddd !important;
}

thead{
	border-bottom: 2px solid #1A2236;
	/* color: #dddddd; */
	color: #1A2236; 
}
td{
	padding: 10px 0px 10px 0px;
}
tr.select:hover td{
  background-color:#f7bc51 !important;
}
.table-sm td, .table-sm th{
	padding: 15px 0px 15px 0px;
}
</style>

<div class="main-content">
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar layout-without-menu">
		<div class="layout-container">
			<!-- Layout container -->
			<div class="layout-page">
				<div class="container">
					<form action="<c:url value="/diet/foodSearch.do"/>" method="post" id="foodForm">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
						<input type="text" value="${param.search}" class="border-0 lh-32 pt-2 pb-2 ps-5 pe-3 fw-500 rounded-xl" placeholder="음식을 검색해보세요" name="search" id="search"/>
						<button type="submit" class="btn"><i class="feather-search font-sm text-grey-400"></i></button>
					</form>

					<div class="card rounded-xl" id="outerCard">
						<h1 class="card-header text-center">검색 결과</h1>
							<div class="card rounded-xl" id="tableCard">
								<table class="table-striped table-hover text-center" id="searchtable">
									<thead id="thead">
										<tr>
											<th>번호</th>
											<th>식품코드</th>
											<th>음식 이름</th>
											<th>제조사명</th>
											<th>총내용량</th>
											<th class="col-1">칼로리</th>
											<th>탄수화물</th>
											<th class="col-1">단백질</th>
											<th class="col-1">지방</th>
											<th>콜레스테롤</th>
											<th class="col-1">나트륨</th>
										</tr>
									</thead>
									<tbody class="table-sm down-file-body">
										<c:if test="${empty searchList }" var="isEmpty">
											<tr>
												<td colspan="11">${FailSearch }</td>
											</tr>
										</c:if>
										<c:if test="${not isEmpty }">
											<c:forEach var="record" items="${searchList}" varStatus="loop">
												<tr class="select">
													<td>${loop.index+1 }</td>
													<td>${record.food_cd }</td>
													<td>${record.food_name }</td>
													<td>${record.food_maker }</td>
													<td>${record.food_size }</td>
													<td>${record.food_kcal }</td>
													<td>${record.food_tan }</td>
													<td>${record.food_dan }</td>
													<td>${record.food_fat }</td>
													<td>${record.food_col }</td>
													<td>${record.food_na }</td>
												</tr>
											</c:forEach>
										</c:if>
	
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	<script>
		$('.select').click(function(){
			var food_cd= $(this).find("td:eq(1)").html();
			console.log("food_cd : "+ food_cd);
				
				window.location.href ='<c:url value="/diet/putFood.do" />?food_cd='+food_cd;
		
		});
</script>
	<script src="${path}/resources/js/plugin.js"></script>
	<script src="${path}/resources/js/lightbox.js"></script>
	<script src="${path}/resources/js/scripts.js"></script>