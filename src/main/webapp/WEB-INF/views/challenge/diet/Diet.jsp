<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${path}/resources/css/lightbox.css">

<style>
	.btn{
		background-color: #ffa629;
		margin-top: 20px;
	}	
	.table{
		color: #ffffff;!important
	}
</style>

	 <!-- main content -->
     <div class="main-content">
		<div class="container">
			
			<div class="mb-3">
				<label for="html5-date-input" class="col-md-2 col-form-label">
					<h1>기록할 날짜 선택</h1>
				</label>
				<form action='<c:url value="/diet/goFoodSearch.do"/>' method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<input class="form-control" type="date" min="1950-01-01" max="9999-12-31"/>
					<!-- 아래 음식 추가는 이미지로 변경  -->
					<input type="submit" class="btn" value="breakfast" name="breakfast" /> 
					<input type="submit" class="btn" value="lunch" name="lunch" /> 
					<input type="submit" class="btn" value="dinner" name="dinner" />
				</form>
			</div>
			
			<div class="text-center mb-2">
				<h1>아침</h1>
				<table class="table table-hover text-center">
	
					<thead>
						<tr>
							<th class="col-2">음식 이름</th>
							<th class="col-1">총내용량</th>
							<th class="col-1">칼로리</th>
							<th class="col-1"></th>
						</tr>
					</thead>
					<tbody class="table-sm down-file-body">
						<c:if test="${empty selectListEatBreakfast }" var="isEmpty">
							<tr>
								<td colspan="10">${FailSelect }</td>
							</tr>
						</c:if>
						<c:if test="${not isEmpty }">
							<c:forEach var="list" items="${selectListEatBreakfast}"
								varStatus="loop">
								<tr>
									<td>${list.food_name }</td>
									<td>${list.food_size }</td>
									<td>${list.food_kcal }</td>
									<!-- delete버튼 이미지로 변경 -->
									<td><input type="submit" class="btn btn-warning" value="delete" name="delete"/></td>
								</tr>
							</c:forEach>
						</c:if>
	
					</tbody>
				</table>
			</div>
			<div class="text-center mb-2">
				<h1>점심</h1>
				<table class="table table-hover text-center">
	
					<thead>
						<tr>
							<th class="col-2">음식 이름</th>
							<th class="col-1">총내용량</th>
							<th class="col-1">칼로리</th>
							<th class="col-1"></th>
						</tr>
					</thead>
					<tbody class="table-sm down-file-body">
						<c:if test="${empty selectListEatLunch }" var="isEmpty">
							<tr>
								<td colspan="10">${FailSelect }</td>
							</tr>
						</c:if>
						<c:if test="${not isEmpty }">
							<c:forEach var="list" items="${selectListEatLunch}"
								varStatus="loop">
								<tr>
									<td>${list.food_name }</td>
									<td>${list.food_size }</td>
									<td>${list.food_kcal }</td>
									<td><input type="submit" class="btn btn-warning" value="delete" name="delete"/></td>
								</tr>
							</c:forEach>
						</c:if>
	
					</tbody>
				</table>
			</div>
			<div class="text-center mb-2">
				<h1>저녁</h1>
				<table class="table table-hover text-center">
	
					<thead>
						<tr>
							<th class="col-2">음식 이름</th>
							<th class="col-1">총내용량</th>
							<th class="col-1">칼로리</th>
							<th class="col-1"></th>
						</tr>
					</thead>
					<tbody class="table-sm down-file-body">
						<c:if test="${empty selectListEatDinner }" var="isEmpty">
							<tr>
								<td colspan="10">${FailSelect }</td>
							</tr>
						</c:if>
						<c:if test="${not isEmpty }">
							<c:forEach var="list" items="${selectListEatDinner}"
								varStatus="loop">
								<tr>
									<td>${list.food_name }</td>
									<td>${list.food_size }</td>
									<td>${list.food_kcal }</td>
									<td><input type="submit" class="btn btn-warning" value="delete" name="delete"/></td>
								</tr>
							</c:forEach>
						</c:if>
	
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- main content -->
	
	<script>
	console.log('input type=date value값: ',$('input[type=date]').val())
	
		var msg = JSON.stringify(me);
		$('.form-control').click(function(e){
			
			$.ajax({
				url: "<c:url value="/diet/selectDate.do"/>",
				method: "POST",
				data: 'd_date='+$('input[type=date]').val() ,
				contentType: "application/json; charset=utf-8"
			})
			.done(function(data){
			 
			 	console.log(data)
			})
			.fail(function(jqXHR, textStatus, errorThrown){
					console.log(jqXHR)
			        console.log(textStatus)
			        console.log(errorThrown);
			}); 
			
		});///////////////
		
		
	
	</script>
	
	<script src="${path}/resources/js/plugin.js"></script>
	<script src="${path}/resources/js/lightbox.js"></script>
	<script src="${path}/resources/js/scripts.js"></script>