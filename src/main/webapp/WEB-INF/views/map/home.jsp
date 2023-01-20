<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sociala - Social Network App HTML Template </title>

    <link rel="stylesheet" href="resources/css/themify-icons.css">
    <link rel="stylesheet" href="resources/css/feather.css">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
    <!-- Custom Stylesheet -->
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/emoji.css">
    
    <link rel="stylesheet" href="resources/css/lightbox.css">

</head>
<style>
div h1 a{
color:white;
}

</style>
<body class="color-theme-blue mont-font">

    <div class="preloader"></div>

    <div class="items-container">   
    

        <!-- navigation top-->
        <div class="nav-header bg-white shadow-xs border-0">
            <div class="nav-top">
                <a href="default.html"><i class="feather-zap text-success display1-size me-2 ms-0"></i><span class="d-inline-block fredoka-font ls-3 fw-600 text-current font-xxl logo-text mb-0">HellTalk </span> </a>
                <a href="#" class="mob-menu ms-auto me-2 chat-active-btn"><i class="feather-message-circle text-grey-900 font-sm btn-round-md bg-greylight"></i></a>
                <a href="default-video.html" class="mob-menu me-2"><i class="feather-video text-grey-900 font-sm btn-round-md bg-greylight"></i></a>
                <a href="#" class="me-2 menu-search-icon mob-menu"><i class="feather-search text-grey-900 font-sm btn-round-md bg-greylight"></i></a>
                <button class="nav-menu me-0 ms-2"></button>
            </div>
            
            <form action="#" class="float-left header-search">
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
            <!-- Notification -->
            <div class="dropdown-menu dropdown-menu-end p-4 rounded-3 border-0 shadow-lg" aria-labelledby="dropdownMenu3"></div>
                
                
            <!-- Message -->
            <a href="#" class="p-2 text-center ms-3 menu-icon chat-active-btn"><i class="feather-message-square font-xl text-current"></i></a>
            <div class="p-2 text-center ms-3 position-relative dropdown-menu-icon menu-icon cursor-pointer">
                <i class="feather-settings animation-spin d-inline-block font-xl text-current"></i>
                <div class="dropdown-menu-settings switchcolor-wrap"> </div>
            </div>
            

            <a href="default-settings.html" class="p-0 ms-3 menu-icon"><img src="https://via.placeholder.com/50x50.png" alt="user" class="w40 mt--1"></a>
          </div>
          
           </div> 
       
        <!-- navigation top -->
        
     
        
        
     
        
        
       
       <div class="item" style="background-Color:gray; height:300px;" >
		        <br><br><br><br><br><br>
		        
		        <h1><a href="<c:url value="/androidDB.do"/>" >AndroidDB</a></h1>
		        
		        <h1><a href="<c:url value="/address.do"/>" >map1</a></h1>
		        
				<h1><a href="<c:url value="/address2.do"/>" >map2</a></h1>
				
				<form action="/login" method="post">
					
					
					<ul>
						<input type="button" onclick="javascript:fblogout();" value ="로그아웃" />
						<div id="status"/>
					</ul>
					<br>
						<div
						  class="fb-like" data-share="true" data-width="450" data-show-faces="true">
						</div>
				</form>
			</div>
       
       
   
        
        
        
        	
		
		
		
   
   
   
   
   	<!-- facebook login api -->


		   
	<script async defer crossorigin="anonymous" src="https://connect.facebook.net/es_LA/sdk.js"></script> 
	<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v10.0&appId=538226158336285" nonce="SiOBIhLG"></script>	   
  
  <script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '538226158336285',
      cookie     : true,  // enable cookies to allow the server to access  the session
      xfbml      : true,  // parse social plugins on this page
      version    : 'v3.0' // use graph api version 2.8
    });
      
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });  
      
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "https://connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));

 
    /*
     콜백에 제공되는 response 개체에는 다음과 같은 여러 필드가 포함되어 있습니다.
    {
        status: 'connected',
        authResponse: {
            accessToken: '...',
            expiresIn:'...',
            signedRequest:'...',
            userID:'...'
        }
    }코드 복사
    status는 앱 사용자의 로그인 상태를 지정합니다. 상태는 다음 중 하나일 수 있습니다.
    connected - 사용자가 Facebook에 로그인하고 앱에 로그인했습니다.
    not_authorized - 사용자가 Facebook에는 로그인했지만 앱에는 로그인하지 않았습니다.
    unknown - 사용자가 Facebook에 로그인하지 않았으므로 사용자가 앱에 로그인했거나 FB.logout()이 호출되었는지 알 수 없어, 
Facebook에 연결할 수 없습니다.
    connected 상태인 경우 authResponse가 포함되며 다음과 같이 구성되어 있습니다.
    accessToken - 앱 사용자의 액세스 토큰이 포함되어 있습니다.
    expiresIn - 토큰이 만료되어 갱신해야 하는 UNIX 시간을 표시합니다.
    signedRequest - 앱 사용자에 대한 정보를 포함하는 서명된 매개변수입니다.
    userID - 앱 사용자의 ID입니다.
    앱에서 앱 사용자의 로그인 상태를 알게 되면 다음 중 하나를 수행할 수 있습니다.
    사용자가 Facebook과 앱에 로그인한 경우 앱의 로그인된 환경으로 리디렉션됩니다.
    사용자가 앱에 로그인하지 않았거나 Facebook에 로그인하지 않은 경우 FB.login()을 사용하여 로그인 대화 상자에 메시지를 
표시하거나 로그인 버튼을 표시합니다.
        */ 
   function statusChangeCallback(response) {
    
      console.log('statusChangeCallback');

      if (response.status === 'connected') {
        console.log(response.authResponse.accessToken);
        // Logged into your app and Facebook.
        testAPI();
      } else if (response.status === 'not_authorized') {
        document.getElementById('status').innerHTML = 'Please log ' + 'into this app.';
      } else {
        document.getElementById('status').innerHTML = 'Please log ' + 'into Facebook.';
      }

  }

function checkLoginState() {
  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });
}
  
//아래는 로그인정보 id,name,email 가져오가기  
function testAPI() {
  console.log('Welcome!  Fetching your information.... ');
  FB.api(
    '/me',
    {"fields":"id,name,email"},
    function(response) {
       // Insert your code here
      console.log('Successful login for: ' + response.name);

      document.getElementById('status').innerHTML = JSON.stringify(response);
    }
  );
}

function fblogout(){

  FB.logout(function(response) {
    window.location.reload();
  });
}

</script>

<fb:login-button scope="public_profile,email" onlogin="checkLoginState();"></fb:login-button>
  
  
  
  
  
  
  
  
  
  
  
  


    <script src="resources/js/plugin.js"></script>
    <script src="resources/js/lightbox.js"></script>
    <script src="resources/js/scripts.js"></script>

    
</body>

</html>