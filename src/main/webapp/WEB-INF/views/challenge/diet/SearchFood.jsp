<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Search Food</title>

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
		<div>
			<form action="<c:url value="/diet/foodSearch.do"/>">
				<input type="text" value="${param.search}" class="form-control" placeholder="음식을 검색해보세요" name="search">
				<button type="submit" class="btn btn-primary">검색</button>
			</form>
		</div>
		<div class="text-center mb-2">
			<h1>검색 결과</h1>
			<table class="table table-hover text-center">

				<thead>
					<tr>
						<th class="col-1">번호</th>
						<th class="col-1">식품코드</th>
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
					<c:if test="${empty searchList }" var="isEmpty">
						<tr>
							<td colspan="10">${FailSearch }</td>
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
</body>

<script>
		$('.select').click(function(){
			var food_cd= $(this).find("td:eq(1)").html();
			console.log("food_cd : "+ food_cd);
				
				window.location.href ='<c:url value="/diet/putFood.do" />?food_cd='+food_cd;
		
		});
</script>
</html>