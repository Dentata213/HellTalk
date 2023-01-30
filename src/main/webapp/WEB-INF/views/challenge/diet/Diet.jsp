<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Diet Page</title>
<link rel="stylesheet" href="${path}/resources/css/themify-icons.css">
<link rel="stylesheet" href="${path}/resources/css/feather.css">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="${path}/resources/images/favicon.png">
<!-- Custom Stylesheet -->
<link rel="stylesheet" href="${path}/resources/css/style.css">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- https://developers.google.com/fonts/docs/material_icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
	<div class="container">
		
		<div class="mb-3">
			<label for="html5-date-input" class="col-md-2 col-form-label">
				<h4>기록할 날짜 선택</h4>
			</label>
			<form action='<c:url value="/diet/goFoodSearch.do"/>' method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input class="form-control col-mb-3" type="date" min="1950-01-01" max="9999-12-31" name="d_date"/>
				<input type="submit" class="btn btn-primary" value="breakfast" name="breakfast" /> 
				<input type="submit" class="btn btn-primary" value="lunch" name="lunch" /> 
				<input type="submit" class="btn btn-primary" value="dinner" name="dinner" />
			</form>
		</div>
		
		<div class="text-center mb-2">
			<h3>아침</h3>
			<table class="table table-hover text-center">

				<thead>
					<tr>
						<th class="col-2">음식 이름</th>
						<th class="col-1">총내용량</th>
						<th class="col-1">칼로리</th>
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
							</tr>
						</c:forEach>
					</c:if>

				</tbody>
			</table>
		</div>
		<div class="text-center mb-2">
			<h3>점심</h3>
			<table class="table table-hover text-center">

				<thead>
					<tr>
						<th class="col-2">음식 이름</th>
						<th class="col-1">총내용량</th>
						<th class="col-1">칼로리</th>
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
							</tr>
						</c:forEach>
					</c:if>

				</tbody>
			</table>
		</div>
		<div class="text-center mb-2">
			<h3>저녁</h3>
			<table class="table table-hover text-center">

				<thead>
					<tr>
						<th class="col-2">음식 이름</th>
						<th class="col-1">총내용량</th>
						<th class="col-1">칼로리</th>
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
							</tr>
						</c:forEach>
					</c:if>

				</tbody>
			</table>
		</div>
	</div>
</body>
</html>