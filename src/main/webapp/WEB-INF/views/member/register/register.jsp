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

    <link rel="stylesheet" href="${path}css/themify-icons.css">
    <link rel="stylesheet" href="${path}css/feather.css">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${path}images/favicon.png">
    <!-- Custom Stylesheet -->
    <link rel="stylesheet" href="${path}css/style.css"> 
    
	<link rel="stylesheet" href="${path}assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="${path}assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
	<link rel="stylesheet" href="${path}assets/vendor/fonts/boxicons.css" />

<style>
.radio-img  > input { 
  display:none;
}

.radio-img  > img{
  cursor:pointer;
  border:2px solid transparent;
  width:100px; height:100px;
  margin:50px;
  margin-top:10px;
  margin-bottom:5px;
  display:block;
}

.radio-img  > input:checked + img{ 
  	border:4px solid #899ef0;
  	background-color: #e1f4ce;
}

.favicon{
   	margin: 0px;
   	width: 50px;
   	height: 50px;
   	margin-right: 12px;
}

</style>
	
</head>

<body class="color-theme-orange">

    <div class="preloader"></div>

    <div class="main-wrap">

        <div class="nav-header bg-transparent shadow-none border-0">
            <div class="nav-top">
                <a href="<c:url value="/"/>"><img src="${path}images/favicon.png" class="favicon"><span class="d-inline-block fredoka-font ls-3 fw-600 text-current font-xxl logo-text mb-0">HellTalk </span> </a>
                <a href="#" class="mob-menu ms-auto me-2 chat-active-btn"><i class="feather-message-circle text-grey-900 font-sm btn-round-md bg-greylight"></i></a>
                <a href="default-video.html" class="mob-menu me-2"><i class="feather-video text-grey-900 font-sm btn-round-md bg-greylight"></i></a>
                <a href="#" class="me-2 menu-search-icon mob-menu"><i class="feather-search text-grey-900 font-sm btn-round-md bg-greylight"></i></a>
                <button class="nav-menu me-0 ms-2"></button>
            </div>
            
            
        </div>

        <div class="row">
            <div class="col-xl-5 d-none d-xl-block p-0 vh-100 bg-image-cover bg-no-repeat" style="background-image: url(${path}images/gym.png);"></div>
            <div class="col-xl-7 vh-100 align-items-center d-flex bg-white rounded-3 overflow-hidden">
                <div class="card shadow-none border-0 ms-auto me-auto login-card">
                    <div class="card-body rounded-0 text-left" style="width:600px">
                        <h2 class="fw-700 display1-size display2-md-size mb-4">Create <br>your account</h2>   
                        
                                             
                        <form action="<c:url value="/member/register.do"/>" method="post">
                        	<div class="first">
                        		<h4 class="mt-2">성별을 선택하여 주세요</h4>
	                           	<div class="form-check-inline">
		                          <label class="radio-img">
								    <input type="radio" name="u_gender" value="M" />
								    <img src="${path}images/free-icon-trainer-3597951.png" title="제작자: Eucalyp - Flaticon">
								   <h5>남성</h5>
								  </label>
                          		</div>
		                        <div class="form-check-inline">
		                          <label class="radio-img">
								    <input type="radio" name="u_gender" value="F"/>
								    <img src="${path}images/free-icon-aerobics-3604152.png" title="제작자: Eucalyp - Flaticon">
								   <h5>여성</h5> 
								  </label>
		                        </div>
		                        
		                        <h4 class="mt-3 mb-1">가입할 회원유형</h4>
		                        <div class="form-check-inline">
	                              <label class="radio-img">
								    <input type="radio" name="u_kind" value="ROLE_USER"/>
								    <img src="${path}images/free-icon-trainer-4080026.png" title="제작자: Eucalyp - Flaticon">
								    <h5>일반회원</h5>	
								  </label>
                          		</div>
		                        <div class="form-check-inline mb-2">
		                          <label class="radio-img">
								    <input type="radio" name="u_kind" value="ROLE_TN"/>
								    <img src="${path}images/free-icon-trainer-2860987.png" title="제작자: Eucalyp - Flaticon">
								    <h5>트레이너</h5>
								  </label>
		                        </div>
	                    		
	              		        <div class="mb-3">
			                        <label for="html5-date-input" class="col-md-2 col-form-label"><h4>생년월일</h4></label>
			                        <div class="col-md-10">
			                          <input class="form-control" type="date" min="1950-01-01" max="9999-12-31" name="u_birth"/>
			                        </div>
			                    </div>
	                    		
		                        <div class="col-sm-12 p-0 text-left">
		                            <div class="form-group mb-1 mt-1" id="nextbtn"><a href="#" class="nextbtn form-control text-center style2-input text-white fw-600 bg-dark border-0 p-0 ">다음</a></div>
		                            <h6 class="text-grey-500 font-xsss fw-500 mt-0 mb-0 lh-32">Already have account <a href="<c:url value="/member/Login.do"/>" class="fw-700 ms-1">Login</a></h6>
		                        </div>
		                    </div>
		                    <div class="second " style="display:none">
		                    <c:if test="${id == null}">
		                    	<div class="form-group form-floating">
			                        <input type="text" class="form-control" name="u_email" placeholder="예:helltalk@email.com" aria-describedby="emailError"/>
			                        <label for="userEmail"><i class="font-sm ti-email text-grey-500 pe-0"></i>&nbsp;&nbsp;이메일</label>
			                        <div id="emailError" class="form-text" style="color: red;"></div>
			                    </div>
	                            <div class="form-group form-floating">
			                        <input type="password" class="form-control" name="u_pwd" placeholder="비밀번호는 영문자와 숫자 그리고 특수문자가 포함되어야 하며 8자 이상" aria-describedby="pwdError"/>
			                        <label for="userPwd"><i class="font-sm ti-lock text-grey-500 pe-0"></i>&nbsp;&nbsp;비밀번호</label>
			                        <div id="pwdError" class="form-text" style="color: red;"></div>
			                    </div>
			                  	<div class="form-group form-floating">
			                        <input type="text" class="form-control" name="u_nickname" placeholder="사용할 이름" aria-describedby="nameError"/>
			                        <label for="userName"><i class="font-sm bx bx-face text-grey-500 pe-0"></i>&nbsp;&nbsp;닉네임</label>
			                        <div id="nicknameError" class="form-text" style="color: red;"></div>
			                    </div>
			       			</c:if>
			       			
			       			
			                    <div class="form-group form-floating">
			                        <input type="text" class="form-control" name="u_phoneno" placeholder="예:010-1234-1234" aria-describedby="phoneError"/>
			                        <label for="userPhone"><i class="font-sm bx bx-phone text-grey-500 pe-0"></i>&nbsp;&nbsp;전화번호</label>
			                        <div id="phoneError" class="form-text" style="color: red;"></div>
			                    </div>
			                    
			                    <div class="form-group form-floating">
			                        <input type="number" class="form-control" name="u_height" placeholder="단위:cm" aria-describedby="heightError"/>
			                        <label for="userPhone"><i class="font-sm bx bx-ruler text-grey-500 pe-0"></i>&nbsp;&nbsp;신장</label>
			                        <div id="heightError" class="form-text" style="color: red;"></div>
			                    </div>
			                    
			                    <div class="form-group form-floating">
			                        <input type="text" class="form-control" name="u_weight" placeholder="단위:kg" aria-describedby="weightError"/>
			                        <label for="userPhone"><i class="font-sm bx bx-street-view text-grey-500 pe-0"></i>&nbsp;&nbsp;몸무게</label>
			                        <div id="weightError" class="form-text" style="color: red;"></div>
			                    </div>
			                    
					            <div class="col-sm-12 p-0 text-left">
		                            <div class="form-group mb-1 mt-1 row">
		                            	<div class="col" id="beforebtn"><a href="#" class="form-control text-center style2-input text-white fw-600 bg-dark border-0 p-0 ">이전</a></div>
		                            	<div class="col" id="submitbtn"><input type="submit" class="btn form-control text-center style2-input text-white fw-600 bg-dark border-0 p-0 " value="회원가입"/></div>
		                            	
		                            </div>
		                            	<input type="hidden" name="u_status" value="1">
		                           	<c:if test="${id != null}">
			                            <input type="hidden" name="u_email" value="${email}">
			                            <input type="hidden" name="u_nickname" value="${nickname}">
		                            </c:if>
		                            <input type="hidden" name="u_kakao" value="${id}">
		                    		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		                            <h6 class="text-grey-500 font-xsss fw-500 mt-0 mb-0 lh-32">Already have account <a href="<c:url value="/member/Login.do"/>" class="fw-700 ms-1">Login</a></h6>
		                        </div>
		                    </div>
                        </form>
                    </div>
                </div> 
            </div>
        </div>
    </div>



    <script src="${path}js/plugin.js"></script>
    <script src="${path}js/scripts.js"></script>
    <script src="${path}js/vaildation.js"></script>
	<script>
		
		//이전버튼
		$('#beforebtn').on('click',function(){
			$('.second').fadeOut(function(){
				$('.first').fadeIn();
			});
		})
		
		
	
	</script>    