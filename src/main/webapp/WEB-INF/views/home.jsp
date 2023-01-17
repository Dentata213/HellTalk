<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>HellTalk - HealthTalk for Everyone! </title>

    <link rel="stylesheet" href="${path}/resources/css/themify-icons.css">
    <link rel="stylesheet" href="${path}/resources/css/feather.css">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${path}/resources/images/favicon.png">
    <!-- Custom Stylesheet -->
    <link rel="stylesheet" href="${path}/resources/css/style.css">
    <link rel="stylesheet" href="${path}/resources/css/emoji.css">
    
    <link rel="stylesheet" href="${path}/resources/css/lightbox.css">
    <style>
        @import 'https://fonts.googleapis.com/css?family=Economica';

        html,
        body {
            margin: 0;
            max-width: 100%;
            height: 100%;
        }

        .not-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            width: 100vw;
        }

        .not-container:hover>.section {
            filter: brightness(22%);
        }

        .not-container:hover>.section:hover {
            filter: brightness(100%);
        }

        .not-container .section {
            flex-grow: 1;
            position: relative;
            height: 100%;
            transition: all 0.4s;
            align-items: center;
            justify-content: center;
            box-sizing: border-box;
            text-align: center;
            flex: 1;
        }

        .not-container .section .cont_title {
            position: relative;
            margin: auto;
            width: 100%;
            height: auto;
            text-align: center;
            margin-top: 37vh;
        }

        .not-container .section .cont_title h1 {
            text-transform: uppercase;
            color: white;
            font-family: "Economica", sans-serif;
            text-shadow: 1px 2px 5px rgba(0, 0, 0, 0.5);
            font-size: 3.5vw;
            margin: 0;
            transition: font-size 0.3s;
            vertical-align: middle;
        }

        .not-container .section .cont_title h3 {
            text-transform: uppercase;
            font-family: "Economica", sans-serif;
            font-size: 1.3vw;
            transition: all 0.3s;
            color: white;
            letter-spacing: 3px;
            text-shadow: 1px 2px 5px rgba(0, 0, 0, 0.5);
        }

        .not-container .section .cont_desc {
            position: relative;
            display: block;
            text-align: center;
            width: 12vw;
            height: auto;
            margin: auto;
            opacity: 0;
            transition: opacity 0.8s, transform 0.7s, padding-top 0.9s;
            padding-top: 6vh;
            transform: scale(1);
        }

        .not-container .section .cont_desc p {
            margin: 0;
            font-family: "Economica", sans-serif;
            color: white;
            font-size: 16px;
        }

        .not-container .section:hover {
            flex-grow: 1.8;
            transition: flex 0.2s;
        }

        .not-container .section:hover>.cont_title h1 {
            font-size: 5.3vw;
            transition: font-size 0.4s;
        }

        .not-container .section:hover>.cont_title h3 {
            font-size: 1.6vw;
            transition: all 0.4s;
        }

        .not-container .section:hover>.cont_desc {
            opacity: 1;
            padding-top: 2vh;
            transform: scale(1.5);
            transition: opacity 0.7s, padding-top 0.5s, transform 0.1s;
            transition-delay: 0s, 0.1s, 0s;
        }

        .not-container .section:nth-child(1) {
            background: url("https://artsandculture.withgoogle.com/gcs/national-parks-service/en-us/Asset-Kenai-desktop.jpg") center;
        }

        .not-container .section:nth-child(2) {
            background: url("https://artsandculture.withgoogle.com/gcs/national-parks-service/en-us/Asset-Hawaii-desktop.jpg") center;
        }

        .not-container .section:nth-child(3) {
            background: url("https://artsandculture.withgoogle.com/gcs/national-parks-service/en-us/de0b954d-ca76-41d3-ac3a-900c6bc25139.jpg") center;
        }
		     
/*않이.... 왜 안돼....*/  
		@media (min-width: 1200px)
				.not-container-xl, .not-container-lg, .not-container-md, .not-container-sm, .not-container {
		  max-width: 1119px;
		}
		@media (min-width: 992px)
				.not-container-lg, .not-container-md, .not-container-sm, .not-container {
		  max-width: 991px;
		}
		@media (min-width: 768px)
				.not-container-md, .not-container-sm, .not-container {
		  max-width: 767px;
		}
		@media (min-width: 576px)
				.not-container-sm, .not-container {
		  max-width: 575px;
		}
		
		#temp a {
			color:white;
		}
    </style>
</head>
<style>

