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
				<%-- <c:if test="" var="isEmpty">
					<tr>
						<td colspan="4">등록된 글이 없습니다.</td>
					</tr>
				</c:if> 
				<c:if test="">--%>
					<c:forEach var="record" items="" varStatus="loop">
						<tr>
							<td class="exer-no"></td>
							<td class="exer-name">
								<a href="#"/><c:out value="" default="1"/></a> 
								<span class="badge badge-light"></span></td>
							<td class="exer-eq"></td>						
							<td class="exer-count"></td>
						</tr>
					</c:forEach>
				<%-- </c:if> --%>
	
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
			context: this,
			type:'post'
			})
			.done(function(data){
				console.log('서버로부터 받은 데이타:',data);	
				console.log('data.e_name:',data[0].e_name);	
				$('#exer-no').html(data[0].e_name);
				var tr="";
				/*var tr="<tr>
							<td>"+data.name+"</td>
							<td class='text-left line-comment' title='"+data.lno+"'>"+data.linecomment+"</td>
							<td>"+getToday()+"</td>
							<td><span class='btn btn-info btn-sm my-delete'>삭제</span></td>
						</tr>";
						
						<tr>
						<th class="col-1">번호</th>
						<th>운동명</th>
						<th class="col-2">필요기구</th>				
						<th class="col-2">사용자기록수</th>
					</tr>
					$('#comments-list').prepend(tr);
				*/
				 /* var tr="<tr><td>"+data.e_no+"</td><td class='text-left line-comment' title='"+data.e_no+"'>"+data.e_name+"</td><td>"+data.e_equipment+"</td><td>"+data.e_count+"</td></tr>";
				$('#exercise-list').prepend(tr);  */
				
				$.each(data,function(i,item){
					/* if($("#exercise-list").length !=0){
						
						$('#exercise-list').remove();
					} */
					
					//
					 /* $('#exer-no').html(item.e_no);
					$('#exer-name').html(item.e_name);
					$('#exer-eq').html(item.e_equipment);
					$('#exer-count').html(item.e_count);  */
					
					tr+="<tr><td>"+item.e_no+"</td><td class='text-left line-comment' title='"+item.e_no+"'>"+item.e_name+"</td><td>"+item.e_equipment+"</td><td>"+data.e_count+"</td></tr>";
					 
					
				})
								
				$('#exercise-list').append(tr);
				
				
				
			})
			.fail(function( request, status, error ){
				console.log("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
			});			
		 
	})
	
	 
		


</script>