<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
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
	var ws;
	window.onload = function(){
	//	getRoom();
		createRoom();
		enterroom();
	}

/*	function getRoom(){
		commonAjax('/getRoom',"", 'post', function(result){
			createChatingRoom(result);
		});
	}*/
	
	function createRoom(){ //createRoom
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

	function goRoom(number, name){
		location.href="/moveChating?roomName="+name+"&"+"roomNumber="+number;
	}

	//채팅방만들기 
	/*function createChatingRoom(res){
		if(res != null){
			var tag = "<tr><th class='num'>순서</th><th class='room'>방 이름</th><th class='go'></th></tr>";
			res.forEach(function(d, idx){
				var rn = d.roomName.trim();
				var roomNumber = d.roomNumber;
				tag += "<tr>"+
							"<td class='num'>"+(idx+1)+"</td>"+
							"<td class='room'>"+ rn +"</td>"+
							"<td class='go'><button type='button' onclick='goRoom(\""+roomNumber+"\", \""+rn+"\")'>참여</button></td>" +
						"</tr>";	
			});
			$("#roomList").empty().append(tag);
		}
	}*/

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
		}
	
	function enterroom(){
		$("#enterroom1").click(function(){
			window.location.href="<c:url value="/chat.do"/>"
		});
		
	}	
</script>
<body>
	<div class="container">
		<h1>채팅방(임시)</h1>
	<div id="roomContainer" class="roomContainer">
		<table id="roomList" class="roomList">
			<tr>
				<th>방 제목</th>
				<th><input name="roomName" id="roomName1" value="나중에" disabled /></th>
				<th><button name="enterroom" id="enterroom1" >누르면바로채팅</button></th>
			</tr>
			<tr>
				<th>방 제목</th>
				<th><input name="roomName" id="roomName2" value="사용자검색기능추가" disabled /></th>
				<th><button name="enterroom" id="enterroom2" >누르면바로채팅</button></th>
			</tr>
			<tr>
				<th>방 제목</th>
				<th><input name="roomName" id="roomName3" value="1:1채팅으로만들거야" disabled /></th>
				<th><button name="enterroom" id="enterroom3" >누르면바로채팅</button></th>
			</tr>						
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