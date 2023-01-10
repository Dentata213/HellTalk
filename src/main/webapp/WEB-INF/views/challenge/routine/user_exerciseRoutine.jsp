<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
					<ul>
				    	<c:forEach var="record" items="${listExerKind }" >
					
					    <li><a href="#" class="btn btn-success">${record["ek_kind"]}</a></li>
					    
					    </c:forEach>
				    </ul>
				</form>
		</fieldset>
		<table class="table table-dark table-hover text-center">

			<thead>
				<tr>
					<th class="col-1">번호</th>
					<th>제목</th>
					<th class="col-2">글쓴이</th>				
					<th class="col-2">작성일</th>
				</tr>
			</thead>
			<tbody class="table-sm down-file-body">
				<c:if test="" var="isEmpty">
					<tr>
						<td colspan="4">등록된 글이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="">
					<c:forEach var="record" items="" varStatus="loop">
						<tr>
							<td></td>
							<td class="text-left"><a
								href="<c:url value="/onememo/bbs/View.do?no=&nowPage="/><c:out value="" default="1"/>"></a> <span class="badge badge-light"></span></td>
							<td></td>						
							<td></td>
						</tr>
					</c:forEach>
				</c:if>
	
			</tbody>
		</table>
	
	
	
	</div>

</body>
</html>