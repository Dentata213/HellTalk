<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
 
  <!-- main content -->
 <div class="main-content right-chat-active">     
<div class="middle-sidebar-bottom">
    <div class="middle-sidebar-left ps-0 pe-lg-3 me-0 ms-0" style="max-width: 100%;">
<div class="row">
    <div class="col-lg-12 position-relative">
     <div class="chat-wrapper pt-0 w-100 position-relative scroll-bar bg-white theme-dark-bg">
         <div  class="chat-body p-3 " >
             <div id="chatArea"   class="messages-content pb-5" >                                            
               
  <!--여기가 받은메시지-->
               <c:forEach var="chatmsg" items="${chatList}" varStatus="loop">
        		<c:if test="${uemail != chatmsg.u_email}">
                 <div class="message-item" id="chatMessage" >
                 <input name="mno" class="mno" value="${chatmsg.mno}" hidden />
                     <div class="message-user" >
                         <figure class="avatar">
                             <img src="https://via.placeholder.com/50x50.png" alt="image">
                         </figure>
                         <div >           
                             <h5>${chatmsg.u_nickname}</h5>
                             <div class="time">${chatmsg.time}</div>
                         </div>
                     </div>
                     <div class="message-wrap" >${chatmsg.message}</div>
                 	</div>
        			</c:if>      
           	</c:forEach>     
        
 <!-- 여기가 보내는 메시지 -->
        <c:forEach var="chatmsg" items="${chatList}" varStatus="loop">
        <c:if test="${ uemail == chatmsg.u_email}">
                 <div class="message-item outgoing-message" >
                 <input name="mno" class="mno" value="${chatmsg.mno}" hidden />
                     <div class="message-user">
                         <figure class="avatar">
                             <img src="https://via.placeholder.com/50x50.png" alt="image">
                         </figure>
                         <div>
                             <h5>${chatmsg.u_nickname}</h5>
                             <div class="time">${chatmsg.time}<i class="ti-double-check text-info"></i></div>
                         </div>
                     </div>
                     <div class="message-wrap">${chatmsg.message}</div>
                 </div>       
        </c:if>      
           </c:forEach>     
                 <div class="clearfix">요밑으로 잡아야겟군</div>
             
             </div>
       </div>
   </div>
      <div class="chat-bottom dark-bg p-3 shadow-none theme-dark-bg" style="width: 98%;">
                <form class="chat-form">                  
		<div class="bg-grey text1">
			<input type="text" class="form-control" id="message" placeholder="메시지를 입력하세요">
		</div>		     
           <button class="bg-current"><i class="ti-arrow-right text-white"></i></button> 
                </form>
            </div> 
                             
        </div>
  	 			<input class="btn btn-danger" type="button" id="exitBtn" value="퇴장임시버튼">  
	
    </div>
</div> <!-- 여기 오른쪽 세로 -->
   </div>    	
     </div>            
 </div>
    <style>
      .text1 {
       width: calc(100% - 90px);
       border-radius: 30px;
       float: left;
       margin: 0 5px;
       position: relative;
       } 
       
     </style>
 

<script>
	 document.addEventListener('DOMContentLoaded', function() {
	/*
	채팅 테스트
	localhost를 아이피로 변경(192.168.0.14) 소스 및 브라우저 URL도 변경
	그리고 인바운드 규칙추가 8080
	 */
	//웹소켓 객체 저장용
	var wsocket;
	//닉 네임 저장용
	var nickname;
	//입장버튼 클릭 시 -서버와 연결된 웹소켓 클라이언트 생성
	//$('#enterBtn').on('click',function(){  //one 한 번만 입장해야 하니까
		if(true){
			console.log(${roomno})
		wsocket = new WebSocket("ws://${pageContext.request.serverName}:${pageContext.request.serverPort}<c:url value="/chating.do?roomno=${roomno}"/>"); //wss 는 보안이 강화된것 얘는 443포트를 사용
		console.log('wsocket:',wsocket);
		//서버와 연결된 웹 소켓에 이벤트 등록(함수들은 밑으로 다 빼놓음)
		wsocket.onopen = open;  //   open()들어가면 호출하는거여
/*		wsocket.onclose=function(){
			appendMessage("연결이 끊어 졌어요");
		};*/
		wsocket.onmessage=receive;
		wsocket.onerror=function(e){
			console.log('에러발생:',e)
		}
	};	
//	});
		//서버에 연결되었을 때 호출되는 콜백함수
		function open(){
			//서버로 연결한 사람의 정보(닉네임) 전송
			//msg:kim가(이) 입장했어요  <---이건 걍 내맘대로 만드는 규칙임
			//사용자가 입력한 닉네임 저장
			nickname = $('#nickname').val();  //usernickname으로 가져오기
			wsocket.send('msg:'+nickname+'가(이) 입장했어요');
			appendMessage("연결이 되었어요");
		}
		//서버에서 메시지를 받을 때마다 호출되는 함수 
		function receive(e){//e는 message이벤트 객체
			//서버로부터 받은 데이타는 이벤트객체(e).data속성에 저장되어 있다
			console.log('서버로부터받은 메시지:',e.data);
			if(e.data.substring(0, 4) ==='msg:')			
				appendMessage("<div class='message-wrap'><span>"+e.data.substring(4)+"</span></div>");//서버로부터 받은 메시지를 msg:부분을 제외하고 div에 출력
		}
		function appendMessage(msg){  //이건 여러군데 사용해서 메소드로 뺀거
			//$('#chatMessage').append(msg+"<br/>");
			
			$('#chatMessage').append(msg);
			$('#chatMessage').get(0).scrollTop = $('#chatMessage').get(0).scrollHeight; 
			//get(0)이거 자바스크립트로 바꾸는거였지...scrollTop랑 .scrollHeight는 스크롤바를계속 올리는 공식임 
		}
		
		
		//메시지 보낼때
		$('#message').on('keypress',function(e){
			console.log('keypress이벤트 발생:',e.keyCode);
			if(e.keyCode===13){//엔터 입력
				//서버로 메시지 전송
				wsocket.send('msg:'+$(this).val());//msg:KOSMO>>안녕
				//DIV(대화영역)에 메시지 출력			        
				appendMessage("<div class='message-wrap' style='background-color:#05f;' align:'right'><span>"+$(this).val()+"</span></div>");
				//기존 메시지 클리어		
				$(this).val("");
				//포커스 주기
				$(this).focus();
				$('#chatMessage').get(0).scrollTop = $('#chatMessage').get(0).scrollHeight;			
			}				
		})	
		
		$('.bg-current').on('click',function(e){
			e.preventDefault();	
			e.stopPropagation()
		
		})
		//퇴장버튼 클릭 시
		$('#exitBtn').on('click',function(){
			wsocket.send('msg:'+nickname+'가(이) 퇴장했어요');
			wsocket.close();
			wsocket.onclose=function(){
				appendMessage("연결이 끊어 졌어요");
			};
		});	
	 });	

</script>
    <script src="${path}/resources/js/plugin.js"></script>
    <script src="${path}/resources/js/scripts.js"></script>
   