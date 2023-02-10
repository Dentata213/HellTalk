<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인공지능(AI) Fitness Trainer</title>
</head>
<body>
	<h1>인공지능(AI) Fitness Trainer</h1>
	
	<form action='<c:url value="/teachable/aiFitnessTrainer.do"/>' method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="submit" class="btn btn-primary" value="squat" name="squat" /> 
				<input type="submit" class="btn btn-primary" value="lunge" name="lunge" /> 
				<input type="submit" class="btn btn-primary" value="burpee" name="burpee" />
	</form>
</body>
</html>