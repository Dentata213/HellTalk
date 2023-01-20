<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Diet Page</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- https://developers.google.com/fonts/docs/material_icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container">
		<form action='<c:url value="/diet/goFoodSearch.do"/>' method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="submit" class="btn btn-primary" value="아침 음식 등록" name="breakfast" />
			<input type="submit" class="btn btn-primary" value="점심 음식 등록" name="lunch" />
			<input type="submit" class="btn btn-primary" value="저녁 음식 등록" name="dinner" />
		</form>
			
		<div class="text-center mb-2">
			<h3>아침</h3>
			<table class="table table-hover text-center">

				<thead>
					<tr>
						<th class="col-1">번호</th>
						<th >음식 이름</th>
						<th class="col-1">제조사명</th>
						<th class="col-1">총내용량</th>
						<th class="col-1">칼로리</th>
						<th class="col-1">탄수화물</th>
						<th class="col-1">단백질</th>
						<th class="col-1">지방</th>
						<th class="col-1">콜레스테롤</th>
						<th class="col-1">나트륨</th>
					</tr>
				</thead>
				<tbody class="table-sm down-file-body">
					<c:if test="${empty selectFood }" var="isEmpty">
						<tr>
							<td colspan="10">${FailSelect }</td>
						</tr>
					</c:if>
					<c:if test="${not isEmpty }">
							<tr class="select">
								<td>${selectFood.food_cd }</td>
								<td>${selectFood.food_name }</td>
								<td>${selectFood.food_maker }</td>
								<td>${selectFood.food_size }</td>
								<td>${selectFood.food_kcal }</td>
								<td>${selectFood.food_tan }</td>
								<td>${selectFood.food_dan }</td>
								<td>${selectFood.food_fat }</td>
								<td>${selectFood.food_col }</td>
								<td>${selectFood.food_na }</td>
							</tr>
					</c:if>

				</tbody>
			</table>
		</div>
		<div class="text-center mb-2">
			<h3>점심</h3>
			<table class="table table-hover text-center">

				<thead>
					<tr>
						<th class="col-1">번호</th>
						<th >음식 이름</th>
						<th class="col-1">제조사명</th>
						<th class="col-1">총내용량</th>
						<th class="col-1">칼로리</th>
						<th class="col-1">탄수화물</th>
						<th class="col-1">단백질</th>
						<th class="col-1">지방</th>
						<th class="col-1">콜레스테롤</th>
						<th class="col-1">나트륨</th>
					</tr>
				</thead>
				<tbody class="table-sm down-file-body">
					<c:if test="${empty selectFood }" var="isEmpty">
						<tr>
							<td colspan="10">${FailSelect }</td>
						</tr>
					</c:if>
					<c:if test="${not isEmpty }">
							<tr class="select">
								<td>${selectFood.food_cd }</td>
								<td>${selectFood.food_name }</td>
								<td>${selectFood.food_maker }</td>
								<td>${selectFood.food_size }</td>
								<td>${selectFood.food_kcal }</td>
								<td>${selectFood.food_tan }</td>
								<td>${selectFood.food_dan }</td>
								<td>${selectFood.food_fat }</td>
								<td>${selectFood.food_col }</td>
								<td>${selectFood.food_na }</td>
							</tr>
					</c:if>

				</tbody>
			</table>
		</div>
		<div class="text-center mb-2">
			<h3>저녁</h3>
			<table class="table table-hover text-center">

				<thead>
					<tr>
						<th class="col-1">번호</th>
						<th >음식 이름</th>
						<th class="col-1">제조사명</th>
						<th class="col-1">총내용량</th>
						<th class="col-1">칼로리</th>
						<th class="col-1">탄수화물</th>
						<th class="col-1">단백질</th>
						<th class="col-1">지방</th>
						<th class="col-1">콜레스테롤</th>
						<th class="col-1">나트륨</th>
					</tr>
				</thead>
				<tbody class="table-sm down-file-body">
					<c:if test="${empty selectFood }" var="isEmpty">
						<tr>
							<td colspan="10">${FailSelect }</td>
						</tr>
					</c:if>
					<c:if test="${not isEmpty }">
							<tr class="select">
								<td>${selectFood.food_cd }</td>
								<td>${selectFood.food_name }</td>
								<td>${selectFood.food_maker }</td>
								<td>${selectFood.food_size }</td>
								<td>${selectFood.food_kcal }</td>
								<td>${selectFood.food_tan }</td>
								<td>${selectFood.food_dan }</td>
								<td>${selectFood.food_fat }</td>
								<td>${selectFood.food_col }</td>
								<td>${selectFood.food_na }</td>
							</tr>
					</c:if>

				</tbody>
			</table>
		</div>
	</div>
</body>
</html>