</style>
<body class="color-theme-blue mont-font">
	
    <div class="preloader"></div>

    
    <div class="main-wrapper">

        <!-- navigation top-->
        <div class="nav-header bg-white shadow-xs border-0">
            <div class="nav-top">
                <a href="<c:url value="/"/>"><i class="feather-zap text-success display1-size me-2 ms-0"></i><span class="d-inline-block fredoka-font ls-3 fw-600 text-current font-xxl logo-text mb-0">HellTalk </span> </a>
                <a href="#" class="mob-menu ms-auto me-2 chat-active-btn"><i class="feather-message-circle text-grey-900 font-sm btn-round-md bg-greylight"></i></a>
                <a href="default-video.html" class="mob-menu me-2"><i class="feather-video text-grey-900 font-sm btn-round-md bg-greylight"></i></a>
                <a href="#" class="me-2 menu-search-icon mob-menu"><i class="feather-search text-grey-900 font-sm btn-round-md bg-greylight"></i></a>
                <button class="nav-menu me-0 ms-2"></button>
            </div>
            
            <form action="#" class="float-left header-search">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
                <div class="form-group mb-0 icon-input">
                    <i class="feather-search font-sm text-grey-400"></i>
                    <input type="text" placeholder="Start typing to search.." class="bg-grey border-0 lh-32 pt-2 pb-2 ps-5 pe-3 font-xssss fw-500 rounded-xl w350 theme-dark-bg">
                </div>
            </form>
            <a href="default.html" class="p-2 text-center ms-3 menu-icon center-menu-icon"><i class="feather-home font-lg alert-primary btn-round-lg theme-dark-bg text-current "></i></a>
            <a href="default-storie.html" class="p-2 text-center ms-0 menu-icon center-menu-icon"><i class="feather-zap font-lg bg-greylight btn-round-lg theme-dark-bg text-grey-500 "></i></a>
            <a href="default-video.html" class="p-2 text-center ms-0 menu-icon center-menu-icon"><i class="feather-video font-lg bg-greylight btn-round-lg theme-dark-bg text-grey-500 "></i></a>
            <a href="default-group.html" class="p-2 text-center ms-0 menu-icon center-menu-icon"><i class="feather-user font-lg bg-greylight btn-round-lg theme-dark-bg text-grey-500 "></i></a>
            <a href="<c:url value="model/shop-2.do"/>" class="p-2 text-center ms-0 menu-icon center-menu-icon"><i class="feather-shopping-bag font-lg bg-greylight btn-round-lg theme-dark-bg text-grey-500 "></i></a>

            <a href="#" class="p-2 text-center ms-auto menu-icon" id="dropdownMenu3" data-bs-toggle="dropdown" aria-expanded="false"><span class="dot-count bg-warning"></span><i class="feather-bell font-xl text-current"></i></a>
            <div class="dropdown-menu dropdown-menu-end p-4 rounded-3 border-0 shadow-lg" aria-labelledby="dropdownMenu3">
                
                <h4 class="fw-700 font-xss mb-4">Notification</h4>
                <div class="card bg-transparent-card w-100 border-0 ps-5 mb-3">
                    <img src="https://via.placeholder.com/50x50.png" alt="user" class="w40 position-absolute left-0">
                    <h5 class="font-xsss text-grey-900 mb-1 mt-0 fw-700 d-block">Hendrix Stamp <span class="text-grey-400 font-xsssss fw-600 float-right mt-1"> 3 min</span></h5>
                    <h6 class="text-grey-500 fw-500 font-xssss lh-4">There are many variations of pass..</h6>
                </div>
                <div class="card bg-transparent-card w-100 border-0 ps-5 mb-3">
                    <img src="https://via.placeholder.com/50x50.png" alt="user" class="w40 position-absolute left-0">
                    <h5 class="font-xsss text-grey-900 mb-1 mt-0 fw-700 d-block">Goria Coast <span class="text-grey-400 font-xsssss fw-600 float-right mt-1"> 2 min</span></h5>
                    <h6 class="text-grey-500 fw-500 font-xssss lh-4">Mobile Apps UI Designer is require..</h6>
                </div>

                <div class="card bg-transparent-card w-100 border-0 ps-5 mb-3">
                    <img src="https://via.placeholder.com/50x50.png" alt="user" class="w40 position-absolute left-0">
                    <h5 class="font-xsss text-grey-900 mb-1 mt-0 fw-700 d-block">Surfiya Zakir <span class="text-grey-400 font-xsssss fw-600 float-right mt-1"> 1 min</span></h5>
                    <h6 class="text-grey-500 fw-500 font-xssss lh-4">Mobile Apps UI Designer is require..</h6>
                </div>
                <div class="card bg-transparent-card w-100 border-0 ps-5">
                    <img src="https://via.placeholder.com/50x50.png" alt="user" class="w40 position-absolute left-0">
                    <h5 class="font-xsss text-grey-900 mb-1 mt-0 fw-700 d-block">Victor Exrixon <span class="text-grey-400 font-xsssss fw-600 float-right mt-1"> 30 sec</span></h5>
                    <h6 class="text-grey-500 fw-500 font-xssss lh-4">Mobile Apps UI Designer is require..</h6>
                </div>
            </div>
            <a href="#" class="p-2 text-center ms-3 menu-icon chat-active-btn"><i class="feather-message-square font-xl text-current"></i></a>
            <div class="p-2 text-center ms-3 position-relative dropdown-menu-icon menu-icon cursor-pointer">
                <i class="feather-settings animation-spin d-inline-block font-xl text-current"></i>
                <div class="dropdown-menu-settings switchcolor-wrap">
                    <h4 class="fw-700 font-sm mb-4">Settings</h4>
                    <h6 class="font-xssss text-grey-500 fw-700 mb-3 d-block">Choose Color Theme</h6>
                    <ul>
                        <li>
                            <label class="item-radio item-content">
                                <input type="radio" name="color-radio" value="red" checked=""><i class="ti-check"></i>
                                <span class="circle-color bg-red" style="background-color: #ff3b30;"></span>
                            </label>
                        </li>
                        <li>
                            <label class="item-radio item-content">
                                <input type="radio" name="color-radio" value="green"><i class="ti-check"></i>
                                <span class="circle-color bg-green" style="background-color: #4cd964;"></span>
                            </label>
                        </li>
                        <li>
                            <label class="item-radio item-content">
                                <input type="radio" name="color-radio" value="blue" checked=""><i class="ti-check"></i>
                                <span class="circle-color bg-blue" style="background-color: #132977;"></span>
                            </label>
                        </li>
                        <li>
                            <label class="item-radio item-content">
                                <input type="radio" name="color-radio" value="pink"><i class="ti-check"></i>
                                <span class="circle-color bg-pink" style="background-color: #ff2d55;"></span>
                            </label>
                        </li>
                        <li>
                            <label class="item-radio item-content">
                                <input type="radio" name="color-radio" value="yellow"><i class="ti-check"></i>
                                <span class="circle-color bg-yellow" style="background-color: #ffcc00;"></span>
                            </label>
                        </li>
                        <li>
                            <label class="item-radio item-content">
                                <input type="radio" name="color-radio" value="orange"><i class="ti-check"></i>
                                <span class="circle-color bg-orange" style="background-color: #ff9500;"></span>
                            </label>
                        </li>
                        <li>
                            <label class="item-radio item-content">
                                <input type="radio" name="color-radio" value="gray"><i class="ti-check"></i>
                                <span class="circle-color bg-gray" style="background-color: #8e8e93;"></span>
                            </label>
                        </li>

                        <li>
                            <label class="item-radio item-content">
                                <input type="radio" name="color-radio" value="brown"><i class="ti-check"></i>
                                <span class="circle-color bg-brown" style="background-color: #D2691E;"></span>
                            </label>
                        </li>
                        <li>
                            <label class="item-radio item-content">
                                <input type="radio" name="color-radio" value="darkgreen"><i class="ti-check"></i>
                                <span class="circle-color bg-darkgreen" style="background-color: #228B22;"></span>
                            </label>
                        </li>
                        <li>
                            <label class="item-radio item-content">
                                <input type="radio" name="color-radio" value="deeppink"><i class="ti-check"></i>
                                <span class="circle-color bg-deeppink" style="background-color: #FFC0CB;"></span>
                            </label>
                        </li>
                        <li>
                            <label class="item-radio item-content">
                                <input type="radio" name="color-radio" value="cadetblue"><i class="ti-check"></i>
                                <span class="circle-color bg-cadetblue" style="background-color: #5f9ea0;"></span>
                            </label>
                        </li>
                        <li>
                            <label class="item-radio item-content">
                                <input type="radio" name="color-radio" value="darkorchid"><i class="ti-check"></i>
                                <span class="circle-color bg-darkorchid" style="background-color: #9932cc;"></span>
                            </label>
                        </li>
                    </ul>
                    
                    <div class="card bg-transparent-card border-0 d-block mt-3">
                        <h4 class="d-inline font-xssss mont-font fw-700">Header Background</h4>
                        <div class="d-inline float-right mt-1">
                            <label class="toggle toggle-menu-color"><input type="checkbox"><span class="toggle-icon"></span></label>
                        </div>
                    </div>
                    <div class="card bg-transparent-card border-0 d-block mt-3">
                        <h4 class="d-inline font-xssss mont-font fw-700">Menu Position</h4>
                        <div class="d-inline float-right mt-1">
                            <label class="toggle toggle-menu"><input type="checkbox"><span class="toggle-icon"></span></label>
                        </div>
                    </div>
                    <div class="card bg-transparent-card border-0 d-block mt-3">
                        <h4 class="d-inline font-xssss mont-font fw-700">Dark Mode</h4>
                        <div class="d-inline float-right mt-1">
                            <label class="toggle toggle-dark"><input type="checkbox"><span class="toggle-icon"></span></label>
                        </div>
                    </div>
                    
                </div>
            </div>
            

            <a href="default-settings.html" class="p-0 ms-3 menu-icon"><img src="https://via.placeholder.com/50x50.png" alt="user" class="w40 mt--1"></a>
            
        </div>

        <!-- navigation top -->
        <div style="margin-top:100px"></div>
		<a href="<c:url value="/model/shop-1.do"/>" >김동진</a>
		<a href="<c:url value="/model/routine.do"/>" >진소희</a>
		<a href="<c:url value="/model"/>" >조주희</a>
		<a href="<c:url value="/model/ocr.do"/>" >함병완</a>
		<a href="<c:url value="/home.do"/>" >김성우</a>
		<a href="<c:url value="/cal/List.do"/>" >최도원</a>
		
		
		<!-- 추가이동경로 필요할경우 아래에 추가 -->
		
		<a href="<c:url value="/member/Login.do"/>" >최부건-로그인</a>
   		<a href="<c:url value="/member/CreateUser.do"/>" >최부건-회원가입</a>
   		<a href="<c:url value="/community/bbs/list"/>" >함병완-게시판</a>
   		<a href="<c:url value="/community/bbs/mypage"/>" >함병완-마이페이지</a>
   		<a href="<c:url value="/backend/admin"/>" >김동진-어드민</a>
   		<a href="<c:url value="/chat1.do"/>" >최도원채팅임시</a>
   		
   		<sec:authorize access="isAuthenticated()">
	        
	        <!--객체의 권한-->
	        <b>principal(현재 접속한 사람의 정보):<sec:authentication property="principal"/></b>
	        <b>principal(현재 접속한 사람의 id):<sec:authentication property="principal.username"/></b>
		    <form action="<c:url value="/member/Logout.do"/>" method="post">
	   			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	   			<button class="custom-btn btn-5" type="submit"><span>로그아웃</span></button>
	   		</form>
		</sec:authorize>

		<div>
		    <section class="not-container">
		        <div class="section first">
		            <div class="cont_title">
		                <h1>오우!?<br>챌린지!</h1>
		                <h3>여기야여기!</h3>
		            </div>
		            <div class="cont_desc">
		                <p>눈아파도 잠시동안만... </p>
		                <div id="temp">
			                <a href="<c:url value="/model/shop-1.do"/>">백건효</a>
							<a href="<c:url value="/model/routine.do"/>" >진소희</a>
							<a href="<c:url value="/diet/main.do"/>" >조주희</a>
							<a href="<c:url value="/model/ocr.do"/>" >함병완</a>
							<a href="<c:url value="/home.do"/>" >김성우</a>
							<a href="<c:url value="/cal/ifram.do"/>" >최도원</a>
							<a href="<c:url value="/model/Login.do"/>" >최부건-로그인</a>
							
							<!-- 추가이동경로 필요할경우 아래에 추가 -->
					   		<a href="<c:url value="/model/Register.do"/>" >최부건-회원가입</a>
					   		<a href="<c:url value="/community/bbs/list"/>" >함병완-게시판</a>
					   		<a href="<c:url value="/community/bbs/mypage"/>" >함병완-마이페이지</a>
					   		<a href="<c:url value="/backend/admin"/>" >김동진-어드민</a>
					   		<a href="<c:url value="/chat1.do"/>" >최도원채팅임시</a>
					   		<a href="<c:url value="/backend/design"/>">임시 사용자 회원가입 디자인</a>
				   		</div>
		            </div>
		        </div>
		        <div class="section">
		            <div class="cont_title">
		                <h1>여긴<br>마이페이지</h1>
		                <h3>National Park</h3>
		            </div>
		            <div class="cont_desc">
		                <p>Rappel into a crevasse, kayak through icebergs, and watch a glacier recede.</p>
		            </div>
		        </div>
		        <div class="section">
		            <div class="cont_title">
		                <h1>마지막으로<br>커뮤니티</h1>
		                <h3>National Park</h3>
		            </div>
		            <div class="cont_desc">
		                <p>Rappel into a crevasse, kayak through icebergs, and watch a glacier recede.</p>
		            </div>
		        </div>
		    </section>
		</div>
   
   
   
   



    <script src="${path}/resources/js/plugin.js"></script>
    <script src="${path}/resources/js/lightbox.js"></script>
    <script src="${path}/resources/js/scripts.js"></script>

    
</body>

</html>