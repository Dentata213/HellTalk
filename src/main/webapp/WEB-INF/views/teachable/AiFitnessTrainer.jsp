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

<style>
#aibox {
	height: 80px;
}

#ai {
	font-weight: bold;
	margin-left: 20px;
	line-height: 80px;
}

.training {
	line-height: 100%;
	margin: 10px 10px 10px 10px;
}

#squat {
	width: 40%;
	background-color: #1A2236 !important;
	align-items: center;
	margin: 20px 20px 20px 20px;
	border-radius: 20px;
}

#lunge {
	width: 40%;
	background-color: #1A2236 !important;
	vertical-align: middle;
	align-items: center;
	margin: 20px 20px 20px 20px;
	border-radius: 20px;
}

#burpee {
	width: 40%;
	background-color: #1A2236 !important;
	vertical-align: middle;
	align-items: center;
	margin: 20px 20px 20px 20px;
	border-radius: 20px;
}

img {
	width: 100%;
	height: 100%;
	border-radius: 20px;
	margin: 10px 10px 10px 10px;
}
</style>

<div class="main-content">
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar layout-without-menu">
		<div class="layout-container">
			<!-- Layout container -->
			<div class="layout-page">
				<div class="container">

					<div class="card rounded-xl mt-5 mb-3" id="aibox">
						<h1 id="ai">인공지능(AI) Fitness Trainer</h1>

						<div class="row">
							<div class="card rounded-xl">
								<div class="card rounded-xl" id="squat">
									<h1 class="training">스쿼트</h1>
									<button type="button" onclick="squat()">
										<img src="${path}/resources/images/teachable/squat.png">
									</button>
								</div>
								
								<div class="card rounded-xl" id="lunge">
									<h1 class="col-6 training">런지</h1>
									<button type="button" onclick="lunge()">
										<img class="col-6"
											src="${path}/resources/images/teachable/lunge.png">
									</button>
								</div>
								
								<div class="card rounded-xl" id="burpee">
									<h1 class="training">버피</h1>
									<button type="button" onclick="burpee()">
										<img src="${path}/resources/images/teachable/burpee.png">
									</button>
								</div>
							</div>
							<!-- card -->
						</div>
					</div>
				</div>
			</div>
		</div>
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