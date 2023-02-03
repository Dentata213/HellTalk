<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}/resources/"/>


	<div class="container">
	    
	   <div class="jumbotron">
			<h1>
				Q&A게시판 <small>등록 페이지</small>			
			</h1>
		</div>
		<c:if test="${! empty InputError}">
			<div class="alert alert-success alert-dismissible fade show">
			  <button type="button" class="close" data-dismiss="alert">&times;</button>
			  <strong>Failure!</strong> ${InputError}
			</div>
		</c:if>
		<form method="post" action="<c:url value="/qna/Write.do"/>">  
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>    
	      <div class="form-group">
	        <label><kbd class="lead">제목</kbd></label>
	        <input type="text" value="${param.q_title}" class="form-control" placeholder="제목을 입력하세요" name="q_title">
	      </div>
	      <div class="form-group">
			<label><kbd class="lead">내용</kbd></label>
			<textarea class="form-control" rows="5" name="q_content">${param.q_content}</textarea>
		  </div>
	      <button type="submit" class="btn btn-primary">등록</button>
	    </form>	
	</div>