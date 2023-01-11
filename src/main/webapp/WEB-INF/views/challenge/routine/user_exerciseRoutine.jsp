<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="container">
		<fieldset>
			<legend>커스텀 운동 루틴</legend>
			<h2>DAY1</h2>
		</fieldset>
		<fieldset>
			<legend>운동부위</legend>
				<form action="<c:url value="#"/>" method="post">
					<table class="table table-hover text-center">
						<tr >
				    		<c:forEach var="record" items="${listExerKind }" >
				    			<td class="listExerKind" title="${record['ek_no']}">${record["ek_kind"]}</td>
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
						<th>루틴 추가</th>
					</tr>
				</thead>
				<tbody class="table-sm down-file-body" id="exercise-list">
					
		
				</tbody>
			</table>
		</fieldset>
	
	
	</div>

</body>
</html>
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
				console.log("$('#exercise-list').children('tr').length",$("#exercise-list").children("tr").length)
				 if($("#exercise-list").has("tr").length !=0){
					
					 $("#exercise-list").children("tr").remove();
				} 
			
				 
				$.each(data,function(i,item){
					
					tr+="<tr><td>"+item.e_no+"</td><td class='text-left line-comment' title='"+item.e_no+"'>"+item.e_name+"</td><td>"+item.e_equipment+"</td><td>"+data.e_count+"</td><td><input type='button' class='btn btn-info' value='추가'></td></tr>";
					 
					
				})
								
				$('#exercise-list').append(tr);
				
				
				
			})
			.fail(function( request, status, error ){
				console.log("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
			});			
		  
})
	
	
	
$(document).on('click','tr',function(e){	
	console.log('tr클릭이벤트')
	console.log("e.target.nodeName",e.target.nodeName)
	if(e.target.nodeName=='INPUT'){//추가버튼 클릭 이벤트
		
	}
	else{//운동 상세보기(td) 클릭 이벤트
		
	}
	
	
});

	


		


</script>