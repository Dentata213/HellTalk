<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}/resources/"/>

        <!-- main content -->
        <div class="main-content right-chat-active">
            <div class="middle-sidebar-bottom">
                <div class="middle-sidebar-left">
                     <div class="container">
				        <h2 class="mt-5">Q & A</h2>
				
				        <div class="text-right mb-2">
				            <a href="<c:url value="/qna/Write.do"/>" class="btn btn-danger">글등록</a>
				        </div>
				        <table class="table table-hover text-center">
				
				            <thead>
				                <tr>
				                    <th class="col-1">번호</th>
				                    <th>제목</th>
				                    <th class="col-2">글쓴이</th>
				                    <th class="col-2">작성일</th>
				                </tr>
				            </thead>
				            <tbody class="table-sm down-file-body">
				                <c:if test="${empty lists}" var="isEmpty">
				                    <tr>
				                        <td colspan="4">등록된 글이 없습니다.</td>
				                    </tr>
				                </c:if>
				                <c:if test="${not isEmpty }">
			                    <c:forEach var="record" items="${lists}" varStatus="loop">
			                        <tr>
			                            <td>${record.no}</td>
			                            <td class="text-left"><a href="#">">${record.title}</a><span class="badge badge-light">${record.commentCount}</span></td>
			                            <td>${record.name}</td>
			                            <td>${record.postDate}</td>
			                        </tr>
			                    </c:forEach>
				                </c:if>
				            </tbody>
				        </table>
				    </div>
				</div> 
            </div>            
        </div>
        <!-- main content -->

    <script src="${path}js/plugin.js"></script>
    <script src="${path}js/scripts.js"></script>

