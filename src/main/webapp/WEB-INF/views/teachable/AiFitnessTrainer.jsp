<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${path}/resources/css/lightbox.css">
<div class="main-content">
	<div class="container">

		<h1>인공지능(AI) Fitness Trainer</h1>

		<button onclick="squat()">스쿼트</button>
		<button onclick="lunge()">런지</button>
		<button onclick="burpee()">버피</button>

	</div>
</div>

		<script>
			function squat() {
				window.location.href = "<c:url value="/teachable/squat.do"/>"
			}
			function lunge() {
				window.location.href = "<c:url value="/teachable/lunge.do"/>"
			}
			function burpee() {
				window.location.href = "<c:url value="/teachable/burpee.do"/>"
			}
		</script>
		<!-- main content -->
		<script src="${path}/resources/js/plugin.js"></script>
		<script src="${path}/resources/js/lightbox.js"></script>
		<script src="${path}/resources/js/scripts.js"></script>