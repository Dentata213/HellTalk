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
		<fieldset style="width:60%">
			<legend>운동리스트</legend>
			<h2>운동부위</h2>
				<form action="<c:url value="#"/>" method="post">
					<table class="table table-hover text-center">
				    	<c:forEach var="record" items="${listExerKind }" >
				    		<tr>
				    			<td title="${record['ek_no']}">${record["ek_kind"]}</td>
							<%-- <input type="hidden" name="no" value="${record['ek_no']}" /> --%>
							<%-- <input type="button" class="no" value="${record['ek_no']}" />${record["ek_kind"]} --%>
							<%-- <a href="#" class="btn btn-success" >${record["ek_kind"]}</a> --%>
					    
					    </c:forEach>
				    </table>
				</form>
		</fieldset>
		<table class="table table-dark table-hover text-center">

			<thead>
				<tr>
					<th class="col-1">번호</th>
					<th>운동명</th>
					<th class="col-2">필요기구</th>				
					<th class="col-2">사용자기록수</th>
				</tr>
			</thead>
			<tbody class="table-sm down-file-body" id="exercise-list">
				
	
			</tbody>
		</table>
	
	
	
	</div>

</body>
</html>
<script>
$(document).on('click','tr',function(){	 
/*$('tr').click(function(){ */
		console.log($(this).children('td').text());
		console.log($(this).children('td').attr('title'));
		
		var ek_kind=$(this).children('td').text();
		var ek_no=$(this).children('td').attr('title');
		
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
				console.log("$("#exercise-list").children("tr").length",$("#exercise-list").children("tr").length)
				 if($("#exercise-list").has("tr").length !=0){
					
					 $("#exercise-list").children("tr").remove();
				} 
			
				 
				$.each(data,function(i,item){
					
					tr+="<tr><td>"+item.e_no+"</td><td class='text-left line-comment' title='"+item.e_no+"'>"+item.e_name+"</td><td>"+item.e_equipment+"</td><td>"+data.e_count+"</td></tr>";
					 
					
				})
								
				$('#exercise-list').append(tr);
				
				
				
			})
			.fail(function( request, status, error ){
				console.log("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
			});			
		 
	})
	
	 
		


</script>