<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Scrapping.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>



/* li {
    display: inline-block; 
}  */
h2{
	
	 float:left; 
	 margin: 20px;
}
.ol-container{
	margin-top: 30px;

} 
 li {
	
 	float: left; 
    margin-left: 20px;
    margin-bottom: 10px;
    
} 	
.flex-container{
            display: flex;
            
        }

.calendar{
	display: flex;
	float: left; 
	margin-right: 50px;
	margin-left: 15px;
}
.btn{
	float: right; 
}

legend{
	margin-bottom: 0px;
	
} 
.modal-body{
	padding-bottom: 0px;
}
.body-contents{
	margin-top: 5px;
	font-size: 18px;
	font-weight: normal;
}

</style>   
</head>
<body>

  
 

<div class="container">
		<div>
			<fieldset>
				<legend><h2>커스텀 운동 루틴</h2></legend>
				<form method="post" action="<c:url value="/exercise/routine.do"/>"> 
					<div class="calendar">
						<label>
							시작날짜 </br>
							<input type="date" id="start" min="1950-01-01" max="2023-12-31" name="start">
							
						 </label>
					 </div class="calendar">
					 <div>
						 <label>
							끝날짜: </br>
							<input type="date" id="end" min="1950-01-01" max="2023-12-31" readonly name="end">
						 </label>
					</div>
				
					<c:forEach var="i" begin="1" end="7" varStatus="loop">
						<div class="flex-container">
							<h2>DAY ${loop.index }</h2>
							<ol class="ol-container">
								<c:forEach var="k" begin="1" end="3" varStatus="loop2">
								<li>
									<select class="selecBox" id="selecBox${loop.index}_${loop2.index}" name="selecBox${loop.index}_${loop2.index}">
									<option class="option">운동 선택</option>
									</select>
								</li>
								
								</c:forEach>
							</ol>
						</div>
					</c:forEach>
					
					<!-- <input type="submit" class="btn btn-danger mx-2" data-toggle="modal" data-target="#exampleModalCenter" value="등록" id="submit"/> -->
				
					<!--모달  -->
					<!-- Button trigger modal -->
					 <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" data-id="전달할 값">
					  등록
					</button> 
					<input type="button" class="btn btn-danger mx-2" value="취소" id="cancel" />
					
					<!-- Modal -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLongTitle">루틴 내용을 작성해 주세요</h5>
					        <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span> -->
					        </button>
					      </div>
					      <div class="modal-body">
					      	<form name="boardInfo" class="body-contents">
					      		<legend class="body-contents">루틴 제목</br>
						        <input type="text" class="body-contents" id="rout_name" name="rout_name"/></legend>
						        <legend class="body-contents">루틴 내용</br>
	        					<textarea class="body-contents" id="rout_content" name="rout_content"></textarea></legend>
	        					<legend class="body-contents">
        						<select class="body-contents" id="rout_level" name="rout_level">
									<option class="body-contents">난이도 선택</option>
									<option class="body-contents">하</option>
									<option class="body-contents">중</option>
									<option class="body-contents">상</option>
								</select>
								<select class="body-contents" id="rout_time" name="rout_time">
									<option class="body-contents">총 운동시간</option>
									<option class="body-contents">10분</option>
									<option class="body-contents">20분</option>
									<option class="body-contents">30분</option>
									<option class="body-contents">40분</option>
									<option class="body-contents">50분</option>
									<option class="body-contents">60분</option>
									
								</select>
								</legend>
								<legend>운동 목표</br>
								    <input type="radio" class="body-contents" name="rout_effect" value="홈트레이닝"/>홈트레이닝
								    <input type="radio" class="body-contents" name="rout_effect" value="피트니스센터" />피트니스센터
								    <input type="radio" class="body-contents" name="rout_effect" value="공통" checked />공통</legend>
								<legend>운동 모드</br>
								    <input type="radio" class="body-contents" name="rout_mode" value="다이어트"/>다이어트
								    <input type="radio" class="body-contents" name="rout_mode" value="근육증가" />근육증가
								    <input type="radio" class="body-contents" name="rout_mode" value="공통" checked />공통</legend>
								<legend>성별</br>
									
									<input type="radio" class="body-contents" name="rout_gender" value="남자" ${member['u_gender']=="M"?"CHECKED":"" }/>남자 
									
									<input type="radio" class="body-contents" name="rout_gender" value="여자" ${member['u_gender']=="F"?"CHECKED":"" } />여자 </legend>
									
								<legend>공개여부</br>
									<input type="radio" class="body-contents" name="rout_display" value="Y" >Y 
									<input type="radio" class="body-contents" name="rout_display" value="N" >N </legend>
	
	
								<input type="hidden" name="u_id" value="${member['u_id']}">
								<%-- <input type="text" name="u_id" value="${member['u_gender']}"> --%>
								
							</form>
					      </div>
					      <div class="modal-footer">
					      	<button type="submit" class="btn btn-primary" onclick="clickSave(boardInfo)">저장</button>
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					        
					      </div>
					    </div>
					  </div>
					</div>
				</form>
			</fieldset>
			</div>
			
			<div>
			<fieldset>
				<legend>운동부위</legend>
					<form action="<c:url value="#"/>" method="post">
						<table class="table table-hover text-center">
							<tr >
					    		<c:forEach var="record" items="${listExerKind }" >
					    			<td class="listExerKind" title="${record['ek_no']}">${record['ek_kind']}</td>
								<%-- <input type="hidden" name="no" value="${record['ek_no']}" /> --%>
								<%-- <input type="button" class="no" value="${record['ek_no']}" />${record["ek_kind"]} --%>
								<%-- <a href="#" class="btn btn-success" >${record["ek_kind"]}</a> --%>
						    
						    </c:forEach>
					    </table>
					</form>
			
				<table class="table table-dark table-hover text-center">
		
					<thead>
						<tr>
							<th>번호</th>
							<th>운동명</th>
							<th>필요기구</th>				
							<th>사용자기록수</th>
							<!-- <th>루틴 추가</th> -->
						</tr>
					</thead>
					<tbody class="table-sm down-file-body" id="exercise-list">
						
			
					</tbody>
				</table>
			</fieldset>
		</div>
	
	</div>
	


