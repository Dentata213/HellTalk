<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>HellTalk - HellTalk for Everyone! </title>

    <link rel="stylesheet" href="${path}/resources/css/themify-icons.css">
    <link rel="stylesheet" href="${path}/resources/css/feather.css">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${path}/resources/images/favicon.png">
    <!-- Custom Stylesheet -->
    <link rel="stylesheet" href="${path}/resources/css/style.css">
	<style>
		@media (min-width: 992px) {
		  .main-content {
		    padding-left: 225px;
		  }
		  iframe{
		  	height: 83vh; width: 100%
		  }
		}
		@media (max-width: 991px){
			iframe{
				height: 83vh;
			}
		}
	</style>

</head>

<body class="color-theme-blue mont-font stop-scrolling" id="body">
    <div class="preloader"></div>

    
    <div class="main-wrapper">

        <!-- navigation top-->
        <div class="nav-header bg-white shadow-xs border-0">
            <div class="nav-top"  style="justify-content: space-between;">
                <a href="<c:url value="/"/>"><i class="feather-zap text-success display1-size me-2 ms-0"></i><span class="d-inline-block fredoka-font ls-3 fw-600 text-current font-xxl logo-text mb-0">HellTalk </span> </a>
                <button class="nav-menu me-0 ms-2"></button>
            </div>

            <a href="default-settings.html" class="p-2 text-center ms-auto menu-icon"><img src="https://via.placeholder.com/50x50.png" alt="user" class="w40 mt--1"></a>
            
        </div>
        <!-- navigation top -->

        <!-- navigation left -->
        <nav class="navigation scroll-bar">
            <div class="container ps-0 pe-0">
                <div class="nav-content">
                    <div class="nav-wrap bg-white bg-transparent-card rounded-xxl shadow-xss pt-3 pb-1 mb-2 mt-2" style="height: 83vh; width: 200px">
                        <ul class="mb-1 top-content">
                            <li class="logo d-none d-xl-block d-lg-block"></li>
                            <li><a href="javascript:adminStatus();" class="nav-content-bttn open-font" ><i class="feather-bar-chart-2" style="color:black"></i>&nbsp;&nbsp;<span>통계</span></a></li>
                            <li><a href="javascript:adminMember();" class="nav-content-bttn open-font" ><i class="feather-users" style="color:black"></i>&nbsp;&nbsp;<span>사용자 관리</span></a></li>
                            <li><a href="javascript:adminBBS();" class="nav-content-bttn open-font" ><i class="feather-list" style="color:black"></i>&nbsp;&nbsp;<span>게시물 관리</span></a></li>
                            <li><a href="javascript:adminPayment();" class="nav-content-bttn open-font" ><i class="feather-credit-card" style="color:black"></i>&nbsp;&nbsp;<span>결재 관리</span></a></li>
                            <li><a href="#" class="nav-content-bttn open-font"><i class="feather-help-circle" style="color:black"></i>&nbsp;&nbsp;<span>Q&A</span></a></li>    
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
        <!-- navigation left -->
        <!-- main content -->
        <div class="main-content bg-white theme-dark-bg">
			<div class="middle-sidebar-bottom">

				<iframe id="iframe" style="width: 100%; overflow: hidden" frameborder="0" crolling="no" frameborder="none" allowfullscreen="" src="<c:url value="/backend/adminStatus"/>"></iframe>
				

        	</div>
        </div>
        <!-- main content -->
        <div class="app-header-search">
            <form class="search-form">
                <div class="form-group searchbox mb-0 border-0 p-1">
                    <input type="text" class="form-control border-0" placeholder="Search...">
                    <i class="input-icon">
                        <ion-icon name="search-outline" role="img" class="md hydrated" aria-label="search outline"></ion-icon>
                    </i>
                    <a href="#" class="ms-1 mt-1 d-inline-block close searchbox-close">
                        <i class="ti-close font-xs"></i>
                    </a>
                </div>
            </form>
        </div>

    </div> 

    

    <div class="modal-popup-chat">
        <div class="modal-popup-wrap bg-white p-0 shadow-lg rounded-3">
            <div class="modal-popup-header w-100 border-bottom">
                <div class="card p-3 d-block border-0 d-block">
                    <figure class="avatar mb-0 float-left me-2">
                        <img src="https://via.placeholder.com/50x50.png" alt="image" class="w35 me-1">
                    </figure>
                    <h5 class="fw-700 text-primary font-xssss mt-1 mb-1">Hendrix Stamp</h5>
                    <h4 class="text-grey-500 font-xsssss mt-0 mb-0"><span class="d-inline-block bg-success btn-round-xss m-0"></span> Available</h4>
                    <a href="#" class="font-xssss position-absolute right-0 top-0 mt-3 me-4"><i class="ti-close text-grey-900 mt-2 d-inline-block"></i></a>
                </div>
            </div>
            <div class="modal-popup-body w-100 p-3 h-auto">
                <div class="message"><div class="message-content font-xssss lh-24 fw-500">Hi, how can I help you?</div></div>
                <div class="date-break font-xsssss lh-24 fw-500 text-grey-500 mt-2 mb-2">Mon 10:20am</div>
                <div class="message self text-right mt-2"><div class="message-content font-xssss lh-24 fw-500">I want those files for you. I want you to send 1 PDF and 1 image file.</div></div>
                <div class="snippet pt-3 ps-4 pb-2 pe-3 mt-2 bg-grey rounded-xl float-right" data-title=".dot-typing"><div class="stage"><div class="dot-typing"></div></div></div>
                <div class="clearfix"></div>
            </div>
            <div class="modal-popup-footer w-100 border-top">
                <div class="card p-3 d-block border-0 d-block">
                    <div class="form-group icon-right-input style1-input mb-0"><input type="text" placeholder="Start typing.." class="form-control rounded-xl bg-greylight border-0 font-xssss fw-500 ps-3"><i class="feather-send text-grey-500 font-md"></i></div>
                </div>
            </div>
        </div> 
    </div>


    <script src="${path}/resources/js/plugin.js"></script>
    <script src="${path}/resources/js/scripts.js"></script>
	<style>
	.stop-scrolling {
	  height: 100%;
	  overflow: hidden;
	}
	</style>
	<script>
		body.classList.add("stop-scrolling");
		
		
		function adminStatus(){
			$.ajax({
				url:'<c:url value="/backend/getAdminStatus"/>',
				dataType:'text'
			}).done(function(data){
				console.log(data);
				$('#iframe').attr('src','/Helltalk/'+data);
			})
		}
		
		function adminMember(){
			$.ajax({
				url:'<c:url value="/backend/getAdminMembers"/>',
				dataType:'text'
			}).done(function(data){
				console.log(data);
				$('#iframe').attr('src','/Helltalk/'+data);
			})
			
		}
		function adminBBS(){
			$.ajax({
				url:'<c:url value="/backend/getAdminBBS"/>',
				dataType:'text'
			}).done(function(data){
				console.log(data);
				$('#iframe').attr('src','/Helltalk/'+data);
			})
		}
		
		function adminPayment(){
			$.ajax({
				url:'<c:url value="/backend/getAdminPayment"/>',
				dataType:'text'
			}).done(function(data){
				console.log(data);
				$('#iframe').attr('src','/Helltalk/'+data);
			})
		}
		
		
	</script>

    
</body>

</html>