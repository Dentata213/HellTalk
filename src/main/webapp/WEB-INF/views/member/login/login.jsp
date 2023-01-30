<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
   	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>로그인</title>
	<link rel="stylesheet" href="${path}/resources/css/themify-icons.css">
    <link rel="stylesheet" href="${path}/resources/css/feather.css">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${path}/resources/images/favicon.png">
    <!-- Custom Stylesheet -->
    <link rel="stylesheet" href="${path}/resources/css/style.css">
    
<style>
   	button {
  		margin: 10px;
  		margin-left: 250px;
	}

	.custom-btn {
	  
	  color: #fff;
	  border-radius: 5px;
	  padding: 10px;
	  font-family: 'Lato', sans-serif;
	  font-weight: 500;
	  background: transparent;
	  cursor: pointer;
	  transition: all 0.3s ease;
	  position: relative;
	  display: inline-block;
	   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
	   7px 7px 20px 0px rgba(0,0,0,.1),
	   4px 4px 5px 0px rgba(0,0,0,.1);
	  outline: none;
	}
	
	/* 5 */
.btn-5 {
	  width: 130px;
	  height: 40px;
	  line-height: 42px;
	  padding :0;
	  border: none;
	  background: rgb(255,27,0);
	background: linear-gradient(0deg, rgba(255,27,0,1) 0%, rgba(251,75,2,1) 100%);
	}
	.btn-5:hover {
	  color: #f0094a;
	  background: transparent;
	   box-shadow:none;
	}
	.btn-5:before,
	.btn-5:after{
	  content:'';
	  position:absolute;
	  top:0;
	  right:0;
	  height:2px;
	  width:0;
	  background: #f0094a;
	  box-shadow:
	   -1px -1px 5px 0px #fff,
	   7px 7px 20px 0px #0003,
	   4px 4px 5px 0px #0002;
	  transition:400ms ease all;
	}
	.btn-5:after{
	  right:inherit;
	  top:inherit;
	  left:0;
	  bottom:0;
	}
	.btn-5:hover:before,
	.btn-5:hover:after{
	  width:100%;
	  transition:800ms ease all;
	}
   
   
</style>
</head>


<body class="color-theme-blue">

    <div class="preloader"></div>

    <div class="main-wrap">

        <div class="nav-header bg-transparent shadow-none border-0">
            <div class="nav-top">
                <a href="${path}"><i class="feather-zap text-success display1-size me-2 ms-0"></i><span class="d-inline-block fredoka-font ls-3 fw-600 text-current font-xxl logo-text mb-0">HellTalk</span> </a>
            </div>
        </div>

        <div class="row">
            <div class="col-xl-5 d-none d-xl-block p-0 vh-100 bg-image-cover bg-no-repeat" style="background-image: url(${path}/resources/images/woman-running.png);"></div>
            <div class="col-xl-7 vh-100 align-items-center d-flex bg-white rounded-3 overflow-hidden">
                <div class="card shadow-none border-0 ms-auto me-auto login-card">
                    <div class="card-body rounded-0 text-left">
	                    <!-- 로그인 실패시 시큐리티는 SPRING_SECURITY_LAST_EXCEPTION 라는 키값을 세션에 저장
	                	<c:if test="${! empty SPRING_SECURITY_LAST_EXCEPTION}">
	                		<font color="red">
							  <strong>로그인 실패!!</strong> ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
							</font>
							<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session" />
							<!-- 예외를 계속 세션에 저장하면 WAS에 과부하, remove 태그로 세션 영역에 에러 메세지를 지워준다. 
						</c:if>
						-->
						<c:if test="${! empty LoginFailMessage}">
	                		<font color="red">
							  <strong>로그인 실패!!</strong> <br>${LoginFailMessage}
							</font>
						</c:if>
                        <h2 class="fw-700 display1-size display2-md-size mb-3">Login into <br>your account</h2>
                        
                        <form action="<c:url value="/member/LoginProcess.do"/>" method="post">
                        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <div class="form-group icon-input mb-3">
                                <i class="font-sm ti-email text-grey-500 pe-0"></i>
                                <input type="text" class="style2-input ps-5 form-control text-grey-900 font-xsss fw-600" placeholder="이메일 입력" name="id">                        
                            </div>
                            <div class="form-group icon-input mb-1">
                                <input type="Password" class="style2-input ps-5 form-control text-grey-900 font-xss ls-3" placeholder="비밀번호 입력" name="pwd">
                                <i class="font-sm ti-lock text-grey-500 pe-0"></i>
                            </div>
                            <div class="form-check text-left mb-3">
                                <input type="checkbox" class="form-check-input mt-2" id="exampleCheck1">
                                <label class="form-check-label font-xsss text-grey-500" for="exampleCheck1">아이디 저장</label>
                                <a href="forgot.html" class="fw-600 font-xsss text-grey-700 mt-1 float-right">비밀번호를 있으셨나요?</a>
                            </div>
                           <button class="custom-btn btn-5" type="submit"><span>로그인</span></button>
                        </form>
                         
                        <div class="col-sm-12 p-0 text-left">
                            <h6 class="text-grey-500 font-xsss fw-500 mt-0 mb-0 lh-32">계정이 아직 없으신가요? <a href="<c:url value="/member/CreateUser.do"/>" class="fw-700 ms-1">회원가입</a></h6>
                        </div>
                        
                        <div class="col-sm-12 p-0 text-center mt-2">
                            
                            <h6 class="mb-0 d-inline-block bg-white fw-500 font-xsss text-grey-500 mb-3">Or, Sign in with your social account </h6>
                            <div class="form-group mb-1"><a href="#" class="form-control text-left style2-input text-kakao fw-600 bg-kakao border-0 p-0 mb-2"><img src="${path}/resources/images/kakao_login.png" alt="icon" class="ms-2 w40 mb-1 me-5"> Sign in with Kakao</a></div>
                            <div class="form-group mb-1"><a href="#" class="form-control text-left style2-input text-white fw-600 bg-facebook border-0 p-0 mb-2"><img src="${path}/resources/images/icon-1.png" alt="icon" class="ms-2 w40 mb-1 me-5"> Sign in with Google</a></div>
                            <div class="form-group mb-1"><a href="#" class="form-control text-left style2-input text-white fw-600 bg-twiiter border-0 p-0 "><img src="${path}/resources/images/icon-3.png" alt="icon" class="ms-2 w40 mb-1 me-5"> Sign in with Facebook</a></div>
                        </div>
                    </div>
                </div> 
            </div>
        </div>
    </div>

    <script src="${path}/resources/js/plugin.js"></script>
    <script src="${path}/resources/js/scripts.js"></script>
    
</body>
</html>