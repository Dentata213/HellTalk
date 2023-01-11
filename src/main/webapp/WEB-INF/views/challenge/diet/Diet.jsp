<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>HellTalk - HealthTalk for Everyone!</title>

    <link rel="stylesheet" href="../css/themify-icons.css">
    <link rel="stylesheet" href="../css/feather.css">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${path}/resources/images/favicon.png">
    <!-- Custom Stylesheet -->
    <link rel="stylesheet" href="${path}/resources/css/style.css">
    <link rel="stylesheet" href="${path}/resources/css/style-rtl.css">


    <link rel="stylesheet" href="${path}/resources/css/emoji.css">
    <link rel="stylesheet" href="${path}/resources/css/lightbox.css">
    <link rel="stylesheet" href="${path}/resources/css/examscss/_color.scss">

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
			<ul>
				<c:forEach var="record" items="${param.searchList}" varStatus="loop">
					<li>${record[i] }</li>
				</c:forEach>
			</ul>
		
		</div>
		
		<%-- 
		<c:forEach var="record" items="${listPagingData.lists}" varStatus="loop">
			<tr>
				<td>${record.no}</td>
				<td class="text-left"><a
					href="<c:url value="/onememo/bbs/View.do?no=${record.no}&nowPage="/><c:out value="${param.nowPage}" default="1"/>">${record.title}</a>
					<span class="badge badge-light">${record.commentCount}</span></td>
				<td>${record.name}</td>
				<td>${record.postDate}</td>
			</tr>
		</c:forEach>
		--%>
	</div>
</body>

</html>