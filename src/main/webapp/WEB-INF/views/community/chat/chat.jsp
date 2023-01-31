<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

 <style>
	p {
	  color: whitesmoke;
	  margin: 10px;
	}
	
	span {
	  display: inline-block;
	  max-width: 180px;
	  padding: 5px 10px;
	  position: relative;
	  word-wrap: break;
	}
	
	.ext {
	  text-align: left;
	}
	
	.ext span {
	  background: #000000;
	  border-radius: 0 5px 5px 5px;
	}
	
	.int {
	  text-align: right;
	}
	
	.int span {
	  background: #ff0000;
	  border-radius: 5px 5px 0 5px;
	  right: 0;
	}
</style>
 
<div class="container">     
	<fieldset class=" form-group border p-3">
		<legend class="w-auto px-3">웹소켓</legend>
		
		<form>
		<div class="form-group">
			<label><kbd class="lead">닉네임(이거 없앨꺼얌!!)</kbd></label> 
			<input type="text" class="form-control" id="nickname" 
			placeholder="닉네임을 입력하세요">
		</div>
		<input class="btn btn-info" type="button" id="enterBtn" value="입장">
		<input class="btn btn-danger" type="button" id="exitBtn" value="퇴장">


		<div class="form-group">
			<h4>대화내용</h4>
			<div id="chatArea">
				<div id="chatMessage"  
					style="height: 300px; border: 1px gray solid; overflow:auto;"></div>
			</div>
		</div>

		<div class="form-group">
			<label><kbd class="lead">메시지</kbd></label> 
			<input type="text" class="form-control" id="message" placeholder="메시지를 입력하세요">
		</div>		
	</form>
			
	</fieldset>	
</div>  
  
  <script>
	/*
	채팅 테스트
	localhost를 아이피로 변경(192.168.0.14) 소스 및 브라우저 URL도 변경
	그리고 인바운드 규칙추가 8080
	192.168.0.29:8080
	${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}
	채팅 말풍선
	https://codepen.io/beumsk/pen/mmEzrE
	 */

	//웹소켓 객체 저장용(전역변수로 빼야 함수로 가능)
	var wsocket;
	//닉 네임 저장용
	var nickname;
	//연결하는것도 함수로 만들어 놓고 여기저기서 사용 할 수 있게 변경	
	//입장버튼 클릭 시 -서버와 연결된 웹소켓 클라이언트 생성  ==> 채팅방 들어가는 이벤트로 변경예정...
	$('#enterBtn').on('click',function(){
		wsocket = new WebSocket("ws://${pageContext.request.serverName}:${pageContext.request.serverPort}<c:url value='/chating.do?no=1'/>"); //wss 는 보안이 강화된것 얘는 443포트를 사용
		console.log('wsocket:',wsocket);
		//서버와 연결된 웹 소켓에 이벤트 등록(함수들은 밑으로 다 빼놓음)
		wsocket.onopen = open;  //   open()들어가면 호출하는거여
		wsocket.onclose= close;

		wsocket.onmessage=receive;
		wsocket.onerror=function(e){
			console.log('에러발생:',e)
		}
	});
	
	//엔터 시 전송 이벤트
	$('#message').on('keypress',function(e){
		console.log('keypress이벤트 발생:',e.keyCode);
		if(e.keyCode===13){//엔터 입력
			//서버로 메시지 전송
			wsocket.send('msg:'+nickname+'>>' +$(this).val());//msg:KOSMO>>안녕
			//DIV(대화영역)에 메시지 출력
			        
			appendMessage("<p class='ext'><span>"+$(this).val()+"</span></p>");
			//기존 메시지 클리어		
			$(this).val("");
			//포커스 주기
			$(this).focus();
			$('#chatMessage').get(0).scrollTop = $('#chatMessage').get(0).scrollHeight;			
		}		
	})
	
	//퇴장버튼 클릭 시
	$('#exitBtn').on('click',function(){	
		wsocket.send('msg:'+nickname+'가(이) 퇴장했어요');
		wsocket.close();
	});
	
///////////////////////////함수들	
		
	//
	
	//서버에 연결되었을 때 호출되는 콜백함수
	function open(){
		//서버로 연결한 사람의 정보(닉네임) 전송
		//msg:kim가(이) 입장했어요  <---이건 걍 내맘대로 만드는 규칙임
		//사용자가 입력한 닉네임 저장
		nickname = $('#nickname').val();
		wsocket.send('msg:'+nickname+'가(이) 입장했어요');
		appendMessage("연결이 되었어요");
	}
	
	function close(){
		appendMessage("연결이 끊어 졌어요");		
	}
	
	//서버에서 메시지를 받을 때마다 호출되는 함수 
	function receive(e){//e는 message이벤트 객체
		//서버로부터 받은 데이타는 이벤트객체(e).data속성에 저장되어 있다
		console.log('서버로부터받은 메시지:',e.data);
		if(e.data.substring(0, 4) ==='msg:')
			
			appendMessage("<p class='int'><span>"+e.data.substring(4)+"</span></p>");//서버로부터 받은 메시지를 msg:부분을 제외하고 div에 출력
	}
	function appendMessage(msg){  //이건 여러군데 사용해서 메소드로 뺀거
		//$('#chatMessage').append(msg+"<br/>");
		
		$('#chatMessage').append(msg);
		$('#chatMessage').get(0).scrollTop = $('#chatMessage').get(0).scrollHeight; 
		//get(0)이거 자바스크립트로 바꾸는거였지...scrollTop랑 .scrollHeight는 스크롤바를계속 올리는 공식임 
	}
	
	
	</script>