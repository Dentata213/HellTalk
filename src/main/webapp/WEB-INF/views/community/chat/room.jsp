<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
     <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<meta charset="UTF-8">
	<title>Room</title>
	<style>
		*{
			margin:0;
			padding:0;
		}
		.container{
			width: 500px;
			margin: 0 auto;
			padding: 25px
		}
		.container h1{
			text-align: left;
			padding: 5px 5px 5px 15px;
			color: #FFBB00;
			border-left: 3px solid #FFBB00;
			margin-bottom: 20px;
		}
		.roomContainer{
			background-color: #F6F6F6;
			width: 500px;
			height: 500px;
			overflow: auto;
		}
		.roomList{
			border: none;
		}
		.roomList th{
			border: 1px solid #FFBB00;
			background-color: #fff;
			color: #FFBB00;
		}
		.roomList td{
			border: 1px solid #FFBB00;
			background-color: #fff;
			text-align: left;
			color: #FFBB00;
		}
		.roomList .num{
			width: 75px;
			text-align: center;
		}
		.roomList .room{
			width: 350px;
		}
		.roomList .go{
			width: 71px;
			text-align: center;
		}
		button{
			background-color: #FFBB00;
			font-size: 14px;
			color: #000;
			border: 1px solid #000;
			border-radius: 5px;
			padding: 3px;
			margin: 3px;
		}
		.inputTable th{
			padding: 5px;
		}
		.inputTable input{
			width: 330px;
			height: 25px;
		}
	</style>
</head>

<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
	
	 $(document).ajaxSend(function(e, xhr, options) {
		  xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
	  }); 

	/// 계획 : 채팅할 user를 아이디로 검색해서 채팅하기 누르면 채팅방이 생성되게 만들껴!!!
/*	function createRoom(){ 
		$("#createRoom").click(function(){
			var roomName = $("#roomName").val();		
			if(roomName == null || roomName == ""){
				alert("방이름을 입력하세요!");
				return;
			}
			else{
			 var obj = {"roomName" : roomName }  
			 JSON.stringify(obj);	
			}
			
			$.ajax({
				url:"<c:url value="/createRoom.do"/>",
				method:"POST",
				data:JSON.stringify(obj),
				type:'json',
				contentType:"application/json; charset=utf-8"
			})
			.done(function(data){         
					alert('생성되었습니다.');
  					window.location.href ="room.do";			
  			}).
  			fail(function(jqXHR, textStatus, errorThrown){
  				console.log(jqXHR)
  		        console.log(textStatus)
  		        console.log(errorThrown);
			}); 		
		});
	}
*/

/*	 에이작스 공통메소드같은데 나는 능력이안되니까.. 참고용으로 보자!!
 	function commonAjax(url, parameter, type, calbak, contentType){
		$.ajax({
			url: url,
			data: parameter,
			type: type,
			contentType : contentType!=null?contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			success: function (res) {
				calbak(res);
			},
			error : function(err){
				console.log('error');
				calbak(err);
			}
		});	
		}*/	
		/*$(".roomNo").click(function(){
			window.location.href="<c:url value="/chat.do?no=1"/>"
		});		*/
		
 });		
</script>
<body>
	<div class="container">
		<h1>채팅방(임시)</h1>
	<div id="roomContainer" class="roomContainer">
		<table id="roomList" class="roomList">
	<c:forEach var="chatroom" items="${chatList}" varStatus="loop">
			<tr>
				<th>${chatroom.room_name}</th>
				<th><input name="roomName" id="roomName1" value="나중에" disabled />
					<input name="roomNo" id="roomNo1" value="${chatroom.room_no}" hidden />
				</th>
				<th><a href="<c:url value='/chat.do?no=${chatroom.room_no}'/>" ><button name="enterroom" id="enterroom1"  class="roomNo" >채팅하기</button></a></th>
			</tr>
	</c:forEach>		
						
		</table>
	</div>		
		<div>
			<table class="inputTable">
				<tr>
					<th>방 제목</th>
					<th><input type="text" name="roomNo" id="roomNo" hidden ></th>
					<th><input type="text" name="roomName" id="roomName"></th>
					<th><button id="createRoom">방 만들기</button></th>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>