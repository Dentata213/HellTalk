<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	<link rel="stylesheet" href="${path}/resources/css/themify-icons.css">
    <link rel="stylesheet" href="${path}/resources/css/feather.css">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${path}/resources/images/favicon.png">
    <!-- Custom Stylesheet -->
    <link rel="stylesheet" href="${path}/resources/css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
<style>

	* {
  margin: 0px;
  padding: 0px;
  text-decoration: none;
  font-family: 'Dongle', sans-serif;
  font-size: 30px;

}


h4{
  margin-bottom: 40px;
}


body {
  background-image:#34495e;
}

.joinForm {
  position:absolute;
  width:50%;
  height:40%;
  padding: 30px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  top:40%;
  left:50%;
  transform: translate(-50%,-50%);
  border-radius: 15px;
}

.joinForm h2 {
  text-align: center;
  margin: 30px;
}

.textForm {
  border-bottom: 2px solid #adadad;
  margin: 2px;
  padding: 2px 2px;
}


.id {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:30px;
  height:25px;
  background: none;
}

.pw {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:30px;
  height:25px;
  background: none;
}

.name {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:30px;
  height:25px;
  background: none;
}

.email {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:30px;
  height:25px;
  background: none;
}

.nickname {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:30px;
  height:25px;
  background: none;
}

.cellphoneNo {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:30px;
  height:25px;
  background: none;
}

.height {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:30px;
  height:25px;
  background: none;
}

.weight {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:30px;
  height:25px;
  background: none;
}

.btn {
  position:relative;
  width:80%;
  height:60px;
  background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
  background-position: left;
  background-size: 200%;
  color:white;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
  text-align: center;
  margin-bottom: 20px;
}

.btn:hover {
  background-position: right;
}

.radio-img  > input { 
  display:none;
}

.radio-img  > img{
  cursor:pointer;
  border:2px solid transparent;
  width:140px; height:140px;
  margin:50px;
  margin-top:10px;
  margin-bottom:0px;
  display:block;
}

.radio-img  > input:checked + img{ 
  	border:4px solid #899ef0;
  	background-color: #e1f4ce;
}
</style>


</head>
<body class="color-theme-blue">
	<div class="preloader"></div>

    <div class="main-wrap">	
	<div class="nav-header bg-transparent shadow-none border-0">
	      <div class="nav-top">
	          <a href="${path}"><i class="feather-zap text-success display1-size me-2 ms-0"></i><span class="d-inline-block fredoka-font ls-3 fw-600 text-current font-xxl logo-text mb-0">HellTalk</span></a>
	      </div>
	    </div>
	</div>

	<form action="<c:url value="/register.do"/>" method="post" class="joinForm">
	  <h1>HellTalk에 오신것을 환영합니다.</h1>
	  <h4 class="text-grey-500">혹은 이미 계정이 있으신가요?? <a href="<c:url value="/model/Login.do"/>" class="fw-700 ms-1">로그인하러 가기</a></h4> 
	                                                              
      <h3>성별을 선택하여 주세요</h3>
      <label class="radio-img">
	    <input type="radio" name="u_gender" value="M" />
	    <img src="${path}/resources/images/free-icon-trainer-3597951.png" title="제작자: Eucalyp - Flaticon">
	    <h3>남성</h3>
	  </label>
	  
	  <label class="radio-img">
	    <input type="radio" name="u_gender" value="F"/>
	    <img src="${path}/resources/images/free-icon-aerobics-3604152.png" title="제작자: Eucalyp - Flaticon">
	    <h3>여성</h3>
	  </label>
	  <br>
	  <label>
		생년월일을 선택해주세요: <input type="date" name="u_birth" min="1950-01-01" max="9999-12-31">
	 </label>
	  
      <div class="textForm">
        <input name="u_id" type="text" class="id" placeholder="아이디 (아이디는 영문자와 숫자 그리고 특수문자가 포함되어야 하며 8자 이상)">
      </div>
      <div class="textForm">
        <input name="u_pwd" type="password" class="pw" placeholder="비밀번호">
      </div>
      <div class="textForm">
        <input name="u_nickname" type="text" class="name" placeholder="닉네임">
      </div>
       <div class="textForm">
        <input name="u_email" type="text" class="email" placeholder="이메일 (예:helltalk@naver.com)">
      </div>
      <div class="textForm">
        <input name="u_phoneno" type="text" class="cellphoneNo" placeholder="전화번호 (예:010-1234-1234)">
      </div>
      <div class="textForm">
        <input name="u_height" type="text" class="height" placeholder="신장 (단위:cm)">
      </div>
      <div class="textForm">
        <input name="u_weight" type="text" class="weight" placeholder="몸무게 (단위:kg)">
      </div>
      
      <h3>일반회원 또는 트레이너로 가입</h3>
      <label class="radio-img">
	    <input type="radio" name="u_kind" value="1"/>
	    <img src="${path}/resources/images/free-icon-trainer-4080026.png" title="제작자: Eucalyp - Flaticon">
	    <h3>일반회원</h3>
	  </label>
	  
	  <label class="radio-img">
	    <input type="radio" name="u_kind" value="2"/>
	    <img src="${path}/resources/images/free-icon-trainer-2860987.png" title="제작자: Eucalyp - Flaticon">
	    <h3>트레이너</h3>
	  </label>
	  <input type="hidden" name="u_status" value="Y">
      <input type="submit" class="btn" value="회원가입"/>
		
    </form>	
    
    
    <script src="${path}/resources/js/plugin.js"></script>
    <script src="${path}/resources/js/scripts.js"></script>
    <script src="${path}/resources/js/vaildation.js"></script>
</body>
</html>