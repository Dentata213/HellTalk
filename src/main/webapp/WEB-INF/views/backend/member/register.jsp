<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}/resources/"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>HellTalk - HellTalk for Everyone!</title>

    <link rel="stylesheet" href="${path}/css/themify-icons.css">
    <link rel="stylesheet" href="${path}/css/feather.css">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${path}/images/favicon.png">
    <!-- Custom Stylesheet -->
    <link rel="stylesheet" href="${path}/css/style.css"> 
    
	<link rel="stylesheet" href="${path}assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="${path}assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
	<link rel="stylesheet" href="${path}assets/vendor/fonts/boxicons.css" />


</head>

<body class="color-theme-blue">

    <div class="preloader"></div>

    <div class="main-wrap">

        <div class="nav-header bg-transparent shadow-none border-0">
            <div class="nav-top">
                <a href="<c:url value="/"/>"><i class="feather-zap text-success display1-size me-2 ms-0"></i><span class="d-inline-block fredoka-font ls-3 fw-600 text-current font-xxl logo-text mb-0">HellTalk </span> </a>
                <a href="#" class="mob-menu ms-auto me-2 chat-active-btn"><i class="feather-message-circle text-grey-900 font-sm btn-round-md bg-greylight"></i></a>
                <a href="default-video.html" class="mob-menu me-2"><i class="feather-video text-grey-900 font-sm btn-round-md bg-greylight"></i></a>
                <a href="#" class="me-2 menu-search-icon mob-menu"><i class="feather-search text-grey-900 font-sm btn-round-md bg-greylight"></i></a>
                <button class="nav-menu me-0 ms-2"></button>

            </div>
            
            
        </div>

        <div class="row">
            <div class="col-xl-5 d-none d-xl-block p-0 vh-100 bg-image-cover bg-no-repeat" style="background-image: url(https://via.placeholder.com/800x950.png);"></div>
            <div class="col-xl-7 vh-100 align-items-center d-flex bg-white rounded-3 overflow-hidden">
                <div class="card shadow-none border-0 ms-auto me-auto login-card">
                    <div class="card-body rounded-0 text-left" style="width:400px">
                        <h2 class="fw-700 display1-size display2-md-size mb-4">Create <br>your account</h2>                        
                        <form>
                        	<div class="first">
                        		<h4 class="mt-2">성별</h4>
                       	
	                           	<div class="form-check-inline">
		                            <input name="default-radio-1" class="form-check-input" type="radio" value="" id="defaultRadio1"/>
		                            <label class="form-check-label" for="defaultRadio1"> 남성 </label>
                          		</div>
		                        <div class="form-check-inline">
		                            <input name="default-radio-1" class="form-check-input" type="radio" value="" id="defaultRadio2"/>
		                            <label class="form-check-label" for="defaultRadio2"> 여성 </label>
		                        </div>
		                        
		                        <h4 class="mt-2">가입할 회원유형</h4>
		                 
		                        <div class="form-check-inline">
		                            <input name="default-radio-2" class="form-check-input" type="radio" value="" id="defaultRadio3"/>
		                            <label class="form-check-label" for="defaultRadio3"> 일반 </label>
                          		</div>
		                        <div class="form-check-inline">
		                            <input name="default-radio-2" class="form-check-input" type="radio" value="" id="defaultRadio4"/>
		                            <label class="form-check-label" for="defaultRadio4"> 트레이너 </label>
		                        </div>
	                    
		                        <div class="col-sm-12 p-0 text-left">
		                            <div class="form-group mb-1 mt-1" id="nextbtn"><a href="#" class="form-control text-center style2-input text-white fw-600 bg-dark border-0 p-0 ">다음</a></div>
		                            <h6 class="text-grey-500 font-xsss fw-500 mt-0 mb-0 lh-32">Already have account <a href="login.html" class="fw-700 ms-1">Login</a></h6>
		                        </div>
		                    </div>
		                    <div class="second " style="display:none">
								 <div class="form-group form-floating">
			                        <input type="text" class="form-control" id="userId" placeholder="아이디" aria-describedby="idError"/>
			                        <label for="userId"><i class="font-sm ti-user text-grey-500 pe-0"></i>&nbsp;&nbsp;아이디</label>
			                        <div id="idError" class="form-text">여기에 에러 출력하면되나</div>
			                    </div>
	                            <div class="form-group form-floating">
			                        <input type="password" class="form-control" id="userPwd" placeholder="비밀번호" aria-describedby="pwdError"/>
			                        <label for="userPwd"><i class="font-sm ti-lock text-grey-500 pe-0"></i>&nbsp;&nbsp;비밀번호</label>
			                        <div id="pwdError" class="form-text">여기에 에러 출력하면되나</div>
			                    </div>
			                    <div class="form-group form-floating">
			                        <input type="password" class="form-control" id="userPwdConfirm" placeholder="비밀번호 확인" aria-describedby="pwdConfirmError"/>
			                        <label for="userPwdConfirm"><i class="font-sm ti-lock text-grey-500 pe-0"></i>&nbsp;&nbsp;비밀번호 확인</label>
			                        <div id="pwdConfirmError" class="form-text">여기에 에러 출력하면되나</div>
			                    </div>
			                  	<div class="form-group form-floating">
			                        <input type="text" class="form-control" id="userName" placeholder="사용할 이름" aria-describedby="nameError"/>
			                        <label for="userName"><i class="font-sm bx bx-face text-grey-500 pe-0"></i>&nbsp;&nbsp;닉네임</label>
			                        <div id="nameError" class="form-text">여기에 에러 출력하면되나</div>
			                    </div>
			           			<div class="form-group form-floating">
			                        <input type="text" class="form-control" id="userEmail" placeholder="example123@gmail.com" aria-describedby="emailError"/>
			                        <label for="userEmail"><i class="font-sm ti-email text-grey-500 pe-0"></i>&nbsp;&nbsp;메일</label>
			                        <div id="emailError" class="form-text">여기에 에러 출력하면되나</div>
			                    </div>
			                    <div class="form-group form-floating">
			                        <input type="text" class="form-control" id="userPhone" placeholder="000-0000-0000" aria-describedby="phoneError"/>
			                        <label for="userPhone"><i class="font-sm bx bx-phone text-grey-500 pe-0"></i>&nbsp;&nbsp;전화번호</label>
			                        <div id="phoneError" class="form-text">여기에 에러 출력하면되나</div>
			                    </div>
			                    
					            <div class="col-sm-12 p-0 text-left">
		                            <div class="form-group mb-1 mt-1 row">
		                            	<div class="col" id="beforebtn"><a href="#" class="form-control text-center style2-input text-white fw-600 bg-dark border-0 p-0 ">이전</a></div>
		                            	<div class="col" id="submitbtn"><a href="#" class="form-control text-center style2-input text-white fw-600 bg-dark border-0 p-0 ">회원가입</a></div>
		                            </div>
		                            <h6 class="text-grey-500 font-xsss fw-500 mt-0 mb-0 lh-32">Already have account <a href="login.html" class="fw-700 ms-1">Login</a></h6>
		                        </div>
		                    </div>
                        </form>
                    </div>
                </div> 
            </div>
        </div>
    </div>



    <script src="${path}/js/plugin.js"></script>
    <script src="${path}/js/scripts.js"></script>
	<script>
		//다음버튼
		$('#nextbtn').on('click',function(){
			$('.first').fadeOut(function(){
				$('.second').fadeIn();
			});
		})
		//이전버튼
		$('#beforebtn').on('click',function(){
			$('.second').fadeOut(function(){
				$('.first').fadeIn();
			});
		})
		
		//회원가입버튼
		
	
	</script>    
