<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

        <div class="main-content right-chat-active">
            <div class="middle-sidebar-bottom">
                <div class="middle-sidebar-left">
                    <div class="row">
					<iframe id="iframe" style="width:100%; height:1000px; overflow: hidden" frameborder="0" crolling="no" frameborder="none" allowfullscreen="" src="<c:url value="/map//address.do"/>"></iframe>
					</div>
				</div> 
            </div>            
        </div>

    <script src="${path}/resources/js/plugin.js"></script>
    <script src="${path}/resources/js/scripts.js"></script>