<script>
$(document).on('click','.listExerKind',function(){	 
/*$('tr').click(function(){ */
		console.log($(this).text());
		console.log($(this).attr('title'));
		
		var ek_kind=$(this).text();
		var ek_no=$(this).attr('title');
		
		console.log(ek_kind);
		console.log(ek_no);
		
		 $.ajax({
			url:"<c:url value='/exercise.do'/>",
			data:{"ek_no": ek_no},
			dataType:'json',
			//context: this,
			type:'post'
			})
			.done(function(data){
				console.log('서버로부터 받은 데이타:',data);	
				console.log('data.e_name:',data[0].e_name);	
				$('#exer-no').html(data[0].e_name);
				var tr="";
				var option="";
				
				
				/* console.log("$('#exercise-list').children('tr').length",$("#exercise-list").children("tr").length)
				console.log('$(".option").html()',$(".option").html())
				console.log("$('.selecBox').find()",$('.selecBox').find())
				console.log($(".selecBox option:selected").text())
				console.log($("#selecBox option:selected").text())
				console.log($("#selecBox1_1 option:selected").text())
				console.log($("#selecBox1_3 option:selected").text()) */
				
				 if($("#exercise-list").has("tr").length !=0){
					
					 $("#exercise-list").children("tr").remove();
				} 
				
				for(var i=1;i<=7;i++){
					for(var k=1;k<=3;k++){
						if($("#selecBox"+i+"_"+k+" option:selected").text()=="운동 선택"){
							$("#selecBox"+i+"_"+k+" option").remove();
							option="<option class='option'>운동 선택</option>"
						 }
					}
				}

				$.each(data,function(i,item){
					/* 
					tr+="<tr><td>"+item.e_no+"</td><td class='text-left line-comment' title='"+item.e_no+"'>"+item.e_name+"</td><td>"+item.e_equipment+"</td><td>"+data.e_count+"</td><td><input type='button' class='btn btn-info' value='추가'></td></tr>";
					 */ 
					tr+="<tr><td>"+item.e_no+"</td><td class='text-left line-comment' title='"+item.e_no+"'>"+item.e_name+"</td><td>"+item.e_equipment+"</td><td>"+data.e_count+"</td></tr>";
					option+="<option value='"+item.e_no+"'>"+item.e_name+"</option>"
					
				})
								
				$('#exercise-list').append(tr);
				$(".selecBox").append(option);
				
				
				
			})
			.fail(function( request, status, error ){
				console.log("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
			});			
		  
})
	
	
	
$(document).on('click','tr',function(e){	
	console.log('tr클릭이벤트')
	console.log("e.target.nodeName",e.target.nodeName)
	/* if(e.target.nodeName=='INPUT'){//추가버튼 클릭 이벤트
		console.log('INPUT클릭이벤트')
		console.log(e.target)
		console.log(e.target.parentElement.parentElement.children[1])
		
	}
	else{//운동 상세보기(td) 클릭 이벤트
		
	} */
	
	
	
});

	
 $(document).on('change','#start',function(e){	
	
 	var start=$(this).val();
 	console.log("start",start)
 	
	var end=endDate(start,6)
	console.log("end",end) 
	$('#end').val(end)
	
}); 
 
function endDate(date,n){
	var yyyy=date.substring(0,4);
	var mm = date.substring(5,7);
	var dd=date.substring(8,10);
	mm=Number(mm)-1;
	
	var endDate = new Date(yyyy,mm,dd);
	endDate.setDate(endDate.getDate()+n);
	
	return endDate.getFullYear()+"-"+((endDate.getMonth()+1)>9?(endDate.getMonth()+1).toString():"0"+(endDate.getMonth()+1))+
			"-"+(endDate.getDate()>9?endDate.getDate().toString():"0"+endDate.getDate().toString());
}
 
$(document).on('click','#cancel',function(e){	
	console.log("취소버튼 클릭")
	var option="";
	for(var i=1;i<=7;i++){
		for(var k=1;k<=3;k++){
			
				$("#selecBox"+i+"_"+k+" option").remove();
				option="<option class='option'>운동 선택</option>"
			 
		}
	}
	$(".selecBox").append(option);
	 $("#exercise-list").children("tr").remove();
	
})



/* 모달 */
$('#myModal').on('shown.bs.modal', function (e) {
  
})

function clickSave(formName) {
	formName.action = "/exercise/routine.do";
	formName.method = "post";
	formName.submit();
}

</script>  
  
    <script src="${path}/resources/js/plugin.js"></script>
    <script src="${path}/resources/js/scripts.js"></script>
</body>
</html>
