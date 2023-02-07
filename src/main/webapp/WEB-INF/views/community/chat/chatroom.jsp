<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="today" value="<%=new Date() %>"/>
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
             <div class="messages-content pb-5" >                                            
               
  <!--여기가 받은메시지-->
            <c:forEach var="chatmsg" items="${chatList}" varStatus="loop">
        	<c:if test="${uemail != chatmsg.u_email}">
                 <div class="message-item"  >  <!-- 우선 요거가 다름 -->
                 <input name="mno" class="mno" value="${chatmsg.mno}" hidden />
                     <div class="message-user" >
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
         <div class="message-item outgoing-message" >   <!-- 우선 요거가 다름 -->
         <input name="mno" class="mno" value="${chatmsg.mno}" hidden />
             <div class="message-user">      
                 <div>
                     <h5>${chatmsg.u_nickname}</h5>
                     <div class="time">${chatmsg.time}</div>
                 </div>
             </div>
             <div class="message-wrap">${chatmsg.message}</div>
         </div> 
                   
        </c:if>      
        </c:forEach> 
                 
		<div class="container">
	 		<div class="message-user"> 
              <div class="clearfix" id="chatMessage"></div>
            </div>
        </div>
		
             </div>
       </div>
   </div>
   
   <!-- 메시지 전송 form 태그 insert 넣기! 버튼클릭 시 message,time, uemail,roomno 컨트롤러로 전송  -->
   <div class="chat-bottom dark-bg p-3 shadow-none theme-dark-bg" style="width: 98%;">
      <form class="chat-form">                  
		<div class="bg-grey text1">
			<input type="text" class="form-control" id="message" placeholder="메시지를 입력하세요">
		</div>		     
         <button class="bg-current"><i class="ti-arrow-right text-white"></i></button> 
      </form>
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
	웹소켓 주소를 ws://${pageContext.request.serverName}:${pageContext.request.serverPort}
			프로토콜 host:port 을 저렇게 해놓으면 연결되어있는 네트워크에 맞게 알아서 변경됨 ! 근데 테스트할땐 같은 네트워크 이용해야 함!!
	그리고 인바운드 규칙추가 8080
	 */
	//웹소켓 객체 저장용
	var wsocket;
	//닉 네임 저장용
	var nickname;
	
		if(true){  //페이지 이동하면 무조건 연결시킴
			console.log(${roomno})
			wsocket = new WebSocket("ws://${pageContext.request.serverName}:${pageContext.request.serverPort}<c:url value="/chating.do?roomno=${roomno}"/>"); //wss 는 보안이 강화된것 얘는 443포트를 사용
			console.log('wsocket:',wsocket);
			//서버와 연결된 웹 소켓에 이벤트 등록(함수들은 밑으로 다 빼놓음)
			wsocket.onopen = open;  //   open()들어가면 호출하는거여
			wsocket.onclose=function(){
				appendMessage("연결이 끊어 졌어요");
			};
			wsocket.onmessage=receive;
			wsocket.onerror=function(e){
				console.log('에러발생:',e)
			}
		};	

		//서버에 연결되었을 때 호출되는 콜백함수
		function open(){
			//send랑 appendMessage랑 뭐가 다른거지
			//send에 입력된건 상대방에게 보여지는 메시지 , append는 나한테 보여지는 메시지!
			wsocket.send('입장했어요');  //이건 안되네
			appendMessage("여기까지 읽었습니다."); //이건 굳이 사용 안할 것 같지만 혹시모르니 남겨두자
		
		}
		//서버에서 메시지를 받을 때마다 호출되는 함수 (insert넣기!)
		function receive(e){//e는 message이벤트 객체
			//서버로부터 받은 데이타는 이벤트객체(e).data속성에 저장되어 있다
			console.log('서버로부터받은 메시지:',e.data);
			if(true)			
				appendMessage(
						"<div class='message-item'><div class='message-user'><div>"
						+"<h5>"+"상대방이름"+"</h5><div class='time'>"+"상대방시간"+"</div></div></div>"
						+"<div class='message-wrap'>"+e.data+"</div></div>" );//서버로부터 받은 메시지를 div에 출력
			}
		function appendMessage(msg){  //이건 여러군데 사용해서 메소드로 뺀거
			//$('#chatMessage').append(msg+"<br/>");
			$('#chatMessage').append(msg);
			$('#chatMessage').get(0).scrollTop = $('#chatMessage').get(0).scrollHeight;
	
			//get(0)이거 자바스크립트로 바꾸는거였지...scrollTop랑 .scrollHeight는 스크롤바를계속 올리는 공식임 
		}
		
		
		//메시지 보낼 때 (insert넣기!!)
		$('#message').on('keypress',function(e){
			console.log('keypress이벤트 발생:',e.keyCode);
			if(e.keyCode===13){//엔터 입력
				//서버로 메시지 전송 요건 그냥 두고
				wsocket.send(	
						$(this).val());
				//DIV(대화영역)에 메시지 출력			        
				appendMessage(  //여기를 변수처리하자!
						"<div class='message-item outgoing-message'><div class='message-user'><div>"
						+"<h5>"+"여긴내 정보"+"</h5>"+
						"<div class='time'>"+"내가보낸시간"+"</div></div></div><div class='message-wrap'>"
						+$(this).val()+"</div></div>" );
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
   